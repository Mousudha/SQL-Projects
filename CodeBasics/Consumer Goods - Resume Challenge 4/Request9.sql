/*
Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/

WITH CTE1 AS
(
	SELECT
		c.channel,
		ROUND(SUM(gross_price * sold_quantity)/1000000,2) AS gross_sales_mln
	FROM 
		fact_gross_price gp
	JOIN 
		fact_sales_monthly fm ON gp.product_code = fm.product_code AND 
        gp.fiscal_year = fm.fiscal_year
	JOIN 
		dim_customer c ON fm.customer_code = c.customer_code
	WHERE gp.fiscal_year = 2021
	GROUP BY channel
	ORDER BY 2 DESC
)

SELECT
	channel,
	MAX(gross_sales_mln),
    ROUND(MAX(gross_sales_mln)*100/SUM(gross_sales_mln),2) AS percentage
FROM CTE1

