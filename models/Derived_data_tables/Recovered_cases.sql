{{ config(materialized='table') }}

with Recovered_cases as(
    select DATE,
    max(continent) continent,
    max(country)country,
    max(location_level) location_level,
    location,
    concat(max(latitude),',',max(longitude)) as coordinates,
    max(LOCATION_ISO_CODE) LOCATION_ISO_CODE,
    sum(total_recovered) as total_recovered,
    sum(new_recovered) as new_recovered,
    sum(case_recovered_rate) as case_recovered_rate

    from {{ref('base_data')}} 
    group by DATE,location order by DATE,location desc
)

select * from Recovered_cases
 



