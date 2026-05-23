{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='emp_id'
) }}

SELECT *
FROM {{ source('yogesh', 'emp') }}

{% if is_incremental() %}
WHERE joining_date >
(
    SELECT MAX(joining_date)
    FROM {{ this }}
)
{% endif %}