{{
    config(
        materialized='table'
    )
}}

select 
    stg.*,
    s.ml_classification,
    '' ml_validation
from {{ ref('stg_incident_data') }} stg
left join {{ ref('sentiment_records') }} s on stg.record_id = s.record_id