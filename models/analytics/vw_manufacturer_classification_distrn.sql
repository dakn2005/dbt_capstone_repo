select 
  manufacturer,
  ml_classification,
  count(1) cnt
from {{ ref('fct_incident_data') }}
-- where ml_classification = 'Manufacturer defect/negligence'
group by 1, 2
order by 3 desc