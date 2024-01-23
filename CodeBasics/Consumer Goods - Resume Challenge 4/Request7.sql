/*
Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount
*/

SELECT 
	MONTHNAME(date) AS Month,
    fm.fiscal_year AS Year,
    ROUND(SUM(sold_quantity * gross_price)/1000000,2) AS Gross_sales_amount_mln
FROM dim_customer c
JOIN fact_sales_monthly fm ON c.customer_code = fm.customer_code
JOIN fact_gross_price gp ON fm.product_code = gp.product_code AND fm.fiscal_year = gp.fiscal_year
WHERE customer = 'Atliq Exclusive'
GROUP BY 2,1
ORDER BY year(date),month(date)