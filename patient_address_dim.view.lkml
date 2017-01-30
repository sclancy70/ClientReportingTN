view: patient_address_dim {
  sql_table_name: reporting.patient_address_dim ;;

  dimension: axial_member_id {
    type: number
    sql: ${TABLE}.axial_member_id ;;
  }

  dimension_group: effective {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.effective_date ;;
  }

  dimension_group: load {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.load_date ;;
  }

  dimension: member_address {
    type: string
    sql: ${TABLE}.member_address ;;
  }

  dimension: member_city {
    type: string
    sql: ${TABLE}.member_city ;;
  }

  dimension: member_state {
    type: string
    sql: ${TABLE}.member_state ;;
  }

  dimension: member_zip {
    type: string
    sql: ${TABLE}.member_zip ;;
  }

  dimension: primary_flag {
    type: number
    sql: ${TABLE}.primary_flag ;;
  }

  dimension_group: termination {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.termination_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
