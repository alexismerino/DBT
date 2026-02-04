{{
    config(
        materialized ='table',
        tags=['processing','sales','carmake']
    )
}}

SELECT 
    DATE_TRUNC('MONTH', DDATE) AS DDATE,
    SALESPERSON,
    CARMAKE,
    SUM(SALEPRICE-COMNEA)       AS TOTALSALE,
    SUM(COMNEA)                 AS TOTALCOM
FROM {{ref("stg_sales_data_202p")}}
GROUP BY DATE_TRUNC('MONTH', DDATE),SALESPERSON,    CARMAKE