-- Add General Constraints (CHECK constraints) to Lab3 schema

-- 1. Airport: numRunways must be greater than zero
ALTER TABLE Airport
ADD CONSTRAINT airportRunwaysPositive
CHECK (numRunways > 0);

-- 2. Flight: aircraftType must be one of the valid types or NULL
ALTER TABLE Flight
ADD CONSTRAINT validAircraftType
CHECK (aircraftType IS NULL OR aircraftType IN ('Boeing 737', 'Airbus A320', 'Boeing 777', 'Airbus A380'));

-- 3. Reservation: If ticketPrice is NULL, then paymentMethod must also be NULL
-- Logic: (ticketPrice IS NOT NULL) OR (paymentMethod IS NULL)
-- This ensures that if price is NULL, method must be NULL; but if price is not NULL, method can be anything
ALTER TABLE Reservation
ADD CONSTRAINT ifNullPriceThenNullMethod
CHECK ((ticketPrice IS NOT NULL) OR (paymentMethod IS NULL));

