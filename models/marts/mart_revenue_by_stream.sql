-- Same logic and revenue definition as Gold table gold_revenue_by_stream:
-- net revenue = SUM(amount) of Completed + Reversed rows (Reversed are negative).
select
    txn_type                                                                       as revenue_stream,
    count(*)                                                                       as txn_count,
    round(sum(case when txn_status = 'Completed' then amount_aud end), 2)          as gross_revenue_aud,
    round(sum(case when txn_status = 'Reversed'  then amount_aud end), 2)          as reversed_aud,
    round(sum(amount_aud), 2)                                                      as net_revenue_aud,
    round(sum(amount_aud) / sum(sum(amount_aud)) over () * 100, 2)                 as pct_of_net_revenue
from {{ ref('stg_transactions') }}
where txn_status in ('Completed', 'Reversed')
group by txn_type
