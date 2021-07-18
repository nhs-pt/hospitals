#' @export
hospital_id_to_short_name <- function(hospital_id) {

  # Convert `hospital_id` vector to a one-column tibble
  hospital_id_tbl <- tibble::tibble(hospital_id)

  dplyr::left_join(hospital_id_tbl, hospitals, by = 'hospital_id') %>%
    dplyr::pull('short_name')

}

#' @export
short_name_to_hospital_id <- function(short_name) {

  # Convert `short_name` vector to a one-column tibble
  short_name_tbl <- tibble::tibble(short_name)

  dplyr::left_join(short_name_tbl, hospitals, by = 'short_name') %>%
    dplyr::pull('hospital_id')

}
