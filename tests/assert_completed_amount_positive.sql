-- Business rule (Silver R13): a Completed transaction must bring in money (amount > 0).
-- Returns offending rows; the test fails if any are returned.
select transaction_id, txn_status, amount_aud
from {{ ref('stg_transactions') }}
where txn_status = 'Completed' and amount_aud <= 0
