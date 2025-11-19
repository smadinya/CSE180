-- Add Foreign Key Constraints to Lab3 schema
-- These constraints were intentionally omitted from create_lab3.sql

-- 1. Reservation.passengerID -> Passenger.passengerID
-- ON DELETE SET NULL: If passenger is deleted, set passengerID to NULL in Reservation
-- ON UPDATE CASCADE: If passengerID is updated, update all related Reservation tuples
ALTER TABLE Reservation
ADD CONSTRAINT fk_reservation_passenger
FOREIGN KEY (passengerID) REFERENCES Passenger(passengerID)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- 2. Reservation.flightID -> Flight.flightID
-- ON DELETE RESTRICT: Reject deletion of Flight if there are Reservation tuples
-- ON UPDATE CASCADE: If flightID is updated, update all related Reservation tuples
ALTER TABLE Reservation
ADD CONSTRAINT fk_reservation_flight
FOREIGN KEY (flightID) REFERENCES Flight(flightID)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- 3. CheckIn.reservationID -> Reservation.reservationID
-- ON DELETE CASCADE: If reservation is deleted, delete all related CheckIn tuples
-- ON UPDATE CASCADE: If reservationID is updated, update all related CheckIn tuples
ALTER TABLE CheckIn
ADD CONSTRAINT fk_checkin_reservation
FOREIGN KEY (reservationID) REFERENCES Reservation(reservationID)
ON DELETE CASCADE
ON UPDATE CASCADE;

