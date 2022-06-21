with
    source_persons as (
        select
            /* Primary key */
            businessentityid
            /* Columns */
            , title
            , firstname
            , middlename
            , lastname
            , suffix
            , persontype
        from {{source('adventure_works', 'person')}}
    )

select *
from source_persons