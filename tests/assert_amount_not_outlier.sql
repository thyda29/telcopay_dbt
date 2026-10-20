-- Business rule (Silver R14): no single transaction above AUD 1,000 (rate plans top out far below this).
select transaction_id, amount_aud
from {{ ref('stg_transactions') }}
where abs(amount_aud) > 1000
