with 

source as (

    select * from {{ source('gz_raw_data', 'ship') }}

),

renamed as (

    select
        orders_id,
        CAST(shipping_fee AS FLOAT64) AS shipping_fee,
        CAST(logcost AS FLOAT64) AS logcost,
        CAST(ship_cost AS FLOAT64) AS ship_cost

    from source

)

select * from renamed
