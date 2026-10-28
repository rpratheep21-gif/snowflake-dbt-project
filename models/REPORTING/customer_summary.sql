{{ config(materialized='table') }}

SELECT
    customer_id,
    customer_name,
    country,
    customer_type,
    COUNT(transaction_id) AS total_transactions,
    SUM(amount) AS total_transaction_amount,
    MAX(transaction_date) AS latest_transaction_date
FROM {{ ref('customer_account_transactions') }}
GROUP BY
    customer_id,
    customer_name,
    country,
    customer_typeS