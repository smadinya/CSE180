-- Create index on Reservation table
-- Index on seatClass and ticketPrice columns (in that order)
-- This improves query performance when searching by these attributes

CREATE INDEX ReservationIndex ON Reservation(seatClass, ticketPrice);

