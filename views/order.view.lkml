view: orders {
  sql_table_name: 
      {% if _model._name == 'astrify_dev' %}
        `astrafy-interview-dev.sales_orders.raw_orders`
      {% elsif _model._name == 'astrify_uat' %}
        `astrafy-interview-uat.sales_orders.raw_orders`
      {% elsif _model._name == 'astrify' %}
        `astrafy-interview.sales_orders.raw_orders`
      {% endif %}
    ;;

  dimension_group: order_date {
    description: "Date when the order was placed"
    type: time
    timeframe: [time, date, week, month, raw]
    sql: CAST(${TABLE}.sale_date AS TIMESTAMP) ;;
  }

  dimension: customer_id {
    description: "Unique identifier of the customer who placed the order (renamed from 'customers_id')."
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_id {
    description: "Unique identifier for the order (renamed from 'orders_id')."
    type: number
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: net_sales {
    description: "Total net sales amount for the order."
    type: number
    sql: ${TABLE}.net_sales ;;
  }
}
