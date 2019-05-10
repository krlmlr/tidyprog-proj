library(tidyverse)

iris %>%
  select(starts_with("Petal"), Species) %>%
  group_by(Species) %>%
  summarize(mean(Petal.Width)) %>%
  ungroup()


iris %>%
  select(starts_with("Petal"), Species) %>%
  nest(-Species) %>%
  mutate(mean = map_dbl(data, ~ mean(.$Petal.Width)))
