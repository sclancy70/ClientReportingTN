view: patient_fact {
  sql_table_name: reporting.patient_fact ;;

  dimension: axial_member_id {
    hidden: yes
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
    hidden:  yes
    type: date
    sql: cast( ${TABLE}.effective_date as date) ;;
  }




  dimension_group: coverage_effective_date {
    type: time
    timeframes: [date, week, month, year]
    convert_tz: no
    sql: ${effective_date} ;;
  }







  dimension: eligible_flag {
    type: string
    sql: ${TABLE}.eligible_flag ;;
  }

  dimension: er_visits {
    type: number
    sql: cast(${TABLE}.er_visits as integer) ;;
  }

  dimension: behavioral_risk_flag {
    type: number
    sql: cast(${TABLE}.has_behavioral as integer) ;;
  }

  dimension: comorbid_risk_flag {
    type: number
    sql: cast(${TABLE}.has_comorbid as integer) ;;
  }

  dimension: duration_risk_flag {
    type: number
    sql: cast(${TABLE}.has_duration as integer) ;;
  }

  dimension: ervisit_risk_flag {
    type: number
    sql: cast(${TABLE}.has_ervisit as integer) ;;
  }

  dimension: highrisk_risk_flag {
    type: number
    sql: cast(${TABLE}.has_highrisk as integer);;
  }

  dimension: medd_risk_flag {
    type: number
    sql: cast( ${TABLE}.has_meddrisk as integer);;
  }

  dimension: multipharmacy_risk_flag {
    type: number
    sql: cast(${TABLE}.has_multipharmacy as integer) ;;
  }

  dimension: multiprescriber_risk_flag {
    type: number
    sql: cast(${TABLE}.has_multiprescriber as integer) ;;
  }

  dimension: polydrug_risk_flag {
    type: number
    sql: cast( ${TABLE}.has_poly as integer);;
  }

  dimension: sud_risk_flag {
    type: number
    sql: cast(${TABLE}.has_sud as integer);;
  }

  dimension:unreported_visits_risk_flag {
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
    sql: cast( ${TABLE}.is_opioid as integer) ;;
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
    sql: cast(${TABLE}.monthly_spend as decimal);;
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

  dimension: coverage_termination_date {
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
    hidden: yes
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

######################################################   Measure  ##############################################


measure: Distinct_Count_of_Behavioral_Patients {
       type: number
       sql:count(distinct case when ${behavioral_risk_flag} = 1 then ${axial_member_id} end);;
      value_format_name: decimal_0
      drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
}


  measure: Distinct_Count_of_Comorbid_Patients {
    type: number
    sql:count(distinct case when ${comorbid_risk_flag} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }


  measure: Distinct_Count_of_Duration_Patients {
    type: number
    sql:count(distinct case when ${duration_risk_flag} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }


  measure: Distinct_Count_of_ERVisit_Patients {
    type: number
    sql:count(distinct case when ${ervisit_risk_flag} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }

  measure: Distinct_Count_of_High_Risk_Patients {
    type: number
    sql:count(distinct case when ${highrisk_risk_flag} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }


  measure: Distinct_Count_of_MEDD_Risk_Patients {
    type: number
    sql:count(distinct case when ${medd_risk_flag}= 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }

  measure:Distinct_Count_of_Multi_Pharmacy_Patients {
    type: number
    sql:count(distinct case when ${multipharmacy_risk_flag} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields:[patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }



  measure: Distinct_Count_of_Multi_Prescriber_Patients {
    type: number
    sql:count(distinct case when ${multiprescriber_risk_flag} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }


  measure: Distinct_Count_of_PolyDrug_Patients {
    type: number
    sql:count(distinct case when ${polydrug_risk_flag} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }


  measure:Distinct_Count_of_SUD_Patients {
    type: number
    sql:count(distinct case when ${sud_risk_flag} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }

  measure: Distinct_Count_of_Unreported_Visits_Patients {
    type: number
    sql:count(distinct case when ${unreported_visits_risk_flag} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }


  measure: Distinct_Count_of_Pain_Patients {
    type: number
    sql:count(distinct case when ${in_pain_dm} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [axial_member_id,patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }


  measure: Distinct_Count_of_Patients {
    type: number
    sql:count(distinct ${axial_member_id} );;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }


  measure: Distinct_Count_of_Opioid_Patients {
    type: number
    sql:count(distinct case when ${is_opioid} = 1 then ${axial_member_id} end);;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }

  measure: Total_Monthly_Spend {
    type: number
    sql:sum(${monthly_spend});;
    value_format_name: decimal_0
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }



  measure: Count_of_Records {
    type: number
    sql: count(*) ;;
    drill_fields: [patient_phi_dim.axial_member_id,patient_phi_dim.member_address, patient_phi_dim.member_state, patient_phi_dim.member_city, patient_phi_dim.member_zip ]
  }
}
