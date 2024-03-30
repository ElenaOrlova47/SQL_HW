-- Задача 1
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS convertsec;
DELIMITER ##

CREATE FUNCTION convertsec(n INT)
RETURNS VARCHAR(50)
READS SQL DATA
BEGIN
	DECLARE DD CHAR(3);
	DECLARE HH, MN, SS CHAR(2);
	DECLARE result VARCHAR(50);
	SET DD = cast(floor(n/60/60/24) AS CHAR(3));
	SET HH = cast(floor(mod(n/60/60/24,1)*24) AS CHAR(2));
	SET MN = cast(floor(mod(mod(n/60/60/24,1)*24,1)*60) AS CHAR(2));
	SET SS = cast(ceiling(mod(mod(mod(n/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
	SET result = concat(DD,' day(s) ',HH,' hour(s) ',MN,' minute(s) ',SS,' second(s)');
	RETURN result;
END ##

DELIMITER ;
SELECT convertsec(123586);


-- Задача 2
-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
DROP PROCEDURE IF EXISTS Numbers;
DELIMITER $$
CREATE PROCEDURE Numbers(n INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    
    WHILE i <= n DO
		IF i % 2 = 0  THEN
			SELECT i ;
		END IF;		
		SET i = i + 1;        
	END WHILE ;   
END $$
DELIMITER ;

Call Numbers(10)