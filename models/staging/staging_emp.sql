{{ config(
    materialized='table'
) }}

select *
from {{ source('yogesh', 'emp') }}