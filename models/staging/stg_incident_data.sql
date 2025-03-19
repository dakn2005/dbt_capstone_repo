{{
    config(
        materialized='table'
    )
}}

select
    -- identifiers
    {{ dbt_utils.generate_surrogate_key(['date', 'time']) }} as record_id,
    date incident_date,
    {{ dbt.safe_cast("time", api.Column.translate_type("integer")) }} as incident_time,
    location,
    operator,
    {{ COALESCE(CONTAINS_SUBSTR(lower(trim_func('operator')), 'military'), FALSE) }} is_military,
    {{ string_empty_to_null('flight') }},
    {{ string_empty_to_null('route') }},
    {{ string_empty_to_null('actype') }},
    {{ get_plane_manufacturer_name('actype') }},
    {{ COALESCE(CONTAINS_SUBSTR(lower(trim_func('actype')), 'helicopter'), FALSE) }} is_helicopter,
    {{ string_empty_to_null('registration') }},
    {{ string_empty_to_null('cn_ln') }},  
    {{ dbt.split_part('aboard', '" "', 1) }} aboard,
    {{ dbt.split_part('aboard', '"  "', 2) }} aboard_description,
    {{ dbt.split_part('fatalities', '" "', 1) }} fatalities,
    {{ dbt.split_part('fatalities', '"  "', 2) }} fatalities_description, 
    {{ dbt.safe_cast("ground", api.Column.translate_type("integer")) }} ground,
    summary
from {{ source('staging', 'external_data') }}
