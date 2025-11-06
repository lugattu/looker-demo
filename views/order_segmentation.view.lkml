view: orders_segmentation {
	sql_table_name: {
        {% if _model._name == 'astrify_dev' %}
          `astrafy-interview-dev.sales_orders.orders_segmentation`
        {% elsif _model._name == 'astrify_uat' %}
          `astrafy-interview-uat.sales_orders.orders_segmentation`
        {% elsif _model._name == 'astrify' %}
          `astrafy-interview.sales_orders.orders_segmentation`
        {% endif %}
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
    description: "Customer identifier for the order in 2023." ;;
  }

  dimension: order_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.order_id ;;
    description: "Order identifier; unique per row in this result set." ;;
  }

  dimension: order_date {
    type: date
    sql: ${TABLE}.order_date ;;
    description: "Order date filtered to records where year(order_date) = 2023." ;;
  }

  dimension: past_12m_orders {
    type: number
    sql: ${TABLE}.past_12m_orders ;;
    description: "Count of prior orders for the same customer in the 12 months before the order_date." ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}.customer_segment ;;
    description: "Segment label based on past_12m_orders: New (0), Returning (1–3), VIP (4+)." ;;
  }
}
