view: patient_phi_dim {
  derived_table: {
    sql: SELECT
      axial_member_id,
      member_state,
      member_zip,
      member_city,
      member_address1 member_address,
      member_gender,
      member_first_name,
      member_last_name,
      member_date_of_birth,
      load_date,
      row_number() over (partition by axial_member_id order by termination_date desc) primary_flag
      FROM public.eligibility_cur
      where load_date =
      (select max(load_date)
      FROM public.eligibility_cur)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

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

  set: detail {
    fields: [
      axial_member_id,
      member_state,
      member_zip,
      member_city,
      member_address,
      member_gender,
      member_first_name,
      member_last_name,
      member_date_of_birth,
      load_date,
      primary_flag
    ]
  }
}
