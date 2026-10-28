{{ config(materialized='view') }}

SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    c.country,
    c.customer_type,

    a.account_id,
    a.account_type,
    a.balance,
    a.currency,
    a.account_status,
    a.open_date,

    t.transaction_id,
    t.transaction_date,
    t.transaction_type,
    t.amount,
    t.status,t.updated_at

FROM {{ ref('CUSTOMERS') }} c

Inner JOIN {{ ref('ACCOUNTS') }} a
    ON c.customer_id = a.customer_id

Inner JOIN {{ ref('incremental_transactions') }} t
    ON a.account_id = t.account_id