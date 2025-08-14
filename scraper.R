# set working directory to the folder containing this script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load required packages
library(tidyverse)
library(rvest)

# scrape the downloaded reports
reports <- tibble()

for (y in 2016:2023) {
  print(y)
  files <- list.files(paste0("html/",y), full.names = TRUE)
  for (f in files) {
    page <- read_html(f)
    country <- html_elements(page, "title") %>%
      html_text() %>%
      str_split(pattern = " - ")
    country <- country[[1]][1]
    report_text <- html_elements(page, ".report__main p") %>%
      html_text() %>%
      paste(collapse = " ") 
    tmp <- tibble(year = y, country = country, report_text = report_text)
    reports <- bind_rows(reports,tmp)
    rm(tmp,country,report_text,files,page)
  }
}
rm(f,y)

# sort
reports <- reports %>%
  arrange(year,country)

# remove any documents with no text (will not be country reports)
reports <- reports %>%
  filter(report_text != "")

# save scraped data
save.image("processed_data/reports.RData")
  
