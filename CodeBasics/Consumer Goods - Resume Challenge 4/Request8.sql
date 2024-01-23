/*
In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity
*/

SELECT 
	SUM(sold_quantity) AS total_sold_quantity,
    Quarter
FROM (
		SELECT
			sold_quantity,
			CASE	
					WHEN MONTH(Date) IN (9,10,11) THEN 'Q1'
					WHEN MONTH(Date) IN (12,1,2) THEN 'Q2'
					WHEN MONTH(Date) IN (3,4,5) THEN 'Q3'
					WHEN MONTH(Date) IN (6,7,8) THEN 'Q4'
			END 
				AS Quarter
		FROM fact_sales_monthly
		WHERE fiscal_year = 2020
        ) A
GROUP BY Quarter
ORDER BY 1 DESC
LIMIT 1