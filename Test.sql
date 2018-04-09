USE Test_BD;

/*
13.

Через UNION/EXCEPT/INTERSECT

SELECT *
	INTO #Chessboard4
FROM Chessboard
EXCEPT
SELECT *
FROM Chessboard2;

SELECT fId
FROM #Chessboard4;
 
 .............................
 За счет JOIN
 
 SELECT Chessboard.*, Chessboard2.fId AS CNT
	INTO #Chessboard_JOIN5
FROM Chessboard LEFT OUTER JOIN Chessboard2
ON (Chessboard.x = Chessboard2.x) AND (Chessboard.y = Chessboard2.y)
AND (Chessboard.fId = Chessboard2.fId);

SELECT fId
FROM #Chessboard_JOIN5
WHERE CNT IS NULL;

*/