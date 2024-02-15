USE project1;

select * from salary_data;

/**1-What is the average salary for each job title?**/
select Job_Title,ROUND(AVG(Salary_by_year),2)AS AVG_salary
from salary_data
group by Job_Title
order by AVG_salary  ;

/**2-How does education level affect Job title?**/
select SCHOOL,Job_Title,count(*)as count_jobs
from (select job_Title,
            CASE
			WHEN Education='PhD' THEN 'PHD'
	        WHEN Education='High School' THEN 'High School'
	        WHEN Education='Bachelor' THEN 'Bachelor'
	        ELSE 'Master'
	        END AS SCHOOL
       FROM salary_data)AS df
 group by SCHOOL,Job_Title
 order by SCHOOL ;

/**3-Are there significant differences in salaries between locations?**/
SELECT Location,ROUND(AVG(Salary_by_year),2)AS AVG_salary
FROM salary_data
GROUP BY Location ;

/**4-Is there a gender pay gap within the data set?**/
SELECT Gender,ROUND(AVG(Salary_by_year),2)AS AVG_salary
FROM salary_data 
GROUP BY Gender;

/**5-How does education level affect salary?**/
SELECT Education,ROUND(AVG(Salary_by_year),2)AS AVG_salary
FROM salary_data
GROUP BY Education;

/**6-How does experience affect salary?**/
select MIN(Experience)
from salary_data;

select MAX(Experience)
from salary_data;

select Years_of_Experience,ROUND(AVG(salary_by_year),2)AS AVG_SALARY
from (select salary_by_year,
            CASE
			WHEN Experience BETWEEN 1 AND 10 THEN 'Years 1  -->10'
	        WHEN Experience BETWEEN 11 AND 20 THEN 'Years 11-->20'
	        ELSE 'Years 21-->29'
	        END AS Years_of_Experience
       FROM salary_data)AS df
 group by Years_of_Experience
 ORDER BY AVG_SALARY;

/**7-How does AGE level affect salary? **/
select AGE,ROUND(AVG(salary_by_year),2)AS AVG_SALARY
from (select salary_by_year,
            CASE
			WHEN Age BETWEEN 20 AND 30 THEN 'Years 20 -->30'
	        WHEN Age BETWEEN 31 AND 40 THEN 'Years 31-->40'
		    WHEN Age BETWEEN 41 AND 50 THEN 'Years 41-->50'
		    WHEN Age BETWEEN 51 AND 59 THEN 'Years 51-->59'
	        ELSE 'Years 60-->64'
	        END AS AGE
       FROM salary_data)AS df
 group by AGE
 ORDER BY AGE ;
