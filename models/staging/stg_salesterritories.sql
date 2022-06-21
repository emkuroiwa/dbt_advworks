with
    source_salesterritories as (
        select
            /* Primary key */
            territoryid
            /* Columns */
            --, group
            , countryregioncode
            , name
        from {{source('adventure_works', 'salesterritory')}}
    )

select *
from source_salesterritories