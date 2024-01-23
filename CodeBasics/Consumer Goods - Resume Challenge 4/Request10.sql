/*
Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order
*/

WITH CTE1 AS
(
	SELECT
		division,
		fm.product_code,
		product,
		SUM(sold_quantity) AS total_sold_quantity,
		RANK() OVER(partition by division ORDER BY SUM(sold_quantity) DESC) AS rank_order
	FROM 
		fact_sales_monthly fm 
	JOIN
		dim_product p ON fm.product_code = p.product_code
	WHERE fiscal_year = 2021
	GROUP BY 1, 2, 3
)

SELECT
	*
FROM CTE1
WHERE rank_order < 4
ORDER BY division 