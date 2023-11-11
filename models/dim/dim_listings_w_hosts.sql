SELECT
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost AS host_is_superhost,
    l.created_at,
    greatest(l.updated_at, h.updated_at) AS updated_at
FROM
    {{ ref("dim_listings_cleansed") }} l
    LEFT JOIN {{ ref("dim_hosts_cleaned") }} h ON l.host_id = h.host_id