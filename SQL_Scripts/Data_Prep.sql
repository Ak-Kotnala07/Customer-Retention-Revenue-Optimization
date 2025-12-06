USE retail_project;

-- Step 1: Increase the max length for GROUP_CONCAT for this session only.
-- We're setting it to 1 million bytes, which should be more than enough.
SET SESSION group_concat_max_len = 1000000;

-- Step 2: Drop the old, incomplete table if it exists, so we can start fresh.
DROP TABLE IF EXISTS customer_product_text;

-- Step 3: Re-run the original query to create the complete table.
CREATE TABLE customer_product_text AS
SELECT
    t.CustomerID,
    GROUP_CONCAT(p.Description SEPARATOR ' ') AS AllDescriptions
FROM
    fact_Transactions t
JOIN
    dim_Products p ON t.StockCode = p.StockCode
GROUP BY
    t.CustomerID;

-- Step 4: Verify the new table.
SELECT * FROM customer_product_text LIMIT 5;