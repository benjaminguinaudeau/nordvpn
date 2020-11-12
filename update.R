if(Sys.getenv("api_a") == "") stop("API token cannot be retrieved")

library(dplyr)
source("R/utils.R")

# update_server_data(n = 50)
# Sys.sleep(30)
n <- 150
country <- NULL

server <- get_server_list(country = country)

if(base::file.exists("data/servers.rds")){
  already <- readRDS("data/servers.rds")
} else {
  already <- dplyr::tibble()
}
try({
  server_info <- server %>%
    dplyr::sample_n(n) %>%
    split(1:nrow(.)) %>%
    purrr::map_dfr(~{
      # get_server_info(.x)
      out <- try(get_server_info(.x, verbose = F))
      if(inherits(out, "try-error")) return(dplyr::tibble())

      out %>%
        dplyr::select(-config) %>%
        purrr::imap_chr(~{glue::glue(" {.y} : {.x} ")}) %>%
        paste(collapse = "\n") %>%
        paste0("\n", .) %>%
        write_log()

      return(out)
    })

  already <- dplyr::bind_rows(server_info, already) %>%
    dplyr::group_by(server) %>%
    dplyr::arrange(desc(stamp)) %>%
    dplyr::slice(1)

  write_log(glue::glue("\n\n\nAlready has now {nrow(already)} servers\n\n\n"))

  saveRDS(already, file = "data/servers.rds")
})
