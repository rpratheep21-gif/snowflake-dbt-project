{{ config(
    materialized='table'
) }}

select
    customer_id,
    customer_name,
    country,
    customer_type,
    count(transaction_id) as total_transactions,
    sum(amount) as total_amount,
    max(transaction_date) as latest_transaction_date
from {{ ref('int_customer_transactions') }}
group by
    customer_id,
    customer_name,
    country,
    customer_type