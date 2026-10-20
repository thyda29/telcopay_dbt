-- Business rule (Silver R10b): transaction dates must fall inside the extract window.
select transaction_id, txn_date
from {{ ref('stg_transactions') }}
where txn_date < to_date('{{ var("data_start") }}') or txn_date > to_date('{{ var("data_end") }}')
