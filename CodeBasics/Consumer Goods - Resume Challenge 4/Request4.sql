/*
Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference
*/

WITH CTE1 AS
(
	SELECT
		segment,
		COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN p.product_code ELSE NULL END) products_2020,
		COUNT(DISTINCT CASE WHEN fiscal_year = 2021 THEN p.product_code ELSE NULL END) products_2021
	FROM fact_sales_monthly fm
	JOIN dim_product p ON fm.product_code = p.product_code
	GROUP BY segment
)

SELECT
	segment,
    products_2020,
    products_2021,
	products_2021-products_2020 AS difference
FROM CTE1
ORDER BY difference DESC
LIMIT 1