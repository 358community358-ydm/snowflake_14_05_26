{{ config (
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'emp_id'
)}}
select emp_id ,
initcap(trim(emp_name)) as emp_name,
trim(department)  as department ,
joining_date  as joining_date,
(salary) as salary 
from {{source('yogesh','emp')}}
where emp_id is not null 

{% if is_incremental()%}
and joining_date > (select max(joining_date) from {{this}})
{%endif%}