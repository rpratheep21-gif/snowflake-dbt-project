{{ config (materialized ='view')}}

select count(txn_id),balance,name  FROM {{ ref('Account') }} a join  {{ ref( 'TRANSACTIONS') }} t on a.cust_id=t.customer_id group by balance,name