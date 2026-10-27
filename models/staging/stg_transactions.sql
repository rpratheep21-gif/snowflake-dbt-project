select
    transaction_id,
    customer_id,
    transaction_date,
    upper(transaction_type) as transaction_type,
    amount,
    upper(status) as status,
    updated_at
from {{ source('raw', 'transactions') }}