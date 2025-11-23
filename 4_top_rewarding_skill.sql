/*
Question: What are the top skills based on Salary?
- Look at the average salary associated with each skill for Data Analyst position
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify
    the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills_dim.skills AS skill_name,
    -- COUNT(skills_job_dim.job_id) AS Demand_Count
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS Average_salary_per_skill 
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    -- job_title_short = 'Data Analyst' AND
    job_title_short = 'Machine Learning Engineer' AND
    job_work_from_home = TRUE AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY  skills_dim.skill_id
ORDER BY Average_salary_per_skill DESC
LIMIT 25;