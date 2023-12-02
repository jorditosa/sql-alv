jordi@mylaptop:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.35-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DATABASE' at line 1
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| alv_proy           |
| dracs_cat          |
| information_schema |
| juegos_mesa        |
| mysql              |
| nc_coffee          |
| performance_schema |
| sys                |
+--------------------+
8 rows in set (0,01 sec)

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
1 row in set (0,00 sec)

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

mysql> INSERT INTO users (name, email, phone) VALUES ('Jordi', 'jordi@gmail.com', 666644);
Query OK, 1 row affected (0,01 sec)

mysql> SELECT * FROM users;
+----+--------+-----------------+-------------+---------+
| id | name   | email           | userCreated | phone   |
+----+--------+-----------------+-------------+---------+
|  1 | Alvaro | alv@gmail.com   | NULL        | 4455646 |
|  2 | Jordi  | jordi@gmail.com | NULL        |  666644 |
+----+--------+-----------------+-------------+---------+
2 rows in set (0,00 sec)

mysql> SELECT name FORM users;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'users' at line 1
mysql> SELECT name FROM users;
+--------+
| name   |
+--------+
| Alvaro |
| Jordi  |
+--------+
2 rows in set (0,00 sec)

mysql> INSERT INTO users (name,email) VALUES (),(),(),.....
    -> .;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.....
.' at line 1
mysql> SELECT * FROM users WHERE email LIKE 'alv@gmail.com';
+----+--------+---------------+-------------+---------+
| id | name   | email         | userCreated | phone   |
+----+--------+---------------+-------------+---------+
|  1 | Alvaro | alv@gmail.com | NULL        | 4455646 |
+----+--------+---------------+-------------+---------+
1 row in set (0,00 sec)

mysql> SELECT name FROM users WHERE email LIKE 'alv@gmail.com';
+--------+
| name   |
+--------+
| Alvaro |
+--------+
1 row in set (0,00 sec)

mysql> SELECT * FROM users WHERE email LIKE 'alv@gmail.com';
+----+--------+---------------+-------------+---------+
| id | name   | email         | userCreated | phone   |
+----+--------+---------------+-------------+---------+
|  1 | Alvaro | alv@gmail.com | NULL        | 4455646 |
+----+--------+---------------+-------------+---------+
1 row in set (0,00 sec)

mysql> SELECT * FROM users WHERE phone BETWEEN 1 AND 999999;
+----+-------+-----------------+-------------+--------+
| id | name  | email           | userCreated | phone  |
+----+-------+-----------------+-------------+--------+
|  2 | Jordi | jordi@gmail.com | NULL        | 666644 |
+----+-------+-----------------+-------------+--------+
1 row in set (0,00 sec)

mysql> SELECT name FROM users LIMIT 1;
+--------+
| name   |
+--------+
| Alvaro |
+--------+
1 row in set (0,00 sec)

mysql> SELECT email FROM users ORDER BY id DESC;
+-----------------+
| email           |
+-----------------+
| jordi@gmail.com |
| alv@gmail.com   |
+-----------------+
2 rows in set (0,00 sec)

mysql> SELECT email FROM users ORDER BY id ASC;
+-----------------+
| email           |
+-----------------+
| alv@gmail.com   |
| jordi@gmail.com |
+-----------------+
2 rows in set (0,00 sec)

mysql> SELECT email FROM users ORDER BY id ASC AND id = 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AND id = 1' at line 1
mysql> SELECT email FROM users WHERE id = 1 ORDER BY ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ASC' at line 1
mysql> SELECT email FROM users WHERE id = 1 AND ORDER BY ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ORDER BY ASC' at line 1
mysql> SELECT email FROM users WHERE id = 1 AND ORDER BY id ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ORDER BY id ASC' at line 1
mysql> SELECT email FROM users WHERE id = 1 ORDER BY id ASC;
+---------------+
| email         |
+---------------+
| alv@gmail.com |
+---------------+
1 row in set (0,00 sec)

mysql> SELECT email FROM users WHERE id = 1 AND email = 'alv@gmail.com';
+---------------+
| email         |
+---------------+
| alv@gmail.com |
+---------------+
1 row in set (0,00 sec)

mysql> SELECT email FROM users WHERE id = 1 AND email = 'alv@gmail.com' ORDER BY id ASC;
+---------------+
| email         |
+---------------+
| alv@gmail.com |
+---------------+
1 row in set (0,00 sec)

mysql> SELECT * FROM users WHERE id = 1 OR email = 'jordi@gmail.com' ORDER BY id ASC;
+----+--------+-----------------+-------------+---------+
| id | name   | email           | userCreated | phone   |
+----+--------+-----------------+-------------+---------+
|  1 | Alvaro | alv@gmail.com   | NULL        | 4455646 |
|  2 | Jordi  | jordi@gmail.com | NULL        |  666644 |
+----+--------+-----------------+-------------+---------+
2 rows in set (0,00 sec)

mysql> 
