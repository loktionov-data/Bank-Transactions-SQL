##Clients by transaction sum
DELIMITER //
CREATE PROCEDURE clients_by_month_trans()
BEGIN
SELECT customers.`name`, transactions.customer_id,
ROUND(SUM(transactions.amount) / (SELECT TIMESTAMPDIFF(MONTH, MIN(transactions.`date`), MAX(transactions.`date`)) FROM transactions),2) AS `monthly_mean`
FROM customers JOIN transactions ON customers.ID = transactions.customer_id
GROUP BY transactions.customer_id
ORDER BY `monthly_mean` DESC
LIMIT 5;
END//
DELIMITER ;
##Mean balance
DELIMITER $$
CREATE PROCEDURE mean_balance_by_country()
BEGIN
SELECT country, ROUND(AVG(balance),2) as average_balance FROM customers GROUP BY country ORDER BY average_balance DESC;
END$$
DELIMITER;

## Sum of + and - of user transactions
DELIMITER //
CREATE PROCEDURE deposit_and_withdrawals()
BEGIN
SELECT customers.`name`, transactions.customer_id,
(SELECT ROUND(SUM(`amount`),2) FROM `transactions` WHERE transactions.transaction_type = "Withdrawal" AND customers.ID = transactions.customer_id GROUP BY `customer_id`) as `withdrawal_sum`,
(SELECT ROUND(SUM(`amount`),2) FROM `transactions` WHERE transactions.transaction_type = "Deposit" AND customers.ID = transactions.customer_id GROUP BY `customer_id`) as `deposit_sum`
FROM customers JOIN transactions ON customers.ID = transactions.customer_id
GROUP BY customer_id;  
END//
DELIMITER;

##Clients by activity
DELIMITER$$
CREATE PROCEDURE clients_by_activity()
BEGIN
SELECT 
(SELECT COUNT(DISTINCT customer_id) FROM transactions) AS active_users,
(SELECT COUNT(ID) FROM customers) AS total_users,
ROUND((SELECT COUNT(DISTINCT customer_id) FROM transactions) * 100.0 / (SELECT COUNT(ID) FROM customers),2) AS active_users_share_percent;
END$$
DELIMITER ;

##Countries by balance
DELIMITER //
CREATE PROCEDURE top_countries_by_balance()
BEGIN
SELECT COUNT(*) as user_count,country FROM customers WHERE balance > 10000 GROUP BY country ORDER BY user_count desc LIMIT 5;
END//
DELIMITER ;