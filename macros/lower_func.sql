{% macro lower_func(column_name) %}
    lower({{ column_name }})
{% endmacro %}