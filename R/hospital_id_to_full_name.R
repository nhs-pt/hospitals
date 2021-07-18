#' @export
hospital_id_to_full_name <- function(hospital_id) {

  # Convert `hospital_id` vector to a one-column tibble
  hospital_id_tbl <- tibble::tibble(hospital_id)

  dplyr::left_join(hospital_id_tbl, hospitals, by = 'hospital_id') %>%
    dplyr::pull('full_name')

}

#' @export
full_name_to_hospital_id <- function(full_name) {

  # Convert `full_name` vector to a one-column tibble
  full_name_tbl <- tibble::tibble(full_name)

  dplyr::left_join(full_name_tbl, hospitals, by = 'full_name') %>%
    dplyr::pull('hospital_id')

}
