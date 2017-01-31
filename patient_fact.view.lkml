view: patient_fact {
  sql_table_name: reporting.patient_fact ;;

  dimension: axial_member_id {

    type: string
    sql: ${TABLE}.axial_member_id ;;
  }

  dimension: comorbid {
    type: string
    sql: ${TABLE}.comorbid ;;
  }

  dimension: duration {
    type: number
    sql: cast( ${TABLE}.duration as integer) ;;
  }

  dimension: duration_label {
    type: string
    sql: ${TABLE}.duration_label ;;
  }

  dimension: effective_date {
    type: string
    sql: ${TABLE}.effective_date ;;
  }

  dimension: eligible_flag {
    type: string
    sql: ${TABLE}.eligible_flag ;;
  }

  dimension: er_visits {
    type: number
    sql: cast(${TABLE}.er_visits as integer) ;;
  }

  dimension: has_behavioral {
    type: number
    sql: cast(${TABLE}.has_behavioral as integer) ;;
  }

  dimension: has_comorbid {
    type: number
    sql: cast(${TABLE}.has_comorbid as integer) ;;
  }

  dimension: has_duration {
    type: number
    sql: cast(${TABLE}.has_duration as integer) ;;
  }

  dimension: has_ervisit {
    type: number
    sql: cast(${TABLE}.has_ervisit as integer) ;;
  }

  dimension: has_highrisk {
    type: number
    sql: cast(${TABLE}.has_highrisk as integer);;
  }

  dimension: has_meddrisk {
    type: number
    sql: cast( ${TABLE}.has_meddrisk as integer);;
  }

  dimension: has_multipharmacy {
    type: number
    sql: cast(${TABLE}.has_multipharmacy as integer) ;;
  }

  dimension: has_multiprescriber {
    type: number
    sql: cast(${TABLE}.has_multiprescriber as integer) ;;
  }

  dimension: has_poly {
    type: number
    sql: cast( ${TABLE}.has_poly as integer);;
  }

  dimension: has_sud {
    type: number
    sql: cast(${TABLE}.has_sud as integer);;
  }

  dimension: has_unreported_visits {
    type: number
    sql: cast(${TABLE}.has_unreported_visits as integer);;
  }

  dimension: in_pain_dm {
    type: string
    sql: cast(${TABLE}.in_pain_dm  as integer);;
  }

  dimension: in_rx_claims {
    type: number
    sql: cast(${TABLE}.in_rx_claims as interger) ;;
  }

  dimension: is_opioid {
    type: number
    sql: cast(${TABLE}.is_opioid as interger) ;;
  }

  dimension: medd {
    type: number
    sql: cast( ${TABLE}.medd as integer) ;;
  }

  dimension: medd_label {
    type: string
    sql: ${TABLE}.medd_label ;;
  }

  dimension: monthly_spend {
    type: number
    sql: ${TABLE}.monthly_spend ;;
  }

  dimension: pharm_label {
    type: string
    sql: ${TABLE}.pharm_label ;;
  }

  dimension: pharm_measure {
    type: number
    sql: cast( ${TABLE}.pharm_measure as integer) ;;
  }

  dimension: plan_code {
    type: string
    sql: ${TABLE}.plan_code ;;
  }

  dimension: prescriber_label {
    type: string
    sql: ${TABLE}.prescriber_label ;;
  }

  dimension: prescriber_measure {
    type: string
    sql: ${TABLE}.prescriber_measure ;;
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

  dimension: unreported_visits {
    type: string
    sql: ${TABLE}.unreported_visits ;;
  }

  dimension: unreported_visits_label {
    type: string
    sql: ${TABLE}.unreported_visits_label ;;
  }

  dimension: yrmo {
    type: string
    sql: ${TABLE}.yrmo ;;
  }


  dimension: medd_label_order{
    type: string
    sql:
      Case when medd between 0 and 49 then '1: MEDD < 50'
         when medd between 50 and 100 then '2: MEDD 50 - 100'
         when medd between 101 and 150 then '3: MEDD 101 - 150'
         when medd > 150 then '4: MEDD >150' else '0: No MEDD' end;;
  }






#######   Measure  ##############################################


measure: Count_Behavioral_Patients {
       type: number
       sql:count(distinct case when ${has_behavioral} = 1 then ${axial_member_id} end);;
      value_format_name: decimal_0
      drill_fields: [axial_member_id]
}


  measure: Count_Comorbid_Patients {
    type: number
    sql:count(distinct case when ${has_comorbid} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }


  measure: Count_Duration_Patients {
    type: number
    sql:count(distinct case when ${has_duration} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }


  measure: Count_ERVisit_Patients {
    type: number
    sql:count(distinct case when ${has_ervisit} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }

  measure: Count_High_Risk_Patients {
    type: number
    sql:count(distinct case when ${has_highrisk} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }


  measure: Count_MEDD_Risk_Patients {
    type: number
    sql:count(distinct case when ${has_meddrisk} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }

  measure: Count_Multi_Pharmacy_Patients {
    type: number
    sql:count(distinct case when ${has_multipharmacy} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }



  measure: Count_Multi_Prescriber_Patients {
    type: number
    sql:count(distinct case when ${has_multiprescriber} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }


  measure: Count_PolyDrug_Patients {
    type: number
    sql:count(distinct case when ${has_poly} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }


  measure: Count_SUD_Patients {
    type: number
    sql:count(distinct case when ${has_sud} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }

  measure: Count_Unreported_Visits_Patients {
    type: number
    sql:count(distinct case when ${has_unreported_visits} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }


  measure: Count_Pain_Patients {
    type: number
    sql:count(distinct case when ${in_pain_dm} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id,patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }





  measure: Total_Monthly_Spend {
    type: number
    sql:sum(${monthly_spend});;
    value_format_name: decimal_0
    drill_fields: [axial_member_id]
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
