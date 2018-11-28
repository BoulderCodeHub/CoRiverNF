library(xts)

context("check summation of monthly to annual")

test_that("monthly sums to annual", {
  for (i in 1:29) {
    end_year <- xtsAttributes(monthlyTot)$end_year
    
    tmp_mon <- monthlyTot[,i]
    
    expect_equivalent(apply.yearly(tmp_mon, sum)["1906/"], cyAnnTot[,i])
    
    # water year sums
    my_index <- tmp_mon[index(tmp_mon[.indexmon(tmp_mon) == 8]), which.i = TRUE]
    expect_equivalent(
      period.sum(tmp_mon, my_index)[paste0("/",end_year,"-09")], 
      wyAnnTot[,i]
    )
    
    tmp_mon <- monthlyInt[,i]
    expect_equivalent(apply.yearly(tmp_mon, sum)["1906/"], cyAnnInt[,i])
    
    my_index <- tmp_mon[index(tmp_mon[.indexmon(tmp_mon) == 8]), which.i = TRUE]
    expect_equivalent(
      period.sum(tmp_mon, my_index)[paste0("/",end_year,"-09")], 
      wyAnnInt[,i]
    )
  }
})
