USE Test_BD;

/*
14.

SELECT x, y
	INTO #Black_King_Coordinate
FROM Chessboard JOIN Chessmen ON Chessboard.fId = Chessmen.fId
WHERE (Chessmen.fColor = 'black') AND (Chessmen.fType = 'king');

SELECT fId
FROM Chessboard CROSS JOIN #Black_King_Coordinate king
WHERE (ABS(unicode(Chessboard.x)-unicode(king.x)) < 3) AND (ABS(Chessboard.y - king.y) < 3);

*/

/*
15.

SELECT x, y
	INTO #White_King_Coordinate1
FROM Chessboard JOIN Chessmen ON Chessboard.fId = Chessmen.fId
WHERE Chessmen.fColor = 'white' AND Chessmen.fType = 'king';

SELECT ABS(unicode(Chessboard.x) - unicode(#White_King_Coordinate1.x)) + ABS (Chessboard.y - #White_King_Coordinate1.y) AS distance
	INTO #Distance1
FROM Chessmen JOIN Chessboard ON Chessmen.fId = Chessboard.fId
CROSS JOIN #White_King_Coordinate1
WHERE NOT (Chessmen.fColor = 'white' AND Chessmen.fType = 'king')

SELECT Chessmen.*
FROM Chessmen JOIN Chessboard ON Chessmen.fId = Chessboard.fId
CROSS JOIN #White_King_Coordinate1 wking
WHERE ABS(unicode(Chessboard.x) - unicode(wking.x)) + ABS (Chessboard.y - wking.y) = 
(SELECT MIN(distance) FROM #Distance1)

*/

/*
16.

SELECT Chessboard.*, Chessmen.fColor
	INTO #ROOK1
FROM Chessboard JOIN Chessmen ON Chessboard.fId = Chessmen.fId
WHERE Chessboard.fId = 5;

SELECT Chessboard.x, Chessboard.y, Chessmen.*
	INTO #CANDIDATE1
FROM Chessboard JOIN Chessmen ON Chessboard.fId = Chessmen.fId
WHERE (Chessboard.x IN (SELECT x FROM #ROOK1) OR Chessboard.y IN (SELECT y FROM #ROOK1)) AND
( NOT (Chessmen.fColor IN (SELECT fColor FROM #ROOK1)) )

SELECT MIN(unicode(#ROOK1.x) - unicode(#CANDIDATE1.x)) AS dist
	INTO #H_LEFT
FROM #CANDIDATE1 CROSS JOIN #ROOK1
WHERE #ROOK1.x > #CANDIDATE1.x;

SELECT MIN(unicode(#CANDIDATE1.x) - unicode(#ROOK1.x)) AS dist
	INTO #H_RIGHT
FROM #CANDIDATE1 CROSS JOIN #ROOK1
WHERE #ROOK1.x < #CANDIDATE1.x;

SELECT MIN(#CANDIDATE1.y - #ROOK1.y) AS dist
	INTO #V_UP
FROM #CANDIDATE1 CROSS JOIN #ROOK1
WHERE #CANDIDATE1.y > #ROOK1.y;

SELECT MIN(#ROOK1.y - #CANDIDATE1.y) AS dist
	INTO #V_DOWN
FROM #CANDIDATE1 CROSS JOIN #ROOK1
WHERE #CANDIDATE1.y < #ROOK1.y;


SELECT #CANDIDATE1.*
	FROM #CANDIDATE1 CROSS JOIN #ROOK1
WHERE 
((#CANDIDATE1.x < #ROOK1.x) AND ((unicode(#ROOK1.x) - unicode(#CANDIDATE1.x)) IN (SELECT * FROM #H_LEFT)))
OR
((#CANDIDATE1.x > #ROOK1.x) AND  ((unicode(#CANDIDATE1.x)-unicode(#ROOK1.x))  IN (SELECT * FROM #H_RIGHT)))
OR
((#CANDIDATE1.y > #ROOK1.y) AND ((#CANDIDATE1.y - #ROOK1.y) IN (SELECT * FROM #V_UP)))
OR
((#CANDIDATE1.y < #ROOK1.y) AND ((#ROOK1.y - #CANDIDATE1.y) IN (SELECT * FROM #V_DOWN)))

*/

