/* Management view: This report consolidates monthly gross profit and ROS across stores in different regions in descending order, 
   which allows the management to analyze the monthly performance on each region that has generated sales and re-adjust business decision based on ROS */
CREATE OR REPLACE VIEW monthend_region_gross_profit AS
    SELECT  UNIQUE r.regionid, r.region_desc, r.country,
    SUM (p.msrp * w.amount_ordered) AS revenue,
    SUM (p.cost * w.amount_ordered) AS total_cost, SUM ((p.msrp * w.amount_ordered) - (p.cost* w.amount_ordered)) AS gross_profit, 
    ROUND (SUM ((p.msrp * w.amount_ordered) - (p.cost* w.amount_ordered))/ SUM (p.msrp * w.amount_ordered), 2) AS return_on_sales,
    to_date('2022-01-31', 'yyyy-mm-dd') AS monthend  
        
    FROM region r INNER JOIN store s ON r.regionid = s.regionid
    INNER JOIN orders o ON s.store_number = o.store_number
    INNER JOIN warehouse w ON o.order_number = w.order_number
    INNER JOIN product p ON w.product_id = p.product_id
    
    GROUP BY r.regionid, r.region_desc, r.country, to_date('2022-01-31', 'yyyy-mm-dd')    
    ORDER BY gross_profit DESC;


/* Management view: This report reflects monthly gross profit and ROS for each store that has generated sales in descending order,
   management may analyze sales from each store and re-adjust store location*/    
CREATE OR REPLACE VIEW monthend_store_performance AS
    SELECT o.store_number, s.address, r.region_desc, r.country, s.regionid,  
    COUNT(UNIQUE w.order_number) AS total_orders, SUM (p.msrp * w.amount_ordered) AS total_sales, to_date('2022-01-31', 'yyyy-mm-dd') AS monthend
    
    FROM warehouse w INNER JOIN product p On w.product_id = p.product_id
    INNER JOIN orders o ON w.order_number = o.order_number
    INNER JOIN store s ON o.store_number = s.store_number
    INNER JOIN region r ON s.regionid = r.regionid
    
    GROUP BY o.store_number, s.regionid, s.address, r.region_desc, r.country, to_date('2022-01-31', 'yyyy-mm-dd')    
    ORDER BY total_sales DESC;
    
    
    
/* District manager view: This report reflects the monthly employee performance among all stores and is an indicator of staff promotion*/
CREATE OR REPLACE VIEW monthend_employee_performence AS
    SELECT c.sales_rep, e.first_name ||' '|| e.last_name AS name, e.role, e.store_number, e.reports_to, e.employment_date, 
    COUNT(UNIQUE w.order_number) AS closed_deals, SUM (p.msrp * w.amount_ordered) AS total_sales, to_date('2022-01-31', 'yyyy-mm-dd') AS monthend
    
    FROM customer c INNER JOIN employee e ON c.sales_rep = e.employee_number
    INNER JOIN orders o ON c.customer_number = o.customer_number
    INNER JOIN warehouse w ON o.order_number = w.order_number
    INNER JOIN product p ON w.product_id = p.product_id
    
    GROUP BY c.sales_rep, e.first_name ||' '|| e.last_name, e.role, e.store_number, e.reports_to, 
    e.employment_date, to_date('2022-01-31', 'yyyy-mm-dd')     
    ORDER BY total_sales DESC;   
    
    
/* Store manager view: This report reflects the monthly best selling items across all stores and is able to show the trend of customer purchasing inclination, thus helping 
   the store manager on restocking decision*/
CREATE OR REPLACE VIEW monthend_most_sales_item AS
    SELECT p.product_id, p.product_desc, p.msrp, p.cost, SUM(w.amount_ordered) As  total_quantity_sold, 
    ROUND((p.msrp - p.cost) / (p.msrp), 2) AS return_on_sales, to_date('2022-01-31', 'yyyy-mm-dd') AS monthend
    
    FROM product p INNER JOIN warehouse w ON p.product_id = w.product_id    
    GROUP BY p.product_id, p.product_desc, p.msrp, p.cost, to_date('2022-01-31', 'yyyy-mm-dd')    
    ORDER BY total_quantity_sold DESC;
