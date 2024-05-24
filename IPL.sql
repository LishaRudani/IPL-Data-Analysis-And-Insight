Use IPL
Go

--1. Find the top 5 players based on the highest number of runs scored in a particular IPL season?
SELECT TOP 5 Player_Name, Runs_Scored FROM dbo.IPL_Data$ WHERE Year = 2023 ORDER BY Runs_Scored DESC;

--2. Calculate the batting average of each player for a specific IPL season?
SELECT Player_Name, Runs_Scored, Matches_Batted, Not_Outs, 
CAST(Runs_Scored AS INT) / (Matches_Batted - Not_Outs) AS Batting_Average
FROM dbo.IPL_Data$
WHERE Year = 2023;

--3. Find the player with the highest batting strike rate in a particular IPL season?
SELECT TOP 1 Player_Name, Batting_Strike_Rate FROM dbo.IPL_Data$ WHERE Year = 2023 ORDER BY Batting_Strike_Rate DESC;

--4. Identify the players who scored centuries (100 runs or more) in a specific IPL season?
SELECT Player_Name, Centuries FROM dbo.IPL_Data$ WHERE Year = 2023 AND Centuries > 0;

--5. Find the players who have taken the most catches as fielders in a particular IPL season?
SELECT Player_Name, Catches_Taken FROM dbo.IPL_Data$ WHERE Year = 2023 ORDER BY Catches_Taken DESC;

--6. Calculate the economy rate of each bowler for a specific IPL season?
SELECT Player_Name, Runs_Conceded, Balls_Bowled, 
CAST(Runs_Conceded AS FLOAT) / (Balls_Bowled / 6) AS Economy_Rate
FROM dbo.IPL_Data$
WHERE Year = 2023 AND Balls_Bowled > 0;

--7. Identify the bowler with the best bowling average in a particular IPL season?
SELECT TOP 1 Player_Name, Bowling_Average FROM dbo.IPL_Data$ WHERE Year = 2023 AND Wickets_Taken > 0
ORDER BY Bowling_Average ASC;

--8. Find the players who achieved five-wicket hauls (5 wickets or more in an inning) in a specific IPL season?
SELECT Player_Name, Five_Wicket_Hauls FROM dbo.IPL_Data$ WHERE Year = 2023 AND Five_Wicket_Hauls > 0;

--9. Find the players who have scored both a century and a half-century in a specific IPL season?
SELECT Player_Name, Centuries, Half_Centuries FROM dbo.IPL_Data$
WHERE Year = 2023 AND Centuries > 0 AND Half_Centuries > 0;

--10. Find the top 5 players based on the highest number of runs scored in any IPL season?
SELECT TOP 5 Player_Name, MAX(Runs_Scored) AS Highest_Runs_Scored FROM dbo.IPL_Data$
GROUP BY Player_Name
ORDER BY Highest_Runs_Scored DESC;

--11. Calculate the overall batting average of each player across all IPL seasons?
SELECT Player_Name, 
SUM(Runs_Scored) AS Total_Runs, 
SUM(Matches_Batted) AS Total_Matches_Batted,
SUM(Not_Outs) AS Total_Not_Outs,
CASE WHEN SUM(Matches_Batted) - SUM(Not_Outs) = 0 THEN NULL
ELSE CAST(SUM(Runs_Scored) AS FLOAT) / (SUM(Matches_Batted) - SUM(Not_Outs)) END AS Batting_Average FROM dbo.IPL_Data$

--11. Calculate the overall batting average of each player across all IPL seasons?
SELECT Player_Name, 
SUM(Runs_Scored) AS Total_Runs, 
SUM(Matches_Batted) AS Total_Matches_Batted,
SUM(Not_Outs) AS Total_Not_Outs,
CASE WHEN SUM(Matches_Batted) - SUM(Not_Outs) = 0 THEN NULL
ELSE CAST(SUM(Runs_Scored) AS FLOAT) / (SUM(Matches_Batted) - SUM(Not_Outs)) END AS Batting_Average FROM dbo.IPL_Data$;

--12. Find the player with the highest career batting strike rate across all IPL seasons?
SELECT TOP 1 Player_Name, AVG(Batting_Strike_Rate) AS Career_Batting_Strike_Rate FROM dbo.IPL_Data$ GROUP BY Player_Name
ORDER BY Career_Batting_Strike_Rate DESC;

--13. Identify the players who have scored centuries (100 runs or more) in any IPL season?
SELECT Player_Name, SUM(Centuries) AS Total_Centuries FROM dbo.IPL_Data$ WHERE Centuries > 0 GROUP BY Player_Name;

--14. Find the players who have taken the most catches as fielders across all IPL seasons?
SELECT Player_Name, SUM(Catches_Taken) AS Total_Catches_Taken FROM dbo.IPL_Data$ GROUP BY Player_Name ORDER BY Total_Catches_Taken DESC;

---15. Calculate the overall economy rate of each bowler across all IPL seasons?
SELECT Player_Name, SUM(Runs_Conceded) AS Total_Runs_Conceded, 
SUM(Balls_Bowled) AS Total_Balls_Bowled,
CAST(SUM(Runs_Conceded) AS FLOAT) / (SUM(Balls_Bowled) / 6) AS Overall_Economy_Rate
FROM dbo.IPL_Data$ WHERE Balls_Bowled > 0 GROUP BY Player_Name;

--16. Identify the bowler with the best career bowling average across all IPL seasons?
SELECT TOP 1 Player_Name, AVG(Bowling_Average) AS Career_Bowling_Average
FROM dbo.IPL_Data$ WHERE Wickets_Taken > 0 GROUP BY Player_Name ORDER BY Career_Bowling_Average ASC;

--17. Find the players who have achieved five-wicket hauls (5 wickets or more in an inning) in any IPL season?
SELECT Player_Name, SUM(Five_Wicket_Hauls) AS Total_Five_Wicket_Hauls FROM dbo.IPL_Data$ WHERE Five_Wicket_Hauls > 0
GROUP BY Player_Name;