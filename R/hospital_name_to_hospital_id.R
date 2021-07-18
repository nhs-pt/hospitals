whole <- function(str) paste0('^.*(', str, ').*$')

match_hname_to_hid0 <- function(hospital_name) {

  if(length(hospital_name) == 1 && is.na(hospital_name))
    return(NA_character_)

  if(!rlang::is_string(hospital_name))
    stop('`hospital_name` must be a string.')

  pattern <- hospitals$regex
  replacement <- hospitals$hospital_id

  # Replace hospital name with hospital id
  hospital_id <- stringr::str_replace(
    hospital_name,
    pattern = stringr::regex(whole(pattern), ignore_case = TRUE),
    replacement = replacement
  )

  # If str_replace did not replace then `hospital_id` is equal
  # to `hospital_name`.
  hospital_id <- hospital_id[hospital_id != hospital_name]
  if(length(hospital_id) == 0) return(NA_character_)
  else return(hospital_id)

}

match_hname_to_hid <- Vectorize(vectorize.args = 'hospital_name', FUN = match_hname_to_hid0)

#' @export
hospital_name_to_hospital_id <- match_hname_to_hid
