DROP EVENT IF EXISTS remove_inactive_rooms_event;
CREATE EVENT remove_inactive_rooms_event
ON SCHEDULE EVERY 3 HOUR
DO CALL remove_inactive_rooms();