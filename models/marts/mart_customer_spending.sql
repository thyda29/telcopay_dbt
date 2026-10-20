select
    c.customer_id,
    c.plan,
    c.state,
    c.customer_status,
    count(case when t.txn_status in ('Completed','Reversed') then 1 end)                               as txn_count,
    round(coalesce(sum(case when t.txn_status = 'Completed' then t.amount_aud end), 0), 2)             as gross_revenue_aud,
    round(coalesce(sum(case when t.txn_status = 'Reversed'  then t.amount_aud end), 0), 2)             as reversed_aud,
    round(coalesce(sum(case when t.txn_status in ('Completed','Reversed') then t.amount_aud end), 0), 2) as net_revenue_aud
from {{ ref('stg_customers') }} c
left join {{ ref('stg_transactions') }} t on t.customer_id = c.customer_id
group by c.customer_id, c.plan, c.state, c.customer_status
