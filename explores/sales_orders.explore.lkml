include: "/views/*.view"
include: "/config/*"

explore: orders {
  join: sales {
    type: left_outer
    sql_on: ${orders.order_id} = ${sales.order_id} ;;
    relationship: one_to_many
  }
}