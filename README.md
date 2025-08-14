# State Department Human Rights Report Analysis

Data and [R](https://www.r-project.org/) code to reproduce the analysis underlying [this Aug. 14, 2025 Inside Climate News article](https://insideclimatenews.org/news/14082025/us-annual-human-rights-reports-gutted/), scrutinizing the text of the 2024 edition of the U.S. State Department's Country Reports on Human Rights Practices, compared to reports from previous years.

### Methodology/code

We downloaded the individual country pages for all reports from 2016 to 2024, which are in the folder `html`, then parsed their contents using the script `scraper.R`. The resulting data, including the full text of each country report, is in the file `reports.RData` in the `processed_data` folder.

Subsequent text analysis is in the file `index.Rmd` and online [here](https://insideclimatenews.github.io/2025-08-state-department-human-rights/).

### Questions/Feedback

Email [Peter Aldhous](mailto:peter.aldhous@insideclimatenews.org).
