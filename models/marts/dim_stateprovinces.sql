with
    staging as (
        select *
        from {{ref('stg_stateprovinces')}}
    )
    , transformed as (
        select
            row_number() over(order by stateprovinceid) as stateprovince_sk
            , name
            , countryregioncode
            , territoryid
            , stateprovinceid
        from staging
    )

select *
from transformed