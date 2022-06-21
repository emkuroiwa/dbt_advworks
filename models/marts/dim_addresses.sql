with 
    staging as (
        select *
        from {{ref('stg_addresses')}}
    )
    , transformed as (
        select
            row_number() over (order by addressid) as address_sk -- surrogate key auto incremental
            /* Natural key */
            , addressid
            , stateprovinceid
            /* Column */
            , city
        from staging
    )
select *
from transformed