SELECT
    is_full_moon,
    review_sentiment,
    count(*) AS reviews
FROM
    {{ ref("mart_fullmoon_reviews") }}
GROUP BY
    is_full_moon,
    review_sentiment
ORDER BY
    1,
    2