view: sales {
  sql_table_name:
    {% if _model._name == 'astrify_dev' %}
    `astrafy-interview-dev.sales_orders.sales`
    {% elsif _model._name == 'astrify_uat' %}
    `astrafy-interview-uat.sales_orders.sales`
    {% elsif _model._name == 'astrify' %}
    `astrafy-interview.sales_orders.sales`
    {% endif %}
  ;;

  dimension_group: sale_date {
    description: "Date of the sale"
    type: time
    timeframe: [time, date, week, month, raw]
    sql: CAST(${TABLE}.sale_date AS TIMESTAMP) ;;
  }

  dimension: customer_id {
    description: "Unique identifier of the customer who placed the order"
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_id {
    description: "Unique identifier for the order associated with the sale"
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    description: "Unique identifier for the product sold"
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: net_sales {
    description: "Net sales amount for the specific product in the order"
    type: number
    sql: ${TABLE}.net_sales ;;
  }

  dimension: quantity {
    description: "Number of units sold"
    type: number
    sql: ${TABLE}.quantity ;;
  }
}
