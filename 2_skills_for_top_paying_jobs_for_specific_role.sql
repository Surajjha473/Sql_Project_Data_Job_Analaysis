/*
Question:- What skills are required for the top-paying data analyst job?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name
    FROM 
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Machine Learning Engineer' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10    
)
SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY    
    salary_year_avg DESC
;

/*

top results:-
[
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5",
    "skills": "sql"
  },
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5",
    "skills": "python"
  },
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5",
    "skills": "java"
  },
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5",
    "skills": "aws"
  },
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5",
    "skills": "gcp"
  },
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5",
    "skills": "spark"
  },
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5",
    "skills": "airflow"
  },
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5",
    "skills": "kubernetes"
  },
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5",
    "skills": "docker"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Harnham",
    "skills": "python"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Harnham",
    "skills": "scala"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Harnham",
    "skills": "aws"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Harnham",
    "skills": "excel"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Harnham",
    "skills": "terraform"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Harnham",
    "skills": "kubernetes"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Harnham",
    "skills": "docker"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Harnham",
    "skills": "chef"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Harnham",
    "skills": "ansible"
  },
  {
    "job_id": 901491,
    "job_title": "Machine Learning Engineer",
    "salary_year_avg": "300000.0",
    "company_name": "orbit",
    "skills": "python"
  },
  {
    "job_id": 901491,
    "job_title": "Machine Learning Engineer",
    "salary_year_avg": "300000.0",
    "company_name": "orbit",
    "skills": "typescript"
  },
  {
    "job_id": 901491,
    "job_title": "Machine Learning Engineer",
    "salary_year_avg": "300000.0",
    "company_name": "orbit",
    "skills": "golang"
  },
  {
    "job_id": 751285,
    "job_title": "Machine Learning Researcher",
    "salary_year_avg": "262500.0",
    "company_name": "Acceler8 Talent",
    "skills": "python"
  },
  {
    "job_id": 751285,
    "job_title": "Machine Learning Researcher",
    "salary_year_avg": "262500.0",
    "company_name": "Acceler8 Talent",
    "skills": "excel"
  },
  {
    "job_id": 589335,
    "job_title": "Principal Machine Learning Research Scientist (Deep Learning)",
    "salary_year_avg": "262500.0",
    "company_name": "Acceler8 Talent",
    "skills": "python"
  },
  {
    "job_id": 589335,
    "job_title": "Principal Machine Learning Research Scientist (Deep Learning)",
    "salary_year_avg": "262500.0",
    "company_name": "Acceler8 Talent",
    "skills": "excel"
  },
  {
    "job_id": 367792,
    "job_title": "Director of Engineering, ML Platform",
    "salary_year_avg": "249000.0",
    "company_name": "MongoDB",
    "skills": "python"
  },
  {
    "job_id": 367792,
    "job_title": "Director of Engineering, ML Platform",
    "salary_year_avg": "249000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 367792,
    "job_title": "Director of Engineering, ML Platform",
    "salary_year_avg": "249000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 67310,
    "job_title": "Machine Learning Engineer",
    "salary_year_avg": "240000.0",
    "company_name": "Acceler8 Talent",
    "skills": "tensorflow"
  },
  {
    "job_id": 67310,
    "job_title": "Machine Learning Engineer",
    "salary_year_avg": "240000.0",
    "company_name": "Acceler8 Talent",
    "skills": "pytorch"
  },
  {
    "job_id": 801317,
    "job_title": "Sr. Machine Learning Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Acceler8 Talent",
    "skills": "tensorflow"
  },
  {
    "job_id": 801317,
    "job_title": "Sr. Machine Learning Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Acceler8 Talent",
    "skills": "pytorch"
  },
  {
    "job_id": 303478,
    "job_title": "Director of Engineering, ML Platform",
    "salary_year_avg": "222000.0",
    "company_name": "MongoDB",
    "skills": "python"
  },
  {
    "job_id": 303478,
    "job_title": "Director of Engineering, ML Platform",
    "salary_year_avg": "222000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 303478,
    "job_title": "Director of Engineering, ML Platform",
    "salary_year_avg": "222000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 282701,
    "job_title": "Lead AI / ML / Data Science Engineer - Co Founder",
    "salary_year_avg": "200000.0",
    "company_name": "Founding Teams",
    "skills": "sql"
  },
  {
    "job_id": 282701,
    "job_title": "Lead AI / ML / Data Science Engineer - Co Founder",
    "salary_year_avg": "200000.0",
    "company_name": "Founding Teams",
    "skills": "python"
  },
  {
    "job_id": 282701,
    "job_title": "Lead AI / ML / Data Science Engineer - Co Founder",
    "salary_year_avg": "200000.0",
    "company_name": "Founding Teams",
    "skills": "java"
  }
]

*/