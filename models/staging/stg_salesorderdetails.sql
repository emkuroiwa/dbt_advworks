with 
    source_salesordetails as ( 
        select 
            /* Primary Key*/
            salesorderdetailid
            /* Foreign key*/
            , salesorderid 
            , productid
            , specialofferid
            /* Columns */
            , orderqty
            , unitprice
            , unitpricediscount
        from {{source('adventure_works', 'salesorderdetail')}}
    )
select *
from source_salesordetails