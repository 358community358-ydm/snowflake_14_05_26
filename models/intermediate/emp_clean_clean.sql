{{
    config (
        materialized = 'incremental',
        unique_key = 'emp_id',
        incremental_strategy = 'merge'
    )
}}

select emp_id,
salary
from {{ref('staging_emp')}}