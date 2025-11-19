-- Combine data from UpdateReservation into Reservation table
-- If reservationID exists: UPDATE seatClass, ticketPrice, set paymentMethod to 'Credit Card'
-- If reservationID does not exist: INSERT new row with NULL passengerID/flightID, CURRENT_DATE bookingDate, 'Credit Card' paymentMethod

-- Update existing reservations
UPDATE Reservation r
SET 
    seatClass = u.seatClass,
    ticketPrice = u.ticketPrice,
    paymentMethod = 'Credit Card'
FROM UpdateReservation u
WHERE r.reservationID = u.reservationID;

-- Insert new reservations
INSERT INTO Reservation (reservationID, passengerID, flightID, bookingDate, seatClass, ticketPrice, paymentMethod)
SELECT 
    u.reservationID,
    NULL AS passengerID,
    NULL AS flightID,
    CURRENT_DATE AS bookingDate,
    u.seatClass,
    u.ticketPrice,
    'Credit Card' AS paymentMethod
FROM UpdateReservation u
WHERE NOT EXISTS (
    SELECT 1 
    FROM Reservation r 
    WHERE r.reservationID = u.reservationID
);

