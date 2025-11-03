include: "/views/*.view"
include: "/config/*"

explore: sales {
join: orders {
	type: left_outer
	sql_on: ${sales.order_id} = ${orders.order_id}
	relationship: many_to_one
}
}	
