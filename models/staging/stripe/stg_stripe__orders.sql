select 
    id, 
    item, 
    price, 
    description

from {{ source('stripe_raw', 'order_raw') }}
