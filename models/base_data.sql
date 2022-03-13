{{ config(materialized='view') }}

with source_data as (

    select * from {{ source('base_data', 'COVID_19_INDONESIA_PALAK_JAIN') }}

)

select *
from source_data