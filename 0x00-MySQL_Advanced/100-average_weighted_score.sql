-- Compute Average score
DELIMITER **
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN user_id INT)
BEGIN
    DECLARE a_score FLOAT DEFAULT 0;
    SELECT SUM(projects.weight * corrections.score) / SUM(projects.weight) INTO a_score
    FROM corrections INNER JOIN projects
    ON corrections.project_id = projects.id
    WHERE corrections.user_id = user_id;

    UPDATE users
    SET users.average_score = a_score
    WHERE users.id = user_id;
END **
DELIMITER ;