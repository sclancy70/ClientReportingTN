view: report_through_date_dim {
  sql_table_name: reporting.date_month_dim ;;

  dimension: fiscal_month {
    type: string
    sql: ${TABLE}.fiscal_month ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: month_abbrev {
    type: string
    sql: ${TABLE}.month_abbrev ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: month_year {
    type: string
    sql: ${TABLE}.month_year ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.quarter ;;
  }

  dimension: quarter_year {
    type: string
    sql:  'Q'||${TABLE}.quarter||'-'||${TABLE}.year ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  dimension: year_string {
    type: string
    sql: ${TABLE}.year_string ;;
  }

  dimension: yrmo {
    type: string
    sql: ${TABLE}.yrmo ;;
  }

  dimension: report_through_yrmo {
    type: string
    sql: ${TABLE}.yrmo ;;
  }


  measure: count {
    type: count
    drill_fields: [month_name]
  }
}
