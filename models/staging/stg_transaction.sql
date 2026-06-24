{{
    config(
        materialized = 'incremental',
        unique_key = 'transaction_id'
    )
}}

SELECT *
FROM {{ source('yogesh', 'transaction_raw') }}
WHERE transaction_id IS NOT NULL

{% if is_incremental() %}
AND transaction_date > (
    SELECT MAX(transaction_date)
    FROM {{ this }}
)
{% endif %}