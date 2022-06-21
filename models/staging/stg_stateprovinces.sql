with
    source_stateprovinces as (
        select
            /* Primary key */
            stateprovinceid
            /* Foreign key */
            , territoryid
            /* Columns */
            , countryregioncode
            , name
        from {{source('adventure_works', 'stateprovince')}}
    )

select *
from source_stateprovinces