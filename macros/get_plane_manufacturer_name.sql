{#
    properly label manufacturers especially those will multi-names e.g. McDonnell Douglas
#}

{% macro get_plane_manufacturer_name(fieldname) -%}
     {% set part1 = split_part(trim_func(fieldname), '" "', 1) %}

    case 
        when {{part1}} = 'McDonnell' or {{part1}} = 'Mc' or {{part1}} = 'MD' then 'McDonnell Douglas'
        when {{part1}} = 'de' or {{part1}} = 'De' then 'de Havilland'
        when {{part1}} = 'MD-87 / Cessna' then 'MD-87 / Cessna'
        when {{part1}} = 'Britten' then 'Britten-Norman'
        when {{part1}} = 'A-7D' then 'Corsair'
        when {{part1}} = 'BAE' or {{part1}} = 'Bae' then 'BAe'
        when {{part1}} = 'British' then 'British Aerospac'
        when {{ contains_substring(fieldname, 'ATR') }} then 'ATR'
        when {{ contains_substring(fieldname, 'Airbus') }} then 'Airbus'
        when {{ contains_substring(fieldname, 'Chinook') }} then 'Chinook'
        when {{ contains_substring(fieldname, 'Catalina') }} then 'Catalina'
        when {{ contains_substring(fieldname, 'Hughes') }} then 'Hughes'
        when {{ contains_substring(fieldname, 'Hawker') }} then 'Hawker Siddeley'
        when {{ contains_substring(fieldname, 'Westwind') }} then 'Westwind'
        when {{ contains_substring(fieldname, 'IPTN') }} then 'Aérospatiale'
        when {{ contains_substring(fieldname, 'Sud') }} then 'Sud Aviation'
        when {{ contains_substring(fieldname, 'UH-60') }} then 'Lockheed Martin'
        when {{ contains_substring(fieldname, 'Yunshuji') }} then 'Yunshuji'
        when {{part1}} = 'F-4C' then 'McDonnell Douglas'
        when {{part1}} = 'Fairchild-Hiller' then 'Fairchild'
        when {{part1}} = 'GAF' then 'GAF Nomad'
        when {{part1}} = 'Gates' then 'Gates Learjet'
        else {{part1}}
    end as manufacturer

{%- endmacro %}