# Introduction to SQL

SQL means Structured Query Language. 

- executes queries against a database
- retrieves data from a database
- inserts records in a database
- updates records in a database
- deletes records from a database
- creates new databases
- creates new tables in a database
- creates stored procedures in a database (?)
- creates views in a database
- sets permissions on tables, procedures, and views.

## RDBMS (Relational Database Management System)

The data in RDBMS is stored in database objects called tables.

Fields are columns in the table that is designed to maintain specific information about every record, also called a row.

## SQL Commands

Most of the actions you need to perform on a database are done with SQL statements.

The following SQL statement selects all the records in the "Customers" table:

```sql 
SELECT * FROM Customers;
```

*SQL keywords are not case sensitive.*

Semicolon is used to separate two SQL statements, allowing more than one SQL statement to be executed in the same call to the server.

### Some of the Most Important SQL Commands

- SELECT - extracts data
- UPDATE - updates data 
- DELETE - deletes data
- INSERT INTO - inserts new data 
- CREATE DATABASE - creates a new database
- ALTER DATABASE - modifies a database
- CREATE TABLE - creates a new table
- ALTER TABLE - modifies a table
- DROP TABLE - deletes a table
- CREATE INDEX - creates an index (search key)
- DROP INDEX - deletes an index
- CREATE VIEW - creates a view
- DROP VIEW - deletes a view
- BACKUP DATABASE - creates a backup of a database

### SQL SELECT Statement

The SELECT statement is used to select data from a database.

The data returned is stored in a result table, called the result-set.

```sql
SELECT column1, column2, ...
FROM table_name;
```

column1, column2 are the field names of the table_name table. If we want to select all the fields available in the table:
    
```sql
SELECT * FROM table_name;
```

### SQL SELECT DISTINCT Statement

The SELECT DISTINCT statement is used to return only different values.

