select
    transaction_id,
    customer_id,
    txn_type,
    amount_aud,
    channel,
    txn_date,
    status                as txn_status,
    before_join_date
from {{ source('silver', 'silver_transactions') }}
