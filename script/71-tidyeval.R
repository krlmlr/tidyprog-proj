library(tidyverse)

iris %>%
  select(starts_with("Petal")) %>%
  group_by(Species) %>%
  summarize_all(mean) %>%
  ungroup()
