
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
#> Rows: 101
#> Columns: 14
#> Groups: server [101]
#> $ ip           <chr> "45.248.79.155", "103.1.212.163", "144.48.36.19", "103.1…
#> $ country      <chr> "AU", "AU", "AU", "AU", "AU", "AU", "AU", "AU", "AU", "A…
#> $ tz           <chr> "Australia/Adelaide", "Australia/Sydney", "Australia/Syd…
#> $ region       <chr> "South Australia", "New South Wales", "New South Wales",…
#> $ city         <chr> "Adelaide", "Leichhardt", "Sydney", "Brisbane", "Perth",…
#> $ zip          <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", …
#> $ lat          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ lon          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ servers_link <chr> "https://downloads.nordcdn.com/configs/files/ovpn_legacy…
#> $ server       <chr> "au527.nordvpn.com.tcp443.ovpn", "au538.nordvpn.com.tcp4…
#> $ down         <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, …
#> $ latency      <dbl> 218.051, 188.161, 195.761, 236.000, 267.000, 265.000, 21…
#> $ config       <list> [<"client", "dev tun", "proto tcp", "remote 45.248.79.1…
#> $ stamp        <dttm> 2020-11-12 02:18:59, 2020-11-12 02:22:20, 2020-11-12 02…
```

For specific country:

``` r

nordvpn::get_servers(country = "US") %>%
  dplyr::glimpse()
#> Rows: 33
#> Columns: 14
#> Groups: server [33]
#> $ ip           <chr> "2.56.254.67", "208.91.107.131", "66.115.176.140", "96.9…
#> $ country      <chr> "US", "US", "US", "US", "US", "US", "US", "US", "US", "U…
#> $ tz           <chr> "America/New_York", "America/Los_Angeles", "America/Los_…
#> $ region       <chr> "New Jersey", "California", "California", "New York", ""…
#> $ city         <chr> "Secaucus", "Los Angeles", "San Jose", "Buffalo", "", "D…
#> $ zip          <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", …
#> $ lat          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ lon          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ servers_link <chr> "https://downloads.nordcdn.com/configs/files/ovpn_legacy…
#> $ server       <chr> "us5097.nordvpn.com.tcp443.ovpn", "us5229.nordvpn.com.tc…
#> $ down         <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, …
#> $ latency      <dbl> 7.380, 38.000, 75.963, 19.600, 75.400, 53.100, 119.000, …
#> $ config       <list> [<"client", "dev tun", "proto tcp", "remote 2.56.254.67…
#> $ stamp        <dttm> 2020-11-12 02:20:26, 2020-11-11 23:49:59, 2020-11-12 02…
```

You can also specify a credential path. This will append the path to the
credential file to the config file entailed in the data.

``` r

nordvpn::get_servers(country = "US", credential_path = "/etc/openvpn/auth.txt")  %>%
  dplyr::pull(config) %>%
  purrr::map(tail, 3)
#> [[1]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[2]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[3]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[4]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[5]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[6]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[7]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[8]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[9]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[10]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[11]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[12]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[13]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[14]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[15]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[16]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[17]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[18]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[19]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[20]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[21]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[22]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[23]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[24]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[25]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[26]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[27]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[28]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[29]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[30]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[31]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[32]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[33]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
```
