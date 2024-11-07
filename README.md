*This project aims to migrate OneStop's existing transaction data from Excel spreadsheets to a SQL database.*

# **Use Case: Database Migration for OneStop Store**

**Overview:**
---
OneStop Store, a retail chain, was managing its inventory and sales data in multiple Excel (XLSX) spreadsheets. This manual process was time-consuming, prone to errors, and hindered efficient data analysis and reporting. To streamline operations and improve data accessibility, the store decided to migrate its data to a structured SQL database.

**Objectives**
- Improved Data Management: Enhance the ability to manage and query large datasets efficiently.
- Scalability: Ensure the database can handle increasing amounts of data.
- Performance: Improve query performance and data retrieval speed.
- Automation: Automate the migration process to minimize errors and save time.

**Methodology**
The database migration involves several key steps:

1. **Normalize XLSX Data:**

Normalized the data using Excel into 3NF.
<b><u>The original table</u></b>

![Original table](<Images/Screenshot (278).png>)

<b><u>The normalized table</u></b>

![Normalized table](<Images/Screenshot (280).png>)

2. **Read XLSX Files:** 
Use Python's pandas library to read the XLSX files, parsing the data into DataFrames.
```python

# Read all sheets into separate DataFrames with custom names
dataframes = {}
for sheet_name in sheet_names:
    df = pd.read_excel(file_path, sheet_name=sheet_name)
    dataframes[sheet_name] = df

# Access DataFrames separately
customer_df = dataframes["Customer"]
store_df = dataframes["Store"]
product_df = dataframes["Product"]
product_subcategory_df = dataframes["Product Subcategory"]
product_category_df = dataframes["Product Category"]
order_df = dataframes["Order"]
order_item_df = dataframes["Order Item"]

```

3. **Clean and Transform Data:** 
Clean the data by handling missing values, inconsistencies, and formatting issues. Transform the data into a suitable format for SQL insertion. Removing redundant data.
```python
customer_df.drop(['state_code'], axis=1, inplace= True)
```

![Cleaning data](<Images/Screenshot (276).png>)


4. **Database Creation and Connection:**
- Set up the SQL database (e.g., MySQL, PostgreSQL).
```python
connection_string = f'mssql+pyodbc://@{server}/{database}?trusted_connection=yes&driver={driver.replace(" ", "+")}'
engine = create_engine(connection_string)
```
- Create database

![Database creation](<Images/Screenshot (282).png>)

- Bulk insert data from the saved csvs

```sql
BULK INSERT [dbo].[customer]
FROM 'C:\Users\USER\Documents\database 1\customer_df.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n' );
```
- Query the data
```sql
SELECT TOP 10 *
FROM customer
```

![sql query](<Images/Screenshot (285).png>)

**Conclusion**
The migration from Excel to SQL resulted in improved data management, scalability, and performance for OneStop store. By automating the process with Python, the migration was efficient and error-free, ensuring data integrity and accuracy. Post-migration analysis showed significant improvements in query performance and overall data handling capabilities.

**LIBRARIES AND VERSION**
---
- numpy: 1.26.4
- pandas: 2.2.2
- matplotlib: 3.9.1.post1
- seaborn: 0.13.2
- sqlalchemy: 2.0.30
- re: 2.2.1
- pyodbc