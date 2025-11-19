-- Create FrequentFlyerView
-- This view identifies passengers who have made 2 or more reservations
-- Attributes: passengerID, passengerName, totalReservations, totalSpent

CREATE VIEW FrequentFlyerView AS
SELECT 
    p.passengerID,
    p.passengerName,
    COUNT(r.reservationID) AS totalReservations,
    SUM(r.ticketPrice) AS totalSpent
FROM 
    Passenger p
    INNER JOIN Reservation r ON p.passengerID = r.passengerID
GROUP BY 
    p.passengerID, p.passengerName
HAVING 
    COUNT(r.reservationID) >= 2;

