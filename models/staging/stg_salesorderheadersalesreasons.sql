with
    source_salesorderheadersalesreasons as (
        select
            /* Foreign keys */
            salesreasonid
            , salesorderid
        from {{source('adventure_works', 'salesorderheadersalesreason')}}
    )

select *
from source_salesorderheadersalesreasons