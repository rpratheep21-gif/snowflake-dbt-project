select
    customer_id,
    trim(customer_name) as customer_name,
    upper(country) as country,
    upper(customer_type) as customer_type,
    updated_at
from {{ source('raw', 'customers') }}