```sql
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

The following SQL statement list the number of different countries in the customers table.

```sql
SELECT COUNT(DISTINCT column_name) 
FROM table_name;
```

### SQL WHERE Clause

The WHERE clause is used to filter records. It is used to extract only those records that fulfill a specified condition.

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

The WHERE clause not only can be used with SELECT statement, but also with UPDATE, DELETE, ...

#### Operators in The WHERE Clause

- "=" Equal
- "<>" Not equal. Note: In some versions of SQL this operator may be written as !=
- ">" Greater than
- "<" Less than
- ">=" Greater than or equal
- "<=" Less than or equal
- "BETWEEN" Between an inclusive range
- "LIKE" Search for a pattern
- "IN" To specify multiple possible values for a column

Exemples:
```sql
SELECT * FROM Customers
WHERE Country='Mexico';
```

```sql
SELECT * FROM Customers
WHERE CustomerID=1;
```

```sql
SELECT * FROM Customers
WHERE Country <> 'Germany';
```

```sql
SELECT * FROM Customers
WHERE Country LIKE 'U%';
```

```sql
SELECT * FROM Customers
WHERE Country LIKE '%land%';
```

```sql
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');
```

```sql
SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');
```

```sql
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;
```

### SQL AND, OR and NOT Operators

The WHERE clause can be combined with AND, OR, and NOT operators.

The AND and OR operators are used to filter records based on more than one condition.

The NOT operator displays a record if the condition(s) is NOT TRUE.

**Combining AND, OR and NOT**

The following statement selects all customers from the country "Germany" **and** the city **must not** be "Berlin" **nor** "München":

```sql
SELECT * FROM Customers
WHERE Country='Germany' AND NOT(City='Berlin' OR City='München');
```

### SQL ORDER BY Keyword
The ORDER BY keyword is used to sort the result-set in ascending or descending order.

By default ORDER BY sorts the records in ascending order, to sort in descending order use the DESC keyword.

```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
```

### SQL INSERT INTO Statement

The INSERT INTO statement is used to insert new records in a table.

**Syntax**
There are two basic syntaxes of the INSERT INTO statement which are shown below.

1. Specify the column names and the values to be inserted:

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

2. If you are adding values for all the columns of the table, you only need to make sure the order of the values is in the same order as the columns in the table.

```sql
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
```

### SQL NULL Values

A field with NULL values is a field with no value.

If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field. Then, the field will be saved with a NULL value.

To test for NULL values in the WHERE clause of a query, you must use the IS (NOT) NULL operator.

```sql
SELECT column_names
FROM table_name
WHERE column_name IS (NOT) NULL;
```

### SQL UPDATE Statement
The UPDATE statement is used to modify the existing records in a table.

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

__Note: Be careful when updating records in a table! Notice the WHERE clause in the UPDATE statement. The WHERE clause specifies which record(s) that should be updated. If you omit the WHERE clause, all records in the table will be updated!__

Example:

The following SQL statement updates the first customer (CustomerID = 1) with a new contact person and a new city.


```sql
UPDATE Customers
SET ContactName = 'Vitor Franca',
City = 'Joao Pessoa'
WHERE CustomerID = 1;
```

### SQL DELETE Statement

The DELETE statement is used to delete existing records in a table.

```sql
DELETE FROM table_name
WHERE condition;
```

__Note: Be careful when deleting records in a table! Notice the WHERE clause in the DELETE statement. The WHERE clause specifies which record(s) should be deleted. If you omit the WHERE clause, all records in the table will be deleted!__


### SQL SELECT TOP, LIMIT or ROWNUM Clause

The SELECT TOP clause is used to specify the number of records to return.

The SELECT TOP clause is useful on large tables with thousands of records. Returning a large number of records can impact on performance.

MySQL Syntax

```sql
SELECT column_name
FROM table_name
WHERE condition
LIMIT number;
```

SQL Server / MS Access Syntax

```sql
SELECT TOP number|percent column_name
FROM table_name
WHERE condition;
```

Oracle 12 Syntax

```sql
SELECT column_name
FROM table_name
ORDER BY column_name
FETCH FIRST number ROWS ONLY;
```

Older Oracle Syntax

```sql
SELECT column_name
FROM table_name
WHERE ROWNUM <= number;
```

Examples:
```sql
SELECT * FROM Customers
LIMIT 3; -- MySQL
```

```sql
SELECT TOP 3 * FROM Customers; -- SQL Server / MS Access
```

```sql
SELECT TOP 50 PERCENT * FROM Customers; -- SQL Server / MS Access
```

```sql
SELECT * FROM Customers
FETCH FIRST 50 PERCENT ROWS ONLY; -- Oracle 12
```

```sql
SELECT * FROM Customers
WHERE ROWNUM <= 3; -- Older Oracle
```

### SQL MIN(), MAX(), COUNT(), AVG() and SUM() Functions

The MIN() function returns the smallest value of the selected column.

The MAX() function returns the largest value of the selected column.

The COUNT() function returns the number of rows that matches a specified criteria.

The AVG() function returns the average value of a numeric column.

The SUM() function returns the total sum of a numeric column.

```sql
SELECT MIN(column_name)
FROM table_name
WHERE condition;
```

Examples:
```sql
SELECT MIN(Price) AS SmallestPrice
FROM Products;
```

```sql
SELECT MAX(Price) AS LargestPrice
FROM Products;
```

The number of records that have the Price value set to 18.

```sql
SELECT COUNT(*) 
FROM Products
WHERE Price=18;
```

### SQL LIKE Operator

The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

there are two wildcards often used in conjunction with the LIKE operator:

- The percent sign (%) represents zero, one, or multiple characters
- The underscore sign (_) represents one, single character

*Note: MS Access uses an asterisk (\*) instead of the percent sign (%), and a question mark (?) instead of the underscore (_).*

```sql
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern; 
```

Like Operator                  | Description
-------------------------------| -------------------------------------------
WHERE CustomerName LIKE 'a%'   | Finds any values that start with "a"
WHERE CustomerName LIKE '%a'   | Finds any values that end with "a"
WHERE CustomerName LIKE '%or%' | Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'  | Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'  | Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%' | Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'   | Finds any values that start with "a" and ends with "o"

### SQL Wildcards

A wildcard is used to substitute one or more characters in a string.

Symbol |Description|Example
-------|-----------|-------
%      |A substitute for zero or more characters | WHERE CustomerName LIKE 'a%' finds all customers whose names begin with "a"
_      |Represents a single character| WHERE ContactName LIKE 'h_t finds hot, hat, and hit
[]     |Represents any single character within the brackets| WHERE CustomerName LIKE '[bsp]r' finds br, sr, and pr
^      |Represents any character not in the brackets| WHERE CustomerName LIKE '[^bsp]r' finds ar, cr, and dr but not br, sr, or pr
-     |Represents a range of characters| WHERE ContactName LIKE '[a-n]%' finds all contacts with a name starting with any character between A and N




Exemples:

Select all records where the first letter of the City is an "a" or a "c" or an "s".

```sql 
SELECT * FROM Customers
WHERE City LIKE '[acs]%';
```

Select all records where the first letter of the City starts with anything from an "a" to an "f".
    
```sql
SELECT * FROM Customers
WHERE City LIKE '[a-f]%';
```

Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".

```sql
SELECT * FROM Customers
WHERE City LIKE '[^acf]%';
```

### SQL IN Operator

The IN operator allows you to specify multiple values in a WHERE clause.

The IN operator is a shorthand for multiple OR conditions.

```sql
SELECT column_name
FROM table_name
WHERE column_name IN (value1, value2, ...);
```

or

```sql
SELECT column_name
FROM table_name
WHERE column_name IN (SELECT STATEMENT);
```

Exemples:

The following SQL statement selects the distinct countries that are suppliers but not customers:

```sql
SELECT DISTINCT Country FROM Suppliers
WHERE Country NOT IN (SELECT Country FROM Customers);
```

### SQL BETWEEN Operator

The BETWEEN Operator selects values within a given range. The values can be numbers, text, or dates.

The BETWEEN operator is inclusive: begin and end values are included.

```sql
SELECT column_name
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

Exemples:

The following SQL statement selects all products with a ProductName BETWEEN Carnarvon Tigers and Mozzarella di Giovanni:

```sql
SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName; --Alphabetical order
```

The following SQL statement selects all orders with an OrderDate between '01-July-1996' and '31-July-1996':

```sql
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';
```

### SQL Aliases
SQL aliases are used to give a table, or a column in a table, a temporary name.

Aliases are often used to make column names more readable.

An alias only exists for the duration of the query.

Alias Column:
```sql
SELECT column_name AS alias_name
FROM table_name;
```

Alias Table:
```sql
SELECT column_name
FROM table_name AS alias_name;
```

Exemples:

```sql
SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers; 
```
Note: It requires double quotation marks or square brackets if the alias name contains spaces.

```sql
SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers; 
```

```sql
 SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID; 
```

Aliases can be useful when:

- There are more than one table involved in a query
- Functions are used in the query
- Column names are big or not very readable
- Two or more columns are combined together

### SQL Joins

A JOIN clause is used to combine rows from two or more tables, based on a related column between them.