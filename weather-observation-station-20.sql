WITH RankedLatitudes AS (
    SELECT 
        LAT_N, 
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS Row_Num, 
        COUNT(*) OVER () AS Total_Count 
    FROM 
        STATION
)
SELECT 
    ROUND(AVG(LAT_N), 4) AS Median_Latitude 
FROM 
    RankedLatitudes 
WHERE 
    Row_Num IN (CEIL(Total_Count/2.0), FLOOR(Total_Count/2.0) + 1);
