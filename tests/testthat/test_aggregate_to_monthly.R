misssing_norm_data_tibble_only_Q <- tibble::tribble(
  ~type, ~code, ~date, ~data,
  "Q",   "123", as.Date("2019-01-15"), 10,
  "Q",   "123", as.Date("2019-02-15"), 10,
  "Q",   "123", as.Date("2019-03-15"), 10,
  "Q",   "123", as.Date("2019-04-15"), 10,
  "Q",   "123", as.Date("2019-05-15"), 10,
  "Q",   "123", as.Date("2019-06-15"), 10,
  "Q",   "123", as.Date("2019-07-15"), 10,
  "Q",   "123", as.Date("2019-08-15"), 10,
  "Q",   "123", as.Date("2019-09-15"), 10,
  "Q",   "123", as.Date("2019-10-15"), 10,
  "Q",   "123", as.Date("2019-11-15"), 10,
  "Q",   "123", as.Date("2019-12-15"), 10,
)


missing_data_tibble_only_Q <- tibble::tribble(
  ~type, ~code, ~date, ~data, ~norm, ~resolution,
  "Q",   "123", as.Date("2019-01-05"),  5, 1, "dec",
  "Q",   "123", as.Date("2019-01-15"), 10, 2, "dec",
  "Q",   "123", as.Date("2019-01-25"), 15, 3, "dec",
  "Q",   "123", as.Date("2019-02-05"),  50, 2, "dec",
  "Q",   "123", as.Date("2019-02-25"), 150, 4, "dec",
  "Q",   "123", as.Date("2019-03-15"), 1000, 4, "dec",
  "Q",   "123", as.Date("2019-03-25"), 1500, 5, "dec",
  "Q",   "123", as.Date("2019-04-05"),  51, 4, "dec",
  "Q",   "123", as.Date("2019-04-15"), 101, 5, "dec",
  "Q",   "123", as.Date("2019-04-25"), 151, 6, "dec",
  "Q",   "123", as.Date("2019-05-05"),  511, 5, "dec",
  "Q",   "123", as.Date("2019-05-15"), 1011, 6, "dec",
  "Q",   "123", as.Date("2019-05-25"), 1511, 7, "dec",
  "Q",   "123", as.Date("2019-06-05"),  501, 6, "dec",
  "Q",   "123", as.Date("2019-06-15"), 1001, 7, "dec",
  "Q",   "123", as.Date("2019-06-25"), 1501, 8, "dec",
  "Q",   "123", as.Date("2019-07-05"),  502, 7, "dec",
  "Q",   "123", as.Date("2019-07-15"), 1002, 8, "dec",
  "Q",   "123", as.Date("2019-07-25"), 1502, 9, "dec",
  "Q",   "123", as.Date("2019-08-05"),  503, 8, "dec",
  "Q",   "123", as.Date("2019-08-15"), 1003, 9, "dec",
  "Q",   "123", as.Date("2019-08-25"), 1503, 10, "dec",
  "Q",   "123", as.Date("2019-11-05"),  544, 11, "dec",
  "Q",   "123", as.Date("2019-11-15"), 1044, 12, "dec",
  "Q",   "123", as.Date("2019-11-25"), 1544, 13, "dec",
  "Q",   "123", as.Date("2019-12-05"),  54, 12, "dec",
  "Q",   "123", as.Date("2019-12-15"), 104, 13, "dec",
  "Q",   "123", as.Date("2019-12-25"), 154, 14, "dec",
)

test_that("aggregation works", {

  result <- aggregate_to_monthly(
    dataTable = tibble::tribble(
      ~type, ~code, ~date, ~data, ~norm, ~resolution,
      "Q",   "123", as.Date("2019-01-05"),  5, 1, "dec",
      "Q",   "123", as.Date("2019-01-15"), 10, 2, "dec",
      "Q",   "123", as.Date("2019-01-25"), 15, 3, "dec",
    ),
    funcTypeLib = list("mean" = c("Q"))
  )

  expect_equal(10, result$data)

})

