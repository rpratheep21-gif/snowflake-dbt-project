{{ config(materialized='view') }}


select  cust_id,
    name,
    balance,
    open_date from FROM {{ source('banking_source', 'account') }}