{{ config(
    materialized = 'incremental',
    unique_key = 'account_id'
)}}
select account_id,balance ,
{{ add_hundred( 'balance') }} as blance_p from
{{ ref('stg_account') }}