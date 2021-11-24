test_that("basic cases", {
  expect_identical(normalise('Matosinhos'), 'ULS de Matosinhos')
  expect_identical(normalise('Matosinhos', 'hospital_full_name'), 'Unidade Local de Saúde de Matosinhos, EPE')
  expect_identical(normalise('Matosinhos', 'hospital_id'), 'h0012')
  expect_identical(normalise('Matosinhos', 'hospital_acronym'), 'ULSM')
})

test_that("old to new hospital names", {
  # The old hospital name "Hospital do Alto Ave" is mapped to the new name
  # "Hospital da Senhora da Oliveira, Guimarães, EPE".
  expect_identical(normalise('Hospital do Alto Ave', 'hospital_full_name'), 'Hospital da Senhora da Oliveira, Guimarães, EPE')
})

test_that("partial matching based on key keywords", {
  # The important keyword in this example is "Algarve".
  expect_identical(normalise(c('Algarve', 'H Algarve', 'Hospital do Algarve')), rep('CHU do Algarve', 3))
})

test_that("tolerance towards misuse of accented characters", {
  expect_identical(normalise('Hospital de São João'), 'CHU de São João')
  expect_identical(normalise('Hospital de Sao Joao'), 'CHU de São João')
})

test_that("unmatched hospital names", {
  expect_identical(normalise('Hospital do Wonderland'), NA_character_)
  expect_identical(normalise('Hospital do Wonderland', unmatched_as_na = FALSE), 'Hospital do Wonderland')
})

test_that("normalise and normalize always yield the same result", {
  expect_identical(normalise('Matosinhos'), normalize('Matosinhos'))
  expect_identical(normalise('Matosinhos', 'hospital_full_name'), normalize('Matosinhos', 'hospital_full_name'))
})
