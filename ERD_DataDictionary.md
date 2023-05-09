# ERD and Data Dictionary

## ERD:
![ERD](https://user-images.githubusercontent.com/108771890/235384696-83e63c96-96b6-402a-bccb-b05c73ed6cad.png)



## Data Dictionary:
TABLE: CUSTOMER							
| Column           | Data Type | Size, Precision | Default | PK/FK | Required | Range | Sample Data                         | Notes |
|------------------|-----------|-----------------|---------|-------|----------|-------|-------------------------------------|-------|
| Customer_Number  | number    |                 |         | PK    | Y        |       | 12345                               |       |
| First_Name       | varchar   | 50              |         |       | Y        |       | “Bob”                               |       |
| Last_Name        | varchar   | 50              |         |       | Y        |       | “McKenzie”                          |       |
| DOB              | date      |                 |         |       | Y        |       | 1984-01-01                          |       |
| Shipping_Address | varchar   | 255             |         |       | Y        |       | 1760 Finch Ave, North York, Toronto |       |
| Sales_Rep        | number    |                 |         | FK    |          |       | 12345                               |       |

<br>TABLE: ORDERS								
| Column          | Data Type | Size, Precision | Default | PK/FK | Required | Range | Sample Data | Notes             |
|-----------------|-----------|-----------------|---------|-------|----------|-------|-------------|-------------------|
| Order_Number    | number    |                 |         | PK    | Y        |       | 12345678    |                   |
| Date_Ordered    | date      |                 |         |       | Y        |       | 1984-01-01  |                   |
| Comments        | varchar   | 500             |         |       |          |       |             |                   |
| Store_Number    | number    |                 |         | FK    | Y        |       | 203         |                   |
| Customer_Number | number    |                 |         | FK    |          |       |             | null = non-member |

<br>TABLE: RECEIPT								
| Column         | Data Type | Size, Precision | Default | PK/FK | Required | Range | Sample Data | Notes |
|----------------|-----------|-----------------|---------|-------|----------|-------|-------------|-------|
| Receipt_Number | number    |                 |         | PK    | Y        |       | 123456789   |       |
| Order_Number   | number    |                 |         | FK    | Y        |       | 12345678    |       |
| Payment_Date   | date      |                 |         |       | Y        |       |             |       |
								
<br>TABLE: WAREHOUSE							
| Column           | Data Type | Size, Precision | Default | PK/FK | Required | Range | Sample Data | Notes |
|------------------|-----------|-----------------|---------|-------|----------|-------|-------------|-------|
| Order_Number     | number    |                 |         | PK FK | Y        |       | 12345678    |       |
| Product_ID       | number    |                 |         | PK FK | Y        |       | 1234567     |       |
| Amount_Ordered   | number    |                 |         |       | Y        |       | 8           |       |
| Shipping_Date    | date      |                 |         |       |          |       |  1984-01-01 |       |
| Expected_Arrival | date      |                 |         |       |          |       | 1984-01-01  |       |
| Status           | number    |                 |         |  FK   |          |       | 1           |       |

<br>TABLE: STATUS								
| Column     | Data Type | Size, Precision | Default | PK/FK | Required | Range | Sample Data | Notes |
|------------|-----------|-----------------|---------|-------|----------|-------|-------------|-------|
| Status     | number    |                 |         | PK    | Y        |       | 1           |       |
| Status_Def | varchar   | 10              |         |       | Y        |       | Arrived     |       | 

								
<br>TABLE: PRODUCT							
| Column       | Data Type | Size, Precision | Default | PK/FK | Required | Range         | Sample Data  | Notes |
|--------------|-----------|-----------------|---------|-------|----------|---------------|--------------|-------|
| Product_ID   | number    |                 |         | PK    | Y        |               | 1234567      |       |
| Product_Desc | varchar   | 500             |         |       | Y        |               | 32" monitor  |       |
| UPC          | number    |                 |         |       | Y        |               | 123456789012 |       |
| Quantity     | number    |                 |         |       | Y        |               | 777          |       |
| Cost         | decimal   | 10, 2           |         |       | Y        | 0-99999999.99 |  30.60       |       |
| MSRP         | decimal   | 10, 2           |         |       | Y        | 1-99999999.99 |  59.99       |       | 

<br>TABLE: STORE							
| Column       | Data Type | Size, Precision | Default | PK/FK | Required | Range | Sample Data                          | Notes |
|--------------|-----------|-----------------|---------|-------|----------|-------|--------------------------------------|-------|
| Store_Number | number    |                 |         | PK    | Y        |       | 203                                  |       |
| RegionID     | number    |                 |         | FK    | Y        |       | 9                                    |       |
| Address      | varchar   | 255             |         |       | Y        |       | 123 Bestbuy Ave, North York, Toronto |       |

<br>TABLE: REGION								
| Column          | Data Type | Size, Precision | Default | PK/FK | Required | Range | Sample Data     | Notes |
|-----------------|-----------|-----------------|---------|-------|----------|-------|-----------------|-------|
| RegionID        | number    |                 |         | PK    | Y        |       | 9               |       |
| Region_Desc     | varchar   | 50              |         |       | Y        |       | North America   |       |
| Country         | varchar   | 50              |         |       | Y        |       | USA             |       |
								
<br>TABLE: EMPLOYEE							
| Column          | Data Type | Size, Precision | Default | PK/FK | Required | Range | Sample Data     | Notes |
|-----------------|-----------|-----------------|---------|-------|----------|-------|-----------------|-------|
| Employee_Number | number    |                 |         | PK    | Y        |       | 1234            |       |
| Store_Number    | number    |                 |         | FK    | Y        |       | 203             |       |
| First_Name      | varchar   | 50              |         |       | Y        |       | “Bob”           |       |
| Last_Name       | varchar   | 50              |         |       | Y        |       | “McKenzie”      |       |
| Role            | varchar   | 50              |         |       | Y        |       | Sales executive |       |
| Employment_Date | date      |                 |         |       | Y        |       | 2020-01-01      |       |
| Reports_To      | number    |                 |         |  FK   | Y        |       | 1234            |       | 

