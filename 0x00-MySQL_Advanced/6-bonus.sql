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

    IF @test < 0 THEN
        INSERT INTO projects (name) VALUES (project_name);
    END IF;
    
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, (SELECT id FROM projects WHERE name = project_name), score);
END //

DELIMITER ;