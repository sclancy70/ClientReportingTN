view: axial_admin_fact {
  sql_table_name: reporting.axial_admin_fact ;;

  dimension_group: completion {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.completion_date ;;
  }

  dimension: completion_yrmo {
    hidden: yes
    type: string
    sql: ${TABLE}.completion_yrmo ;;
  }

  dimension: disposition {
    type: string
    sql: ${TABLE}.disposition ;;
  }

  dimension: intervention_rim_score {
    type: string
    sql: ${TABLE}.intervention_rim_score ;;
  }

  dimension: intervention_rim_yrmo {
    hidden: yes
    type: string
    sql: ${TABLE}.intervention_rim_yrmo ;;
  }

  dimension: intervention_type {
    type: string
    sql: ${TABLE}.intervention_type ;;
  }

  dimension: npi {
    hidden: yes
    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: provider_group_id {
    hidden: yes
    type: string
    sql: ${TABLE}.provider_group_id ;;
  }

  dimension: provider_group_name {
    hidden: yes
    type: string
    sql: ${TABLE}.provider_group_name ;;
  }

  dimension: provider_name {
    hidden: yes
    type: string
    sql: ${TABLE}.provider_name ;;
  }

  dimension_group: schedule {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.schedule_date ;;
  }

  dimension: schedule_yrmo {
    hidden: yes
    type: string
    sql: ${TABLE}.schedule_yrmo ;;
  }



  measure: distinct_count_of_records {
    type: number
    sql:count (distinct ${TABLE}.npi);;
    drill_fields: [provider_name, provider_group_name]

  }



  measure: count_of_records {
    type: number
    sql:count (*);;
    drill_fields: [provider_name, provider_group_name]
  }
}
