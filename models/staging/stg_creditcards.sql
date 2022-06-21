with
    source_creditcards as (
        select
            /* Primary key */
            creditcardid
            /* Column */
            , cardtype
        from {{source('adventure_works', 'creditcard')}}
    )

select *
from source_creditcards