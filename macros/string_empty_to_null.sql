{#
    converts '?' found in data to nulls
#}

{% macro string_empty_to_null(fieldname) -%}

    case {{fieldname}}
        when '?' then null
        else {{fieldname}}
    end as {{fieldname}}

{%- endmacro %}