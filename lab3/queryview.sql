-- FrequentFlyerSummary Query
-- Calculates the average amount spent per reservation for each frequent flyer
SELECT 
    passengerID,
    passengerName,
    totalReservations,
    (totalSpent / totalReservations) AS avgSpentPerReservation
FROM 
    FrequentFlyerView
ORDER BY 
    passengerID;

-- Output before deletion:
-- passengerid | passengername  | totalreservations | avgspentperreservation
-- -------------+----------------+-------------------+-----------------------
--            1 | Alice Smith    |                 3 |  440.0000000000000000
--            2 | Bob Johnson    |                 2 |  790.0000000000000000
--            3 | Charlie Brown  |                 2 | 1390.0000000000000000

-- Delete reservation with reservationID = 5
DELETE FROM Reservation
WHERE reservationID = 5;

-- FrequentFlyerSummary Query (after deletion)
SELECT 
    passengerID,
    passengerName,
    totalReservations,
    (totalSpent / totalReservations) AS avgSpentPerReservation
FROM 
    FrequentFlyerView
ORDER BY 
    passengerID;

-- Output after deletion:
-- passengerid | passengername  | totalreservations | avgspentperreservation
-- -------------+----------------+-------------------+-----------------------
--            1 | Alice Smith    |                 3 |  440.0000000000000000
--            2 | Bob Johnson    |                 2 |  790.0000000000000000
--
-- Note: After deleting reservationID 5, Charlie Brown now has only 1 reservation,
-- so he no longer appears in the FrequentFlyerView (since the view only shows
-- passengers with 2+ reservations). The view automatically updates to reflect
-- the current state of the Reservation table.

