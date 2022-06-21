with
    staging as (
        select *
        from {{ref('stg_salesorderheadersalesreasons')}}
    )
    , transformed as (
        select
            row_number() over (order by salesreasonid) as salesorderheadersalesreason_sk
            , salesreasonid
            , salesorderid
        from staging
    )

select *
from transformed