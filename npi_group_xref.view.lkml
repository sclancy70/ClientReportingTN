view: npi_group_xref {
  sql_table_name: reporting.npi_group_xref ;;

  dimension: group_id {
    type: string
    sql: ${TABLE}.group_id ;;
  }

  dimension: npi {
    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: yrmo {
    type: string
    sql: ${TABLE}.yrmo ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
