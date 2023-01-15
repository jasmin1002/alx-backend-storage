-- Create procedure name AddBonus
DELIMITER //
CREATE PROCEDURE AddBonus (
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score FLOAT
)
BEGIN
    SET @test := -1;
    SELECT id INTO @test FROM projects WHERE name = project_name;
    select @test;

    IF @test > 0 THEN
        UPDATE corrections SET score = score
        WHERE user_id = user_id AND project_id = @test;
    ELSE
        INSERT INTO projects (name) VALUES (project_name);
        INSERT INTO corrections (user_id, project_id, score)
        VALUES (user_id, (SELECT id FROM projects WHERE name = project_name), score);
    END IF;
END //

DELIMITER ;