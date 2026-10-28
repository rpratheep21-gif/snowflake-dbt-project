{{ config(materialized='view') }}

SELECT
    account_id,
    customer_id,
    account_type,
    balance,
    currency,
    account_status,
    open_date
FROM {{ source('raw', 'ACCOUNTS') }}