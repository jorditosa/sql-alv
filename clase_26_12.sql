jordi@mylaptop:~$ mysql -u root
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
jordi@mylaptop:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 15
Server version: 8.0.35-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> system mysqldump -u root -p alv_proy > C:\Users/alvaro\Desktop;
ERROR: 
Unknown command '\U'.
ERROR: 
Unknown command '\D'.
sh: 1: cannot create C:Users/alvaroDesktop: Directory nonexistent
mysql> system mysqldump -u root -p alv_proy > C:\Users\alvaro\Desktop;
ERROR: 
Unknown command '\U'.
ERROR: 
Unknown command '\a'.
ERROR: 
Unknown command '\D'.
Enter password: 
mysqldump: Got error: 1045: Access denied for user 'root'@'localhost' (using password: YES) when trying to connect
mysql> system mysqldump -u root -p alv_proy > /home/jordi/Escritorio;
sh: 1: cannot create /home/jordi/Escritorio: Is a directory
Enter password: sqldump -u root -p alv_proy > /home/jordi/Escritorio/backup_26_12.sql;
mysql> 
mysql> 
mysql> 
mysql> USE alv_proy;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+--------------------+
| Tables_in_alv_proy |
+--------------------+
| bikes              |
| users              |
+--------------------+
2 rows in set (0,01 sec)

mysql> SELECT * FROM bikes;
+----+---------+--------+--------+
| id | modelo  | precio | userId |
+----+---------+--------+--------+
|  1 | Bianchi | 101.00 |      5 |
|  2 | Trek    | 225.40 |      6 |
+----+---------+--------+--------+
2 rows in set (0,01 sec)

mysql> SELECT * FROM bikes WHERE precio > 200;
+----+--------+--------+--------+
| id | modelo | precio | userId |
+----+--------+--------+--------+
|  2 | Trek   | 225.40 |      6 |
+----+--------+--------+--------+
1 row in set (0,00 sec)

mysql> SELECT modelo AS Bicicleta FROM bikes WHERE precio > 200 OR id = 6;
+-----------+
| Bicicleta |
+-----------+
| Trek      |
+-----------+
1 row in set (0,00 sec)

mysql> SELECT modelo, precio FROM bikes WHERE modelo LIKE 'B%';
+---------+--------+
| modelo  | precio |
+---------+--------+
| Bianchi | 101.00 |
+---------+--------+
1 row in set (0,00 sec)

mysql> SELECT * FROM bikes WHERE precio LIKE = 225.40;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '= 225.40' at line 1
mysql> SELECT * FROM bikes WHERE precio LIKE = '225.40';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '= '225.40'' at line 1
mysql> SELECT * FROM bikes WHERE precio = 225.40;
+----+--------+--------+--------+
| id | modelo | precio | userId |
+----+--------+--------+--------+
|  2 | Trek   | 225.40 |      6 |
+----+--------+--------+--------+
1 row in set (0,00 sec)

mysql> SELECT * FROM bikes WHERE precio = '225.40';
+----+--------+--------+--------+
| id | modelo | precio | userId |
+----+--------+--------+--------+
|  2 | Trek   | 225.40 |      6 |
+----+--------+--------+--------+
1 row in set (0,00 sec)

mysql> SELECT * FROM bikes WHERE NOT id = 5;
+----+---------+--------+--------+
| id | modelo  | precio | userId |
+----+---------+--------+--------+
|  1 | Bianchi | 101.00 |      5 |
|  2 | Trek    | 225.40 |      6 |
+----+---------+--------+--------+
2 rows in set (0,00 sec)

mysql> SELECT * FROM bikes WHERE NOT userId = 5;
+----+--------+--------+--------+
| id | modelo | precio | userId |
+----+--------+--------+--------+
|  2 | Trek   | 225.40 |      6 |
+----+--------+--------+--------+
1 row in set (0,00 sec)

mysql> SELECT * FROM bikes ORDER BY precio DESC;
+----+---------+--------+--------+
| id | modelo  | precio | userId |
+----+---------+--------+--------+
|  2 | Trek    | 225.40 |      6 |
|  1 | Bianchi | 101.00 |      5 |
+----+---------+--------+--------+
2 rows in set (0,00 sec)

mysql> SELECT * FROM bikes ORDER BY precio DESC AND id = 5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AND id = 5' at line 1
mysql> SELECT precio FROM bikesWHERE precio BETWEEN 50 AND 150;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'BETWEEN 50 AND 150' at line 1
mysql> SELECT precio FROM bikes WHERE precio BETWEEN 50 AND 150;
+--------+
| precio |
+--------+
| 101.00 |
+--------+
1 row in set (0,01 sec)

mysql> 

-- JOIN

mysql> SELECT * FROM bikes
    -> INNER JOIN users ON users.id = bikes.userId;
+----+---------+--------+--------+----+--------+----------------------+---------------------+-----------+
| id | modelo  | precio | userId | id | name   | email                | userCreated         | phone     |
+----+---------+--------+--------+----+--------+----------------------+---------------------+-----------+
|  1 | Bianchi | 101.00 |      5 |  5 | Alvaro | usuario1@example.com | 2023-12-11 10:00:00 | 123456789 |
|  2 | Trek    | 225.40 |      6 |  6 | Jordi  | usuario2@example.com | 2023-12-12 11:30:00 | 987654321 |
+----+---------+--------+--------+----+--------+----------------------+---------------------+-----------+
2 rows in set (0,00 sec)

