{{config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'emp_id'
)}}

select emp_id,
 INITCAP(NULLIF(TRIM(emp_name), '')) AS first_name,
 from 
{{source('yogesh','emp')}}

{% if is_incremental() %}
where joining_date > (
    select max(joining_date)
    from {{this}})
{%endif%}
