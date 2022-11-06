# Glassdoor Reviews

## Description
Data Analysis of Glassdoor Reviews from 2017-2021

## Dashboard
[Glassdoor Reviews](https://datastudio.google.com/u/0/reporting/6e2f46bc-475c-46d5-9231-1f43b52ceb13/page/zPK6C)

![Dashboard - Sample Preview](https://github.com/sagar-0817/glassdoor_reviews/blob/main/images/dashboard-sample-preview.png?raw=true)

## Project Contents

- [glassdoor_reviews.csv](https://www.kaggle.com/datasets/davidgauthier/glassdoor-job-reviews)
    - a Kaggle dataset containing around **850K** job reviews from [Glassdoor](https://www.glassdoor.com/Job/index.htm) across many years and various companies, locations, job titles
- [reviews_cleansed.sql](https://github.com/sagar-0817/glassdoor_reviews/blob/main/reviews_cleansed.sql)
    - the SQL script contains the query that considers all reviews from 2017 and performs transformation
    - the query is saved as a view which is materialized to power the dashboard
