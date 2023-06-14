with 
    staging as (
        select *
        from {{ref('stg_businessentityaddresses')}}
    )
    , transformed as (
        select
            row_number() over (order by addressid) as businessentityaddress_sk -- surrogate key auto incremental
            /* Natural key */
            , addressid
            , businessentityid
            /* Column */
            , addresstypeid
        from staging
    )
select *
from transformed