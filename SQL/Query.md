# SQL Query

## Create User
```sh
$ CREATE USER username IDENTIFIED BY password;
$ GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO username;
$ ALTER USER username DEFAULT TABLESPACE USERS QUOTA 5m ON USERS;
```
**NB: for "Invalid common user or role name error" try this command: `alter session set "_ORACLE_SCRIPT"=true;`**

Show All Tables of Database
```sh
$ SELECT * FROM TABS;
```

## Create Table
CREATE TABLE
```sh
$ CREATE TABLE Table_name
(
	column1 VARCHAR2(12) NOT NULL,
	column2	DATE,
	column3	VARCHAR2(12)
);
```

## Insert Table
```sh
$ INSERT INTO table_name VALUES('Colm1_val','Colm2_val','Colm3_val');
```
OR
```sh
$ INSERT INTO table_name (col1,col3,col2) VALUES ('col1_val','col3_val','col2_val');
```

## Update
```sh
$ UPDATE table_name SET col_val = 'new_val' WHERE primary_key= 'primary_key_val';
```

## Commit
Don't forget to commit to save your progress!
```sh
$ commit;
```

## DISTINCT
To show unique data use DINSTINCT keyword (Duplicate will be removed)
```sh
$ SELECT DISTINCT column_1,column_2 FROM table;
```

## Change Column Name
```sh
$ SELECT column "new_name" FROM table;
$ SELECT column1 "new_name_1", column2 "new_name_2" FROM table;
```

## Change view
```sh
$ select cust_id "Customer ID", cust_name "Customer Name", cust_city "Customer City" 
from customer;
$ select cust_name ||' has a Customer ID '|| cust_id as "Summary" from customer;
```

## DELETE
DROP TABLE:
```sh
$ DROP TABLE table_name;
```

# Join
## Cross Join
```sh
$ SELECT col1,col2 FROM table1,table2;
```
OR
```sh
$ SELECT col1,col2 FROM table1 CROSS JOIN table2;
```
** Here new table will have (table_1 row x table_2 row) numbers of row
Adding condition:
```sh
$ SELECT table_1.col_1, table_2.col_1 FROM table_1,table_2 WHERE
table_1.col_1 = table_2.col_1;
```

## Natural Join
Both table must have at least 1 same column name and type. 
```sh
$ SELECT table1.column1,table2.column1 FROM table1 NATURAL JOIN table2;
```
For 3 table:
```sh
$ SELECT cust_id,cust_name,account_id,balance  FROM customer NATURAL JOIN
depositor NATURAL JOIN account;
```

## Join .... Using
```sh
$ SELECT cust_id,cust_name,balance  FROM customer JOIN depositor USING (cust_id) JOIN
account using (account_id) where cust_city='Harrison';
```
## Join ... On: 
(Jei jayga te 2ta common column er type same but naam different sheikhane Join..On use korbo, Otherwise Join...Using)
```sh
$ SELECT column_name FROM table1 A JOIN Table2 B ON A.Col1=B.Col2;
```
For 3 table:
```sh
$ SELECT depositor.cust_id,cust_name,balance  from customer join depositor on
depositor.cust_id=customer.cust_id join account on account.account_id=depositor.account_id
where cust_city='Harrison';
```

## Between Join
```sh
$ SELECT e.employee_name,e.salary,s.grade FROM employee e, salgrade s WHERE e.salary 
BETWEEN s.losal and s.hisal;
```

## Outer Join
(Jaar data nai tar ta null thakbe)
```sh
$ SELECT cust_name, c.cust_id,account_id from customer c,
depositor d where c.cust_id=d.cust_id(+) order by c.cust_id;
```


## Date Functions
```sh
TO_DATE('19-APR-1979','DD-MON-YYYY')
```

## Functions
1. upper('text');
2. lower('text');
3. initcap('text');
### Test
```sh
cd dillinger
docker build -t joemccann/dillinger:${package.json.version} .
```
`${package.json.version}`