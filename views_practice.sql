##Total info about clients
CREATE VIEW client_info AS
SELECT customers.`name`, customers.`country`, COUNT(transactions.`customer_id`) AS amount_of_transactions,  
ROUND(SUM(transactions.`amount`),2) as transactions_sum, ROUND(AVG(transactions.`amount`),2) AS mean_transaction
FROM customers JOIN transactions ON customers.`ID` = transactions.`customer_id`
GROUP BY transactions.`customer_id`, customers.`country`
ORDER BY amount_of_transactions DESC; 

##Countries activity
CREATE VIEW countries_activity AS
SELECT customers.`country`, COUNT(transactions.`ID`) as transactions_amount, 
COUNT(DISTINCT transactions.`customer_id`) as customers_amount, ROUND(SUM(transactions.`amount`),2) as total_transactions_sum
FROM customers JOIN transactions ON customers.`ID` = transactions.`customer_id`
GROUP BY customers.`country`
ORDER BY transactions_amount DESC;

##Customers activity
CREATE VIEW customers_activity AS
SELECT customers.`ID`, customers.`name`, 
DATE_FORMAT(transactions.`date`, '%y-%m') AS `month`,
ROUND(SUM(CASE 
WHEN transactions.`transaction_type` IN ("Withdrawal", "Fee", "Payment") THEN -transactions.`amount` 
WHEN transactions.`transaction_type` IN ('Deposit', 'Transfer', 'Refund') THEN transactions.`amount` ELSE 0 END),2) AS sum_of_payments
FROM customers JOIN transactions ON customers.`ID` = transactions.`customer_id`
GROUP BY transactions.`customer_id`, customers.`name`, `month`
ORDER BY sum_of_payments DESC;

##Customers for Churn prediction
CREATE VIEW customers_churn AS
SELECT customers.`ID`, customers.`name`, customers.`country`, customers.`balance`, 
COUNT(transactions.`customer_id`) AS transactions_count, MAX(transactions.`date`) AS last_transaction_date
FROM customers LEFT JOIN transactions ON customers.`ID` =  transactions.`customer_id` 
GROUP BY customers.`ID`, customers.`name`, customers.`country`
HAVING customers.`balance` < 7500 AND transactions_count < 3;