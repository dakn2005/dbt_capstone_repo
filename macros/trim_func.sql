{% macro trim_func(column_name) %}
    TRIM({{ column_name }})
{% endmacro %}