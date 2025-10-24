USE LMSAnalytics;
GO

CREATE TABLE dbo.LMS_Usage (
    UserID VARCHAR(50),
    Techno VARCHAR(50),
    AccessDate DATETIME,
    CompletionStatus VARCHAR(50),
    Time_Spent INT,
    Device VARCHAR(50),
    Country VARCHAR(50),
    AccessMonth VARCHAR(50)
);
GO

DELETE FROM dbo.LMS_Usage
WHERE 
    (UserID IS NULL OR LTRIM(RTRIM(UserID)) = '') 
    AND (Techno IS NULL OR LTRIM(RTRIM(Techno)) = '') 
    AND (AccessDate IS NULL)
    AND (CompletionStatus IS NULL OR LTRIM(RTRIM(CompletionStatus)) = '') 
    AND (Time_Spent IS NULL OR Time_Spent = 0)
    AND (Device IS NULL OR LTRIM(RTRIM(Device)) = '')
    AND (Country IS NULL OR LTRIM(RTRIM(Country)) = '')
    AND (AccessMonth IS NULL OR LTRIM(RTRIM(AccessMonth)) = '');


WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY UserID, Techno, AccessDate ORDER BY (SELECT NULL)) AS rn
    FROM dbo.LMS_Usage
)
DELETE FROM CTE WHERE rn > 1;


SELECT COUNT(*) AS TotalRows FROM dbo.LMS_Usage;
SELECT TOP 10 * FROM dbo.LMS_Usage;

SELECT Techno, COUNT(DISTINCT UserID) AS TotalUsers
FROM dbo.LMS_Usage
GROUP BY Techno
ORDER BY TotalUsers DESC;

USE LMSAnalytics;
GO
SELECT COUNT(*) AS TotalRows FROM dbo.LMS_Usage;

SELECT TOP 10 * FROM dbo.LMS_Usage;
SELECT COUNT(*) AS Total_Records FROM dbo.LMS_Usage;

SELECT 
    SUM(CASE WHEN UserID IS NULL OR LTRIM(RTRIM(UserID)) = '' THEN 1 ELSE 0 END) AS Missing_UserID,
    SUM(CASE WHEN Techno IS NULL OR LTRIM(RTRIM(Techno)) = '' THEN 1 ELSE 0 END) AS Missing_Techno,
    SUM(CASE WHEN AccessDate IS NULL THEN 1 ELSE 0 END) AS Missing_AccessDate,
    SUM(CASE WHEN CompletionStatus IS NULL OR LTRIM(RTRIM(CompletionStatus)) = '' THEN 1 ELSE 0 END) AS Missing_CompletionStatus,
    SUM(CASE WHEN Time_Spent IS NULL THEN 1 ELSE 0 END) AS Missing_Time_Spent,
    SUM(CASE WHEN Device IS NULL OR LTRIM(RTRIM(Device)) = '' THEN 1 ELSE 0 END) AS Missing_Device,
    SUM(CASE WHEN Country IS NULL OR LTRIM(RTRIM(Country)) = '' THEN 1 ELSE 0 END) AS Missing_Country
FROM dbo.LMS_Usage;

SELECT 
    COUNT(DISTINCT UserID) AS Unique_Users,
    COUNT(DISTINCT Techno) AS Unique_Technologies,
    COUNT(DISTINCT Device) AS Unique_Devices,
    COUNT(DISTINCT Country) AS Unique_Countries,
    COUNT(DISTINCT AccessMonth) AS Unique_Months
FROM dbo.LMS_Usage;

SELECT TOP 10 
    Techno,
    COUNT(DISTINCT UserID) AS Total_Users,
    AVG(Time_Spent) AS Avg_Time_Spent
FROM dbo.LMS_Usage
GROUP BY Techno
ORDER BY Total_Users DESC;

SELECT TOP 10 
    Techno,
    COUNT(DISTINCT UserID) AS Total_Users,
    AVG(Time_Spent) AS Avg_Time_Spent
FROM dbo.LMS_Usage
GROUP BY Techno
ORDER BY Total_Users DESC;


SELECT 
    CompletionStatus,
    COUNT(*) AS Total,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM dbo.LMS_Usage), 2) AS Percentage
FROM dbo.LMS_Usage
GROUP BY CompletionStatus;

SELECT 
    Device,
    ROUND(AVG(Time_Spent), 2) AS Avg_Time_Spent
FROM dbo.LMS_Usage
GROUP BY Device
ORDER BY Avg_Time_Spent DESC;

CREATE VIEW LMS_Usage_Insights AS
SELECT 
    Techno,
    Country,
    Device,
    AccessMonth,
    COUNT(DISTINCT UserID) AS Total_Users,
    ROUND(AVG(Time_Spent), 2) AS Avg_Time_Spent,
    SUM(CASE WHEN CompletionStatus = 'Completed' THEN 1 ELSE 0 END) AS Completed,
    SUM(CASE WHEN CompletionStatus = 'In Progress' THEN 1 ELSE 0 END) AS In_Progress,
    SUM(CASE WHEN CompletionStatus = 'Not Started' THEN 1 ELSE 0 END) AS Not_Started
FROM dbo.LMS_Usage
GROUP BY Techno, Country, Device, AccessMonth;








