{% snapshot customer_snapshot %}

{{
    config(
        target_schema='SNAPSHOT',
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='created_at'
    )
}}

SELECT *
FROM {{ ref('stg_customer') }}

{% endsnapshot %}