{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='emp_id'
) }}

SELECT *
FROM {{ source('yogesh','emp') }} emp

{% if is_incremental() %}
WHERE emp.joining_date >
(
    SELECT MAX(joining_date)
    FROM {{ this }}
)
{% endif %}