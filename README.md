
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
#> Rows: 4,669
#> Columns: 14
#> $ ip           <chr> "31.171.152.19", "80.246.28.33", "31.171.152.11", "31.17…
#> $ country      <chr> "AL", "AL", "AL", "AL", "AL", "AL", "AL", "AL", "AR", "A…
#> $ tz           <chr> "Europe/Tirane", "Europe/Tirane", "Europe/Tirane", "Euro…
#> $ region       <chr> "", "Tirana District", "", "", "", "", "Tirana District"…
#> $ city         <chr> "", "Tirana", "", "", "", "", "Tirana", "Tirana", "Bueno…
#> $ zip          <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", …
#> $ lat          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ lon          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ servers_link <chr> "https://downloads.nordcdn.com/configs/files/ovpn_legacy…
#> $ server       <chr> "al18.nordvpn.com.tcp443.ovpn", "al19.nordvpn.com.tcp443…
#> $ down         <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, …
#> $ latency      <dbl> 128.147, 136.069, 135.242, 139.894, 141.131, 136.950, 12…
#> $ config       <list> [<"client", "dev tun", "proto tcp", "remote 31.171.152.…
#> $ stamp        <dttm> 2020-11-12 03:41:42, 2020-11-12 12:53:12, 2020-11-12 12…
```

For specific country:

``` r

nordvpn::get_servers(country = "US") %>%
  dplyr::glimpse()
