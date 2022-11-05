WITH glassdoor_reviews_from_2017 AS (
  SELECT
    firm AS company,
    date_review AS review_date,
    job_title,
    `current` as employee_status,
    location,
    overall_rating,
    work_life_balance,
    culture_values,
    diversity_inclusion,
    career_opp,
    comp_benefits,
    senior_mgmt
  FROM `ocean-data-engg.glassdoor.reviews`
  WHERE EXTRACT(YEAR FROM date_review) >= 2017
),

companies_with_more_than_500_reviews AS (
  SELECT company
  FROM glassdoor_reviews_from_2017
  GROUP BY company
  HAVING COUNT(*) >= 500
)

SELECT
company,
review_date,
IF(job_title = " ", "Anonymous Employee", TRIM(job_title)) as job_title,
CASE
  WHEN employee_status LIKE "%Former%" THEN "Former Employee"
  WHEN employee_status LIKE "%Current%" THEN "Current Employee"
END AS employee_status,
IF(location = "NA", NULL, SPLIT(location, ", ")[OFFSET(0)]) as location,
overall_rating,
IF(work_life_balance = "NA", NULL, CAST(work_life_balance AS INT64)) as work_life_balance,
IF(culture_values = "NA", NULL, CAST(culture_values AS INT64)) as culture_values,
IF(diversity_inclusion = "NA", NULL, CAST(diversity_inclusion AS INT64)) as diversity_inclusion,
IF(career_opp = "NA", NULL, CAST(career_opp AS INT64)) as career_opp,
IF(comp_benefits = "NA", NULL, CAST(comp_benefits AS INT64)) as comp_benefits,
IF(senior_mgmt = "NA", NULL, CAST(senior_mgmt AS INT64)) as senior_mgmt
FROM glassdoor_reviews_from_2017
WHERE company IN (SELECT company FROM companies_with_more_than_500_reviews)
