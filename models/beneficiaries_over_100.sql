

/*
    Example of a dbt model that gets beneficiaries
    that are still alive and >= 100 years of age
    as of today.
*/



{{ config(materialized='table')  }}


select 
    DESYNPUF_ID,
    to_date(BENE_BIRTH_DT, 'YYYYMMDD') as DOB,
    floor(DATEDIFF(day, 
             to_date(BENE_BIRTH_DT, 'YYYYMMDD'),
             CAST( GETDATE() AS Date )  ) / 365.0 ) AS age
from {{ ref('ages') }}
where age >= 100




