CREATE DATABASE Cricket;
use Cricket;

select * from asiacup;

### **1. Questions for `asiacup.csv`**

#1. Which team has won the most matches in Asia Cup history?  
select ï»¿Team , count(*) As wins 
from asiacup 
where Result = 'win'
group by ï»¿Team
order by wins Desc
Limit 1;

#2. What is the win/loss ratio for each team?  
SELECT 
    ï»¿Team, 
    SUM(CASE WHEN Result = 'Win' THEN 1 ELSE 0 END) AS Wins,
    SUM(CASE WHEN Result = 'Lose' THEN 1 ELSE 0 END) AS Losses,
    CASE 
        WHEN SUM(CASE WHEN Result = 'Lose' THEN 1 ELSE 0 END) = 0 
        THEN 'Infinity' -- Handle divide-by-zero scenario
        ELSE ROUND(SUM(CASE WHEN Result = 'Win' THEN 1 ELSE 0 END) * 1.0 / 
                   SUM(CASE WHEN Result = 'Lose' THEN 1 ELSE 0 END), 2)
    END AS Win_Loss_Ratio
FROM asiacup
GROUP BY ï»¿Team
ORDER BY Win_Loss_Ratio DESC;


#3. How many matches were played in each tournament format?  
select Format , 
count(*) as Total_Matches 
from asiacup 
group by Format;

 
#4. Which team scored the highest total runs in a single match?  
select ï»¿Team, 
Run_Scored as Hightest_Runs_Scored
from asiacup
order by Run_Scored Desc;


#5. What is the average run rate of each team across all matches?  
select ï»¿Team, 
avg(Run_Rate) as Average_run_rate
from asiacup 
group by ï»¿Team;


#6. How many times did a specific team win the toss and lose the match?  
SELECT 
    ï»¿Team, 
    COUNT(*) AS Toss_Win_Match_Lose
FROM asiacup
WHERE Toss = 'Win' AND Result = 'Lose'
GROUP BY ï»¿Team
ORDER BY Toss_Win_Match_Lose DESC;


#7. Which player won the most Player of the Match awards?  
select Player_Of_The_Match,
count(*) as Most_MOM 
from asiacup 
group by Player_Of_The_Match 
order by Most_MOM desc;


#8. Which ground hosted the maximum number of matches?  
select Ground,
count(*) as Most_Matches
from asiacup 
group by Ground 
order by Most_Matches desc;


#9. List all matches where a team scored more than 300 runs.  
select * from asiacup
where Run_Scored > 300;


#10. Which team gave away the most extras in a single match?  
select ï»¿Team ,
count(*) as most_extras
from asiacup
group by ï»¿Team
order by  most_extras desc;


#11. What is the highest individual score in Asia Cup history, and who scored it?  
select Player_Of_The_Match as Player,
MAX(Run_Scored) as Highest_run
from asiacup 
group by Player_Of_The_Match
limit 1;


#12. Which team has the highest number of sixes in the tournament?  
select ï»¿Team as Team,
MAX(Sixes) AS Highest_sixes
from asiacup 
group by ï»¿Team
limit 1;


#13. Identify the team with the best average batting strike rate. 
 select ï»¿Team as Team,
MAX(Avg_Bat_Strike_Rate) AS  average_batting_strike_rate
from asiacup 
group by ï»¿Team
limit 1;


#14. Which bowler took the highest individual wickets in a match? 
select Player_Of_The_Match as Player,
MAX(Highest_Individual_wicket) as Highest_wickets
from asiacup 
group by  Player_Of_The_Match
limit 1;


#15. How many matches ended with a margin of fewer than 10 runs?  
#16. Which team has the highest average score in matches played at a specific ground?  
select ï»¿Team as Team,
avg(Run_Scored) AS Maximum_avg_score
from asiacup 
where Ground = 'Sharjah'
group by ï»¿Team
order by Maximum_avg_score desc;

#17. How many matches were played in each year of the tournament? 
select Year,
count(*) as Matches 
from asiacup 
group by Year 
order by Year;


#18. Which team lost the most wickets in a single match?  
select Opponent as Team ,
MAX(Wicket_Taken) AS Lost_Of_Wickets
from asiacup 
group by Opponent;


#19. What is the total number of fours scored by each team across all matches?  
select ï»¿Team as Team ,
sum(Fours) AS Total_Fours 
from asiacup 
group by ï»¿Team
order by Total_Fours desc;


#20. Which team chased a target successfully the most times?  
select ï»¿Team as Team ,
count(*) AS Successful_Chase
from asiacup
where Selection='Bowling' and Result='win'
group by Team
order by Successful_Chase desc;