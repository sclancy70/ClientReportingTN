view: patient_membership_dim {
  sql_table_name: reporting.patient_membership_dim ;;

  dimension: axial_member_id {
    type: string
    sql: ${TABLE}.axial_member_id ;;
  }

  dimension: effective_date {
    type: string
    sql: ${TABLE}.effective_date ;;
  }

  dimension: eligible_flag {
    type: string
    sql: ${TABLE}.eligible_flag ;;
  }

  dimension: plan_code {
    type: string
    sql: ${TABLE}.plan_code ;;
  }

  dimension: primary_patient_flag {
    type: string
    sql: ${TABLE}.primary_patient_flag ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: relation {
    type: string
    sql: ${TABLE}.relation ;;
  }

  dimension: reporting_yyyymm {
    type: string
    sql: ${TABLE}.reporting_yyyymm ;;
  }

  dimension: termination_date {
    type: string
    sql: ${TABLE}.termination_date ;;
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
