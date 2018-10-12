library(xts)
context("test structure of data")

atts <- c("source", "sourceWorkbook", "sheetName", "start_year", "end_year")

test_that("class and dims are correct", {
  expect_s3_class(cyAnnTot, "xts")
  expect_s3_class(wyAnnTot, "xts")
  expect_s3_class(cyAnnInt, "xts")
  expect_s3_class(wyAnnInt, "xts")
  expect_s3_class(monthlyInt, "xts")
  expect_s3_class(monthlyTot, "xts")
  
  expect_true(all(names(xtsAttributes(cyAnnTot)) %in% atts))
  expect_true(all(names(xtsAttributes(wyAnnTot)) %in% atts))
  expect_true(all(names(xtsAttributes(cyAnnInt)) %in% atts))
  expect_true(all(names(xtsAttributes(wyAnnInt)) %in% atts))
  expect_true(all(names(xtsAttributes(monthlyInt)) %in% atts))
  expect_true(all(names(xtsAttributes(monthlyTot)) %in% atts))
  
  expect_true(all(atts %in% names(xtsAttributes(cyAnnTot))))
  expect_true(all(atts %in% names(xtsAttributes(wyAnnTot))))
  expect_true(all(atts %in% names(xtsAttributes(cyAnnInt))))
  expect_true(all(atts %in% names(xtsAttributes(wyAnnInt))))
  expect_true(all(atts %in% names(xtsAttributes(monthlyInt))))
  expect_true(all(atts %in% names(xtsAttributes(monthlyTot))))
  
  start_year <- xtsAttributes(cyAnnTot)$start_year
  end_year <- xtsAttributes(wyAnnTot)$end_year
  nyrs <- end_year - start_year + 1
  nmonths <- nyrs * 12 + 3
  
  expect_equal(dim(cyAnnTot), c(nyrs, 29))
  expect_equal(dim(wyAnnTot), c(nyrs, 29))
  expect_equal(dim(cyAnnInt), c(nyrs, 29))
  expect_equal(dim(wyAnnInt), c(nyrs, 29))
  expect_equal(dim(monthlyInt), c(nmonths, 29))
  expect_equal(dim(monthlyTot), c(nmonths, 29))
})
