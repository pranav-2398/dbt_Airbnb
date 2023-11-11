{{ config(materialized = 'table') }} 
SELECT
    r.*,
CASE
        WHEN fm.full_moon_date IS NULL THEN 'Not Full Moon'
        ELSE 'Full Moon'
    END AS is_full_moon
FROM
    {{ ref("fct_reviews") }} r
    LEFT JOIN {{ ref("seed_full_moon_dates") }} fm ON (to_date(r.review_date)) = dateadd(DAY, 1, fm.full_moon_date)