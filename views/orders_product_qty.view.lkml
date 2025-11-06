view: orders_product_qty {

  sql_table_name:
    {% if _model._name == 'astrify_dev' %}
    `astrafy-interview-dev.sales_orders.orders_product_qty`
    {% elsif _model._name == 'astrify_uat' %}
    `astrafy-interview-uat.sales_orders.orders_product_qty`
    {% elsif _model._name == 'astrify' %}
    `astrafy-interview.sales_orders.orders_product_qty`
    {% endif %}
  ;;

  dimension: order_id {
    description: "Order identifier coming from the aggregated result (grouped by order_id)."
    type: number
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: qty_product {
    description: "Count of product rows per order for orders in years 2022–2023."
    type: number
    sql: ${TABLE}.qty_product ;;
  }

  measure: orders_count {
    description: "Distinct count of orders in the result set."
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: qty_product_sum {
    description: "Sum of qty_product across the selected orders."
    type: sum
    sql: ${qty_product} ;;
  }
}
