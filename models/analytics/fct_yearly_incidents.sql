{{
    config(
        materialized='table'
    )
}}

select 
    {{ dbt_date.date_part('year', 'incident_date') }} year,
    count(1) cnt
from 
{{ ref('stg_incident_data') }}
group by {{ dbt_date.date_part('year', 'incident_date') }}