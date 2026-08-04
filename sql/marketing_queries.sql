-- ============================================================
-- MARKETING CAMPAIGN PERFORMANCE ANALYTICS
-- Complete SQL Script
-- ============================================================

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS marketing_campaign_db;
USE marketing_campaign_db;

-- 2. Create Table
CREATE TABLE IF NOT EXISTS marketing_campaign (
    Campaign_ID INT,
    Company TEXT,
    Campaign_Type TEXT,
    Target_Audience TEXT,
    Duration TEXT,
    Channel_Used TEXT,
    Conversion_Rate DOUBLE,
    Acquisition_Cost DOUBLE,
    ROI DOUBLE,
    Location TEXT,
    Date DATE,
    Clicks INT,
    Impressions INT,
    Engagement_Score INT,
    Customer_Segment TEXT
);

-- ============================================================
-- PART 1 : BASIC SQL
-- ============================================================

-- Query 1 : View all records
SELECT * FROM marketing_campaign;

-- Query 2 : Total campaigns
SELECT COUNT(*) AS Total_Campaigns
FROM marketing_campaign;

-- Query 3 : Total clicks
SELECT SUM(Clicks) AS Total_Clicks
FROM marketing_campaign;

-- Query 4 : Total impressions
SELECT SUM(Impressions) AS Total_Impressions
FROM marketing_campaign;

-- Query 5 : Average ROI
SELECT ROUND(AVG(ROI),2) AS Average_ROI
FROM marketing_campaign;

-- ============================================================
-- PART 2 : INTERMEDIATE SQL
-- ============================================================

-- Query 6 : Average ROI by Channel
SELECT
Channel_Used,
ROUND(AVG(ROI),2) AS Avg_ROI
FROM marketing_campaign
GROUP BY Channel_Used
ORDER BY Avg_ROI DESC;

-- Query 7 : Campaign Count by Type
SELECT
Campaign_Type,
COUNT(*) AS Campaign_Count
FROM marketing_campaign
GROUP BY Campaign_Type
ORDER BY Campaign_Count DESC;

-- Query 8 : Total Acquisition Cost by Channel
SELECT
Channel_Used,
ROUND(SUM(Acquisition_Cost),2) AS Total_Acquisition_Cost
FROM marketing_campaign
GROUP BY Channel_Used
ORDER BY Total_Acquisition_Cost DESC;

-- Query 9 : Average Conversion Rate by Campaign Type
SELECT
Campaign_Type,
ROUND(AVG(Conversion_Rate)*100,2) AS Avg_Conversion_Percentage
FROM marketing_campaign
GROUP BY Campaign_Type
ORDER BY Avg_Conversion_Percentage DESC;

-- Query 10 : Engagement Score by Customer Segment
SELECT
Customer_Segment,
ROUND(AVG(Engagement_Score),2) AS Avg_Engagement
FROM marketing_campaign
GROUP BY Customer_Segment
ORDER BY Avg_Engagement DESC;

-- ============================================================
-- PART 3 : ADVANCED SQL
-- ============================================================

-- Query 11 : Campaign Count by Location
SELECT
Location,
COUNT(*) AS Campaign_Count
FROM marketing_campaign
GROUP BY Location
ORDER BY Campaign_Count DESC;

-- Query 12 : Average ROI by Customer Segment
SELECT
Customer_Segment,
ROUND(AVG(ROI),2) AS Avg_ROI
FROM marketing_campaign
GROUP BY Customer_Segment
ORDER BY Avg_ROI DESC;

-- Query 13 : Top 10 Campaigns by ROI
SELECT
Campaign_ID,
Company,
Channel_Used,
ROI
FROM marketing_campaign
ORDER BY ROI DESC
LIMIT 10;

-- Query 14 : Top 10 Campaigns by Clicks
SELECT
Campaign_ID,
Company,
Clicks
FROM marketing_campaign
ORDER BY Clicks DESC
LIMIT 10;

-- Query 15 : Overall Marketing Performance Summary
SELECT
COUNT(*) AS Total_Campaigns,
SUM(Clicks) AS Total_Clicks,
SUM(Impressions) AS Total_Impressions,
ROUND(AVG(Conversion_Rate)*100,2) AS Avg_Conversion_Rate,
ROUND(AVG(ROI),2) AS Avg_ROI,
ROUND(SUM(Acquisition_Cost),2) AS Total_Acquisition_Cost,
ROUND(AVG(Engagement_Score),2) AS Avg_Engagement_Score
FROM marketing_campaign;

-- ============================================================
-- END OF SQL SCRIPT
-- ============================================================