#> Rows: 1,668
#> Columns: 14
#> $ ip           <chr> "196.196.216.3", "104.149.135.11", "104.149.135.12", "10…
#> $ country      <chr> "US", "US", "US", "US", "US", "US", "US", "US", "US", "U…
#> $ tz           <chr> "America/New_York", "America/Los_Angeles", "America/Los_…
#> $ region       <chr> "District of Columbia", "California", "California", "Cal…
#> $ city         <chr> "Washington", "Los Angeles", "Los Angeles", "Los Angeles…
#> $ zip          <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", …
#> $ lat          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ lon          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ servers_link <chr> "https://downloads.nordcdn.com/configs/files/ovpn_legacy…
#> $ server       <chr> "ee36.nordvpn.com.tcp443.ovpn", "us2722.nordvpn.com.tcp4…
#> $ down         <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, …
#> $ latency      <dbl> 106.562, 62.944, 60.937, 59.062, 33.110, 2.020, 29.993, …
#> $ config       <list> [<"client", "dev tun", "proto tcp", "remote 196.196.216…
#> $ stamp        <dttm> 2020-11-12 07:20:52, 2020-11-12 07:36:19, 2020-11-12 08…
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
#> 
#> [[34]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[35]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[36]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[37]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[38]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[39]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[40]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[41]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[42]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[43]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[44]]
#> [1] ""                                    
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[45]]
#> [1] ""                                    
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[46]]
#> [1] ""                                    
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[47]]
#> [1] ""                                    
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[48]]
#> [1] ""                                    
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[49]]
#> [1] ""                                    
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[50]]
#> [1] ""                                    
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[51]]
#> [1] ""                                    
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[52]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[53]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[54]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[55]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[56]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[57]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[58]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[59]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[60]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[61]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[62]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[63]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[64]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[65]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[66]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[67]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[68]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[69]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[70]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[71]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[72]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[73]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[74]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[75]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[76]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[77]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[78]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[79]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[80]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[81]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[82]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[83]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[84]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[85]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[86]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[87]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[88]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[89]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[90]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[91]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[92]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[93]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[94]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[95]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[96]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[97]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[98]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[99]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[100]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[101]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[102]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[103]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[104]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[105]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[106]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[107]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[108]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[109]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[110]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[111]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[112]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[113]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[114]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[115]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[116]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[117]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[118]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[119]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[120]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[121]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[122]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[123]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[124]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[125]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[126]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[127]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[128]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[129]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[130]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[131]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[132]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[133]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[134]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[135]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[136]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[137]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[138]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[139]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[140]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[141]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[142]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[143]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[144]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[145]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[146]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[147]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[148]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[149]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[150]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[151]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[152]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[153]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[154]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[155]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[156]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[157]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[158]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[159]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[160]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[161]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[162]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[163]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[164]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[165]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[166]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[167]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[168]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[169]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[170]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[171]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[172]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[173]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[174]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[175]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[176]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[177]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[178]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[179]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[180]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[181]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[182]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[183]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[184]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[185]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[186]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[187]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[188]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[189]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[190]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[191]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[192]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[193]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[194]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[195]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[196]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[197]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[198]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[199]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[200]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[201]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[202]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[203]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[204]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[205]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[206]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[207]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[208]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[209]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[210]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[211]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[212]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[213]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[214]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[215]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[216]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[217]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[218]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[219]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[220]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[221]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[222]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[223]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[224]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[225]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[226]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[227]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[228]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[229]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[230]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[231]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[232]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[233]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[234]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[235]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[236]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[237]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[238]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[239]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[240]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[241]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[242]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[243]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[244]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[245]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[246]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[247]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[248]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[249]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[250]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[251]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[252]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[253]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[254]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[255]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[256]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[257]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[258]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[259]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[260]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[261]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[262]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[263]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[264]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[265]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[266]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[267]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[268]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[269]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[270]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[271]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[272]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[273]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[274]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[275]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[276]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[277]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[278]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[279]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[280]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[281]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[282]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[283]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[284]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[285]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[286]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[287]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[288]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[289]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[290]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[291]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[292]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[293]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[294]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[295]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[296]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[297]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[298]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[299]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[300]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[301]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[302]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[303]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[304]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[305]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[306]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[307]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[308]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[309]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[310]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[311]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[312]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[313]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[314]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[315]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[316]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[317]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[318]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[319]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[320]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[321]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[322]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[323]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[324]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[325]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[326]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[327]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[328]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[329]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[330]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[331]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[332]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[333]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[334]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[335]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[336]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[337]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[338]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[339]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[340]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[341]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[342]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[343]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[344]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[345]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[346]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[347]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[348]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[349]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[350]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[351]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[352]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[353]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[354]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[355]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[356]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[357]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[358]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[359]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[360]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[361]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[362]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[363]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[364]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[365]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[366]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[367]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[368]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[369]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[370]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[371]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[372]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[373]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[374]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[375]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[376]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[377]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[378]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[379]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[380]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[381]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[382]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[383]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[384]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[385]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[386]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[387]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[388]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[389]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[390]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[391]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[392]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[393]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[394]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[395]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[396]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[397]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[398]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[399]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[400]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[401]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[402]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[403]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[404]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[405]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[406]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[407]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[408]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[409]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[410]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[411]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[412]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[413]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[414]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[415]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[416]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[417]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[418]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[419]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[420]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[421]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[422]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[423]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[424]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[425]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[426]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[427]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[428]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[429]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[430]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[431]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[432]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[433]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[434]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[435]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[436]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[437]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[438]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[439]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[440]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[441]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[442]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[443]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[444]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[445]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[446]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[447]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[448]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[449]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[450]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[451]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[452]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[453]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[454]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[455]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[456]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[457]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[458]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[459]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[460]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[461]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[462]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[463]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[464]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[465]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[466]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[467]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[468]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[469]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[470]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[471]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[472]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[473]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[474]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[475]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[476]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[477]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[478]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[479]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[480]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[481]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[482]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[483]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[484]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[485]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[486]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[487]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[488]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[489]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[490]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[491]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[492]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[493]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[494]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[495]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[496]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[497]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[498]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[499]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[500]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[501]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[502]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[503]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[504]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[505]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[506]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[507]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[508]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[509]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[510]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[511]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[512]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[513]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[514]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[515]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[516]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[517]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[518]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[519]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[520]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[521]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[522]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[523]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[524]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[525]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[526]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[527]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[528]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[529]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[530]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[531]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[532]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[533]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[534]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[535]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[536]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[537]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[538]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[539]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[540]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[541]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[542]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[543]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[544]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[545]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[546]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[547]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[548]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[549]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[550]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[551]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[552]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[553]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[554]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[555]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[556]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[557]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[558]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[559]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[560]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[561]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[562]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[563]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[564]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[565]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[566]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[567]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[568]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[569]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[570]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[571]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[572]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[573]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[574]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[575]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[576]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[577]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[578]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[579]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[580]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[581]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[582]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[583]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[584]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[585]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[586]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[587]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[588]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[589]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[590]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[591]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[592]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[593]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[594]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[595]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[596]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[597]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[598]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[599]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[600]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[601]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[602]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[603]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[604]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[605]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[606]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[607]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[608]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[609]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[610]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[611]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[612]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[613]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[614]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[615]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[616]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[617]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[618]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[619]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[620]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[621]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[622]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[623]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[624]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[625]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[626]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[627]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[628]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[629]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[630]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[631]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[632]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[633]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[634]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[635]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[636]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[637]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[638]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[639]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[640]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[641]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[642]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[643]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[644]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[645]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[646]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[647]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[648]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[649]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[650]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[651]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[652]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[653]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[654]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[655]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[656]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[657]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[658]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[659]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[660]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[661]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[662]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[663]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[664]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[665]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[666]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[667]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[668]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[669]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[670]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[671]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[672]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[673]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[674]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[675]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[676]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[677]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[678]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[679]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[680]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[681]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[682]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[683]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[684]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[685]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[686]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[687]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[688]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[689]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[690]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[691]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[692]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[693]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[694]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[695]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[696]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[697]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[698]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[699]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[700]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[701]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[702]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[703]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[704]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[705]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[706]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[707]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[708]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[709]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[710]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[711]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[712]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[713]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[714]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[715]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[716]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[717]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[718]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[719]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[720]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[721]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[722]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[723]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[724]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[725]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[726]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[727]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[728]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[729]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[730]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[731]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[732]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[733]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[734]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[735]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[736]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[737]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[738]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[739]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[740]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[741]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[742]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[743]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[744]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[745]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[746]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[747]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[748]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[749]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[750]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[751]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[752]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[753]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[754]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[755]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[756]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[757]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[758]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[759]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[760]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[761]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[762]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[763]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[764]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[765]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[766]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[767]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[768]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[769]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[770]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[771]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[772]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[773]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[774]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[775]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[776]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[777]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[778]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[779]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[780]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[781]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[782]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[783]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[784]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[785]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[786]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[787]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[788]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[789]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[790]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[791]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[792]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[793]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[794]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[795]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[796]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[797]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[798]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[799]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[800]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[801]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[802]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[803]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[804]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[805]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[806]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[807]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[808]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[809]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[810]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[811]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[812]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[813]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[814]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[815]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[816]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[817]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[818]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[819]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[820]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[821]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[822]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[823]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[824]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[825]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[826]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[827]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[828]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[829]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[830]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[831]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[832]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[833]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[834]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[835]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[836]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[837]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[838]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[839]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[840]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[841]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[842]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[843]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[844]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[845]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[846]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[847]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[848]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[849]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[850]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[851]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[852]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[853]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[854]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[855]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[856]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[857]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[858]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[859]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[860]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[861]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[862]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[863]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[864]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[865]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[866]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[867]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[868]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[869]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[870]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[871]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[872]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[873]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[874]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[875]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[876]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[877]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[878]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[879]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[880]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[881]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[882]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[883]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[884]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[885]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[886]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[887]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[888]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[889]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[890]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[891]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[892]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[893]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[894]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[895]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[896]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[897]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[898]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[899]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[900]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[901]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[902]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[903]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[904]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[905]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[906]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[907]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[908]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[909]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[910]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[911]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[912]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[913]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[914]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[915]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[916]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[917]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[918]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[919]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[920]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[921]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[922]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[923]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[924]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[925]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[926]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[927]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[928]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[929]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[930]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[931]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[932]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[933]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[934]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[935]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[936]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[937]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[938]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[939]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[940]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[941]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[942]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[943]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[944]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[945]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[946]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[947]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[948]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[949]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[950]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[951]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[952]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[953]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[954]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[955]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[956]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[957]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[958]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[959]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[960]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[961]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[962]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[963]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[964]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[965]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[966]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[967]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[968]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[969]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[970]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[971]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[972]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[973]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[974]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[975]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[976]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[977]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[978]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[979]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[980]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[981]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[982]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[983]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[984]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[985]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[986]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[987]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[988]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[989]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[990]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[991]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[992]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[993]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[994]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[995]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[996]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[997]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[998]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[999]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1000]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1001]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1002]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1003]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1004]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1005]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1006]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1007]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1008]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1009]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1010]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1011]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1012]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1013]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1014]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1015]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1016]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1017]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1018]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1019]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1020]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1021]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1022]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1023]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1024]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1025]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1026]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1027]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1028]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1029]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1030]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1031]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1032]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1033]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1034]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1035]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1036]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1037]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1038]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1039]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1040]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1041]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1042]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1043]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1044]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1045]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1046]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1047]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1048]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1049]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1050]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1051]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1052]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1053]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1054]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1055]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1056]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1057]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1058]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1059]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1060]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1061]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1062]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1063]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1064]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1065]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1066]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1067]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1068]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1069]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1070]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1071]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1072]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1073]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1074]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1075]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1076]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1077]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1078]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1079]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1080]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1081]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1082]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1083]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1084]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1085]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1086]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1087]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1088]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1089]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1090]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1091]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1092]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1093]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1094]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1095]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1096]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1097]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1098]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1099]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1100]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1101]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1102]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1103]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1104]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1105]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1106]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1107]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1108]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1109]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1110]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1111]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1112]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1113]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1114]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1115]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1116]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1117]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1118]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1119]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1120]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1121]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1122]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1123]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1124]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1125]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1126]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1127]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1128]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1129]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1130]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1131]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1132]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1133]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1134]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1135]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1136]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1137]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1138]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1139]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1140]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1141]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1142]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1143]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1144]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1145]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1146]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1147]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1148]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1149]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1150]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1151]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1152]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1153]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1154]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1155]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1156]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1157]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1158]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1159]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1160]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1161]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1162]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1163]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1164]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1165]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1166]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1167]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1168]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1169]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1170]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1171]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1172]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1173]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1174]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1175]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1176]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1177]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1178]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1179]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1180]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1181]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1182]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1183]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1184]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1185]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1186]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1187]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1188]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1189]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1190]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1191]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1192]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1193]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1194]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1195]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1196]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1197]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1198]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1199]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1200]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1201]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1202]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1203]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1204]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1205]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1206]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1207]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1208]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1209]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1210]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1211]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1212]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1213]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1214]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1215]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1216]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1217]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1218]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1219]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1220]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1221]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1222]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1223]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1224]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1225]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1226]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1227]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1228]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1229]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1230]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1231]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1232]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1233]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1234]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1235]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1236]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1237]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1238]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1239]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1240]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1241]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1242]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1243]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1244]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1245]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1246]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1247]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1248]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1249]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1250]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1251]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1252]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1253]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1254]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1255]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1256]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1257]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1258]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1259]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1260]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1261]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1262]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1263]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1264]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1265]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1266]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1267]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1268]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1269]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1270]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1271]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1272]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1273]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1274]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1275]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1276]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1277]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1278]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1279]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1280]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1281]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1282]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1283]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1284]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1285]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1286]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1287]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1288]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1289]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1290]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1291]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1292]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1293]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1294]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1295]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1296]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1297]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1298]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1299]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1300]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1301]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1302]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1303]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1304]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1305]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1306]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1307]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1308]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1309]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1310]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1311]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1312]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1313]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1314]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1315]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1316]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1317]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1318]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1319]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1320]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1321]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1322]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1323]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1324]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1325]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1326]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1327]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1328]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1329]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1330]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1331]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1332]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1333]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1334]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1335]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1336]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1337]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1338]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1339]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1340]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1341]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1342]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1343]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1344]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1345]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1346]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1347]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1348]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1349]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1350]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1351]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1352]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1353]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1354]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1355]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1356]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1357]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1358]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1359]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1360]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1361]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1362]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1363]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1364]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1365]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1366]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1367]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1368]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1369]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1370]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1371]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1372]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1373]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1374]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1375]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1376]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1377]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1378]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1379]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1380]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1381]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1382]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1383]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1384]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1385]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1386]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1387]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1388]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1389]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1390]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1391]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1392]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1393]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1394]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1395]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1396]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1397]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1398]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1399]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1400]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1401]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1402]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1403]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1404]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1405]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1406]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1407]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1408]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1409]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1410]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1411]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1412]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1413]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1414]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1415]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1416]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1417]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1418]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1419]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1420]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1421]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1422]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1423]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1424]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1425]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1426]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1427]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1428]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1429]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1430]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1431]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1432]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1433]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1434]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1435]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1436]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1437]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1438]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1439]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1440]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1441]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1442]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1443]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1444]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1445]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1446]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1447]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1448]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1449]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1450]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1451]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1452]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1453]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1454]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1455]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1456]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1457]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1458]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1459]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1460]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1461]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1462]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1463]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1464]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1465]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1466]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1467]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1468]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1469]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1470]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1471]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1472]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1473]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1474]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1475]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1476]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1477]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1478]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1479]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1480]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1481]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1482]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1483]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1484]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1485]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1486]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1487]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1488]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1489]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1490]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1491]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1492]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1493]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1494]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1495]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1496]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1497]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1498]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1499]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1500]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1501]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1502]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1503]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1504]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1505]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1506]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1507]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1508]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1509]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1510]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1511]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1512]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1513]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1514]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1515]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1516]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1517]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1518]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1519]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1520]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1521]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1522]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1523]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1524]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1525]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1526]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1527]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1528]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1529]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1530]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1531]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1532]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1533]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1534]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1535]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1536]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1537]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1538]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1539]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1540]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1541]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1542]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1543]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1544]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1545]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1546]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1547]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1548]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1549]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1550]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1551]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1552]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1553]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1554]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1555]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1556]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1557]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1558]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1559]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1560]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1561]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1562]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1563]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1564]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1565]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1566]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1567]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1568]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1569]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1570]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1571]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1572]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1573]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1574]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1575]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1576]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1577]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1578]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1579]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1580]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1581]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1582]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1583]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1584]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1585]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1586]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1587]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1588]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1589]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1590]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1591]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1592]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1593]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1594]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1595]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1596]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1597]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1598]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1599]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1600]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1601]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1602]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1603]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1604]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1605]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1606]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1607]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1608]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1609]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1610]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1611]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1612]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1613]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1614]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1615]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1616]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1617]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1618]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1619]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1620]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1621]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1622]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1623]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1624]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1625]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1626]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1627]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1628]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1629]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1630]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1631]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1632]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1633]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1634]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1635]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1636]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1637]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1638]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1639]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1640]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1641]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1642]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1643]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1644]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1645]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1646]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1647]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1648]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1649]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1650]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1651]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1652]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1653]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1654]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1655]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1656]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1657]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1658]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1659]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1660]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1661]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1662]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1663]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1664]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1665]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1666]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1667]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
#> 
#> [[1668]]
#> [1] "-----END OpenVPN Static key V1-----" 
#> [2] "</tls-auth>"                         
#> [3] "auth-user-pass /etc/openvpn/auth.txt"
```
