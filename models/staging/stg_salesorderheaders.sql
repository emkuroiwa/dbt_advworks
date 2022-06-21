with
    source_salesorderheaders as (
        select
            /* Primary key */
            salesorderid
            /* Foreign keys */
            , territoryid
            , creditcardid
            , customerid
            /* Columns */
            , totaldue
            , status
            , orderdate
        from {{source('adventure_works', 'salesorderheader')}}
    )

select *
from source_salesorderheaders