test_that("The aggregation sums up as expected", {

  correct_data_tibble_only_Q <- tibble::tribble(
    ~type, ~code, ~date, ~data, ~norm, ~resolution,
    "Q",   "123", as.Date("2019-01-05"),  5, 1, "dec",
    "Q",   "123", as.Date("2019-01-15"), 10, 2, "dec",
    "Q",   "123", as.Date("2019-01-25"), 15, 3, "dec",
    "Q",   "123", as.Date("2019-02-05"),  50, 2, "dec",
    "Q",   "123", as.Date("2019-02-15"), 100, 3, "dec",
    "Q",   "123", as.Date("2019-02-25"), 150, 4, "dec",
    "Q",   "123", as.Date("2019-03-05"),  500, 3, "dec",
    "Q",   "123", as.Date("2019-03-15"), 1000, 4, "dec",
    "Q",   "123", as.Date("2019-03-25"), 1500, 5, "dec",
    "Q",   "123", as.Date("2019-04-05"),  51, 4, "dec",
    "Q",   "123", as.Date("2019-04-15"), 101, 5, "dec",
    "Q",   "123", as.Date("2019-04-25"), 151, 6, "dec",
    "Q",   "123", as.Date("2019-05-05"),  511, 5, "dec",
    "Q",   "123", as.Date("2019-05-15"), 1011, 6, "dec",
    "Q",   "123", as.Date("2019-05-25"), 1511, 7, "dec",
    "Q",   "123", as.Date("2019-06-05"),  501, 6, "dec",
    "Q",   "123", as.Date("2019-06-15"), 1001, 7, "dec",
    "Q",   "123", as.Date("2019-06-25"), 1501, 8, "dec",
    "Q",   "123", as.Date("2019-07-05"),  502, 7, "dec",
    "Q",   "123", as.Date("2019-07-15"), 1002, 8, "dec",
    "Q",   "123", as.Date("2019-07-25"), 1502, 9, "dec",
    "Q",   "123", as.Date("2019-08-05"),  503, 8, "dec",
    "Q",   "123", as.Date("2019-08-15"), 1003, 9, "dec",
    "Q",   "123", as.Date("2019-08-25"), 1503, 10, "dec",
    "Q",   "123", as.Date("2019-09-05"),  522, 9, "dec",
    "Q",   "123", as.Date("2019-09-15"), 1022, 10, "dec",
    "Q",   "123", as.Date("2019-09-25"), 1522, 11, "dec",
    "Q",   "123", as.Date("2019-10-05"),  533, 10, "dec",
    "Q",   "123", as.Date("2019-10-15"), 1033, 11, "dec",
    "Q",   "123", as.Date("2019-10-25"), 1533, 12, "dec",
    "Q",   "123", as.Date("2019-11-05"),  544, 11, "dec",
    "Q",   "123", as.Date("2019-11-15"), 1044, 12, "dec",
    "Q",   "123", as.Date("2019-11-25"), 1544, 13, "dec",
    "Q",   "123", as.Date("2019-12-05"),  54, 12, "dec",
    "Q",   "123", as.Date("2019-12-15"), 104, 13, "dec",
    "Q",   "123", as.Date("2019-12-25"), 154, 14, "dec",
  )

  correct_funcTypeLib_only_Q <- list("mean" = c("Q"))


  temp <- tibble::tribble(
    ~type, ~code, ~date, ~data, ~norm, ~resolution,
    "Q", "123", as.Date("2019-01-01"), 10, 2, "mon",
    "Q", "123", as.Date("2019-02-01"), 100, 3, "mon",
    "Q", "123", as.Date("2019-03-01"), 1000, 4, "mon",
    "Q", "123", as.Date("2019-04-01"), 101, 5, "mon",
    "Q", "123", as.Date("2019-05-01"), 1011, 6, "mon",
    "Q", "123", as.Date("2019-06-01"), 1001, 7, "mon",
    "Q", "123", as.Date("2019-07-01"), 1002, 8, "mon",
    "Q", "123", as.Date("2019-08-01"), 1003, 9, "mon",
    "Q", "123", as.Date("2019-09-01"), 1022, 10, "mon",
    "Q", "123", as.Date("2019-10-01"), 1033, 11, "mon",
    "Q", "123", as.Date("2019-11-01"), 1044, 12, "mon",
    "Q", "123", as.Date("2019-12-01"), 104, 13, "mon")

  result <- riversCentralAsia::aggregate_to_monthly(
    dataTable = correct_data_tibble_only_Q,
    funcTypeLib = correct_funcTypeLib_only_Q)

  expect_equal(temp, result)
})
