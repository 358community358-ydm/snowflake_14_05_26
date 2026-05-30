

{% macro apply_discount(price_column) %}

{{ price_column }} * (1 - {{ var('discount_pct') }}/100)

{% endmacro %} 