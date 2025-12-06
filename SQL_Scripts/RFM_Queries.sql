-- This query calculates Recency, Frequency, and Monetary values for each customer.
USE retail_project;

-- We are creating a temporary table named 'rfm_values' to store our results.
CREATE TABLE rfm_values AS
WITH RFM_Base AS (
    -- First, calculate the total price for each item in a transaction
    SELECT 
        t.CustomerID,
        t.InvoiceDate,
        t.InvoiceNo,
        (t.Quantity * p.UnitPrice) AS MonetaryValue
    FROM 
        fact_Transactions t
    JOIN 
        dim_Products p ON t.StockCode = p.StockCode
),
-- Set a snapshot date which is one day after the last transaction
SnapshotDate AS (
    SELECT DATE_ADD(MAX(InvoiceDate), INTERVAL 1 DAY) AS max_date 
    FROM RFM_Base
)
-- Now, calculate R, F, and M for each customer
SELECT 
    CustomerID,
    -- Recency: Days since last purchase from the snapshot date
    DATEDIFF((SELECT max_date FROM SnapshotDate), MAX(InvoiceDate)) AS Recency,
    -- Frequency: Total number of unique invoices
    COUNT(DISTINCT InvoiceNo) AS Frequency,
    -- Monetary: Total money spent by the customer
    SUM(MonetaryValue) AS Monetary
FROM 
    RFM_Base
GROUP BY 
    CustomerID;

-- Finally, let's look at the first 10 rows of our new table
SELECT * FROM rfm_values LIMIT 10;