#' @export
sanitise <- function(hospital_name, form = 'full_name') {

  if(!(form) %in% c('full_name', 'short_name'))
    stop('`form` must be either "full_name" or "short_name"')

  hospital_id <- hospital_name_to_hospital_id(hospital_name)
  hospital_id_tbl <- tibble::tibble(hospital_id)

  sanitised_names <-
    dplyr::left_join(hospital_id_tbl, hospitals, by = 'hospital_id') %>%
    dplyr::pull(form)

  return(sanitised_names)
}
