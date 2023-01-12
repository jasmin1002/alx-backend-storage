-- Create trigger for email reset
DELIMITER $$

CREATE TRIGGER after_users_updated
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN

    IF NEW.email <> OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;

END $$

DELIMITER ;