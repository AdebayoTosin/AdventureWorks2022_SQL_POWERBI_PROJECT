--Recently,Frequency and Monitary ANALYSIS
WITH recency AS (
    SELECT 
        CustomerID, 
        DATEDIFF(day, MAX(OrderDate), '2014-06-03') AS recency,
        MAX(OrderDate) AS last_order_date
    FROM 
        Sales.SalesOrderHeader
    GROUP BY 
        CustomerID
),
frequency AS (
    SELECT 
        CustomerID, 
        COUNT(SalesOrderID) AS frequency
    FROM 
        Sales.SalesOrderHeader
    GROUP BY 
        CustomerID
),
monetary AS (
    SELECT 
        CustomerID,
        sum(TotalDue) AS average_monetary_value
    FROM 
        Sales.SalesOrderHeader
    GROUP BY 
        CustomerID
)
SELECT 
    r.CustomerID, 
    r.recency, 
    r.last_order_date, 
    f.frequency, 
    m.average_monetary_value
FROM 
    recency r
JOIN 
    frequency f ON r.CustomerID = f.CustomerID
JOIN 
    monetary m ON r.CustomerID = m.CustomerID;


--RETENTION ANALYSIS
--Identify customers who haven't made a purchase in the last 6 months.

SELECT CustomerID
FROM sales.SalesOrderHeader
GROUP BY CustomerID
HAVING max(OrderDate) < DATEADD(month,-6, '2014-06-03');

--Detect customers with declining purchase frequency or monetary value.

SELECT
	CustomerID,
	SUM(case when orderyear=2011 then ordercount  end)as ordercount_2011,
	SUM(case when orderyear=2012 then ordercount end) as ordercount_2012,
	SUM(case when orderyear=2013 then ordercount end) as ordercount_2013
	
FROM(
	select customerID,
		year(orderdate) as orderyear,
		count(salesorderID) as ordercount
	from sales.SalesOrderHeader
	group by CustomerID,year(orderdate)
	) as yearly_order
GROUP BY
	CustomerID
HAVING
	SUM(case when orderyear=2011 then ordercount end)>SUM(case when orderyear=2013 then ordercount end)
		
ORDER BY 
	CustomerID
--Propose personalized offers or interventions for at-risk customers.


--Use association rules to identify products frequently purchased together.
SELECT 
    p1.ProductID AS ProductA, 
    p2.ProductID AS ProductB, 
    COUNT(*) AS TimesPurchasedTogether
FROM 
    Sales.SalesOrderDetail p1
JOIN 
    Sales.SalesOrderDetail p2 
    ON p1.SalesOrderID = p2.SalesOrderID 
    AND p1.ProductID < p2.ProductID
GROUP BY 
    p1.ProductID, 
    p2.ProductID
ORDER BY 
    TimesPurchasedTogether DESC;
--Recommend complementary products based on previous purchases.

--Identify customers with recent high-value purchases for potential upsell opportunities

SELECT 
	CustomerID,sum(totaldue) totaldue
FROM 
	sales.SalesOrderHeader
WHERE 
	OrderDate >= DATEADD(month,-6, '2014-06-03')
GROUP BY 
	CustomerID
HAVING 
	sum(totaldue) >=3915
ORDER BY 
	sum(totaldue) desc

--Determine which customer segments to target for specific campaigns.


--Analyze the best timing for sending promotional offers based on purchase recency.

WITH 
  -- Calculate recency and frequency
  CustomerAnalysis AS (
    SELECT 
      CustomerID,
      DATEDIFF(DAY, MAX(OrderDate), '2014-06-03') AS Recency,
      COUNT(SalesOrderID) AS Frequency
    FROM 
      sales.SalesOrderHeader
 
    GROUP BY 
      CustomerID
  ),
  
  -- Determine optimal timing for promotional offers
  PromotionalTiming AS (
    SELECT 
      CustomerID,
      Recency,
      Frequency,
      CASE 
        WHEN Recency <= 30 THEN '0-30 days'
        WHEN Recency <= 90 THEN '31-90 days'
        WHEN Recency <= 180 THEN '91-180 days'
        WHEN Recency <= 365 THEN '181-365 days'
        ELSE '366+ days'
      END AS RecencySegment,
      CASE 
        WHEN Frequency >= 20 THEN 'High'
        WHEN Frequency >= 10 THEN 'Medium'
        ELSE 'Low'
      END AS FrequencySegment,
      CASE 
        WHEN Recency <= 90 AND Frequency >= 10 THEN 'Immediate'
        WHEN Recency <= 180 AND Frequency >= 5 THEN 'Short-term'
        WHEN Recency <= 365 AND Frequency >= 2 THEN 'Medium-term'
        ELSE 'Long-term'
      END AS BestTimeToSendOffers
    FROM 
      CustomerAnalysis
  )

