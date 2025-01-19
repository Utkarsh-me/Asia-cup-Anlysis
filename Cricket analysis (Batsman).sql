### **2. Questions for `batsman data odi/t20i.csv`**

select * from batsman_odi;

select * from batsman_t20i;

#1. Which batsman scored the most runs in ODI/T20I history?  
select `Player Name`, Country ,Runs as Runs_scored
from batsman_odi
order by Runs_scored desc;

select `Player Name`, 
MAX(Runs) as Runs_scored
from batsman_t20i
group by  `Player Name`
order by Runs_scored desc;


#2. Who has the highest batting average in ODIs/T20Is?  
SELECT 
    `Player Name`, 
    Country, 
    `Batting Average`
FROM batsman_odi
ORDER BY `Batting Average` DESC;

SELECT 
    `Player Name`, 
    Country, 
    `Batting Average`
FROM batsman_t20i
ORDER BY `Batting Average` DESC;


#3. Identify the batsman with the highest strike rate.  
select `Player Name`, Country, `Strike Rate`
from batsman_odi 
order by `Strike Rate`;

select `Player Name`, Country, `Strike Rate`
from batsman_t20i
order by `Strike Rate`;


#4. Which player has the most centuries?  
select `Player Name`, Country, Centuries 
from batsman_odi 
order by Centuries desc;

select `Player Name`, Country, Centuries 
from batsman_t20i
order by Centuries desc;


#5. List batsmen with more than 700 runs.  
select `Player Name`, Runs
from batsman_odi
where Runs > 700
order by Runs desc;

select `Player Name`, Runs
from batsman_t20i
where Runs > 700
order by Runs desc;


#6. Who scored the highest individual score in an innings?
select `Player Name`, `Highest Score` 
from batsman_odi
order by `Highest Score` desc
limit 1;

select `Player Name`, `Highest Score` 
from batsman_t20i
order by `Highest Score` desc
limit 1;


#7. Which batsman has the most ducks?
select `Player Name`, Ducks
from batsman_odi 
order by Ducks desc
limit 1;

select `Player Name`, Ducks
from batsman_t20i
order by Ducks desc
limit 1;


#8. How many players scored more than 50 fifties?  
select `Player Name`, Fifties
from batsman_odi
Where Fifties > 5
order by Fifties desc;

select `Player Name`, Fifties
from batsman_t20i
Where Fifties > 2
order by Fifties desc;


#9. Which batsman has faced the most balls?  
select `Player Name`,Country, `Balls Faced`
from batsman_odi
order by `Balls Faced` desc
limit 5;

select `Player Name`,Country, `Balls Faced`
from batsman_t20i
order by `Balls Faced` desc
limit 5;

#10. Identify batsmen with more than 200 sixes.  
select `Player Name`, Country, Sixes
from batsman_odi 
where Sixes > 10
order by Sixes desc
limit 5;

select `Player Name`, Country, Sixes
from batsman_t20i 
where Sixes > 10
order by Sixes desc
limit 5;


#11. What is the total number of fours scored by each country?  
select Country,
sum(Fours) AS Total_Fours
from batsman_odi
group by Country
order by Total_Fours DESC;

select Country,
sum(Fours) AS Total_Fours
from batsman_t20i
group by Country
order by Total_Fours DESC;


#12. Which batsman has the best ratio of centuries to matches played?  
select `Player Name`, Country, Played , Centuries,
(Centuries * 1.0 / Played) AS `Ratio of 100's to matches played`
from batsman_odi
WHERE Played > 0 and Centuries > 0
order by `Ratio of 100's to matches played` DESC
limit 2;

select `Player Name`, Country, Played , Centuries,
(Centuries * 1.0 / Played) AS `Ratio of 100's to matches played`
from batsman_t20i
WHERE Played > 0 and Centuries > 0
order by `Ratio of 100's to matches played` DESC
limit 2;


#13. Who played the longest time period as a batsman?
SELECT 
    `Player Name`, 
    Country, 
    `Time Period`,
    (CAST(SUBSTRING_INDEX(`Time Period`, '-', -1) AS UNSIGNED) - 
     CAST(SUBSTRING_INDEX(`Time Period`, '-', 1) AS UNSIGNED)) AS Career_Length
FROM batsman_odi
ORDER BY Career_Length DESC
LIMIT 1;

SELECT 
    `Player Name`, 
    Country, 
    `Time Period`,
    (CAST(SUBSTRING_INDEX(`Time Period`, '-', -1) AS UNSIGNED) - 
     CAST(SUBSTRING_INDEX(`Time Period`, '-', 1) AS UNSIGNED)) AS Career_Length
FROM batsman_t20i
ORDER BY Career_Length DESC
LIMIT 1;


#14. What is the highest total runs scored by batsmen of a specific country?  
select `Player Name`, `Highest Score` 
from batsman_odi
where Country = 'India'
order by `Highest Score` desc
limit 1;

select `Player Name`, `Highest Score` 
from batsman_t20i
where Country = 'Sri Lanka'
order by `Highest Score` desc
limit 1;


#15. Which player has the most runs in matches where they were not out?  
#16. What is the average strike rate of batsmen from each country?  
SELECT Country, 
AVG(`Strike Rate`) AS `Average Strike Rate`
FROM batsman_odi
WHERE `Strike Rate` > 0 -- Exclude cases with no recorded strike rate
GROUP BY Country
ORDER BY `Average Strike Rate` DESC;

SELECT Country, 
AVG(`Strike Rate`) AS `Average Strike Rate`
FROM batsman_t20i
WHERE `Strike Rate` > 0 -- Exclude cases with no recorded strike rate
GROUP BY Country
ORDER BY `Average Strike Rate` DESC;


#17. How many batsmen scored a century in fewer than 50 balls? 
select `Player Name`, Country, Centuries, `Balls Faced` 
from batsman_odi 
where Centuries > 0 and `Balls Faced` > 50 ;


#18. Who has the most runs in T20Is played after 2020?  
select `Player Name`, Country, `Time Period`, Runs
from batsman_t20i
Where SUBSTRING_INDEX(`Time Period`, '-', 1) > '2020'
order by Runs desc ;


#19. Which batsman scored the most boundaries (fours + sixes)?  
select `Player Name` , Country, 
(Fours + Sixes) as Boundries 
from batsman_odi 
order by Boundries desc;

select `Player Name` , Country, 
(Fours + Sixes) as Boundries 
from batsman_t20i 
order by Boundries desc;


#20. Identify the batsman with the best performance in a losing match.