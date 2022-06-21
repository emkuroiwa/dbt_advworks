with
    source_products as (
        select
            /* Primary Key */
            productid
            /* Columns */
            , name
            , standardcost
            , listprice
            , style
            , size
            , color
        from {{source('adventure_works', 'product')}}
    )

select *
from source_products