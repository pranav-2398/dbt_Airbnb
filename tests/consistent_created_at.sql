SELECT
    *
FROM
    {{ ref("fct_reviews") }} fct
    JOIN {{ ref("dim_listings_cleansed") }} lc
    on fct.listing_id = lc.listing_id
WHERE
    fct.review_date <= lc.created_at