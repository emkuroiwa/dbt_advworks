with
    source_addresses as (
        select
            /* Primary key */
            addressid
            /* Foreign key */
            , stateprovinceid
            /* Column */
            , city
        from {{source('adventure_works', 'address')}}
    )

select *
from source_addresses