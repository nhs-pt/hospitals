library(readODS)
library(tibble)
library(magrittr)
library(here)

hospitals <- readODS::read_ods(path = here::here('data-raw/hospitals.ods')) %>%
  tibble::as_tibble()

usethis::use_data(hospitals, overwrite = TRUE)
