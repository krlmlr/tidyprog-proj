library(tidyverse)

iris %>%
  select(starts_with("Petal"), Species) %>%
  group_by(Species) %>%
  summarize(mean(Petal.Width)) %>%
  ungroup()

iris_nested <-
  iris %>%
  select(starts_with("Petal"), Species) %>%
  nest(-Species)

iris_nested

iris_nested %>%
  mutate(mean = map(data, ~ summarize(., mean(Petal.Width))))

mutate_map <- function(.data, col, expr) {
  .data %>%
    mutate(new_column = map(col, expr))
}

iris %>%
  select(starts_with("Petal"), Species) %>%
  nest(-Species) %>%
  mutate_map(data, ~ summarize(., mean(Petal.Width)))

data

mutate_map <- function(.data, col, expr) {
  col <- .data[[col]]

  .data %>%
    mutate(new_column = map(col, expr))
}

iris %>%
  select(starts_with("Petal"), Species) %>%
  nest(-Species) %>%
  mutate_map("data", ~ summarize(., mean(Petal.Width))) %>%
  select(-data) %>%
  unnest()

library(rlang)

mutate_map <- function(.data, col, expr) {
  col <- rlang::enexpr(col)

  .data %>%
    mutate(new_column = map(col, expr))
}

iris %>%
  select(starts_with("Petal"), Species) %>%
  nest(-Species) %>%
  mutate_map(data, ~ summarize(., mean(Petal.Width))) %>%
  select(-data) %>%
  unnest()

iris %>%
  select(starts_with("Petal"), Species) %>%
  nest(-Species) %>%
  mutate(col = list(tibble(Petal.Width = -3))) %>%
  mutate_map(data, ~ summarize(., mean(Petal.Width))) %>%
  select(-data) %>%
  unnest()




mutate_map <- function(.data, col, expr) {
  col <- rlang::enexpr(col)

  .data %>%
    mutate(new_column = map(!!col, expr))
}

iris_nested %>%
  mutate_map(data, ~ summarize(., mean(Petal.Width))) %>%
  select(-data) %>%
  unnest()

iris_nested %>%
  mutate(col = list(tibble(Petal.Width = -3))) %>%
  mutate_map(data, ~ summarize(., mean(Petal.Width))) %>%
  select(-data) %>%
  unnest()




mutate_map_simul <- function(.data, col, expr) {
  col <- rlang::enexpr(col)

  rlang::quos(new_column = map(!!col, expr))
}

iris_nested %>%
  mutate_map_simul(data, ~ summarize(., mean(Petal.Width)))




mutate_map <- function(.data, col, ...) {
  col <- rlang::enexpr(col)

  args <- list(...)
  stopifnot(length(args) == 1)

  new_column <- rlang::sym(names(args))

  expr <- args[[1]]

  .data %>%
    mutate(!!new_column := map(!!col, expr))
}

iris_nested %>%
  mutate_map(data, mean = ~ summarize(., mean(Petal.Width))) %>%
  select(-data) %>%
  unnest()






mutate_map <- function(.data, col, ...) {
  col <- rlang::enexpr(col)

  quos <- rlang::enquos(..., .named = TRUE)
  stopifnot(length(quos) == 1)

  new_column <- rlang::sym(names(quos))

  expr <- quos[[1]]

  .data %>%
    mutate(!!new_column := map(!!col, ~ rlang::eval_tidy(expr)))
}

iris_nested %>%
  mutate_map(data, mean = summarize(., mean(Petal.Width))) %>%
  select(-data) %>%
  unnest()
