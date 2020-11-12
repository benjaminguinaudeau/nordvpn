if(Sys.getenv("api_a") == "") stop("API token cannot be retrieved")

library(dplyr)
source("R/utils.R")

log <- function(msg){write(glue::glue("[ {Sys.time()} ] {msg}"), file= "log.txt", append=TRUE)}

# update_server_data(n = 50)
# Sys.sleep(30)
n <- 5
country <- NULL


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
    log(.x)
    # get_server_info(.x)
    out <- try(get_server_info(.x))
    if(inherits(out, "try-error")) return(dplyr::tibble())
    return(out)
  })
# tictoc::toc()

log("writing file")

already <- dplyr::bind_rows(server_info, already) #%>%
  # dplyr::group_by(server) %>%
  # dplyr::arrange(desc(stamp)) %>%
  # dplyr::slice(1)

log(paste(nrow(already), "\n\n\n"))


try(saveRDS(already, "data/servers.rds"))
