-- decade over decade incidents report 
-- wanted to exclude the 2020s cos its not a full decade; did so from looker
select 
    v.year,
    -- v.year_start curr_yr,
    -- v.incidents_cnt curr,
    -- v2.year_start prev_yr,
    -- v2.incidents_cnt prev,
    SAFE_DIVIDE(v.cnt - v2.cnt, v2.cnt) * 100 AS yoy_incident_perc
from {{ref('vw_yearly_incidents')}} v
join {{ref('vw_yearly_incidents')}} v2 on v2.year = (v.year - 10)