{% docs desc_fct_monthly_sales %}
Esta tabla de hechos es el **corazón del análisis de rendimiento de ventas**. Consolida todas las transacciones de ventas de vehículos a un nivel mensual, desglosado por:

* Vendedor
* Marca del vehículo

**Lógica de Cálculo clave:**
 - 'TOTAL SALES': se calcula como 'SUM(SALEPRICE - COMMISSION_EARNED)'-
 - 'TOTAL COM': se calcula como 'SM (COMMISSION_EARNED)'.

 **Fuentes principales:**
 - Deriva sus datos del modelo de procesamiento 'psg_monthly_sales_make'.

 **Usos comunes:**
 - Alimentar el Dashboard principal de Ventas.
 - Análisis de tendencias de ventas mensuales.
 - Comparación de rendimiento entre vendedores y marcas.

 **Consideraciones:**
 - Los datos se actualizan diariamente, reflejando las ventas del día anterior.
 - Asegúrese de unir con 'dim_date' para análisis de series temporales más ricos

 {% enddocs %}

 {% docs desc_salesperson_id_column %}
 Esta es la clave subrogada que identifica de forma única a un vendedor dentro del sistema analítico. Se genera en el modelo 'dim_salesperson y se utiliza para unir la tabla de hechos

 **Importante** siempre use esta columna para los joins con la dimensión de vendedores para asegurar la integridad referencial.

 {% enddocs %}