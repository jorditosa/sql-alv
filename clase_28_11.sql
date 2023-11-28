jordi@mylaptop:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 28
Server version: 8.0.35-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| alv                |
| dracs_cat          |
| information_schema |
| juegos_mesa        |
| mysql              |
| nc_coffee          |
| performance_schema |
| sys                |
+--------------------+
8 rows in set (0,02 sec)

mysql> DROP TABLE alv;
ERROR 1046 (3D000): No database selected
mysql> DROP DATABASE alv;
Query OK, 2 rows affected (0,22 sec)

mysql> CREATE DATABASE alv_proy;
Query OK, 1 row affected (0,07 sec)

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
8 rows in set (0,02 sec)

mysql> USE alv_proy;
Database changed
mysql> SHOW TABLES;
Empty set (0,07 sec)

mysql> CREATE TABLE users (
    -> id INT(4) PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(50) NOT NULL,
    -> email VARCHAR(60) NOT NULL UNIQUE,
    -> created TIME NULL,
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 6
mysql> CREATE TABLE nombre_de_la_tabla (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> nombre VARCHAR(50),
    -> edad INT,
    -> email VARCHAR(100),
    -> created TIME DEFAULT NULL,
    -> PRIMARY KEY (id)
    -> );
ERROR 1068 (42000): Multiple primary key defined
mysql> CREATE TABLE nombre_de_la_tabla ( id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(50), edad INT, email VARCHAR(100), created TIME DEFAULT NULL );
Query OK, 0 rows affected (0,03 sec)

mysql> SHOW TABLES;
+--------------------+
| Tables_in_alv_proy |
+--------------------+
| nombre_de_la_tabla |
+--------------------+
1 row in set (0,01 sec)

mysql> DROP TABLE nombre_de_la_tabla;
Query OK, 0 rows affected (0,02 sec)

mysql> CREATE TABLE users (
    -> id INT(11) AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(50) NOT NULL,
    -> email VARCHAR(60) NOT NULL UNIQUE,
    -> userCreated DATETIME DEFAULT NULL
    -> );
Query OK, 0 rows affected, 1 warning (0,04 sec)

mysql> SHOW TABLE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
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
| name        | varchar(50) | NO   |     | NULL    |                |
| email       | varchar(60) | NO   | UNI | NULL    |                |
| userCreated | datetime    | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
4 rows in set (0,07 sec)

mysql> ALTER TABLE users
    -> MODIFY COLUMN name VARCHAR(40);
Query OK, 0 rows affected (0,08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE users;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(40) | YES  |     | NULL    |                |
| email       | varchar(60) | NO   | UNI | NULL    |                |
| userCreated | datetime    | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
4 rows in set (0,00 sec)

mysql> ALTER TABLE users
    -> ADD phone INT(9) NOT NULL;
Query OK, 0 rows affected, 1 warning (0,03 sec)
Records: 0  Duplicates: 0  Warnings: 1

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

mysql> INSERT INTO users (name,email,phone) VALUES ('Alvaro', 'alv@gmail.com', 4455646);
Query OK, 1 row affected (0,01 sec)

mysql> SELECT * FROM users;
+----+--------+---------------+-------------+---------+
| id | name   | email         | userCreated | phone   |
+----+--------+---------------+-------------+---------+
|  1 | Alvaro | alv@gmail.com | NULL        | 4455646 |
+----+--------+---------------+-------------+---------+
1 row in set (0,00 sec)

mysql> SELECT name FROM users WHERE name LIKE 'Alvaro';
+--------+
| name   |
+--------+
| Alvaro |
+--------+
1 row in set (0,00 sec)

mysql> 
