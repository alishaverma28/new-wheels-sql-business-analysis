/*

-----------------------------------------------------------------------------------------------------------------------------------
													    Guidelines
-----------------------------------------------------------------------------------------------------------------------------------

The provided document is a guide for the project. Follow the instructions and take the necessary steps to finish
the project in the SQL file			

-----------------------------------------------------------------------------------------------------------------------------------
                                                         Queries
                                               
-----------------------------------------------------------------------------------------------------------------------------------*/
  use new_wheels;
  
/*-- QUESTIONS RELATED TO CUSTOMERS
     [Q1] What is the distribution of customers across states?
     Hint: For each state, count the number of customers.*/

select * from customer_t;
select state,count(customer_id)
from customer_t
group by state
order by count(customer_id)desc;  -- 49 rows

-- Insight: 
-- California and Texas emerge as the strongest markets with the highest customer concentration (97 customers each). 
-- These regions should be prioritized for retention strategies and service-quality improvements, 
-- especially given the overall decline in customer satisfaction.

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q2] What is the average rating in each quarter?
-- Very Bad is 1, Bad is 2, Okay is 3, Good is 4, Very Good is 5. */

-- soln:
select * from order_t;
select quarter_number,
avg( 
case
when customer_feedback='Very Bad' then 1
when customer_feedback='Bad' then 2
when customer_feedback='Okay' then 3
when customer_feedback='Good' then 4
when customer_feedback='Very Good' then 5
else Null
end ) as Avg_Review
from order_t
group by quarter_number
order by quarter_number;

-- Insight: 
-- There is a clear declining trend in customer satisfaction across quarters, with Q1 being the strongest and Q4 the weakest. 
-- This signals a potential operational or service issue that needs investigation.



-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q3] Are customers getting more dissatisfied over time?

Hint: Need the percentage of different types of customer feedback in each quarter. 
	  determine the number of customer feedback in each category as well as the total number of customer feedback in each quarter.
	  And find out the percentage of different types of customer feedback in each quarter.
      Eg: (total number of very good feedback/total customer feedback)* 100 gives you the percentage of very good feedback. */
      

-- sol
-- Step 1: Count of Feedback in Each Category per Quarter
SELECT 
    quarter_number,customer_feedback,COUNT(*) AS feedback_count
FROM order_t
GROUP BY quarter_number, customer_feedback
ORDER BY quarter_number, customer_feedback;

-- Step 2: Total Feedback per Quarter
SELECT 
    quarter_number,COUNT(*) AS total_feedback
FROM order_t
GROUP BY quarter_number
ORDER BY quarter_number;

-- Step 3: Calculate Percentage (Join Method)
SELECT 
    a.quarter_number,
    a.customer_feedback,
    a.feedback_count,
    b.total_feedback,
    ROUND((a.feedback_count * 100.0 / b.total_feedback), 2) AS percentage
FROM
(SELECT quarter_number,customer_feedback,COUNT(*) AS feedback_count
    FROM order_t
    GROUP BY quarter_number, customer_feedback
) a
JOIN(
    SELECT quarter_number,COUNT(*) AS total_feedback
    FROM order_t
    GROUP BY quarter_number
) b
ON a.quarter_number = b.quarter_number
ORDER BY a.quarter_number, a.customer_feedback;

-- Insights:
-- I calculated feedback distribution per quarter and derived percentage contribution of each feedback type. 
-- By analyzing the trend of “Bad” and “Very Bad” categories, 
-- we can determine whether customer dissatisfaction is increasing over time.



-- ---------------------------------------------------------------------------------------------------------------------------------

/*[Q4] Which are the top 5 vehicle makers preferred by the customer.

Hint: For each vehicle make what is the count of the customers.*/

-- soln:
select p.vehicle_maker , count(c.customer_id)as count_customer ,
round
(
	count(o.customer_id)*100/sum(count(o.customer_id)) over(),2
) as share_percentage 
from customer_t c
join 
order_t o on o.customer_id= c.customer_id
join
product_t p on
p.product_id = o.product_id
group by p.vehicle_maker
order by count(customer_id) desc
limit 5;

-- insight:
-- The vehicle market appears fragmented, with Chevrolet leading at 8.3% market share. 
-- The narrow gap between top brands indicates intense competition. To increase dominance, 
-- brands may need targeted marketing and pricing strategies to capture additional share.
-------------------------------------------------------------------------------------------------

/*[Q5] What is the most preferred vehicle make in each state? */
SELECT c.state,p.vehicle_maker,COUNT(*) AS lead_count
FROM customer_t c
JOIN order_t o 
    ON o.customer_id = c.customer_id
JOIN product_t p 
    ON p.product_id = o.product_id
