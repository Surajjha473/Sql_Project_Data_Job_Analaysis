/*
Question:- 
    1. What are the top-paying jobs for my role?
    2. What are the skills required for these top-paying roles?
    3. What are the most in-demand skills for my role?
    4. What are the top skills based on salary for my role?
    5. What are the most optimal skills to learn?
        a. Optimal: High Demand AND High Paying

What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for carrer development in data analysis
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS Demand_Count
    FROM 
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        -- job_title_short = 'Machine Learning Engineer' AND
        job_work_from_home = TRUE AND
        job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY  skills_dim.skill_id, skills_dim.skills
),
average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills AS skill_name,
        -- COUNT(skills_job_dim.job_id) AS Demand_Count
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS Average_salary_per_skill 
    FROM 
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        -- job_title_short = 'Machine Learning Engineer' AND
        job_work_from_home = TRUE AND
        job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY  skills_dim.skill_id, skills_dim.skills
)
SELECT
    skills_demand.skill_id AS skill_id,
    skills_demand.skills AS skill_name,
    skills_demand.Demand_Count AS Demand_Count,
    average_salary.Average_salary_per_skill AS Average_salary_per_skill
FROM
    skills_demand
    INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    Demand_Count > 10
ORDER BY 
    Average_salary_per_skill DESC,
    Demand_Count DESC
LIMIT 25;


-- Rewriting this same query
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS Demand_Count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS Average_salary_per_skill 
FROM 
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    -- job_title_short = 'Machine Learning Engineer' AND
    job_work_from_home = TRUE AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY  
    skills_dim.skill_id, skills_dim.skills
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    Average_salary_per_skill DESC,
    Demand_Count DESC
LIMIT 25
;
