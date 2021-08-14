library(readODS)
library(tibble)
library(magrittr)
library(here)

hospitals <- readODS::read_ods(path = here::here('data-raw/hospitals.ods')) %>%
  tibble::as_tibble() %>%
  dplyr::mutate(hospital_vatin = as.integer(hospital_vatin))

usethis::use_data(hospitals, compress = "xz", overwrite = TRUE, version = 2)
usethis::use_data(hospitals, internal = TRUE, compress = "xz", overwrite = TRUE, version = 2)
