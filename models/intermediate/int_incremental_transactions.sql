{{ config(
    materialized='incremental',
    unique_key='transaction_id',
    incremental_strategy='merge'
) }}

select
    transaction_id,
    customer_id,
    transaction_date,
    transaction_type,
    amount,
    status,
    updated_at
from {{ ref('stg_transactions') }}

{% if is_incremental() %}

where updated_at >= (
    select coalesce(max(updated_at), '1900-01-01'::timestamp)
    from {{ this }}
)

{% endif %}