{{
    config(
        materialized='view'
    )
}}

select 
    {{ dbt_date.date_part('year', 'incident_date') }} year,
    count(1) cnt
from 
{{ ref('fct_incident_data') }}
group by {{ dbt_date.date_part('year', 'incident_date') }}