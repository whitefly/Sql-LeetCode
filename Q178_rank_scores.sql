SELECT Score, (SELECT count(DISTINCT score) FROM Scores WHERE score >= s.score) AS Rank
FROM Scores s ORDER BY Score DESC ;