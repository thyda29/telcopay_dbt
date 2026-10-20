select
    customer_id,
    plan,
    state,
    status                as customer_status,
    join_date,
    join_date_valid,
    credit_limit_aud,
    email_valid
from {{ source('silver', 'silver_customers') }}
