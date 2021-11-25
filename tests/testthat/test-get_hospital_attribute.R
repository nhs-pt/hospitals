test_that("basic usage", {
  expect_identical(get_hospital_attribute('h0001'), 'ULS do Nordeste')
  expect_identical(get_hospital_attribute('h0001', value = 'hospital_full_name'), 'Unidade Local de Saúde do Nordeste, EPE')
  expect_identical(get_hospital_attribute('IPO de Lisboa', key = 'hospital_short_name', value = 'hospital_full_name'), 'Instituto Português de Oncologia de Lisboa Francisco Gentil, EPE')
})

test_that("vectorised over `x`", {
  expect_identical(get_hospital_attribute(c('h0002', 'h0004')), c('ULS do Alto Minho', 'H Santa Maria Maior'))
  expect_identical(get_hospital_attribute(c('h0016', 'h0017', 'h0018'), value = 'hospital_legal_status'), c('EPE', 'SPA', 'IPSS-CA'))
})
