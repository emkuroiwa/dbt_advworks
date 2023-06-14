with
    staging as (
        select *
        from {{ref('stg_creditcards')}}
    )
    , transformed as (
        select
            /* surrogate key */
            row_number () over (order by creditcardid) as credtcard_sk
            /* Natural Key */
            , creditcardid
            /* Columns */
            , cardtype
        from staging
    )
select *
from transformed