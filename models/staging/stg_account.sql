{{
    config(
        materialized = 'incremental',
    unique_key = 'account_id')
}}

select * from 
{{source('yogesh','account_raw')}}
where account_id is not null
and status = 'Active'

{% if is_incremental() %}
and created_at > ( select max(created_at) from {{ this }})
{% endif %}