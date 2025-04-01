-- decade over decade incidents report 
-- wanted to exclude the 2020s cos its not a full decade; did so from looker
select 
    v.decade,
    -- v.year_start curr_yr,
    -- v.incidents_cnt curr,
    -- v2.year_start prev_yr,
    -- v2.incidents_cnt prev,
    SAFE_DIVIDE(v.incidents_cnt - v2.incidents_cnt, v2.incidents_cnt) * 100 AS dod_incident_perc
from {{ref('vw_decade_aggregates')}} v
join {{ref('vw_decade_aggregates')}} v2 on v2.year_start = (v.year_start - 10)
-- where v.year_start <> 2020