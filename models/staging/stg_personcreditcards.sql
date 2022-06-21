with
    source_personcreditcards as (
        select
            /* Primary key */
            businessentityid
            /* Foreign key */
            , creditcardid
            from {{source('adventure_works', 'personcreditcard')}}
    )

select *
from source_personcreditcards