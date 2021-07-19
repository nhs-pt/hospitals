
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

``` r
library(hospitals)

hospitals[1:6] %>% print(n = Inf)
#> # A tibble: 52 x 6
#>    hospital_id acronym  legal_status integration group short_name               
#>    <chr>       <chr>    <chr>        <chr>       <chr> <chr>                    
#>  1 h001        ULSNE    EPE          ULS         I     ULS de Saúde do Nordeste 
#>  2 h002        ULSAM    EPE          ULS         I     ULS do Alto Minho        
#>  3 h003        HB       EPE          H           II    H de Braga               
#>  4 h004        HSMM     EPE          H           I     H Santa Maria Maior      
#>  5 h005        HSOG     EPE          H           I     H da Senhora da Oliveira 
#>  6 h006        CHPVVC   EPE          CH          I     CH Póvoa de Varzim/Vila …
#>  7 h007        CHMA     EPE          CH          I     CH do Médio Ave          
#>  8 h008        CHTMAD   EPE          CH          II    CH Trás-os-Montes e Alto…
#>  9 h009        CHTS     EPE          CH          I     CH Tâmega e Sousa        
#> 10 h010        CHSJ     EPE          CH          III   CHU de São João          
#> 11 h011        IPOP     EPE          H           IV-a  IPO do Porto             
#> 12 h012        ULSM     EPE          ULS         I     ULS de Matosinhos        
#> 13 h013        CHUP     EPE          CH          III   CHU do Porto             
#> 14 h014        CHVNG/E  EPE          CH          II    CH Vila Nova de Gaia/Esp…
#> 15 h015        CHEDV    EPE          CH          I     CH de Entre o Douro e Vo…
#> 16 h016        HML      EPE          H           IV-c  H de Magalhães Lemos     
#> 17 h017        HFZ      SPA          H           I     H Dr. Francisco Zagalo   
#> 18 h018        HLC      IPSS-CA      H           I     H Luciano de Castro, Ana…
#> 19 h019        HSJ      IPSS-CA      H           <NA>  H São José, Fafe         
#> 20 h020        CHBV     EPE          CH          I     CH do Baixo Vouga        
#> 21 h021        ULSG     EPE          ULS         I     ULS da Guarda            
#> 22 h022        CHTV     EPE          CH          II    CH Tondela-Viseu         
#> 23 h023        CHUCB    EPE          CH          I     CHU Cova da Beira        
#> 24 h024        CHUC     EPE          CH          III   CHU de Coimbra           
#> 25 h025        IPOC     EPE          H           IV-a  IPO de Coimbra           
#> 26 h026        HDFF     EPE          H           I     HD da Figueira da Foz    
#> 27 h027        ULSCB    EPE          ULS         I     ULS de Castelo Branco    
#> 28 h028        CHL      EPE          CH          I     CH de Leiria             
#> 29 h029        CMRRC-RP SPA          H           IV-b  CM de Reabilitação da RC…
#> 30 h030        HAJC     SPA          H           I     H de Cantanhede          
#> 31 h031        CHMT     EPE          CH          I     CH Médio Tejo            
#> 32 h032        CHO      EPE          CH          I     CH do Oeste              
#> 33 h033        HDS      EPE          H           I     HD de Santarém           
#> 34 h034        HVFX     EPE          H           I     H de Vila Franca de Xira 
#> 35 h035        HL       PPP          H           I     H de Loures              
#> 36 h036        CHLN     EPE          CH          III   CHU Lisboa Norte         
#> 37 h037        HFF      EPE          H           I     H Prof Doutor Fernando F…
#> 38 h038        IPOL     EPE          H           IV-a  IPO de Lisboa            
#> 39 h039        HC       PPP          H           I     H de Cascais             
#> 40 h040        CHULC    EPE          CH          III   CHU de Lisboa Central    
#> 41 h041        CHLO     EPE          CH          II    CH de Lisboa Ocidental   
#> 42 h042        HGO      EPE          H           II    H Garcia de Orta         
#> 43 h043        CHBM     EPE          CH          I     CH Barreiro/Montijo      
#> 44 h044        CHS      EPE          CH          I     CH de Setúbal            
#> 45 h045        CHPL     SPA          CH          IV-c  CH Psiquiátrico de Lisboa
#> 46 h046        IOGP     SPA          H           IV    I de Oftalmologia Dr. Ga…
#> 47 h047        ULSNA    EPE          ULS         I     ULS do Norte Alentejano  
#> 48 h048        HESE     EPE          H           II    H Espírito Santo de Évora
#> 49 h049        ULSLA    EPE          ULS         I     ULS do Litoral Alentejano
#> 50 h050        ULSBA    EPE          ULS         I     ULS do Baixo Alentejo    
#> 51 h051        HSP      IPSS-CA      H           <NA>  H de São Paulo, Serpa    
#> 52 h052        CHUA     EPE          CH          II    CHU do Algarve
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

If you rather have the short version of the hospital names use the
`form` argument:

``` r
sanitise('Matosinhos', form = 'short_name')
#> [1] "ULS de Matosinhos"
sanitise('Matosinhos', form = 'full_name')
#> [1] "Unidade Local de Saúde de Matosinhos, EPE"
```

### `hospital_name_to_hospital_id()`

The function `hospital_name_to_hospital_id` uses the same heuristic as
`sanitise` but returns the hospital identifier instead:

``` r
hospital_name_to_hospital_id(c('Matosinhos', 'Algarve'))
#> Matosinhos    Algarve 
#>     "h012"     "h052"
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
#> 1 h021        EPE         
#> 2 h019        IPSS-CA
```
