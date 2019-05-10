### Manipulating pairwise

library(tidyverse)
library(here)

dict <- readxl::read_excel(here("data/cities.xlsx"))

input_data <-
  dict %>%
  select(city_code, weather_filename) %>%
  deframe() %>%
  map(~ readxl::read_excel(here(.)))

manipulator <- function(data) {
  data %>%
    select(time, contains("emperature")) %>%
    filter(temperature >= 14)
}

manipulated_data <-
  input_data %>%
  map(manipulator)

manipulated_data

# Write back results: new file names
output_filenames <- tempfile(names(manipulated_data), fileext = ".csv")
output_filenames

# Iterate over pairs
process_csv <- function(file, data) {
  readr::write_csv(data, file)
  message("Writing ", file)
  invisible(file)
}

map2(manipulated_data, output_filenames, ~ process_csv(..2, ..1))

invisible(map2(manipulated_data, output_filenames, ~ process_csv(..2, ..1)))

# We don't really need the output
walk2(manipulated_data, output_filenames, ~ process_csv(..2, ..1))

print(walk2(manipulated_data, output_filenames, ~ process_csv(..2, ..1)))

# Exercises

# map2() and walk2() are pipable:
manipulated_data %>%
  walk2(output_filenames, ~ readr::write_csv(..1, ..2)) %>%
  map_int(nrow)
