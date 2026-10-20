-- Business rule (Silver R13a): a Reversed transaction is a refund and must be negative.
select transaction_id, txn_status, amount_aud
from {{ ref('stg_transactions') }}
where txn_status = 'Reversed' and amount_aud >= 0
