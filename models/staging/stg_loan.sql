{{
    config(
        materialized = 'incremental',
        unique_key = 'loan_id'
    )
}}

SELECT *
FROM {{ source('yogesh', 'loan_raw') }}
WHERE loan_id IS NOT NULL

{% if is_incremental() %}
AND created_at > (
    SELECT MAX(created_at)
    FROM {{ this }}
)
{% endif %}