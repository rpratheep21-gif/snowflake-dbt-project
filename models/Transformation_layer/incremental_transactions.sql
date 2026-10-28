{{ config(
    materialized='incremental',
    unique_key='transaction_id',
    incremental_strategy='merge'
) }}

SELECT
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    amount,
    status,updated_at
FROM {{ ref('TRANSACTIONS') }}

{% if is_incremental() %}

WHERE updated_at >
(
    SELECT COALESCE(MAX(updated_at), '1900-01-01')
    FROM {{ this }}
)

{% endif %}
