with
    source_salesreasons as (
        select
            /* Primary key */
            salesreasonid
            /* Columns */
            , name
            , reasontype
        from {{source('adventure_works', 'salesreason')}}
    )
    
select *
from source_salesreasons