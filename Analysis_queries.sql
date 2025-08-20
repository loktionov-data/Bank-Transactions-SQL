##The most profitable clients
SELECT transactions.`customer_id`, customers.`name`, ROUND(SUM(transactions.`amount`)) AS total_deposit
FROM customers JOIN transactions ON customers.`ID` = transactions.`customer_id`
WHERE transactions.`transaction_type` = "Deposit"
GROUP BY transactions.`customer_id`
ORDER BY total_deposit DESC; 

##Top 3 countries by activity
SELECT 
    customers.country,
    COUNT(DISTINCT transactions.`customer_id`) AS active_customers,
    COUNT(transactions.`ID`) AS total_transactions
FROM transactions JOIN customers  ON customers.ID = transactions.`customer_id`
WHERE transactions.`date` >= CURDATE() - INTERVAL 30 DAY
GROUP BY customers.`country`
ORDER BY active_customers DESC
LIMIT 3;

##Fee share
SELECT ROUND(SUM(CASE WHEN transactions.`transaction_type` = "Fee" THEN ABS(transactions.`amount`) ELSE 0 END),2) AS fee_sum,
ROUND(SUM(ABS(transactions.`amount`)),2) AS total_sum,
ROUND(SUM(CASE WHEN transactions.`transaction_type` = 'Fee' THEN ABS(transactions.`amount`) ELSE 0 END) * 100.0 / SUM(ABS(transactions.`amount`)), 2) AS fee_share
FROM transactions;
