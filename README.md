
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hospitals <img src='man/figures/logo.svg' align="right" height="139" />

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/hospitals)](https://CRAN.R-project.org/package=hospitals)
[![License:
CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-lightgrey.svg)](https://creativecommons.org/publicdomain/zero/1.0/)
<!-- badges: end -->

This R data package contains one single data set — the eponymous
`hospitals` tibble — comprising the current 52 hospitals in the
Portuguese National Health Service.

For a description of each variable and data sources used to assemble
this data set browse the documentation with `?hospitals`.

## Installation

Install `{hospitals}` from CRAN:

``` r
install.packages("hospitals")
```

You can instead install the development version of `{hospitals}` by
setting [nhs-pt’s universe](https://nhs-pt.r-universe.dev/) repository:

``` r
options(repos = c(
    nhspt = 'https://nhs-pt.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'))
    
install.packages('hospitals')
```

## The `hospitals` data set

### The Portuguese NHS hospitals

Here are the 52 hospitals currently included in the Portuguese National
Health Service:

``` r
library(hospitals)

# Hospital identifier and name
hospitals[c(1, 7)] %>% print(n = Inf)
#> # A tibble: 52 × 2
#>    hospital_id hospital_full_name                                               
#>    <chr>       <chr>                                                            
#>  1 h0001       Unidade Local de Saúde do Nordeste, EPE                          
#>  2 h0002       Unidade Local de Saúde do Alto Minho, EPE                        
#>  3 h0003       Hospital de Braga, EPE                                           
#>  4 h0004       Hospital Santa Maria Maior, EPE                                  
#>  5 h0005       Hospital da Senhora da Oliveira, Guimarães, EPE                  
#>  6 h0006       Centro Hospitalar Póvoa de Varzim/Vila do Conde, EPE             
#>  7 h0007       Centro Hospitalar do Médio Ave, EPE                              
#>  8 h0008       Centro Hospitalar de Trás-os-Montes e Alto Douro, EPE            
#>  9 h0009       Centro Hospitalar do Tâmega e Sousa, EPE                         
#> 10 h0010       Centro Hospitalar Universitário de São João, EPE                 
#> 11 h0011       Instituto Português de Oncologia do Porto Francisco Gentil, EPE  
#> 12 h0012       Unidade Local de Saúde de Matosinhos, EPE                        
#> 13 h0013       Centro Hospitalar Universitário do Porto, EPE                    
#> 14 h0014       Centro Hospitalar de Vila Nova de Gaia/Espinho, EPE              
#> 15 h0015       Centro Hospitalar de Entre o Douro e Vouga, EPE                  
#> 16 h0016       Hospital de Magalhães Lemos, EPE                                 
#> 17 h0017       Hospital Dr. Francisco Zagalo, Ovar                              
#> 18 h0018       Hospital Luciano de Castro, Anadia                               
#> 19 h0019       Hospital São José, Fafe                                          
#> 20 h0020       Centro Hospitalar do Baixo Vouga, EPE                            
#> 21 h0021       Unidade Local de Saúde da Guarda, EPE                            
#> 22 h0022       Centro Hospitalar Tondela-Viseu, EPE                             
#> 23 h0023       Centro Hospitalar Universitário Cova da Beira, EPE               
#> 24 h0024       Centro Hospitalar e Universitário de Coimbra, EPE                
#> 25 h0025       Instituto Português de Oncologia de Coimbra Francisco Gentil, EPE
#> 26 h0026       Hospital Distrital da Figueira da Foz, EPE                       
#> 27 h0027       Unidade Local de Saúde de Castelo Branco, EPE                    
#> 28 h0028       Centro Hospitalar de Leiria, EPE                                 
#> 29 h0029       Centro de Medicina de Reabilitação da Região Centro, Rovisco Pais
#> 30 h0030       Hospital Arcebispo João Crisóstomo, Cantanhede                   
#> 31 h0031       Centro Hospitalar Médio Tejo, EPE                                
#> 32 h0032       Centro Hospitalar do Oeste, EPE                                  
#> 33 h0033       Hospital Distrital de Santarém, EPE                              
#> 34 h0034       Hospital de Vila Franca de Xira, EPE                             
#> 35 h0035       Hospital Beatriz Ângelo, Loures, PPP                             
#> 36 h0036       Centro Hospitalar Universitário Lisboa Norte, EPE                
#> 37 h0037       Hospital Professor Doutor Fernando Fonseca, EPE                  
#> 38 h0038       Instituto Português de Oncologia de Lisboa Francisco Gentil, EPE 
#> 39 h0039       Hospital Cascais Dr. José Almeida, PPP                           
#> 40 h0040       Centro Hospitalar Universitário de Lisboa Central, EPE           
#> 41 h0041       Centro Hospitalar de Lisboa Ocidental, EPE                       
#> 42 h0042       Hospital Garcia de Orta, EPE                                     
#> 43 h0043       Centro Hospitalar Barreiro/Montijo, EPE                          
#> 44 h0044       Centro Hospitalar de Setúbal, EPE                                
#> 45 h0045       Centro Hospitalar Psiquiátrico de Lisboa                         
#> 46 h0046       Instituto de Oftalmologia Dr. Gama Pinto                         
#> 47 h0047       Unidade Local de Saúde do Norte Alentejano, EPE                  
#> 48 h0048       Hospital do Espírito Santo de Évora, EPE                         
#> 49 h0049       Unidade Local de Saúde do Litoral Alentejano, EPE                
#> 50 h0050       Unidade Local de Saúde do Baixo Alentejo, EPE                    
#> 51 h0051       Hospital de São Paulo, Serpa                                     
#> 52 h0052       Centro Hospitalar Universitário do Algarve, EPE
```

### Variables

The `hospitals` data set contains the following variables:

| Variable                     | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|:-----------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `hospital_id`                | A surrogate identifier created by us that ought to help researchers refer to hospitals in an unambiguous way. The idea is for these identifiers to never change. So if an hospital disappears, or is merged with another one, we will deprecate old identifiers and create new, accordingly.                                                                                                                                                                                                                                                                                                          |
| `hospital_acronym`           | The acronym or initialism of the hospital name.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `hospital_legal_status`      | Either an administrative public sector (`'SPA'`) entity, a corporate public entity (`'EPE'`) or a public-private partnership (`'PPP'`) entity.                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `hospital_integration`       | The integration level of the hospital institution: a single hospital unit (`'H'`); Centro Hospitalar (`'CH'`), comprising two or more individual Hospital units (a case of horizontal integration); and Unidade Local de Saúde (`'ULS'`), comprising both Hospital entities and primary care health centres (a case of vertical integration).                                                                                                                                                                                                                                                         |
| `hospital_group`             | One of the groups defined by [Ordinance 82/2014](https://data.dre.pt/eli/port/82/2014/04/10/p/dre/pt/html): `'I'`, `'II'`, `'III'`, `'IV-a'`, `'IV-b'` or `'IV-c'`. This classification is based on the hospital catchment area and the scope of medical specialities provided. Broadly speaking, group I includes local hospitals, group II corresponds to regional hospitals, and group III to central hospitals. Group IV corresponds to specialised hospitals: IV-a, oncology institutes; IV-b, physical medicine and rehabilitation hospitals; and IV-c, psychiatry and mental health hospitals. |
| `hospital_short_name`        | An abbreviated version of the hospital name.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `hospital_full_name`         | The name of the hospital.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `hospital_region_full_name`  | The name of the Portuguese health region.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `hospital_region_short_name` | A shortened version of `hospital_region_full_name.`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `hospital_vatin`             | VAT identification number (VATIN). In Portuguese, *Número de Identificação de Pessoa Colectiva* (NIPC).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `hospital_latitude`          | Latitude of the location of the hospital entity expressed in decimal degrees.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `hospital_longitude`         | Longitude of the location of the hospital entity expressed in decimal degrees.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `hospital_region_colour`     | Colour associated with the region. These colours are assigned by this package and are provided as a convenience colour palette for plotting in R.                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `hospital_bh_group`          | One of the groups defined by the project Benchmarking of Hospitals. Source: [BH \| Grupos e Instituições](https://benchmarking-acss.min-saude.pt/BH_Enquadramento/GrupoInstituicoes).                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `hospital_bh_group_colour`   | Colour associated with the `hospital_bh_group`. These colours are assigned by this package and are provided as a convenience colour palette for plotting in R.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `hospital_regex`             | A regular expression that can be used to identify hospitals from their names, even when the names are not exactly as in `hospital_full_name`. This is used by the function `normalise()`.                                                                                                                                                                                                                                                                                                                                                                                                             |

## Helper functions

### `normalise()`

The names of hospitals found in the wild can have subtle variations. The
`normalise()` function matches hospital names found elsewhere to the
hospitals included in the data set `hospitals`.

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
easily retrieve hospital attributes from the data set `hospitals`.

You specify the hospitals by indicating what type of key you are
providing: `"hospital_id"`, `"hospital_acronym"`,
`"hospital_short_name"` or `"hospital_full_name"`. Contrarily to the
matching performed by `normalise()`, `get_hospital_attribute()` matches
exactly the key provided.

And specify the column variable in `hospitals` with the `value` argument
(default is `"hospital_short_name"`).

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

## Code of Conduct

Please note that the hospitals project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
