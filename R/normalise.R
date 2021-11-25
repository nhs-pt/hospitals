whole <- function(str) paste0('^.*(', str, ').*$')

recode <- function(string, pattern, replacement) {
  lgl <- stringr::str_detect(string, pattern)
  rep <- replacement[which(lgl)[1]]

  return(rep)
}


#' Normalise hospital names
#'
#' `normalise` tries to match provided hospital names to the Portuguese NHS
#' hospitals, i.e. to those hospitals included in the data set
#' \code{\link[hospitals]{hospitals}}, thus allowing conversion to standard
#' hospital names. By default, it returns the shortened version of the hospital
#' name: column `hospital_short_name` in \code{\link[hospitals]{hospitals}}. Use
#' the `return` argument to return a different variable, see below for possible
#' values.
#'
#' The method behind `normalise` for matching hospital names is based on an
#' heuristic that uses a minimal set of keywords to identify the hospital. This
#' is implemented by using regular expressions. The regular expressions are
#' provided in data set \code{\link[hospitals]{hospitals}}, column
#' `hospital_regex`. Moreover, the method is case insensitive and is pretty
#' tolerant to variations in the name as long as one of the critical keywords is
#' found in the name. Note however that the regular expressions have been
#' designed such that matches are mutually exclusive. So the same hospital name
#' will never match more than one hospital of the data set
#' \code{\link[hospitals]{hospitals}}.
#'
#' `normalise` is aware of deprecated hospital names, and will map those old
#' designations to the new hospital names, e.g., Hospital do Alto Ave is
#' correctly mapped to `r normalise('Hospital do Alto Ave', 'hospital_full_name')`.
#'
#' `normalise` is lenient with typos associated with accented characters, so,
#' e.g., both expressions 'Hospital de São João' and 'Hospital de Sao Joao' will
#' correctly match to the same hospital: `r normalise('Hospital de Sao Joao')`.
#'
#' @param nm A character vector of hospital names.
#' @param return A string indicating the hospital attribute to be returned:
#'   either `hospital_short_name` (default), `hospital_full_name`, `hospital_id`
#'   or `hospital_acronym`. These hospital variables are documented in
#'   \code{\link[hospitals]{hospitals}}.
#' @param unmatched_as_na A logical indicating whether unmatched hospital names
#'   are returned as `NA` (`TRUE`, the default) or as originally supplied in
#'   `nm` (`FALSE`).
#'
#' @return A character vector.
#' @md
#' @examples
#' # Match hospital with a single keyword
#' normalise('Matosinhos')
#'
#' # The same, but return now the full name
#' normalise('Matosinhos', 'hospital_full_name')
#'
#' # Get instead the hospital identifier
#' normalise('Matosinhos', 'hospital_id')
#'
#' # Or even just the acronym (useful for labelling in plots)
#' normalise('Matosinhos', 'hospital_acronym')
#'
#' # Find hospitals from their old names
#' # "Hospital do Alto Ave" is the old name for 'Hospital da Senhora da Oliveira, Guimarães, EPE'
#' normalise('Hospital do Alto Ave', 'hospital_full_name')
#'
#' # `normalise()` is vectorised over `nm`
#' normalise(nm = c('medio tejo', 'oeste', 'guarda'))
#'
#' @export
normalise <-
  function(nm,
           return = c('hospital_short_name',
                      'hospital_full_name',
                      'hospital_id',
                      'hospital_acronym'),
           unmatched_as_na = TRUE) {

  # The type of value to map the name (`nm`) to.
  # return <- rlang::arg_match(return)
  return <- match.arg(return)

  # Convert the hospital names (`nm`) to a factor. We will match and replace on
  # the levels instead of doing the same operation on the original character vector
  # `nm` which would be computationally expensive.
  hn_fac <- factor(nm)

  pattern <- stringr::regex(whole(hospitals$hospital_regex), ignore_case = TRUE)
  replacement <- hospitals[[return]]

  # levels(hn_fac) <- purrr::map_chr(levels(hn_fac), recode, pattern = pattern, replacement = replacement)
  levels(hn_fac) <- sapply(levels(hn_fac), recode, pattern = pattern, replacement = replacement)

  # Convert back to character
  hn_chr <- as.character(hn_fac)

  if(!unmatched_as_na) {
    hn_chr[is.na(hn_chr)] <- nm[is.na(hn_chr)]
  }

  return(hn_chr)

}

#' @rdname normalise
#' @export
normalize <- normalise
