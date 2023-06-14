with
    staging as (
        select *
        from {{ref('stg_countryregion')}}
    )
    , transformed as (
        select
            row_number() over(order by countryregioncode) as countrycode_sk
            , countryregioncode
            , name
        from staging
    )

select *
from transformed