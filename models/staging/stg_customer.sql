{{
    config(
        materialized = 'incremental',
        unique_key = 'customer_id'
    )
}}

SELECT *
FROM {{ source('yogesh', 'customer_raw') }}
WHERE customer_id IS NOT NULL

{% if is_incremental() %}
AND created_at > (
    SELECT MAX(created_at)
    FROM {{ this }}
)
{% endif %}