{{
    config(
        materialized='table'
    )
}}

select 
    stg.*,
    s.ml_classification
from {{ ref('stg_incident_data') }} stg
join {{ ref('sentiment_records') }} s on stg.record_id = s.record_id