mysql> SELECT * FROM bikes INNER JOIN users ON users.email = bikes.modelo;
Empty set (0,00 sec)

mysql> SELECT * FROM bikes
    -> LEFT JOIN users ON bikes.userId = users.id;
+----+---------+--------+--------+------+--------+----------------------+---------------------+-----------+
| id | modelo  | precio | userId | id   | name   | email                | userCreated         | phone     |
+----+---------+--------+--------+------+--------+----------------------+---------------------+-----------+
|  1 | Bianchi | 101.00 |      5 |    5 | Alvaro | usuario1@example.com | 2023-12-11 10:00:00 | 123456789 |
|  2 | Trek    | 225.40 |      6 |    6 | Jordi  | usuario2@example.com | 2023-12-12 11:30:00 | 987654321 |
+----+---------+--------+--------+------+--------+----------------------+---------------------+-----------+
2 rows in set (0,00 sec)

mysql> SELECT * FROM bikes RIGHT JOIN users ON bikes.userId = users.id;
+------+---------+--------+--------+----+--------+----------------------+---------------------+-----------+
| id   | modelo  | precio | userId | id | name   | email                | userCreated         | phone     |
+------+---------+--------+--------+----+--------+----------------------+---------------------+-----------+
|    1 | Bianchi | 101.00 |      5 |  5 | Alvaro | usuario1@example.com | 2023-12-11 10:00:00 | 123456789 |
|    2 | Trek    | 225.40 |      6 |  6 | Jordi  | usuario2@example.com | 2023-12-12 11:30:00 | 987654321 |
| NULL | NULL    |   NULL |   NULL |  7 | Marta  | usuario3@example.com | 2023-12-13 09:45:00 | 555555555 |
| NULL | NULL    |   NULL |   NULL |  9 | Miriam | usuario4@example.com | 2023-12-05 00:00:00 | 123456789 |
| NULL | NULL    |   NULL |   NULL | 10 | Juan   | usuario5@example.com | 2023-12-01 00:00:00 |    151919 |
+------+---------+--------+--------+----+--------+----------------------+---------------------+-----------+
5 rows in set (0,00 sec)

mysql> SELECT * FROM users INNER JOIN bikes ON bikes.userId = users.id;
+----+--------+----------------------+---------------------+-----------+----+---------+--------+--------+
| id | name   | email                | userCreated         | phone     | id | modelo  | precio | userId |
+----+--------+----------------------+---------------------+-----------+----+---------+--------+--------+
|  5 | Alvaro | usuario1@example.com | 2023-12-11 10:00:00 | 123456789 |  1 | Bianchi | 101.00 |      5 |
|  6 | Jordi  | usuario2@example.com | 2023-12-12 11:30:00 | 987654321 |  2 | Trek    | 225.40 |      6 |
+----+--------+----------------------+---------------------+-----------+----+---------+--------+--------+
2 rows in set (0,01 sec)

mysql> SELECT * FROM users LEFT JOIN bikes ON bikes.userId = users.id;
+----+--------+----------------------+---------------------+-----------+------+---------+--------+--------+
| id | name   | email                | userCreated         | phone     | id   | modelo  | precio | userId |
+----+--------+----------------------+---------------------+-----------+------+---------+--------+--------+
|  5 | Alvaro | usuario1@example.com | 2023-12-11 10:00:00 | 123456789 |    1 | Bianchi | 101.00 |      5 |
|  6 | Jordi  | usuario2@example.com | 2023-12-12 11:30:00 | 987654321 |    2 | Trek    | 225.40 |      6 |
|  7 | Marta  | usuario3@example.com | 2023-12-13 09:45:00 | 555555555 | NULL | NULL    |   NULL |   NULL |
|  9 | Miriam | usuario4@example.com | 2023-12-05 00:00:00 | 123456789 | NULL | NULL    |   NULL |   NULL |
| 10 | Juan   | usuario5@example.com | 2023-12-01 00:00:00 |    151919 | NULL | NULL    |   NULL |   NULL |
+----+--------+----------------------+---------------------+-----------+------+---------+--------+--------+
5 rows in set (0,00 sec)

mysql> SELECT * FROM users RIGHT JOIN bikes ON bikes.userId = users.id;
+------+--------+----------------------+---------------------+-----------+----+---------+--------+--------+
| id   | name   | email                | userCreated         | phone     | id | modelo  | precio | userId |
+------+--------+----------------------+---------------------+-----------+----+---------+--------+--------+
|    5 | Alvaro | usuario1@example.com | 2023-12-11 10:00:00 | 123456789 |  1 | Bianchi | 101.00 |      5 |
|    6 | Jordi  | usuario2@example.com | 2023-12-12 11:30:00 | 987654321 |  2 | Trek    | 225.40 |      6 |
+------+--------+----------------------+---------------------+-----------+----+---------+--------+--------+
2 rows in set (0,00 sec)

