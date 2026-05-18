config{{ materialized = 'view'}}

select * from
source ('yogesh','emp')