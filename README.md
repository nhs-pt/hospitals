
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hospitals <img src='man/figures/logo.svg' align="right" height="139" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

This R data package contains one single dataset — the eponymous
`hospitals` tibble — comprising the current 52 hospitals in the
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
disappears, or is merged with another one, we will deprecate old
identifiers and create new, accordingly.

``` r
library(hospitals)

# Hospital identifier and short name
hospitals[c(1, 6)] %>% print(n = Inf)
#> # A tibble: 52 x 2
#>    hospital_id hospital_short_name                   
#>    <chr>       <chr>                                 
#>  1 h0001       ULS do Nordeste                       
#>  2 h0002       ULS do Alto Minho                     
#>  3 h0003       H de Braga                            
#>  4 h0004       H Santa Maria Maior                   
#>  5 h0005       H da Senhora da Oliveira              
#>  6 h0006       CH Póvoa de Varzim/Vila do Conde      
#>  7 h0007       CH do Médio Ave                       
#>  8 h0008       CH Trás-os-Montes e Alto Douro        
#>  9 h0009       CH Tâmega e Sousa                     
#> 10 h0010       CHU de São João                       
#> 11 h0011       IPO do Porto                          
#> 12 h0012       ULS de Matosinhos                     
#> 13 h0013       CHU do Porto                          
#> 14 h0014       CH Vila Nova de Gaia/Espinho          
#> 15 h0015       CH de Entre o Douro e Vouga           
#> 16 h0016       H de Magalhães Lemos                  
#> 17 h0017       H Dr. Francisco Zagalo                
#> 18 h0018       H Luciano de Castro, Anadia           
#> 19 h0019       H São José, Fafe                      
#> 20 h0020       CH do Baixo Vouga                     
#> 21 h0021       ULS da Guarda                         
#> 22 h0022       CH Tondela-Viseu                      
#> 23 h0023       CHU Cova da Beira                     
#> 24 h0024       CHU de Coimbra                        
#> 25 h0025       IPO de Coimbra                        
#> 26 h0026       HD da Figueira da Foz                 
#> 27 h0027       ULS de Castelo Branco                 
#> 28 h0028       CH de Leiria                          
#> 29 h0029       CM de Reabilitação da RC, Rovisco Pais
#> 30 h0030       H de Cantanhede                       
#> 31 h0031       CH Médio Tejo                         
#> 32 h0032       CH do Oeste                           
#> 33 h0033       HD de Santarém                        
#> 34 h0034       H de Vila Franca de Xira              
#> 35 h0035       H de Loures                           
#> 36 h0036       CHU Lisboa Norte                      
#> 37 h0037       H Prof Doutor Fernando Fonseca        
#> 38 h0038       IPO de Lisboa                         
#> 39 h0039       H de Cascais                          
#> 40 h0040       CHU de Lisboa Central                 
#> 41 h0041       CH de Lisboa Ocidental                
#> 42 h0042       H Garcia de Orta                      
#> 43 h0043       CH Barreiro/Montijo                   
#> 44 h0044       CH de Setúbal                         
#> 45 h0045       CH Psiquiátrico de Lisboa             
#> 46 h0046       I de Oftalmologia Dr. Gama Pinto      
#> 47 h0047       ULS do Norte Alentejano               
#> 48 h0048       H Espírito Santo de Évora             
#> 49 h0049       ULS do Litoral Alentejano             
#> 50 h0050       ULS do Baixo Alentejo                 
#> 51 h0051       H de São Paulo, Serpa                 
#> 52 h0052       CHU do Algarve
```

## Helper functions

### `normalise()`

The names of hospitals found in the wild can have subtle variations. The
`normalise()` function matches hospital names found elsewhere to the
hospitals included in the dataset `hospitals`.

For example, with `normalise` you can convert hospital names found
elsewhere to the names found in `hospitals$hospital_short_name`:

``` r
normalise(c('Hospital do Alto Minho'))
#> [1] "ULS do Alto Minho"
```

Also `normalise` is aware of old hospital names, and can map to the new
ones:

``` r
normalise(c('Hospital do Alto Ave'))
#> [1] "H da Senhora da Oliveira"
```

The method behind `normalise` for matching hospital names to their names
in `hospital_short_name` is based on an heuristic that uses a minimal
set of keywords to identify the hospital. So it is pretty tolerant to
variations in the name as long as one of the critical keywords is found
in the name, e.g., to identify the Hospital of Algarve as such only the
keyword *Algarve* needs to be present in the name:

``` r
normalise(c('Algarve', 'H Algarve', 'Hospital do Algarve'))
#> [1] "CHU do Algarve" "CHU do Algarve" "CHU do Algarve"
```

Also `normalise` should be lenient with typos associated with accented
characters:

``` r
normalise('Hospital de São João')
#> [1] "CHU de São João"

# Without the tildes the mapping still works fine
normalise('Hospital de Sao Joao')
#> [1] "CHU de São João"
```

Instead of the `hospital_short_name` you may ask for the
`hospital_full_name` or the `hospital_id`:

``` r
# 'hospital_short_name' is the default 
normalise('Matosinhos', return = 'hospital_short_name')
#> [1] "ULS de Matosinhos"

normalise('Matosinhos', return = 'hospital_full_name')
#> [1] "Unidade Local de Saúde de Matosinhos, EPE"

normalise('Matosinhos', return = 'hospital_id')
#> [1] "h0012"
```

### `get_hospital_attribute()`

`get_hospital_attribute()` is a thin wrapper function allowing you to
easily retrieve hospital attributes from the dataset `hospitals`. You
specify the hospitals by indicating what type of key you are providing:
`"hospital_id"`, `"hospital_acronym"`, `"hospital_short_name"` or
`"hospital_full_name"`. And specify the column variable in `hospitals`
with the `value` argument (default is `"hospital_short_name"`).

``` r
# By default you get the hospital short name
get_hospital_attribute('h0001')
#> [1] "ULS do Nordeste"

# Same as above
get_hospital_attribute('h0001', value = 'hospital_short_name')
#> [1] "ULS do Nordeste"

# Or get instead the full name
get_hospital_attribute('h0001', value = 'hospital_full_name')
#> [1] "Unidade Local de Saúde do Nordeste, EPE"

# Map the hospital short name to its full name
get_hospital_attribute('IPO de Lisboa', key = 'hospital_short_name', value = 'hospital_full_name')
#> [1] "Instituto Português de Oncologia de Lisboa Francisco Gentil, EPE"
```
