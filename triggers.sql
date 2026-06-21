
-- perform actions before / after table insert / update / delete --


DELIMITER $$
CREATE TRIGGER must_be_adult
	BEFORE INSERT 
    ON users 
    FOR EACH ROW 
    BEGIN
		IF NEW.age < 18
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Must be an Adult!';
        END IF;
    END;
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER follow_same_user
	BEFORE INSERT 
    ON follows 
    FOR EACH ROW 
    BEGIN
		IF NEW.follower_id = NEW.followee_id
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Self follow not allowed!';
        END IF;
    END;
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER capture_unfollow
	AFTER DELETE 
    ON follows 
    FOR EACH ROW 
    BEGIN
		INSERT INTO unfollows(follower_id, followee.id) 
        values
			(OLD.follower_id, OLD.followee_id);
    END;
$$
DELIMITER ;


use sqldb;

show triggers;

drop trigger trigger_name;