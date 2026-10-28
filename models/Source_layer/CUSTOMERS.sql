{{ config(materialized='view') }}

SELECT
    customer_id,
    customer_name,
    email,
    country,
    customer_type,
    created_date
FROM {{ source('raw', 'CUSTOMERS') }}