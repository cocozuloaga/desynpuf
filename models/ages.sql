

/*
    Example of a dbt model that casts date of birth
    string (BENE_BIRTH_DT) as a date to calculate patient
    age.
*/



{{ config(materialized='table')  }}


select 
    DESYNPUF_ID,
    BENE_BIRTH_DT, 
    BENE_DEATH_DT,
    to_date(BENE_BIRTH_DT, 'YYYYMMDD') as DOB,
    CAST( GETDATE() AS Date ) today,
    floor(DATEDIFF(day, 
             to_date(BENE_BIRTH_DT, 'YYYYMMDD'),
             CAST( GETDATE() AS Date )  ) / 365.0 ) AS age
from beneficiary_summary



