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
  col <- rlang::

  .data %>%
    mutate(new_column = map(col, expr))
}

iris %>%
  select(starts_with("Petal"), Species) %>%
  nest(-Species) %>%
  mutate_map(data, ~ summarize(., mean(Petal.Width))) %>%
  select(-data) %>%
  unnest()
