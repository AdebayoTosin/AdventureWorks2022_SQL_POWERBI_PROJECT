# AdventureWorks2022_SQL_POWERBI_PROJECT

 ## PROJECT TITLE DETAILS:
   *  Title: AdventureWork2022 project using MySQL and PowerBI
   *  Author: Tosin Emmanuel
   *  Date: 2024-09-16

## Project Description
The aim of this project is to gain insights that address various business challenges, including customer segmentation, retention, cross-selling, upselling, marketing campaign optimization, inventory management, and customer lifetime value (CLV) estimation. This will be achieved using SQL and Power BI to explore and analyze the AdventureWorks2022 dataset.

### DISCLAIMER: This is not a real company as we know that adventure works database is compiled by Microsoft for learning purposes.

## Problem Statement
This is an Inventory Management analysis done with SQL and PowerBI, I analyzed Inventory data, production data and Sales data from the AdventureWorks 2019 database.
Problem Statement: The goal of the analysis is to:

*  Customer Segmentation:
    How can we segment our customer base to better understand their behavior and needs?
*  Customer Retention:
    How can we identify customers who are at risk of churning and take proactive measures to retain them?
*  Cross-Selling and Upselling:
    How can we identify opportunities for cross-selling or upselling to our existing customer base?
*  Marketing Campaign Optimization:
    How can we optimize our marketing campaigns to target the right customers at the right time?
*  Inventory Management:
    How can we manage our inventory efficiently based on customer demand and preferences?
*  Customer Lifetime Value (CLV) Estimation:
    How can we predict the potential future value of our customers?

To answer solve the Above problems I have to write the queries that answer the following questions;
   1. RFM Analysis for Customer Segmentation
      *	Recency: Calculate the number of days since the customer's last purchase.
      *	Frequency: Count the total number of purchases made by each customer.
      *	Monetary: Calculate the total monetary value of purchases made by each customer.
2. Customer Retention Analysis
      *	Churn Identification: Identify customers who haven't made a purchase in the last 6 months.
      *	Purchase Frequency Decline: Detect customers with declining purchase frequency or monetary value.
      *	Personalized Interventions: Propose personalized offers or interventions for at-risk customers.
4. Cross-Selling and Upselling Opportunities
      *	Frequent Product Pairs: Use association rules to identify products frequently purchased together.
      *	Complementary Product Recommendations: Recommend complementary products based on previous purchases.
      *	High-Value Customers: Identify customers with recent high-value purchases for potential upsell opportunities.
5. Marketing Campaign Optimization
      *	Segment Prioritization: Determine which customer segments to target for specific campaigns.
      *	Optimal Timing: Analyze the best timing for sending promotional offers based on purchase recency.
      *	Effective Channels: Identify the most effective channels for different customer segments.
6. Inventory Management
      *	Popular Products: Identify products popular among high-value customers.
      *	Stock Availability: Ensure sufficient stock for high-demand products.
      *	High-Sales Product Categories: Analyze product categories that consistently drive high sales.
7. Customer Lifetime Value (CLV) Estimation
      *	Average Purchase Value: Calculate the average monetary value of purchases per customer.
      *	Repeat Purchase Frequency: Determine how often customers make repeat purchases.
      *	CLV Prediction: Estimate the potential future revenue from each customer



  ## Data source
  The data used for this work is obtained from the AdventureWorks 2019 database 2019. I studied the Schema, Objects related to the Schema, data dictionary and found the right tables for the analysis.

You can find a link to get started with installation and restoration of the database to your local machine. [here](https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak)

## Skills Demonstrated  

* SQL (Structured Query Language)
   * SELECT
   * Tempoary Tables
   * Creating subqueries
   * Aliasing
  
*  PowerBI concepts like:
 * Importing Direct queries from SQL into PowerBI
 * Creating of dashboards.

## SQL Scripting
TO Answer the Problem statementt, i have to generate 12 different SQL querires. You can see the full query script [here](https://github.com/AdebayoTosin/AdventureWorks2022_SQL_POWERBI_PROJECT/blob/main/SQLQuery1.sql)
![image](https://github.com/AdebayoTosin/AdventureWorks2022_SQL_POWERBI_PROJECT/blob/main/Screenshot%202024-09-16%20025817.png)

## Data Visualization

The report consists different charts that Answer the questions above, it consist of two different pages. You can have acess to the dashboard [here](https://github.com/AdebayoTosin/AdventureWorks2022_SQL_POWERBI_PROJECT/blob/main/Adventurework2022_project.pbix)

![imge](https://github.com/AdebayoTosin/AdventureWorks2022_SQL_POWERBI_PROJECT/blob/main/Screenshot%202024-09-16%20025259.png)

![image](https://github.com/AdebayoTosin/AdventureWorks2022_SQL_POWERBI_PROJECT/blob/main/Screenshot%202024-09-16%20025345.png)

## Insights And Recommendations

* Revenue and Customer Overview 
   * The total revenue from purchases stands at **$123 million**, generated by **31,000 customers**.
     However, there are **7,398 inactive customers**, which indicates a significant opportunity for re-engagement.  

     Recommendation: Implement targeted reactivation campaigns for inactive customers, offering special promotions or
     personalized offers to bring them back into the purchasing cycle. Additionally, focus on retaining active customers through
     loyalty programs.

* Future Revenue Potential
   The future estimated revenue is projected to reach **$800 million**, suggesting significant growth opportunities.
  
   Recommendation: To achieve this target, we invest in optimizing customer retention by using cross-selling initiatives to encourage more frequent and higher-value purchases from existing customers.

* Best Paired Products 
   Based on purchase history, this  are the top 5 product pairs frequently bought together:  
   - Product IDs 870 & 871 
   - Product IDs 870 & 872 
   - Product IDs 712 & 715  
   - Product IDs 712 & 870 
   - Product IDs 711 & 712
       
   Recommendation: Use these product pairings to inform cross-selling and bundling strategies. Promote these pairs in marketing campaigns and create bundle deals to increase average transaction value.

* Campaign Targeting for Low/Medium Purchase Customers
    
   Customers with medium and low purchase frequency show potential for increased engagement.
  
   Recommendation: Design and execute frequent, high-impact campaigns targeted specifically at medium and low purchase
  customers. These campaigns should offer tailored incentives such as discounts, exclusive offers to encourage repeat purchases     and drive higher lifetime value.

* Highest Purchased Product 
   The most purchased product is **Product ID 712**, which has generated **$50 million** in revenue.  
   Recommendation: Given the popularity of Product ID 712, prioritize it in marketing efforts and inventory management to ensure sufficient stock. Additionally, explore opportunities to cross-promote this product with other high-demand items.

* Top 5 Frequently Purchased Products 
   The top 5 most frequently purchased products are:  
   - Product ID 864 
   - Product ID 884 
   - Product ID 712  
   - Product ID 876 
   - Product ID 715
     
   Recommendation: Focus inventory planning, promotions, and marketing for these products will maximize sales and customer satisfaction.

