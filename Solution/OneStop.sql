USE OneStopdB

GO

BULK INSERT [dbo].[customer]
FROM 'C:\Users\USER\Documents\database 1\customer_df.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n' );

BULK INSERT [dbo].[order]
FROM 'C:\Users\USER\Documents\database 1\order_df.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n' );

BULK INSERT [dbo].[order_item]
FROM 'C:\Users\USER\Documents\database 1\order_item_df.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n' );

BULK INSERT [dbo].[product]
FROM 'C:\Users\USER\Documents\database 1\product_df.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n' );

BULK INSERT [dbo].[product_category]
FROM 'C:\Users\USER\Documents\database 1\product_category_df.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n' );

BULK INSERT [dbo].[product_subcategory]
FROM 'C:\Users\USER\Documents\database 1\product_subcategory_df.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n' );

BULK INSERT [dbo].[store]
FROM 'C:\Users\USER\Documents\database 1\store_df.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n' );