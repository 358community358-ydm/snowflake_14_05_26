{% snapshot snap_emp %}

{{
    config(
        target_schema='snapshot_n',
        unique_key='emp_id',
        strategy='check',
        check_cols=['emp_name', 'department'],
        invalidate_hard_deletes=True
    )
}}

SELECT *
FROM {{ ref('staging_emp') }}

{% endsnapshot %}