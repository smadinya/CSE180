-- Unit Tests for Lab3 Constraints
-- Tests verify that constraints are working correctly

-- ============================================
-- Foreign Key Constraint Tests (3 tests)
-- ============================================

-- Test 1: Violate FK constraint on Reservation.passengerID
-- This should fail because passengerID 999 does not exist in Passenger table
INSERT INTO Reservation (reservationID, passengerID, flightID, bookingDate, seatClass, ticketPrice, paymentMethod)
VALUES (999, 999, 1, CURRENT_DATE, 'E', 300.00, 'Credit Card');

-- Test 2: Violate FK constraint on Reservation.flightID
-- This should fail because flightID 999 does not exist in Flight table
INSERT INTO Reservation (reservationID, passengerID, flightID, bookingDate, seatClass, ticketPrice, paymentMethod)
VALUES (998, 1, 999, CURRENT_DATE, 'E', 300.00, 'Credit Card');

-- Test 3: Violate FK constraint on CheckIn.reservationID
-- This should fail because reservationID 999 does not exist in Reservation table
INSERT INTO CheckIn (reservationID, passengerID, checkInTime, bagCount, seatNumber)
VALUES (999, 1, CURRENT_TIMESTAMP, 1, '10A');

-- ============================================
-- General Constraint Tests (6 tests)
-- ============================================

-- Test 4: Valid UPDATE for airportRunwaysPositive constraint
-- This should succeed: numRunways = 5 > 0
UPDATE Airport
SET numRunways = 5
WHERE airportCode = 'LAX';

-- Test 5: Violate airportRunwaysPositive constraint
-- This should fail: numRunways = 0 is not > 0
UPDATE Airport
SET numRunways = 0
WHERE airportCode = 'LAX';

-- Test 6: Valid UPDATE for validAircraftType constraint
-- This should succeed: 'Boeing 737' is a valid aircraft type
UPDATE Flight
SET aircraftType = 'Boeing 737'
WHERE flightID = 5;

-- Test 7: Violate validAircraftType constraint
-- This should fail: 'Boeing 747' is not in the allowed list
UPDATE Flight
SET aircraftType = 'Boeing 747'
WHERE flightID = 1;

-- Test 8: Valid UPDATE for ifNullPriceThenNullMethod constraint
-- This should succeed: NULL ticketPrice with NULL paymentMethod is valid
UPDATE Reservation
SET ticketPrice = NULL, paymentMethod = NULL
WHERE reservationID = 1;

-- Test 9: Violate ifNullPriceThenNullMethod constraint
-- This should fail: NULL ticketPrice but non-NULL paymentMethod violates the constraint
UPDATE Reservation
SET ticketPrice = NULL, paymentMethod = 'Credit Card'
WHERE reservationID = 2;

