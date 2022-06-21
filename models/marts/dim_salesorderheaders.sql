with
    staging as (
        select *
        from {{ref('stg_salesorderheaders')}}
    )
    , transformed as (
        select
            /* Surrogate key*/
            row_number() over (order by salesorderid) as salesorderheader_sk
            /* Natural key */
            , salesorderid
            , territoryid
            , creditcardid
            , customerid
            /* Columns */
            , status
            , orderdate
            , totaldue
        from staging
    )

select *
from transformed