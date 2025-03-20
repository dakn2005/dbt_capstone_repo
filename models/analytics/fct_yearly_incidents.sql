select 
    {{ dbt_date.date_part('year', 'incident_date') }} Year,
    count(1) cnt
from 
{{ ref('stg_incident_data') }}
group by {{ dbt_date.date_part('year', 'incident_date') }}