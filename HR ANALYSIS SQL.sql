use hr_analysis;
-- Q1. Workforce Structure
-- How is the workforce distributed across job roles?

SELECT JobRole,count(*) emp_count,
ROUND(count(*) *100 / sum(count(*))
OVER (), 2) percentage
FROM hr_analysis
GROUP BY JobRole
ORDER BY  emp_count desc;


-- Q2. Department & Role Composition
-- Which departments and job roles make up the largest portion of the workforce?
SELECT Department,count(*) emp_count
FROM hr_analysis
GROUP BY Department
ORDER BY  emp_count desc;


-- Q3. Compensation Insights
-- How does average monthly income vary across job roles?

SELECT JobRole,ROUND(AVG(MonthlyIncome),2) avg_income
FROM hr_analysis
GROUP BY JobRole
ORDER BY avg_income DESC;

-- Q4. Departmental Headcount
-- Which departments have the highest number of employees?
SELECT Department,(COUNT(*)) Highest_count,
ROUND(COUNT(*) * 100 / SUM(COUNT(*))
OVER() ,2) percentage
FROM hr_analysis
GROUP BY  Department
ORDER BY Highest_count DESC 
;

-- Q5. Workload & Overtime
-- Which roles or departments show higher overtime frequency?
 SELECT
    JobRole,
    COUNT(*) AS overtime_count
FROM hr_analysis
WHERE OverTime = 'Yes'
GROUP BY JobRole
ORDER BY overtime_count DESC;




-- Q6. Entry-Level Talent Distribution
-- Which job roles have a higher concentration of early-career (entry-level) employees?

SELECT JobRole,count(*)  count_
FROM hr_analysis
WHERE JobLevel = 1
GROUP BY JobRole
ORDER BY count_ DESC;


-- Q7. Attrition & Retention Risk
-- Are attrition rates higher in specific job roles or departments?

SELECT JobRole,COUNT(*) COUNT,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) attrition_count,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 /(COUNT(*)) attrition_percentage
FROM hr_analysis
GROUP BY JobRole
ORDER BY attrition_percentage DESC ;
