view: sales {

sql_table_name:
{% if _model._name == 'astrify_dev' %}
`astrafy-interview.sales_orders.stg_sales`
{% elsif _model._name == 'astrify_uat' %}
`astrafy-interview.sales_orders.stg_sales`
{% elsif _model._name == 'astrify' %}
`astrafy-interview.sales_orders.stg_sales` 
{% endif}
;;

dimension: order_date {
	description: "The date where the order has been placed"
	type: date
	sql: ${TABLE}.order_date ;;
}

dimension: customer_id {
	description: "Unique identifier for clients"
	type: number
	sql: ${TABLE}.customer_id ;;
}

dimension: order_id {
	description: "Unique identifier for orders"
	type: number
	sql: ${TABLE}.order_id ;;
}

 
dimension: net_sales {
	description: ""
	type: number
	sql: ${TABLE}.net_sales
	format: 00.0
}

}
