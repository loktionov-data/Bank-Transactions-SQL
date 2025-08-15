-- Procedure for filling customers table with random data
DELIMITER $$
CREATE PROCEDURE FILLUSERS()
BEGIN
	DECLARE Name1 varchar(255);
    DECLARE Surname1 varchar(255);
	DECLARE RandomName varchar(255);
	DECLARE RandomGender VARCHAR(10);
	DECLARE RandomCountry varchar(255);
    DECLARE RandAge INT;
    DECLARE RandBalance DECIMAL(10,2);
    DECLARE I INT DEFAULT 1;
WHILE I <= 100 DO
	SET Name1 = ELT(FLOOR(RAND()*30) +1, 'James ', 'Mary ', 'John ', 'Patricia ', 'Robert ', 'Jennifer ', 'Michael ', 'Linda ',
'William ', 'Elizabeth ', 'David ', 'Barbara ', 'Richard ', 'Susan ', 'Joseph ', 'Jessica ', 'Emma ', 'Olivia ', 'Liam ', 'Noah ',
'Akira ', 'Aarav ', 'Fatima ', 'Hiroshi ', 'Ananya ', 'Jin ', 'Kai ', 'Amara ', 'Viktor ', 'Milan ');
	SET Surname1 = ELT(FLOOR(RAND()*50)+1,
    'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Miller', 'Davis', 'Garcia', 'Rodriguez', 'Wilson',
    'Martinez', 'Anderson', 'Taylor', 'Thomas', 'Hernandez', 'Moore', 'Martin', 'Jackson', 'Thompson', 'White',
    'Lopez', 'Lee', 'Gonzalez', 'Harris', 'Clark', 'Lewis', 'Robinson', 'Walker', 'Perez', 'Hall',
    'Young', 'Allen', 'Sanchez', 'Wright', 'King', 'Scott', 'Torres', 'Nguyen', 'Hill', 'Flores',
    'Green', 'Adams', 'Nelson', 'Baker', 'Hall', 'Mitchell', 'Carter', 'Roberts', 'Murphy', 'Kim'
);
	SET RandomName = CONCAT_WS(' ', Name1, Surname1);
    IF RAND() < 0.5 THEN
		SET RandomGender = "Man";
	ELSE 
		SET RandomGender = "Woman";
	END IF;
	SET RandomCountry = ELT(FLOOR(RAND()*20)+1,
    'United States', 'United Kingdom', 'Germany', 'France', 'Italy', 'Spain', 'Netherlands', 'Sweden', 'Norway', 'Switzerland',
    'Canada', 'Australia', 'Japan', 'China', 'India', 'Brazil', 'Mexico', 'South Korea', 'Egypt', 'South Africa'
);
	SET RandAge = ROUND(RAND() * 52 + 18);
    SET RandBalance = ROUND(RAND() * 99999, 2);
    INSERT INTO customers (`Name`, `Gender`, `Country`, `Age`, `Balance`)
    VALUES (RandomName, RandomGender, RandomCountry, RandAge, RandBalance);
	SET I = I+1;
    END WHILE;
END$$
DELIMITER ; 

-- Procedure for filling transactions table with random data
DELIMITER //
CREATE PROCEDURE FILLTRANSACTIONS()
BEGIN
	DECLARE RandID INT;
    DECLARE RandDate DATE;
    DECLARE RandAmount DECIMAL(10,2);
    DECLARE RandTransaction VARCHAR(255);
    DECLARE I INT DEFAULT 1;
    
WHILE I <=100 DO
SET RandID = (SELECT `ID` FROM customers ORDER BY RAND() LIMIT 1);
SET RandDate = DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND()*1827) DAY);
SET RandAmount = ROUND(RAND() * 4900 + 100, 2);
SET RandTransaction = ELT(FLOOR(RAND()*6)+1, 'Deposit', 'Withdrawal', 'Transfer', 'Payment', 'Fee', 'Refund');
INSERT INTO transactions(`customer_id`,`date`,`amount`, `transaction_type`)
VALUES(RandID, RandDate, RandAmount, RandTransaction);
SET I = I+1;
END WHILE;    
END//
DELIMITER ;

--Procedure for saving customers table with data as csv file
DELIMITER $$
CREATE PROCEDURE SAVECUSTOMERS()
BEGIN
SELECT 'ID', 'name', 'gender', 'country', 'age', 'balance'
UNION ALL
SELECT * FROM customers
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
END$$
DELIMITER ;

--Procedure for saving transactions table with data as csv file
DELIMITER $$
CREATE PROCEDURE SAVETRANSACTIONS()
BEGIN
SELECT 'ID', 'customer_id', 'date', 'amount', 'transaction_type'
UNION ALL
SELECT * FROM transactions
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/transactions.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
END$$
DELIMITER ;

--Calling procedures
CALL FILLUSERS();
CALL FILLTRANSACTIONS();
CALL SAVECUSTOMERS();
CALL SAVETRANSACTIONS();
