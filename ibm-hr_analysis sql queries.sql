--total employees
SELECT COUNT(*) AS total_employees
FROM hr;

--Attrition count
SELECT COUNT(*) AS Attrition_count
FROM hr
WHERE "Attrition" = 'Yes';


--Attrition rate
SELECT 
    COUNT(CASE WHEN "Attrition" = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate
FROM hr;


--Attrition by department
SELECT "Department", COUNT(*) AS attrition_count
FROM hr
WHERE "Attrition" = 'Yes'
GROUP BY "Department"
ORDER BY attrition_count DESC;


--job role analysis
SELECT "JobRole", COUNT(*) AS attrition_count
FROM hr
WHERE "Attrition" = 'Yes'
GROUP BY "JobRole"
ORDER BY attrition_count DESC;



--avg salary analysis
SELECT AVG("MonthlyIncome") AS avg_salary
FROM hr;


--avg salary(Attrition employees)
SELECT AVG("MonthlyIncome") AS avg_salary_attrition
FROM hr
WHERE "Attrition" = 'Yes';


--overtime impact
SELECT "OverTime", COUNT(*) AS attrition_count
FROM hr
WHERE "Attrition" = 'Yes'
GROUP BY "OverTime";


--work life balance analysis
SELECT "WorkLifeBalance", COUNT(*) AS attrition_count
FROM hr
WHERE "Attrition" = 'Yes'
GROUP BY "WorkLifeBalance"
ORDER BY "WorkLifeBalance";


--age group analysis
SELECT 
    CASE 
        WHEN "Age" BETWEEN 18 AND 30 THEN '20-30'
        WHEN "Age" BETWEEN 31 AND 40 THEN '30-40'
        ELSE '40+'
    END AS Age_Group,
    COUNT(*) AS attrition_count
FROM hr
WHERE "Attrition" = 'Yes'
GROUP BY Age_Group;


--experience analysis
SELECT "YearsAtCompany", COUNT(*) AS attrition_count
FROM hr
WHERE "Attrition" = 'Yes'
GROUP BY "YearsAtCompany"
ORDER BY "YearsAtCompany";


--top risk employees
SELECT *
FROM hr
WHERE "Attrition" = 'Yes'
AND "MonthlyIncome" < 4000
AND "OverTime" = 'Yes';


--Attrition % by department
SELECT 
    "Department",
    COUNT(CASE WHEN "Attrition" = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate
FROM hr
GROUP BY "Department"
ORDER BY attrition_rate DESC;