GROUP BY c.state, p.vehicle_maker
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*) FROM customer_t c2
    JOIN order_t o2 
        ON o2.customer_id = c2.customer_id
    JOIN product_t p2 
        ON p2.product_id = o2.product_id
    WHERE c2.state = c.state
    GROUP BY p2.vehicle_maker 
);
-- Insight:
-- “Chevrolet emerges as the most preferred vehicle maker across multiple states, 
-- especially Texas and Ohio, indicating strong brand penetration. However, markets like California 
-- show high competition with multiple brands tied for preference, 
-- suggesting the need for differentiated regional marketing strategies.”

-- ---------------------------------------------------------------------------------------------------------------------------------

/*QUESTIONS RELATED TO REVENUE and ORDERS 

-- [Q6] What is the trend of number of orders by quarters?

Hint: Count the number of orders for each quarter.*/

select quarter_number,count(order_id) from order_t
group by quarter_number
order by quarter_number;
-- insight:
-- Orders peak in Quarter 1 and show a downward trend in later quarters, 
-- indicating possible seasonality in customer purchasing behavior.

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q7] What is the quarter over quarter % change in revenue? 

Hint: Quarter over Quarter percentage change in revenue means 
what is the change in revenue from the subsequent quarter to the previous quarter in percentage.
      
*/

with revenue_cte as
(select quarter_number,sum(vehicle_price) as total_revenue from order_t
group by quarter_number
order by quarter_number)
select r1.quarter_number,r1.total_revenue,
round((r1.total_revenue-r2.total_revenue)/r2.total_revenue*100,2)as qoq_revenue_change
from revenue_cte r1
left join revenue_cte r2
    on r1.quarter_number = r2.quarter_number + 1 -- current = previous + 1
-- (Match each quarter with the quarter that came immediately before it.”)
order by r1.quarter_number;

-- Insight:
-- The business experienced continuous revenue contraction across all quarters, with an overall declining trend. 
-- This suggests weakening demand or potential seasonal slowdown toward year-end.
      
      

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q8] What is the trend of revenue and orders by quarters?

Hint: Find out the sum of revenue and count the number of orders for each quarter.*/

select quarter_number,sum(vehicle_price) as revenue ,count(order_id) 
from order_t
group by quarter_number
order by quarter_number ;
-- Insights:
-- Quarter 1 recorded the highest revenue (26.5M) and order volume (310).
--  Both revenue and orders declined consistently in subsequent quarters, 
--  indicating a steady reduction in sales activity throughout the year. 
-- Since revenue and order volume decrease proportionally, 
-- the decline appears to be volume-driven rather than price-driven


/* finding revenue_drop and order_drop percentage*/
select 
    round(
        (min(vehicle_price_sum) - max(vehicle_price_sum)) 
        / max(vehicle_price_sum) * 100,2) as revenue_drop,
        round(
				(min(total_order)-max(total_order))/ max(total_order)*100,2
			) as order_drop
from (
    select quarter_number, sum(vehicle_price) as vehicle_price_sum,count(order_id) as total_order
    from order_t
    group by quarter_number
) t;

-- Insight:
-- The business experienced a continuous contraction across all quarters, 
-- with revenue declining by over 40% from Q1 to Q4 and order volume decreasing by approximately 36%. 
-- This parallel decline suggests weakening demand rather than changes in pricing strategy

-- ---------------------------------------------------------------------------------------------------------------------------------

/* QUESTIONS RELATED TO SHIPPING 
    [Q9] What is the average discount offered for different types of credit cards?

Hint: Find out the average of discount for each credit card type.*/

select c.credit_card_type,avg(o.discount) as avg_discount
from customer_t c
join order_t o on
o.customer_id=c.customer_id
group by c.credit_card_type
order by avg_discount desc;

-- Insight:
-- The Laser credit card type provides the highest average discount (64.38%),
--  while Diners Club International offers the lowest (58.40%). 
-- However, the overall variation across card types is relatively small, 
-- suggesting a fairly uniform discount policy across payment methods.


-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q10] What is the average time taken to ship the placed orders for each quarters?
	Hint: Use the dateiff function to find the difference between the ship date and the order date.
*/

select quarter_number,avg(datediff(ship_date,order_date)) as avg_shipping_days
from order_t
group by quarter_number
order by quarter_number;

-- Insight:
-- Quarter 4 records the highest average shipping time (175 days), 
-- which may indicate supply chain bottlenecks or higher demand pressure. 
-- The increased delivery duration could potentially impact customer satisfaction and future sales performance.

-- Check If Longer Shipping Orders Have Lower Revenue
select 
    case 
        when datediff(ship_date, order_date) <= 60 then 'Fast Shipping'
        when datediff(ship_date, order_date) <= 120 then 'Medium Shipping'
        else 'Slow Shipping'
    end as shipping_category,
    avg(vehicle_price) as avg_order_value,
    count(order_id) as total_orders
from order_t
group by shipping_category;
-- Insight:
-- The decline in average order value and lower order volume in the slow-shipping category 
-- indicates a potential negative relationship between delivery delays and revenue generation, 
-- suggesting that operational efficiency could directly impact sales performance.

-- --------------------------------------------------------Done----------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------



