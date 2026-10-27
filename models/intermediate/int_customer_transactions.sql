select
    c.customer_id,
    c.customer_name,
    c.country,
    c.customer_type,
    t.transaction_id,
    t.transaction_date,
    t.transaction_type,
    t.amount,
    t.status,
    t.updated_at

from {{ ref('stg_customers') }} c

join {{ ref('int_incremental_transactions') }} t
    on c.customer_id = t.customer_id