SELECT
    {{ dbt_utils.generate_surrogate_key(['CARMAKE','SALESPERSON'])}}    AS ID
FROM {{ref("psg_monthly_sales_make")}}