{% macro contains_substring(column, substring) %}
    {% if target.type == 'bigquery' %}
        COALESCE(CONTAINS_SUBSTR({{ column }}, '{{ substring }}'), FALSE)
    {% else %}
        COALESCE(POSITION('{{ substring }}' IN {{ column }}) > 0, FALSE)
    {% endif %}
{% endmacro %}