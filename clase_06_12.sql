mysql> SELECT name FROM users;
+--------+
| name   |
+--------+
| Alvaro |
+--------+
1 row in set (0,01 sec)

mysql> INSERT INTO users (name, email, phone) VALUES ('Jordi', 'jordi@gmail.com', 665165), ('Juan', 'juan@hotmail.com', 55555);
Query OK, 2 rows affected (0,02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT email FROM users;
+------------------+
| email            |
+------------------+
| alv@gmail.com    |
| jordi@gmail.com  |
| juan@hotmail.com |
+------------------+
3 rows in set (0,00 sec)

mysql> SELECT CONCAT(name, email) AS datosUsuario FROM users;
+----------------------+
| datosUsuario         |
+----------------------+
| Alvaroalv@gmail.com  |
| Jordijordi@gmail.com |
| Juanjuan@hotmail.com |
+----------------------+
3 rows in set (0,00 sec)

mysql> SELECT CONCAT(name, ' cont email: ', email) AS datosUsuario FROM users;
+-----------------------------------+
| datosUsuario                      |
+-----------------------------------+
| Alvaro cont email: alv@gmail.com  |
| Jordi cont email: jordi@gmail.com |
| Juan cont email: juan@hotmail.com |
+-----------------------------------+
3 rows in set (0,00 sec)

mysql> SELECT CONCAT(name, ' ', email) FROM users;
+--------------------------+
| CONCAT(name, ' ', email) |
+--------------------------+
| Alvaro alv@gmail.com     |
| Jordi jordi@gmail.com    |
| Juan juan@hotmail.com    |
+--------------------------+
3 rows in set (0,00 sec)

mysql> SELECT name, phone FROM users WHERE id BETWEEN 2 AND 6;
+-------+--------+
| name  | phone  |
+-------+--------+
| Jordi | 665165 |
| Juan  |  55555 |
+-------+--------+
2 rows in set (0,00 sec)

mysql> SELECT name, phone FROM users WHERE name LIKE '%uan';
+------+-------+
| name | phone |
+------+-------+
| Juan | 55555 |
+------+-------+
1 row in set (0,00 sec)

mysql> SELECT name, phone FROM users WHERE name LIKE 'uan%';
Empty set (0,00 sec)

mysql> 
