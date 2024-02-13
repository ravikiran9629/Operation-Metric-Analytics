SELECT * FROM project_3.job_data;
#task-A
select ds as date,
       round(count(job_id)/(sum(time_spent)/3600)) as "jobs reviewd per hour per day" 
       from job_data 
       WHERE month(ds)=11 
       group by ds
       order by ds;

#task-B
select 	date,
        jobs_rv_p_day,
        avg(jobs_rv_p_day) over(order by date rows between 6 preceding and current row) as 7_Dy_Roll_Avg
        from (select ds as date,
					 (count(job_id)/sum(time_spent)) as jobs_rv_p_day from job_data 
                     WHERE month(ds)=11
					 group by ds
                     order by ds ) as table_1;

#task-C
select language,
	   count(language),
       round((count(language)/(select count(ds)from job_data))*100,2) as percentage_of_language 
	   from job_data 
       where month(ds)=11
       group by language 
       order by language;

#task-D 
select * from job_data
group by ds,job_id,actor_id,event,language,org
having count(*)>1;


