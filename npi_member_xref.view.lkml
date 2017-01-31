view: npi_member_reference {

  sql_table_name: reporting.npi_member_xref
  ;;

  dimension: axial_member_id {
    hidden: yes
    type: string
    sql: ${TABLE}.axial_member_id ;;
  }

  dimension: in_claims {
    hidden: yes
    type: string
    sql: ${TABLE}.in_claims ;;
  }

  dimension: in_medical_claims {
    hidden: yes
    type: string
    sql: ${TABLE}.in_medical_claims ;;
  }

  dimension: in_rx_claims {
    hidden:  yes
    type: string
    sql: ${TABLE}.in_rx_claims ;;
  }

  dimension: is_opioid {
    hidden: yes
    type: string
    sql: ${TABLE}.is_opioid ;;
  }

  dimension: npi {
    hidden: yes
    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: yrmo {
    hidden:  yes
    type: string
    sql: ${TABLE}.yrmo ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
