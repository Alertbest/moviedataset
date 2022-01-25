USE movie_data;

/*To know the name of the table in the database*/
SHOW TABLES;

/*to know the numbers of rows in the table*/
 SELECT COUNT(*) AS RowNum
 FROM movie;

/*selecting all columns and sort by the first column in ASCENDING order*/
 SELECT movietitle, releasedate, genre, budget, revenue
 FROM movie 
 ORDER BY 1;
 
 /*To get the average revenue for all the movies*/
 SELECT AVG(revenue) AS AvgRevenue
 FROM movie;
 
  SELECT ROUND(AVG(revenue),2) AS AvgRevenue
 FROM movie;
 
 
/*To know the highest budget*/ 
 SELECT  MAX(budget) AS Max
 FROM movie;
 
 /*to know the lowest budget*/
 SELECT MIN(Budget) AS Min
 FROM movie;
 
 /*To know the highest revenue*/ 
 SELECT  MAX(revenue) AS Max 
 FROM movie;
 
 /*a list of all genre without duplicate*/
 SELECT DISTINCT(genre)
 from movie;
 
 
 /*using CASE WHEN to categorize the genre*/
 SELECT movietitle, releasedate, genre,
 CASE genre 
 WHEN 'comedy' THEN 'Safe'
 WHEN 'romance' THEN 'NotSafe'
 WHEN 'sci-fi' THEN 'PG'
 WHEN 'religious' THEN 'PG14'
 ELSE 'Adult' 
 END AS 'Censor'
 FROM movie;
 
 SELECT movietitle, releasedate, genre,
 CASE WHEN genre = 'comedy' THEN 'Safe'
 WHEN genre = 'romance' THEN 'NotSafe'
 WHEN genre = 'sci-fi' THEN 'PG'
 WHEN genre = 'religious' THEN 'PG14'
 ELSE 'Adult' 
 END AS 'Censor'
 FROM movie;
 
 
 /*movies with budget greater than the minimum budget arranged by genre*/
  SELECT genre, COUNT(*) AS RowNum
  FROM movie
 WHERE budget > 1000000
 GROUP BY genre
 LIMIT 10;
 
 SELECT (SELECT SUM(budget) FROM movie) AS TotalBudget 
 FROM movie;
 
 /*budget for each genre and the total budget for all genre, this shows that documentary have the least total budget*/
SELECT genre, SUM(budget) AS BudgetSum, (SELECT SUM(budget) FROM movie) AS TotalBudget 
 FROM movie
 GROUP BY genre
 ORDER BY BudgetSum;
 
 /*percentage net profit of all movies arranged in descending order*/
 SELECT movietitle, ROUND((revenue-budget)/revenue*100.0,2) AS NetProfit
 FROM movie
 ORDER BY NetProfit DESC;