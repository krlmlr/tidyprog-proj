test_that("hi() works", {
  expect_output(hi(), "Woot!")
  expect_output(hi("Hello"), "Hello")
})
