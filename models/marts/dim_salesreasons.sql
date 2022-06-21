with
    staging as (
        select *
        from {{ref('stg_salesreasons')}}
    )
    , transformed as (
        select
            row_number() over (order by salesreasonid) as salesreason_sk
            , salesreasonid
            , name
            , reasontype
        from staging 
    )

select *
from transformed