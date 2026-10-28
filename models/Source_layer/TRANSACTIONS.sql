{{ config(materialized='view') }}

SELECT
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    amount,
    status,
    updated_at
FROM {{ source('raw', 'TRANSACTIONS') }}
