#' Get hospital attribute
#'
#' `get_hospital_attribute` retrieves one of the variables of [`hospitals`]
#' as indicated in `x`. Hospitals in `x` can be specified by the: (i) hospital
#' identifier, (ii) acronym, or the (iii) shortened or (iv) full version of the
#' hospital name.
#'
#' @param x A character vector of values that refer to hospitals, can be either
#'   the hospital identifier (e.g. `"h0003"`), its acronym (e.g. `"HB"`), the
#'   shortened name (`"H de Braga"`) or the full name (`"Hospital de Braga,
#'   EPE"`). Indicate how `x` should be interpreted with the parameter `key`.
#' @param key A string indicating the type of values in `x`: `"hospital_id"`,
#'   `"hospital_acronym"`, `"hospital_short_name"` or `"hospital_full_name"`.
#' @param value A string indicating the hospital attribute to be returned, can
#'   be any of the columns of [`hospitals`].
#'
#' @return A character vector of hospital attributes.
#'
#' @examples
#' # Get the short name of a hospital
#' # (same as get_hospital_attribute('h0001', value = 'hospital_short_name'))
#' get_hospital_attribute('h0001')
#'
#' # Or get instead the full name
#' get_hospital_attribute('h0001', value = 'hospital_full_name')
#'
#' # Map the hospital short name to its full name
#' get_hospital_attribute('IPO de Lisboa', key = 'hospital_short_name', value = 'hospital_full_name')
#'
#' @md
#' @export
get_hospital_attribute <- function(x,
                key = 'hospital_id',
                value = 'hospital_short_name') {

  allowed_keys <-
    c('hospital_id',
      'hospital_acronym',
      'hospital_short_name',
      'hospital_full_name')

  key <- match.arg(key, choices = allowed_keys)
  value <- match.arg(value, choices = colnames(hospitals))

  if(identical(key, value)) return(x)

  idx <- match(x, hospitals[[key]])

  return(hospitals[[value]][idx])

}
