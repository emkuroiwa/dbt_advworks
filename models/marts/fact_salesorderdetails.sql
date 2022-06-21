with
    clients as (
        select 
            businessentityid
            , firstname
            , middlename
            , lastname
        from {{ref('dim_persons')}}
    )
    , clients_with_creditcard as (
        select
            distinct(customerid)
            , creditcardid
        from {{ref('dim_salesorderheaders')}}
        where creditcardid is not null
    )
    , salesorderheaders as (
        select *
        from {{ref('dim_salesorderheaders')}}
    )
    , creditcardstype as (
        select *
        from {{ref('dim_creditcards')}}
    )
    , creditcard_businessentity as (
        select *
        from {{ref('dim_personcreditcards')}}
    )
    , products as (
        select 
            productid
            , name
        from {{ref('dim_products')}}
    )
    , salesorderdetails as (
        select
            salesorderid
            , productid
            , specialofferid
            , orderqty
            , unitprice
            , unitpricediscount
        from {{ref('stg_salesorderdetails')}} 
    )
    , businessentityaddresses as (
        select *
        from {{ref('stg_businessentityaddresses')}}
    )
    , addressestb as (
        select *
        from {{ref('stg_addresses')}}
    )
    , stateprovinces as (
        select *
        from {{ref('dim_stateprovinces')}}
    )
    , countries as (
        select
            countryregioncode
            , name
        from {{ref('dim_countryregion')}}
    )
    , addresses as (
        select 
            b.businessentityid
            , a.addressid
            , city 
            , a.stateprovinceid
            , sp.name as state_name
            , ct.countryregioncode
            , ct.name as country_name
        from addressestb a
        left join businessentityaddresses b on b.addressid = a.addressid
        left join stateprovinces sp on sp.stateprovinceid = a.stateprovinceid
        inner join countries ct on ct.countryregioncode = sp.countryregioncode
    )
    , fact_table as (
        select 
            /* surrogate key */
            row_number() over(order by s.salesorderid) as salesorderdetail_sk
            /* Columns */
            , s.salesorderid as salesorderid
            , s2.customerid as customerid
            , s.productid as productid
            , p.name as productname
            , specialofferid
            , orderqty
            , unitprice
            , unitpricediscount
            , territoryid
            , c.creditcardid as creditcardid
            , cb.businessentityid as businessentityid
            , firstname
            , middlename
            , lastname
            , ad.city as city
            , ad.stateprovinceid as stateprovinceid
            , ad.state_name
            , ad.country_name
            , orderdate
        from salesorderdetails s
        inner join products p on s.productid = p.productid
        inner join salesorderheaders s2 on s.salesorderid = s2.salesorderid
        left join clients_with_creditcard c on c.customerid = s2.customerid
        left join creditcard_businessentity cb on cb.creditcardid = c.creditcardid
        left join clients cl on cl.businessentityid = cb.businessentityid
        left join addresses ad on ad.businessentityid = cb.businessentityid
    )
select *
from fact_table
    