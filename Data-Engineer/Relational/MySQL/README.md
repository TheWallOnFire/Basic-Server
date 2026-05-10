# MySQL

## Description
MySQL is one of the world's most popular open-source relational database management systems (RDBMS). It is based on Structured Query Language (SQL) and is known for its reliability, maturity, and widespread use in web applications.

## How it works
MySQL stores data in structured tables consisting of rows and columns. It enforces schemas and relationships (Foreign Keys) between tables to ensure data integrity (ACID compliance in InnoDB). When an application needs data, it sends an SQL query to the MySQL server, which parses, optimizes, and executes the query to return the result set.

## How to code it
Here is a basic example using Python and the `mysql-connector` to connect and query data:

```python
import mysql.connector

# Establish connection
mydb = mysql.connector.connect(
  host="localhost",
  user="yourusername",
  password="yourpassword",
  database="test_db"
)

mycursor = mydb.cursor()

# Execute SQL query
mycursor.execute("SELECT * FROM users")

# Fetch and print results
myresult = mycursor.fetchall()
for x in myresult:
  print(x)
```

## Features it supports
- Relational data structure with strong schemas
- ACID compliance (using the InnoDB storage engine)
- Transactions and rollbacks
- Triggers, Stored Procedures, and Views
- Master-Slave replication for high availability

## Real projects about it
- **Facebook**: Uses heavily modified instances of MySQL.
- **Twitter**: Relies on MySQL for storing massive amounts of tweet data.
- **WordPress**: The underlying database for millions of WordPress websites globally.
