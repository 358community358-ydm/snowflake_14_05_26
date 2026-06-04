{% snapshot emp_snapshot %}

{{
    config(
        target_schema='snapshot',
        unique_key='emp_id',
        strategy='check',
        check_cols=['emp_name', 'joining_date']
    )
}}

select *
from {{ ref('staging_emp') }}

{% endsnapshot %}