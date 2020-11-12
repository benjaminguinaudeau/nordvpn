#' is_server_down
#' @export
is_server_down <- function(ip){
  ping <- suppressWarnings(base::system(glue::glue("ping {ip}"), wait = T, timeout = 1, intern = T))
  down <- as.numeric(stringr::str_extract(stringr::str_subset(ping, "received"), "\\d(?= received)")) == 0
  if(!down){
    latency <- as.numeric(stringr::str_extract(stringr::str_subset(ping, "time\\="), "(?<=time\\=)(\\d|\\.)+"))
  } else {
    latency <- 0
  }

  dplyr::tibble(down, latency)
}

#' get_server_list
#' @export
get_server_list <- function(n = 0, country = NULL){

  if(is.null(country)) country <- "\\w+"

  page <- xml2::read_html("https://nordvpn.com/fr/ovpn/")

  servers_link <- page %>%
    rvest::html_nodes(".Button--small+ .Button--small") %>%
    rvest::html_attr("href")

  if(n == 0) n <- length(servers_link)

  dplyr::tibble(servers_link, server = stringr::str_extract(servers_link, glue::glue("(?<=/){country}\\d+.*?$"))) %>%
    dplyr::sample_n(n, replace = T) %>%
    dplyr::distinct() %>%
    dplyr::arrange(server)
}

#' get_ip_info
#' @export
get_ip_info <- function(ip, verbose = T){

  # token <- sample(read_rds("secret/api_token.rds"), 1)
  token <- sample(c(Sys.getenv("api_a"), Sys.getenv("api_b"), Sys.getenv("api_c"), Sys.getenv("api_d")), 1)

  if(token == "") stop("API Token could not be retrieved")

  req <- try({
    httr::GET(glue::glue("https://signals.api.auth0.com/v2.0/ip/{ip}"),
              httr::add_headers(.headers = c(
                `accept` = 'application/json',
                `x-auth-token` = token
              )),
              time_out = httr::timeout(5))
  })

  if(inherits(req, "try-error")){
    if(verbose) message(glue::glue("[ {Sys.time()} ] {ip}\t-"))
    return(dplyr::tibble())
  }

  info <- jsonlite::fromJSON(rawToChar(req$content))

  if(verbose) message(glue::glue("[ {Sys.time()} ] {ip}\t|"))

  dplyr::tibble(
    ip,
    country = info$fullip$geo$country,
    tz = info$fullip$geo$time_zone,
    region = info$fullip$geo$region,
    city = info$fullip$geo$city,
    zip = info$fullip$geo$postal,
    lat = info$fullip$geo$latitude,
    lon = info$fullip$geo$longitude
  )
}

#' get_server_info
#' @export
get_server_info <- function(server){
  config <- readLines(server$servers_link)

  ip <- config %>%
    stringr::str_subset("remote ") %>%
    stringr::str_remove("remote ") %>%
    stringr::str_remove(" 443")
  down <- is_server_down(ip)
  ip_info <- get_ip_info(ip, verbose = T)

  dplyr::bind_cols(ip_info, server, down) %>%
    dplyr::mutate(config =list(config),
                  stamp = lubridate::now())
}

#' update_server_data
#' @export
update_server_data <- function(n = 10, country = NULL){

  server <- get_server_list(country = country)

  if(base::file.exists("data/servers.rds")){
    already <- readRDS("data/servers.rds")
  } else {
    already <- dplyr::tibble()
  }

  # tictoc::tic()
  server_info <- server %>%
    dplyr::sample_n(n) %>%
    split(1:nrow(.)) %>%
    purrr::map_dfr(~{
      out <- try(get_server_info(.x))
      if(inherits(out, "try-error")) return(dplyr::tibble())
      return(out)
    })%>%
    dplyr::glimpse()
  # tictoc::toc()

  already <- dplyr::bind_rows(server_info, already) %>%
    dplyr::group_by(server) %>%
    dplyr::arrange(desc(stamp)) %>%
    dplyr::slice(1)


  saveRDS(already, "data/servers.rds")
}

#' get_servers
#' @export
get_servers <- function(n = 0){
  if(n == 0){
    readRDS("data/servers.rds")
  } else {
    readRDS("data/servers.rds") %>%
      dplyr::sample_n(10, replace = T) %>%
      dplyr::distinct()
  }
}
