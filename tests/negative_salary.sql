SELECT *
FROM {{ ref('staging_emp') }}
WHERE salary < 0