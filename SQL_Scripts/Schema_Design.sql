CREATE DATABASE retail_project;
-- This command tells SQL which database to use
USE retail_project;

-- This command creates the table for customer information
CREATE TABLE dim_Customers (
    CustomerID INT PRIMARY KEY,
    Country VARCHAR(255)
);

-- This command creates the table for product information
CREATE TABLE dim_Products (
    StockCode VARCHAR(255) PRIMARY KEY,
    Description VARCHAR(255),
    UnitPrice DECIMAL(10, 2)
);

-- This command creates the table for transaction information
CREATE TABLE fact_Transactions (
    TransactionID INT PRIMARY KEY,
    InvoiceNo VARCHAR(255),
    CustomerID INT,
    StockCode VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES dim_Customers(CustomerID),
    FOREIGN KEY (StockCode) REFERENCES dim_Products(StockCode)
);