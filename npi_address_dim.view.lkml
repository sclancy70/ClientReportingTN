view: npi_dim {
  sql_table_name: reporting.npi_address_dim ;;

  dimension: npi {

    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: provider_city {
    type: string
    sql: ${TABLE}.provider_city ;;
  }

  dimension: provider_first_name {
    type: string
    sql: ${TABLE}.provider_first_name ;;
  }

  dimension: provider_last_name {
    type: string
    sql: ${TABLE}.provider_last_name ;;
  }

  dimension: provider_middle_initial {
    type: string
    sql: ${TABLE}.provider_middle_initial ;;
  }

  dimension: provider_name {
    type: string
    sql: ${TABLE}.provider_name ;;
  }

  dimension: provider_state {
    type: string
    sql: ${TABLE}.provider_state ;;
  }

  dimension: provider_zip {
    type: string
    sql: ${TABLE}.provider_zip ;;
  }

  dimension: yrmo {
    hidden: yes
    type: string
    sql: ${TABLE}.yrmo ;;
  }

  measure: count {
    type: count
    drill_fields: [provider_first_name, provider_name, provider_last_name]
  }
}