SELECT * FROM PromotionalTiming



--Identify products popular among high-value customers

WITH HVC AS (
  SELECT CustomerID, SUM(TotalDue) TotalDue, SalesOrderID
  FROM sales.SalesOrderHeader
  WHERE OrderDate >= DATEADD(MONTH, -6, '2014-06-03')
  GROUP BY CustomerID, SalesOrderID
  HAVING SUM(TotalDue) >= 3915
  
),
ProductID AS (
  SELECT SalesOrderID, ProductID, COUNT(ProductID) AS Num_Product
  FROM sales.SalesOrderDetail
  GROUP BY SalesOrderID, ProductID
)
SELECT P.ProductID, SUM(P.Num_Product) AS Total_Count
FROM ProductID P
JOIN HVC H ON P.SalesOrderID = H.SalesOrderID
GROUP BY P.ProductID
order by SUM(P.Num_Product) desc



--Analyze product categories that consistently drive high sales.

select sod.ProductID,sum(soh.TotalDue) productrevenue
from Sales.SalesOrderDetail sod
join sales.SalesOrderHeader soh on sod.SalesOrderID =soh.SalesOrderID
group by sod.ProductID
order by productrevenue desc

--Calculate the average monetary value of purchases per customer.

select CustomerID, AVG(totaldue) acerage_monetary_value
from sales.SalesOrderHeader
group by CustomerID
order by acerage_monetary_value desc


--Determine how often customers make repeat purchases.

SELECT CustomerID, count(salesorderID) as frequency 
FROM sales.SalesOrderHeader
GROUP BY CustomerID


SELECT 
  CustomerID, 
  COUNT(SalesOrderID) AS Frequency, case when count(SalesOrderID) =1 then null else 
  DATEDIFF(day,Min(OrderDate), Max(OrderDate)) / (COUNT(SalesOrderID) - 1) end AS AverageInterval
FROM 
  sales.SalesOrderHeader
GROUP BY 
  CustomerID
HAVING 
  COUNT(SalesOrderID) > 1
ORDER BY 
  AverageInterval DESC;


 --Estimate the potential future revenue from each customer.
 WITH AverageMonetaryValue AS (
    SELECT 
        CustomerID, 
        SUM(TotalDue) AS TOTAL_monetary_value
    FROM 
        Sales.SalesOrderHeader
    GROUP BY 
        CustomerID
),
PurchaseFrequency AS (
    SELECT 
        CustomerID, 
        COUNT(SalesOrderID) AS purchase_frequency
    FROM 
        Sales.SalesOrderHeader
    GROUP BY 
        CustomerID
),
Recency AS (
    SELECT 
        CustomerID, 
        DATEDIFF(day, MAX(OrderDate), '2014-06-03') AS days_since_last_purchase
    FROM 
        Sales.SalesOrderHeader
    GROUP BY 
        CustomerID
)
SELECT 
    amv.CustomerID, 
    amv.TOTAL_monetary_value, 
    pf.purchase_frequency,
    r.days_since_last_purchase,
    (amv.TOTAL_monetary_value * pf.purchase_frequency) AS estimated_future_revenue
FROM 
    AverageMonetaryValue amv
JOIN 
    PurchaseFrequency pf ON amv.CustomerID = pf.CustomerID
JOIN 
    Recency r ON amv.CustomerID = r.CustomerID
ORDER BY 
    estimated_future_revenue DESC;


	
	