with
    source_businessentityaddresses as (
        select 
            /* Primary key*/
            addressid
            /* Foreign key */
            , businessentityid
            , addresstypeid
        from {{source('adventure_works', 'businessentityaddress')}}
    )

select *
from source_businessentityaddresses