with
    staging as (
        select *
        from {{ref('stg_personcreditcards')}}
    )
    , transformed as (
        select
            /* Surrogate key */
            row_number() over(order by businessentityid) as personcreditcard_sk
            /* Natural keys */
            , businessentityid
            , creditcardid
        from staging
    )
select *
from transformed