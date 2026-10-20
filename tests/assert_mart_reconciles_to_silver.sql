-- Reconciliation: mart net revenue must equal net revenue computed directly from Silver.
with m as (select round(sum(net_revenue_aud), 2) as mart_net from {{ ref('mart_revenue_by_stream') }}),
     s as (select round(sum(amount_aud), 2) as silver_net
           from {{ source('silver', 'silver_transactions') }}
           where status in ('Completed', 'Reversed'))
select m.mart_net, s.silver_net from m cross join s where abs(m.mart_net - s.silver_net) > 0.01
