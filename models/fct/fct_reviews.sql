{{ config(
    materialized = 'incremental',
    on_schema_change = 'fail'
) }}
SELECT
    {{dbt_utils.generate_surrogate_key(['listing_id','review_date','review_text'])}} as review_id,
    *
FROM
    {{ ref("src_reviews") }}
WHERE
    review_text IS NOT NULL 
{% if is_incremental() %}
    AND review_date > (SELECT max(review_date) FROM {{ this }}) 
{% endif %}