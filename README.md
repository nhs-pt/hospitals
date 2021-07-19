
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hospitals <img src='man/figures/logo.svg' align="right" height="139" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

This R data package contains one single dataset — the eponymous
`hospitals` tibble — comprising the up to date set of hospitals in the
Portuguese National Health Service.

For a description of each variable and data sources used to assemble
this dataset browse the documentation with `?hospitals`.

## Installation

You can install the current version of hospitals with:

``` r
# install.packages("remotes")
remotes::install_github("nhs-pt/hospitals")
```

## The `hospitals` dataset

The `hospital_id` variable is a surrogate identifier created by us that
ought to help researchers refer to hospitals in an unambiguous way. The
idea is for these identifiers to never change. So if an hospital
disappears, or is merged with another one, we will create deprecate old
identifiers and create new ones accordingly.

``` r
library(hospitals)

hospitals[1:6] %>% print(n = Inf)
#> # A tibble: 52 x 6
#>    hospital_id acronym  legal_status integration group short_name               
#>    <chr>       <chr>    <chr>        <chr>       <chr> <chr>                    
#>  1 h0001       ULSNE    EPE          ULS         I     ULS de Saúde do Nordeste 
#>  2 h0002       ULSAM    EPE          ULS         I     ULS do Alto Minho        
#>  3 h0003       HB       EPE          H           II    H de Braga               
#>  4 h0004       HSMM     EPE          H           I     H Santa Maria Maior      
#>  5 h0005       HSOG     EPE          H           I     H da Senhora da Oliveira 
#>  6 h0006       CHPVVC   EPE          CH          I     CH Póvoa de Varzim/Vila …
#>  7 h0007       CHMA     EPE          CH          I     CH do Médio Ave          
#>  8 h0008       CHTMAD   EPE          CH          II    CH Trás-os-Montes e Alto…
#>  9 h0009       CHTS     EPE          CH          I     CH Tâmega e Sousa        
#> 10 h0010       CHSJ     EPE          CH          III   CHU de São João          
#> 11 h0011       IPOP     EPE          H           IV-a  IPO do Porto             
#> 12 h0012       ULSM     EPE          ULS         I     ULS de Matosinhos        
#> 13 h0013       CHUP     EPE          CH          III   CHU do Porto             
#> 14 h0014       CHVNG/E  EPE          CH          II    CH Vila Nova de Gaia/Esp…
#> 15 h0015       CHEDV    EPE          CH          I     CH de Entre o Douro e Vo…
#> 16 h0016       HML      EPE          H           IV-c  H de Magalhães Lemos     
#> 17 h0017       HFZ      SPA          H           I     H Dr. Francisco Zagalo   
#> 18 h0018       HLC      IPSS-CA      H           I     H Luciano de Castro, Ana…
#> 19 h0019       HSJ      IPSS-CA      H           <NA>  H São José, Fafe         
#> 20 h0020       CHBV     EPE          CH          I     CH do Baixo Vouga        
#> 21 h0021       ULSG     EPE          ULS         I     ULS da Guarda            
#> 22 h0022       CHTV     EPE          CH          II    CH Tondela-Viseu         
#> 23 h0023       CHUCB    EPE          CH          I     CHU Cova da Beira        
#> 24 h0024       CHUC     EPE          CH          III   CHU de Coimbra           
#> 25 h0025       IPOC     EPE          H           IV-a  IPO de Coimbra           
#> 26 h0026       HDFF     EPE          H           I     HD da Figueira da Foz    
#> 27 h0027       ULSCB    EPE          ULS         I     ULS de Castelo Branco    
#> 28 h0028       CHL      EPE          CH          I     CH de Leiria             
#> 29 h0029       CMRRC-RP SPA          H           IV-b  CM de Reabilitação da RC…
#> 30 h0030       HAJC     SPA          H           I     H de Cantanhede          
#> 31 h0031       CHMT     EPE          CH          I     CH Médio Tejo            
#> 32 h0032       CHO      EPE          CH          I     CH do Oeste              
#> 33 h0033       HDS      EPE          H           I     HD de Santarém           
#> 34 h0034       HVFX     EPE          H           I     H de Vila Franca de Xira 
#> 35 h0035       HL       PPP          H           I     H de Loures              
#> 36 h0036       CHLN     EPE          CH          III   CHU Lisboa Norte         
#> 37 h0037       HFF      EPE          H           I     H Prof Doutor Fernando F…
#> 38 h0038       IPOL     EPE          H           IV-a  IPO de Lisboa            
#> 39 h0039       HC       PPP          H           I     H de Cascais             
#> 40 h0040       CHULC    EPE          CH          III   CHU de Lisboa Central    
#> 41 h0041       CHLO     EPE          CH          II    CH de Lisboa Ocidental   
#> 42 h0042       HGO      EPE          H           II    H Garcia de Orta         
#> 43 h0043       CHBM     EPE          CH          I     CH Barreiro/Montijo      
#> 44 h0044       CHS      EPE          CH          I     CH de Setúbal            
#> 45 h0045       CHPL     SPA          CH          IV-c  CH Psiquiátrico de Lisboa
#> 46 h0046       IOGP     SPA          H           IV    I de Oftalmologia Dr. Ga…
#> 47 h0047       ULSNA    EPE          ULS         I     ULS do Norte Alentejano  
#> 48 h0048       HESE     EPE          H           II    H Espírito Santo de Évora
#> 49 h0049       ULSLA    EPE          ULS         I     ULS do Litoral Alentejano
#> 50 h0050       ULSBA    EPE          ULS         I     ULS do Baixo Alentejo    
#> 51 h0051       HSP      IPSS-CA      H           <NA>  H de São Paulo, Serpa    
#> 52 h0052       CHUA     EPE          CH          II    CHU do Algarve
```

