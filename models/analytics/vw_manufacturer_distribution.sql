select 
    manufacturer,
    count(manufacturer) cnt
from 
{{ ref('fct_incident_data') }}
group by manufacturer