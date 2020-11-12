
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nordvpn

<!-- badges: start -->

<!-- badges: end -->

The goal of nordvpn is to provide updated data on the servers of
nordvpn. It can be used to retrieve fast servers and config file
depending on specific geographic location.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("benjaminguinaudeau/nordvpn")
```

## Example

If you want to get the complete liste of servers available:

``` r
nordvpn::get_servers() %>%
  dplyr::glimpse()
#> Rows: 3,350
#> Columns: 14
#> Groups: server [3,350]
#> $ ip           <chr> "31.171.152.19", "80.246.28.33", "31.171.152.11", "31.17…
#> $ country      <chr> "AL", "AL", "AL", "AL", "AL", "AL", "AL", "AR", "AR", "A…
#> $ tz           <chr> "Europe/Tirane", "Europe/Tirane", "Europe/Tirane", "Euro…
#> $ region       <chr> "", "Tirana District", "", "", "", "Tirana District", "T…
#> $ city         <chr> "", "Tirana", "", "", "", "Tirana", "Tirana", "Buenos Ai…
#> $ zip          <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", …
#> $ lat          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ lon          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ servers_link <chr> "https://downloads.nordcdn.com/configs/files/ovpn_legacy…
#> $ server       <chr> "al18.nordvpn.com.tcp443.ovpn", "al19.nordvpn.com.tcp443…
#> $ down         <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, …
#> $ latency      <dbl> 128.147, 128.929, 126.225, 123.967, 141.131, 122.736, 12…
#> $ config       <list> [<"client", "dev tun", "proto tcp", "remote 31.171.152.…
#> $ stamp        <dttm> 2020-11-12 03:41:42, 2020-11-12 05:53:19, 2020-11-12 03…
```

For specific country:

``` r

nordvpn::get_servers(country = "US") %>%
  dplyr::glimpse()
#> Rows: 0
#> Columns: 14
#> Groups: server [0]
#> $ ip           <chr> 
#> $ country      <chr> 
#> $ tz           <chr> 
#> $ region       <chr> 
#> $ city         <chr> 
#> $ zip          <chr> 
#> $ lat          <int> 
#> $ lon          <int> 
#> $ servers_link <chr> 
#> $ server       <chr> 
#> $ down         <lgl> 
#> $ latency      <dbl> 
#> $ config       <list> []
#> $ stamp        <dttm>
```

You can also specify a credential path. This will append the path to the
credential file to the config file entailed in the data.

``` r

nordvpn::get_servers(country = "US", credential_path = "/etc/openvpn/auth.txt")  %>%
  dplyr::pull(config) %>%
  purrr::map(tail, 3)
#> list()
```
