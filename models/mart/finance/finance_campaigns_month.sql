SELECT 
  date_trunc(date_date, MONTH) AS datemonth, 
  SUM(operational_margin - ads_cost) AS ads_margin,
  ROUND(SUM(average_basket),2) AS average_basket,
  SUM(operational_margin) AS operational_margin,
  SUM(ads_cost) AS ads_cost,
  SUM(ads_impression) AS ads_impression,
  SUM(ads_clicks) AS ads_clicks,
  SUM(nb_transaction) AS nb_transaction,
  SUM(revenue) AS revenue,
  SUM(margin) AS margin,
FROM {{ ref('int_campaigns_day') }}
FULL OUTER JOIN {{ ref('finance_days') }} 
  USING (date_date)
GROUP BY datemonth
ORDER BY datemonth desc