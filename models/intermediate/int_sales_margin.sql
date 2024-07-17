SELECT 
      products_id
    , date_date
    , orders_id
    , revenue
    , quantity
    , CAST(purchase_price AS FLOAT64) AS purchase_price
    , ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost
    , ROUND(s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2), 2) AS margin
    , {{ margin_percent('s.revenue', 's.quantity*CAST(p.purchase_price AS FLOAT64)') }} AS margin_percent
FROM {{ref("stg_gz_raw_data__sales")}} s
LEFT JOIN {{ref("stg_gz_raw_data__product")}} p 
USING (products_id)