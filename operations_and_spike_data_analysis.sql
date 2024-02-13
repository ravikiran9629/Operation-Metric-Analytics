# task - A
# user engagement = (active user/total users)*100 over required time period 
select round((count(distinct user_id)/(select count(user_id) from users))*100,2) as 'user_engagment(%)',
       week(occurred_at) as week_no
       from events where event_type='engagement' 
       group by week_no
       order by week_no;

# task - B
# growth rate = ((current value/previous value)-1)*100
# always use % in answer when answers are in percentage
select 
      round((((select count(user_id) 
               from users 
               where year(created_at)=(select year(created_at) from users order by created_at desc limit 1))/
              (select count(user_id) 
               from users 
               where year(created_at)=((select year(created_at) from users order by created_at desc limit 1)-1)))-1)*100,2) as 'yearly_user_growth_rate(%)';
               
# task - C 

SELECT first AS "Week Numbers",
SUM(CASE WHEN week_number = 0 THEN 1 ELSE 0 END) AS "Week 0",
SUM(CASE WHEN week_number = 1 THEN 1 ELSE 0 END) AS "Week 1",
SUM(CASE WHEN week_number = 2 THEN 1 ELSE 0 END) AS "Week 2",
SUM(CASE WHEN week_number = 3 THEN 1 ELSE 0 END) AS "Week 3",
SUM(CASE WHEN week_number = 4 THEN 1 ELSE 0 END) AS "Week 4",
SUM(CASE WHEN week_number = 5 THEN 1 ELSE 0 END) AS "Week 5",
SUM(CASE WHEN week_number = 6 THEN 1 ELSE 0 END) AS "Week 6",
SUM(CASE WHEN week_number = 7 THEN 1 ELSE 0 END) AS "Week 7",
SUM(CASE WHEN week_number = 8 THEN 1 ELSE 0 END) AS "Week 8",
SUM(CASE WHEN week_number = 9 THEN 1 ELSE 0 END) AS "Week 9",
SUM(CASE WHEN week_number = 10 THEN 1 ELSE 0 END) AS "Week 10",
SUM(CASE WHEN week_number = 11 THEN 1 ELSE 0 END) AS "Week 11",
SUM(CASE WHEN week_number = 12 THEN 1 ELSE 0 END) AS "Week 12",
SUM(CASE WHEN week_number = 13 THEN 1 ELSE 0 END) AS "Week 13",
SUM(CASE WHEN week_number = 14 THEN 1 ELSE 0 END) AS "Week 14",
SUM(CASE WHEN week_number = 15 THEN 1 ELSE 0 END) AS "Week 15",
SUM(CASE WHEN week_number = 16 THEN 1 ELSE 0 END) AS "Week 16",
SUM(CASE WHEN week_number = 17 THEN 1 ELSE 0 END) AS "Week 17",
SUM(CASE WHEN week_number = 18 THEN 1 ELSE 0 END) AS "Week 18" FROM (
SELECT m.user_id, m.login_week, n.first, m.login_week - n.first AS week_number
FROM (SELECT user_id,WEEK(occurred_at) AS login_week FROM events
GROUP BY 1, 2
) m,
(SELECT user_id,MIN(WEEK(occurred_at)) AS first FROM events
GROUP BY 1) n
WHERE m.user_id = n.user_id) sub
GROUP BY first ORDER BY first;


             
               
               
               
               
               
# task - D
select count(user_id) as 'user_engagment',
       device,
       week(occurred_at)
       from events where event_type='engagement' 
       group by week(occurred_at),device
       order by week(occurred_at),device;

# task - E 
select user_type,
       action,
       count(user_id) 
       from email_events 
       group by user_type,action 
       order by user_type,action;