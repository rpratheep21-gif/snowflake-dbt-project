{{ config (materialized='view')}}

select txn_id,txn_Amount,customer_id,txn_status,posting_date  FROM {{ source('banking_source', 'transaction') }}