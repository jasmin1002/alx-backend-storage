-- Compute Average score
DELIMITER **
CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
    DECLARE a_score FLOAT DEFAULT 0;
    SELECT AVG(score) INTO a_score FROM corrections WHERE corrections.user_id = user_id;
    UPDATE users
    SET users.average_score = a_score
    WHERE users.id = user_id;
END **
DELIMITER ;