{{
    config(
        materialized='view'
    )
}}

select a.balance,e.emp_id
from 
{{ref('staging_emp')}} e
join
{{ref('staging_account')}} a
on e.account_id = a.account_id
