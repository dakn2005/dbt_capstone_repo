select 
    manufacturer,
    count(manufacturer) cnt
from 
{{ ref('stg_incident_data') }}
group by manufacturer