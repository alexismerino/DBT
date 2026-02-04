{{
    config(tags=["salesperson","dimension","dash_sales_bi"])
}}

SELECT 
    RANK()  OVER(ORDER BY SALESPERSON)   AS ID_SALESPERSON,
    SALESPERSON
FROM {{ref("psg_monthly_sales_make")}}
GROUP BY SALESPERSON