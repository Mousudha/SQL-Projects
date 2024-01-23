/*
Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage
*/

SELECT
	pid.customer_code,
    customer,
	ROUND(AVG(pre_invoice_discount_pct)*100,2)	AS average_discount_percentage
FROM fact_pre_invoice_deductions pid
LEFT JOIN dim_customer c ON pid.customer_code = c.customer_code
WHERE fiscal_year = 2021
AND c.market = 'INDIA'
GROUP BY customer_code
ORDER BY average_discount_percentage DESC
LIMIT 5;