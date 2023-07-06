
use projects;

select
   min(age) as youngest,
   max(age) as oldest
from hr;

select count(*) from hr 
where age<18;

select * from hr;

select gender,count(*) as count
from hr
where age >= 18 and termdate ='0000-00-00'
group by gender;

select race,count(*) as count from hr
where age >= 20 and termdate ='0000-00-00'
group by race
order by count(*) desc;

select * from hr;

select age,count(*) as count
from hr
where age >= 20 and termdate ='0000-00-00'
group by age
order by count(*) desc;


select case 
     when age >=18 AND age <=24 then '18-24'
     when age >=25 AND age <=34 then '25-34'
	 when age >=35 AND age <=44 then '35-44'
	 when age >=45 AND age <=54 then '44-54'
	 when age >=55 AND age <=64 then '55-64'
     else '65+'
     end as age_group,gender,
     count(*) as count
     from hr
     where age >= 20 and termdate ='0000-00-00'
     group by age_group,gender
     order by age_group,gender;
     
     select * from hr;
     
     select location,count(*) as count
     from hr
     where age >= 20 and termdate ='0000-00-00'
     group by location;
     
	 select round(avg( datediff(termdate,hire_date))/365,0) as average_length_employment
     from hr
     where termdate <= curdate() and age >= 20 and termdate !='0000-00-00';
     
     select department,gender,count(*) as count
     from hr
     where age >= 20 and termdate ='0000-00-00'
     group by department,gender
     order by department;
   
   select jobtitle, count(*) as count
   from hr
   where age >= 20 and termdate ='0000-00-00'
   group by jobtitle
   order by count(*) desc;
   
   
   select department,total_count,terminated_count,
   terminated_count/total_count as termination_rate
   from
   (select department,
   count(*) as total_count,
   sum(case when termdate <> '0000-00-00' AND termdate <= curdate() then 1 else 0 end)
   as terminated_count
   from hr
   where age >= 18
   group by department) as subquery
   order by termination_rate desc;
   
   select location_state,
   count(*) as count 
   from hr
   where age >= 20 and termdate ='0000-00-00'
   group by location_state
   order by count(*) desc;
   
   
   select 
   year,hires,terminations,
   hires-terminations as net_change,
   round((hires-terminations)/hires*100,2) as net_change_percent
   from(
   select year(hire_date) as year,
   count(*) as hires,
   SUM(case when termdate <> '0000-00-00' and termdate <= curdate() then 1 else 0 end) as terminations
   from hr
   where age >= 18
   group by year(hire_date)
   )as subquery
   order by year asc;
   
   select department,round(avg(datediff(termdate,hire_date)/365),0) as avg_tenure
   from hr
   where termdate <= curdate() and termdate <> '0000-00-00' and age >=18
   group by department;
