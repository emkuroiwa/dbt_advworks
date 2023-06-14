with
    staging as (
        select *
        from {{ref('stg_salesterritories')}}
    )
    , transformed as (
        select
            row_number() over(order by territoryid) as salesterritory_sk
            , territoryid
            , name
            , countryregioncode
        from staging
    )

select *
from transformed