with
    staging as (
        select *
        from {{ref('stg_persons')}}
    )
    , transformed as (
        select
            /* Surrogate Key */
            row_number() over (order by businessentityid) as person_sk
            /* Natural key */
            , businessentityid
            /* Columns */
            , title
            , firstname
            , middlename
            , lastname
            , suffix
        from staging
    )

select *
from transformed