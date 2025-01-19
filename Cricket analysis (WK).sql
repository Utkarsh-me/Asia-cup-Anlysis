### **5. Questions for `wicketkeeper data odi/t20i.csv`**

select * from wk_data;


#1. Which wicketkeeper has the most dismissals in ODIs/T20Is?  
select`Player Name` as `Wicket Keeper`, Country, Dismissals
from wk_data
order by Dismissals desc;


#2. Identify the wicketkeeper with the highest number of catches. 
select`Player Name` as `Wicket Keeper`, Country, Catches
from wk_data
order by Catches desc;

 
#3. Who has the most stumpings in ODIs?  
select`Player Name` as `Wicket Keeper`, Country, Stumpings
from wk_data
order by Stumpings desc;


#4. Which wicketkeeper has played the most matches as a wicketkeeper?  
select`Player Name` as `Wicket Keeper`, Country, Matches
from wk_data
order by Matches desc;


#5. List players with more than 15 dismissals . 
select `Player Name`, Country, Dismissals 
from wk_data
WHERE Dismissals > 15;


#6. Which player has the most dismissals in an innings?  
#7. Identify the wicketkeeper with the best dismissals-to-matches ratio.  
select `Player Name` , Country, Matches, Dismissals,
(Dismissals * 1.0 / Matches) AS `dismissals-to-matches ratio`
from wk_data 
order by `dismissals-to-matches ratio` desc;


#8. How many players have more than 200 dismissals in their careers?  
#9. Which country has the highest average number of dismissals per wicketkeeper?  
select Country, AVG(Dismissals) AS Avg_Dismissals
from wk_data
group by Country
order by Avg_Dismissals desc;


#10. List wicketkeepers who have more than 20 catches in T20Is.  
select`Player Name` as `Wicket Keeper`, Country, Catches
from wk_data
WHERE Catches > 20
order by Catches desc;


#11. Identify the player with the most stumpings in a single tournament.  
#12. How many dismissals were made by a specific wicketkeeper in ODIs?  
#13. Which wicketkeeper has the best record against a specific team?  
#14. List all players with more than 4 dismissals in a single series. 
select `Player Name`, Country, `Maximum Dismissals` 
from wk_data
WHERE `Maximum Dismissals` > 4
order by `Maximum Dismissals` desc ;


#15. Which wicketkeeper has the highest number of direct-hit run-outs?  
#16. What is the total number of catches and stumpings for each wicketkeeper? 
select `Player Name`, Country,
(Catches + Stumpings) AS Catches_Stumps
from wk_data
order by Catches_Stumps desc;


#17. Identify players who have more than 20 dismissals in a year.  
#18. Who made the most dismissals in day/night matches?  
#19. Which team has the most dismissals by wicketkeepers?  
select Country,
SUM(Dismissals) as Dismissals 
from wk_data 
group by Country
order by Dismissals desc;


#20. List wicketkeepers with the most dismissals in World Cup matches. 