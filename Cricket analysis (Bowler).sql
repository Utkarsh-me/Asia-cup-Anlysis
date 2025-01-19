### **3. Questions for `bowler data odi/t20i.csv`**

select * from bowler_odi;
select * from bowler_t20i;
#1. Which bowler took the most wickets in ODIs/T20Is?  
select `Player Name`, Country, Wickets
from bowler_odi
order by Wickets desc;


#2. Identify the bowler with the best bowling average.  
select `Player Name`, Country, `Bowling Average`
from bowler_t20i
order by `Bowling Average` desc
limit 1;


#3. Which bowler has the best economy rate in T20Is?  
select `Player Name`, Country, `Economy Rate`
from bowler_t20i
order by `Economy Rate` desc
limit 1;


#4. List bowlers with more than 1 five-wicket hauls. 
 select `Player Name`, Country, `Five Wickets`
 from bowler_odi
 where `Five Wickets` > 1;
 
 
#5. Who bowled the highest number of maiden overs?  
select `Player Name`, Country, `Maiden Overs`
from bowler_t20i
order by `Maiden Overs` DESC 
limit 1;

#6. Identify the bowler with the best strike rate.  
select `Player Name`, Country, `Strike Rate`
from bowler_odi 
order by `Strike Rate` DESC;


#7. Which bowler has the best figures in a single match? 
select `Player Name`, Country, `Best Figure`
from bowler_odi 
order by `Best Figure` DESC; 


#8. What is the average number of wickets taken by bowlers of each country? 
select Country, 
AVG(Wickets) AS Avg_Wickets
from bowler_t20i
group by Country
order by Avg_Wickets DESC; 


#9. List bowlers who played more than 100 matches but have an economy rate below 5.  
select `Player Name`, Country, Matches, `Economy Rate`
from bowler_odi
where Matches > 10 and `Economy Rate` < 5
order by `Economy Rate`;

#12. What is the average number of overs bowled by bowlers from a specific country?  
select Country , 
AVG(Overs) AS Avg_Overs
from bowler_t20i
group by Country
order by Avg_Overs DESC;

   
#15. What is the ratio of wickets to runs conceded for each bowler?  
select `Player Name`, Country, Wickets, Runs,
(Runs * 1.0 / Wickets) as `Ratio of runs to wickets`
from bowler_odi
order by `Ratio of runs to wickets` DESC;