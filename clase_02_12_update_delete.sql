mysql> UPDATE users SET name = 'juan' WHERE name = 'jordi';
Query OK, 1 row affected (0,01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE users SET name = 'juan' WHERE name = 'jordi;
    '> ;
    '> ';
Query OK, 0 rows affected (0,00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> SELECT * FROM users;
+----+--------+-----------------+-------------+---------+
| id | name   | email           | userCreated | phone   |
+----+--------+-----------------+-------------+---------+
|  1 | Alvaro | alv@gmail.com   | NULL        | 4455646 |
|  2 | juan   | jordi@gmail.com | NULL        |  666644 |
+----+--------+-----------------+-------------+---------+
2 rows in set (0,00 sec)

mysql> DELETE FROM users WHERE id = 2;
Query OK, 1 row affected (0,01 sec)

mysql> SELECT * FROM users;
+----+--------+---------------+-------------+---------+
| id | name   | email         | userCreated | phone   |
+----+--------+---------------+-------------+---------+
|  1 | Alvaro | alv@gmail.com | NULL        | 4455646 |
+----+--------+---------------+-------------+---------+
1 row in set (0,00 sec)

mysql> ^C
mysql> 
