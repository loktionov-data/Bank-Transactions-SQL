CREATE TABLE customers(
`ID`  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
`gender` ENUM("Man", "Woman") NOT NULL,
`country` VARCHAR(255) NOT NULL,
`age` INT NOT NULL,
`balance` DECIMAL(10,2) NOT NULL);

CREATE TABLE transactions(
`ID` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`customer_id` INT NOT NULL,
`date` DATE NOT NULL,
`amount` INT NOT NULL,
`transaction_type` ENUM('Deposit', 'Withdrawal', 'Transfer', 'Payment', 'Fee', 'Refund') NOT NULL,
FOREIGN KEY (`customer_id`) REFERENCES customers(`ID`)
);