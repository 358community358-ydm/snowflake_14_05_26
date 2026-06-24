{% macro add_hundred(column_name) %}
{{ (column_name) }} + 100
{% endmacro %}