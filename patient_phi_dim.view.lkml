view: patient_phi_dim {
  sql_table_name:reporting.patient_phi_dim ;;




  dimension: axial_member_id {

    type: number
    sql: ${TABLE}.axial_member_id ;;
  }

  dimension: member_state {
    type: string
    sql: ${TABLE}.member_state ;;
  }

  dimension: member_zip {
    type: string
    sql: ${TABLE}.member_zip ;;
  }

  dimension: member_city {
    type: string
    sql: ${TABLE}.member_city ;;
  }

  dimension: member_address {
    type: string
    sql: ${TABLE}.member_address ;;
  }

  dimension: member_gender {
    type: string
    sql: ${TABLE}.member_gender ;;
  }

  dimension: member_first_name {
    type: string
    sql: ${TABLE}.member_first_name ;;
  }

  dimension: member_last_name {
    type: string
    sql: ${TABLE}.member_last_name ;;
  }

  dimension: member_date_of_birth {
    type: date
    sql: ${TABLE}.member_date_of_birth ;;
  }

  dimension: load_date {
    type: date
    sql: ${TABLE}.load_date ;;
  }

  dimension: primary_flag {
    type: number
    sql: ${TABLE}.primary_flag ;;
  }


}
