with
    staging as (
        select *
        from {{ref('stg_products')}}
    )
    , transformed as (
        select
            /* Surrogate Key */
            row_number() over (order by productid) as product_sk
            /* Natural key */
            , productid
            /* Column */
            , name
            , standardcost
            , listprice
        from staging
    )

select *
from transformed