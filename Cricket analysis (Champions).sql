### **4. Questions for `champion.csv`**
use cricket;
select * from champions;


#1. Which country hosted the Asia Cup the most times?  
select Host as Country , 
count(*) as `No. of Times Hosted`
from champions 
group by Host
order by `No. of Times Hosted` desc;


#2. Which team won the Asia Cup the most times?  
select Champion as Country, 
count(*) as `Champions` 
from champions
group by Champion
order by `Champions` desc;


#3. Identify the runner-up team with the most appearances.
select `Runner Up` ,
count(*) as Appearances 
from champions
group by `Runner Up`
order by Appearances desc;

 
#4. List all tournaments where the Player of the Series scored more than 500 runs.  
#5. Which player scored the most runs in a single Asia Cup tournament?  
select `Highest Run Scorer` as Player_name , ï»¿Year 
from champions
order by Player_name desc
limit  1;


#6. Who took the most wickets in a single Asia Cup?  
#7. What is the average number of teams participating in the Asia Cup over the years?  
select ï»¿Year as Year , 
AVG(`No Of Team`) as avg_number_of_teams
from champions
group by Year 
order by avg_number_of_teams desc;


#8. Identify the champion and runner-up teams for each year.  
select ï»¿Year AS Year , Champion, `Runner Up`
from champions;


#9. Which country had the most players winning Player of the Series?  
#10. List all tournaments where the highest run scorer and wicket-taker were from the same team.  
#11. How many times did the host team win the tournament?  
select Host as Team, Champion,
count(*) as Win_times 
from champions
where Host = Champion
group by Host;


#12. Which year had the most teams participating in the Asia Cup?  
select ï»¿Year, `No Of Team`
from champions
order by `No Of Team` desc;


#13. What is the win percentage of the most successful team? 
select Champion as Team,
(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Champion)) AS Win_Percentage
from champions
group by Team
order by Win_Percentage desc;

#14. Identify players who were both the highest run scorer and Player of the Series.  
select `Player Of The Series`, `Highest Run Scorer`, ï»¿Year
from champions 
Where `Player Of The Series` = `Highest Run Scorer`;

#15. Which team has the most final match appearances?  
SELECT Team, 
COUNT(*) AS Final_Appearances
FROM (
    SELECT Champion AS Team FROM champions
    UNION ALL
    SELECT `Runner Up` AS Team FROM champions
) AS FinalTeams
GROUP BY Team
ORDER BY Final_Appearances DESC;


#16. How many tournaments had no matches won by the host team?  
select ï»¿Year, Host, Champion 
from champions
WHERE Host != Champion;


#17. What is the average number of matches played by the champion team each year? 
#18. List all years where the runner-up team scored more runs in the final but lost.  
#19. Who is the youngest Player of the Series winner (if age data is available)?  
#20. Which year had the highest combined runs scored in the final match?  