{{
    config(
        materialized ='incremental',
        incremental_strategy = 'merge',
        unique_key = ['DDATE','SALESPERSON','CARMAKE'],
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
{% if is_incremental() %}
--Filtra solo los eventos nuevos desde la última ejecución
WHERE DDATE > (SELECT MAX(DDATE) FROM {{this}})
{%endif%}
GROUP BY DATE_TRUNC('MONTH', DDATE),SALESPERSON,    CARMAKE