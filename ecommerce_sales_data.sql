-- Top revenue-contributing products
SELECT
    product_name AS product,
    SUM(sales) AS total_sales
FROM ecommerce_sales_data
WHERE order_date BETWEEN '2022-01-01' AND '2024-12-31'
GROUP BY product_name
ORDER BY total_sales DESC;

-- High-volume but low-profit products
SELECT
    product_name AS product,
    SUM(quantity) AS total_quantity,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
WHERE order_date BETWEEN '2022-01-01' AND '2024-12-31'
GROUP BY product_name
ORDER BY total_profit ASC;
-- Average margin by product category
SELECT
    category,
    AVG(margin_rate) AS average_margin_rate
FROM ecommerce_sales_data
GROUP BY category
ORDER BY average_margin_rate DESC;

-- Profit trend by category and order_date
SELECT
    category,
    order_date,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY category, order_date
ORDER BY total_profit DESC
LIMIT 10;

-- Most profitable regions
SELECT
    region,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY region
ORDER BY total_profit DESC;

-- High-volume but low-profit regions
SELECT
    region,
    SUM(quantity) AS total_quantity,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY region
ORDER BY total_profit ASC;

-- Sales evolution by product and order_date
SELECT
    product_name AS product,
    order_date,
    SUM(sales) AS total_sales
FROM ecommerce_sales_data
GROUP BY product_name, order_date
ORDER BY total_sales DESC
LIMIT 10;

-- Regional performance by category
SELECT
    category,
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ecommerce_sales_data
GROUP BY category, region;

-- Star products (high sales & profitable)
SELECT
    product_name AS product,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(margin_rate) AS average_margin_rate
FROM ecommerce_sales_data
GROUP BY product_name
HAVING SUM(profit) > 0
ORDER BY total_sales DESC, total_profit DESC;