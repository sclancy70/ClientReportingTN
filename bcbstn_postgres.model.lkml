connection: "bcbst_postgres"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


explore: npi_member_reference {

  join:  patient_fact {
    type:  left_outer
    sql_on: ${npi_member_reference.axial_member_id} = ${patient_fact.axial_member_id}
    and ${npi_member_reference.yrmo} = ${patient_fact.yrmo};;
    relationship: many_to_one
  }

  join:  npi_fact {
    type:  left_outer
    sql_on: ${npi_member_reference.npi} = ${npi_fact.npi}
    and     ${npi_member_reference.yrmo} = ${npi_fact.yrmo};;
    relationship: many_to_one
  }

  join: patient_phi_dim {
    type:left_outer
    sql_on:  ${npi_member_reference.axial_member_id} = ${patient_fact.axial_member_id} ;;
    relationship: many_to_many
  }


join:  npi_dim {
  type: left_outer
  sql_on:  ${npi_member_reference.npi} = ${npi_dim.npi}
  and     ${npi_member_reference.yrmo} = ${npi_dim.yrmo};;
  relationship: many_to_one
}

join: date_month_dim {
  type: inner
  sql_on: ${npi_member_reference.yrmo} = ${date_month_dim.yrmo} ;;
  relationship: one_to_many



}

join: axial_admin_fact {
  type: left_outer
  sql_on:  ${npi_member_reference.npi} = ${axial_admin_fact.npi}
  and     ${npi_member_reference.yrmo} = ${axial_admin_fact.completion_yrmo};;
relationship: many_to_many
}






}
