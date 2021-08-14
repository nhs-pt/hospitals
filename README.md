
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

# Here are the first 6 columns
hospitals[1:6] %>% print(n = Inf)
#> # A tibble: 52 x 6
#>    hospital_id hospital_acronym hospital_legal_… hospital_integr… hospital_group
#>    <chr>       <chr>            <chr>            <chr>            <chr>         
#>  1 h0001       ULSNE            EPE              ULS              I             
#>  2 h0002       ULSAM            EPE              ULS              I             
#>  3 h0003       HB               EPE              H                II            
#>  4 h0004       HSMM             EPE              H                I             
#>  5 h0005       HSOG             EPE              H                I             
#>  6 h0006       CHPVVC           EPE              CH               I             
#>  7 h0007       CHMA             EPE              CH               I             
#>  8 h0008       CHTMAD           EPE              CH               II            
#>  9 h0009       CHTS             EPE              CH               I             
#> 10 h0010       CHSJ             EPE              CH               III           
#> 11 h0011       IPOP             EPE              H                IV-a          
#> 12 h0012       ULSM             EPE              ULS              I             
#> 13 h0013       CHUP             EPE              CH               III           
#> 14 h0014       CHVNG/E          EPE              CH               II            
#> 15 h0015       CHEDV            EPE              CH               I             
#> 16 h0016       HML              EPE              H                IV-c          
#> 17 h0017       HFZ              SPA              H                I             
#> 18 h0018       HLC              IPSS-CA          H                I             
#> 19 h0019       HSJ              IPSS-CA          H                <NA>          
#> 20 h0020       CHBV             EPE              CH               I             
#> 21 h0021       ULSG             EPE              ULS              I             
#> 22 h0022       CHTV             EPE              CH               II            
#> 23 h0023       CHUCB            EPE              CH               I             
#> 24 h0024       CHUC             EPE              CH               III           
#> 25 h0025       IPOC             EPE              H                IV-a          
#> 26 h0026       HDFF             EPE              H                I             
#> 27 h0027       ULSCB            EPE              ULS              I             
#> 28 h0028       CHL              EPE              CH               I             
#> 29 h0029       CMRRC-RP         SPA              H                IV-b          
#> 30 h0030       HAJC             SPA              H                I             
#> 31 h0031       CHMT             EPE              CH               I             
#> 32 h0032       CHO              EPE              CH               I             
#> 33 h0033       HDS              EPE              H                I             
#> 34 h0034       HVFX             EPE              H                I             
#> 35 h0035       HL               PPP              H                I             
#> 36 h0036       CHLN             EPE              CH               III           
#> 37 h0037       HFF              EPE              H                I             
#> 38 h0038       IPOL             EPE              H                IV-a          
#> 39 h0039       HC               PPP              H                I             
#> 40 h0040       CHULC            EPE              CH               III           
#> 41 h0041       CHLO             EPE              CH               II            
#> 42 h0042       HGO              EPE              H                II            
#> 43 h0043       CHBM             EPE              CH               I             
#> 44 h0044       CHS              EPE              CH               I             
#> 45 h0045       CHPL             SPA              CH               IV-c          
#> 46 h0046       IOGP             SPA              H                IV            
#> 47 h0047       ULSNA            EPE              ULS              I             
#> 48 h0048       HESE             EPE              H                II            
#> 49 h0049       ULSLA            EPE              ULS              I             
#> 50 h0050       ULSBA            EPE              ULS              I             
#> 51 h0051       HSP              IPSS-CA          H                <NA>          
#> 52 h0052       CHUA             EPE              CH               II            
#> # … with 1 more variable: hospital_short_name <chr>
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
#> [1] "ULS de Saúde do Nordeste"

# Same as above
get_hospital_attribute('h0001', value = 'hospital_short_name')
#> [1] "ULS de Saúde do Nordeste"

# Or get instead the full name
get_hospital_attribute('h0001', value = 'hospital_full_name')
#> [1] "Unidade Local de Saúde do Nordeste, EPE"

# Map the hospital short name to its full name
get_hospital_attribute('IPO de Lisboa', key = 'hospital_short_name', value = 'hospital_full_name')
#> [1] "Instituto Português de Oncologia de Lisboa Francisco Gentil, EPE"
```
