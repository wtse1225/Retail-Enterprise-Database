# Retail-Enterprise-Database
Members: Wai Hing William Tse, Alex Choi, Mehmet Kuzu

### Introduction
The industry that we will be making a database for is for the retail industry. The retail industry uses databases to keep check of inventory, item codes, shipment dates, payments, etc, and given that most people have worked in the retail sector before, this industry seems to be the perfect fit for having a database management system in place. Not only for the customer service side of the industry as well, as management also needs to keep track of employees, salaries, and other relevant information containing to the company.

### Problem
A database system for the retail sector would require the database to have every item code that the store sells, so when scanned, the system can tell that unique barcode that item is related to. The system will also have to keep in track of MSRP and actual cost of buying the unit (commercial cost of buying unit not consumer costs), how many are ordered, how many are in stock. The database can also keep track of the stores expenditures, profit, losses, customers per day, and other metrics.
  
### Solution
The solution will be a database that holds all these relevant information and then sorted into logical groups in the database and then depending on what information is needed, the groups can be connected to each other by primary/foreign keys. The database will also be able to create views that can be useful for staff, such as stock, item ids, profit margins, etc.

### Requirements
1.	UPC (Item id)
2.	Stock/Inventory
3.	Cost (MSRP)
4.	Cost (buyprice)
5.	Total Sales
6.	Date
7.	Employee Id
8.	Employee Name
9.	Branch Number
10.	Role
11.	Total Profits/Total Losses

### ERD
![ERD](https://user-images.githubusercontent.com/108771890/235384696-83e63c96-96b6-402a-bccb-b05c73ed6cad.png)
