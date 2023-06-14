with
    source_countryregion as (
        select
            /* Primary key */
            countryregioncode
            /* Column */
            , name
        from {{source('adventure_works', 'countryregion')}}
    )
select *
from source_countryregion