mysql> USE alv_proy;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+--------------------+
| Tables_in_alv_proy |
+--------------------+
| users              |
+--------------------+
1 row in set (0,01 sec)

mysql> DESCRIBE users;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(40) | YES  |     | NULL    |                |
| email       | varchar(60) | NO   | UNI | NULL    |                |
| userCreated | datetime    | YES  |     | NULL    |                |
| phone       | int         | NO   |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
5 rows in set (0,01 sec)

mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> CREATE TABLE bikes (
    -> id INT(11) NOT NULL AUTO_INCREMENET,
    -> modelo VARCHAR(100) NOT NULL,
    -> precio INT(6) NOT NULL,
    -> userId INT(11) NOT NULL,
    -> PRIMARY KEY (id),
    -> KEY userId (userId),
    -> CONSTRAINT user_FK FOREIGN KEY (userId) REFERENCES users (id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO_INCREMENET,
modelo VARCHAR(100) NOT NULL,
precio INT(6) NOT NULL,
userId IN' at line 2
mysql> CREATE TABLE bikes ( id INT(11) NOT NULL AUTO_INCREMENT, modelo VARCHAR(100) NOT NULL, precio INT(6) NOT NULL, userId INT(11) NOT NULL, PRIMARY KEY (id), KEY userId (userId), CONSTRAINT user_FK FOREIGN KEY (userId) REFERENCES users (id) );
Query OK, 0 rows affected, 3 warnings (0,04 sec)

mysql> SHOW TABLES;
+--------------------+
| Tables_in_alv_proy |
+--------------------+
| bikes              |
| users              |
+--------------------+
2 rows in set (0,00 sec)

mysql> DESCRIBE bikes;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| modelo | varchar(100) | NO   |     | NULL    |                |
| precio | int          | NO   |     | NULL    |                |
| userId | int          | NO   | MUL | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0,00 sec)

mysql> DESCRIBE users;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(40) | YES  |     | NULL    |                |
| email       | varchar(60) | NO   | UNI | NULL    |                |
| userCreated | datetime    | YES  |     | NULL    |                |
| phone       | int         | NO   |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
5 rows in set (0,00 sec)

mysql> SELECT * FROM users;
+----+--------+----------------------+---------------------+-----------+
| id | name   | email                | userCreated         | phone     |
+----+--------+----------------------+---------------------+-----------+
|  5 | Alvaro | usuario1@example.com | 2023-12-11 10:00:00 | 123456789 |
|  6 | Jordi  | usuario2@example.com | 2023-12-12 11:30:00 | 987654321 |
|  7 | Marta  | usuario3@example.com | 2023-12-13 09:45:00 | 555555555 |
|  9 | Miriam | usuario4@example.com | 2023-12-05 00:00:00 | 123456789 |
+----+--------+----------------------+---------------------+-----------+
4 rows in set (0,00 sec)

mysql> INSERT INTO bikes (modelo, precio, userId) VALUES ('Bianchi', 100.50, 5);
Query OK, 1 row affected (0,01 sec)

mysql> SELECT * FROM bikes;
+----+---------+--------+--------+
| id | modelo  | precio | userId |
+----+---------+--------+--------+
|  1 | Bianchi |    101 |      5 |
+----+---------+--------+--------+
1 row in set (0,00 sec)

mysql> ALTER TABLE bikes MODIFY COLUMN precio DECIMAL(10,2);
Query OK, 1 row affected (0,06 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> DESCRIBE bikes;
+--------+---------------+------+-----+---------+----------------+
| Field  | Type          | Null | Key | Default | Extra          |
+--------+---------------+------+-----+---------+----------------+
| id     | int           | NO   | PRI | NULL    | auto_increment |
| modelo | varchar(100)  | NO   |     | NULL    |                |
| precio | decimal(10,2) | YES  |     | NULL    |                |
| userId | int           | NO   | MUL | NULL    |                |
+--------+---------------+------+-----+---------+----------------+
4 rows in set (0,00 sec)

mysql> INSERT INTO bikes (modelo, precio, userID) VALUES ('Trek', 225.40, 6);
Query OK, 1 row affected (0,01 sec)

mysql> SELECT * FROM bikes;
+----+---------+--------+--------+
| id | modelo  | precio | userId |
+----+---------+--------+--------+
|  1 | Bianchi | 101.00 |      5 |
|  2 | Trek    | 225.40 |      6 |
+----+---------+--------+--------+
2 rows in set (0,00 sec)

mysql> INSERT INTO bikes (modelo, precio, userID) VALUES ('Btt', 275.40, 25);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`alv_proy`.`bikes`, CONSTRAINT `user_FK` FOREIGN KEY (`userId`) REFERENCES `users` (`id`))
mysql> SELECT * FROM bikes;
+----+---------+--------+--------+
| id | modelo  | precio | userId |
+----+---------+--------+--------+
|  1 | Bianchi | 101.00 |      5 |
|  2 | Trek    | 225.40 |      6 |
+----+---------+--------+--------+
2 rows in set (0,00 sec)