## Helper functions

### `sanitise()`

The names of the hospitals can have subtle variations. I provide a few
functions that help map hospital names found elsewhere to the values in
the columns `hospital_id` or `full_name`.

For example, with `sanitise` you can convert hospital names found
elsewhere to the names found in `hospitals$full_name`:

``` r
sanitise(c('Hospital do Alto Minho'))
#> [1] "Unidade Local de Saúde do Alto Minho, EPE"
```

Also `sanitise` is aware of old hospital names, and can map to the new
ones:

``` r
sanitise(c('Hospital do Alto Ave'))
#> [1] "Hospital da Senhora da Oliveira, Guimarães, EPE"
```

The method behind `sanitise` for matching hospital names to their names
in `full_name` is based on an heuristic that uses a minimal set of
keywords to identify the hospital. So it is pretty tolerant to
variations in the name as long as one of the critical keywords is found
in the name, e.g., to identify the Hospital of Algarve as such only the
keyword *Algarve* needs to be present in the name:

``` r
sanitise(c('Algarve', 'H Algarve', 'Hospital do Algarve'))
#> [1] "Centro Hospitalar Universitário do Algarve, EPE"
#> [2] "Centro Hospitalar Universitário do Algarve, EPE"
#> [3] "Centro Hospitalar Universitário do Algarve, EPE"
```

Also `sanitise` should be lenient with typos associated with accented
characters:

``` r
sanitise('Hospital de São João')
#> [1] "Centro Hospitalar Universitário de São João, EPE"

# Without the tildes the mapping still works fine
sanitise('Hospital de Sao Joao')
#> [1] "Centro Hospitalar Universitário de São João, EPE"
```

If you rather have the short version of the hospital names use the
`form` argument:

``` r
sanitise('Matosinhos', form = 'short_name')
#> [1] "ULS de Matosinhos"

# 'full_name' is the default
sanitise('Matosinhos', form = 'full_name')
#> [1] "Unidade Local de Saúde de Matosinhos, EPE"
```

### `hospital_name_to_hospital_id()`

The function `hospital_name_to_hospital_id` uses the same heuristic as
`sanitise` but returns the hospital identifier instead:

``` r
hospital_name_to_hospital_id(c('Matosinhos', 'Algarve'))
#> Matosinhos    Algarve 
#>    "h0012"    "h0052"
```

This can be useful if you need to map hospital names to some other
variables in `hospitals`, as the `hospital_id` can be used as key in a
join operation. For example, to get the legal status of the Hospital of
Guarda and Hospital São José in Fafe you can do:

``` r
hospital_name_to_hospital_id(c('Guarda', 'São José')) %>%
  tibble::tibble(hospital_id = .) %>%
  dplyr::left_join(hospitals, by = 'hospital_id') %>%
  dplyr::select(c('hospital_id', 'legal_status'))
#> # A tibble: 2 x 2
#>   hospital_id legal_status
#>   <chr>       <chr>       
#> 1 h0021       EPE         
#> 2 h0019       IPSS-CA
```
