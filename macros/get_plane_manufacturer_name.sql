{#
    properly label manufacturers especially those will multi-names e.g. McDonnell Douglas
#}

{% macro get_plane_manufacturer_name(part1) -%}
     {% set part1 = split_part(trim_func(fieldname), '" "', 1) %}

    case {{part1}}
        when 'McDonnell' or 'Mc' or 'MD' then 'McDonnell Douglas'
        when 'de' or 'De' then 'de Havilland'
        when 'MD-87 / Cessna' then 'MD-87 / Cessna'
        when 'Britten' then 'Britten-Norman'
        when 'A-7D' then 'Corsair'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'ATR'), FALSE) then 'ATR'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'Airbus'), FALSE) then 'Airbus'
        when 'BAE' or 'Bae' then 'BAe'
        when 'British' then 'British Aerospac'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'Chinook'), FALSE) then 'Chinook'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'Catalina'), FALSE) then 'Catalina'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'Hughes'), FALSE) then 'Hughes'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'Hawker'), FALSE) then 'Hawker Siddeley'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'Westwind'), FALSE) then 'Westwind'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'IPTN'), FALSE) then 'Aérospatiale'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'Sud'), FALSE) then 'Sud Aviation'
        when COALESCE(CONTAINS_SUBSTR({{fieldname}}, 'UH-60'), FALSE) then 'Lockheed Martin'
        when 'F-4C' then 'McDonnell Douglas'
        when 'Fairchild-Hiller' then 'Fairchild'
        when 'GAF' then 'GAF Nomad'
        when 'Gates' then 'Gates Learjet'
        else {{part1}}
    end as manufacturer

{%- endmacro %}