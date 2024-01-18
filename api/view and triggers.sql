CREATE OR REPLACE VIEW faculty_data AS
SELECT a.faculty_name, b.workshop_id, b.workshop_name, b.interaction_type, b.duration, b.start_date, b.organized_by
FROM
fi_login a
INNER JOIN
faculty_interaction_info b
ON
a.unique_id = b.faculty_number


CREATE OR REPLACE VIEW workshop_organized_view AS
SELECT a.faculty_name, b.workshop_id, b.workshop_name, b.venue, b.year_conducted
FROM
fi_login a
INNER JOIN
workshop_organized b
ON
a.unique_id = b.faculty_number

DELIMITER $$
CREATE OR REPLACE TRIGGER attended_backup
BEFORE DELETE ON faculty_interaction_info
FOR EACH ROW
BEGIN
INSERT INTO faculty_interaction_info_backup
VALUES (OLD.workshop_id,OLD.faculty_number,OLD.workshop_name,OLD.interaction_type,OLD.duration,OLD.start_date,OLD.organized_by);
END;
$$

DELIMITER $$
CREATE OR REPLACE TRIGGER organized_backup
BEFORE DELETE ON workshop_organized
FOR EACH ROW
BEGIN
INSERT INTO workshop_organized_backup
VALUES (OLD.workshop_id,OLD.faculty_number,OLD.workshop_name,OLD.venue,OLD.year_conducted);
END;
$$

DELIMITER $$
CREATE OR REPLACE TRIGGER delete_teacher
BEFORE DELETE ON fi_login
FOR EACH ROW
BEGIN
DELETE FROM faculty_interaction_info
WHERE faculty_number = OLD.unique_id;
DELETE FROM workshop_organized
WHERE faculty_number = OLD.unique_id;
INSERT INTO fi_login_backup
VALUES (OLD.username,OLD.password,OLD.unique_id,OLD.faculty_name);
END;
$$


//restore attended workshop
BEGIN
DECLARE done INT default 0;
DECLARE workshop_id BIGINT(15);
DECLARE faculty_number INT(3);
DECLARE workshop_name VARCHAR(100);
DECLARE interaction_type VARCHAR(100);
DECLARE duration INT(2);
DECLARE start_date DATE;
DECLARE organized_by VARCHAR(100);
DECLARE myCur CURSOR for SELECT * FROM faculty_interaction_info_backup WHERE b_faculty_number=id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN myCur;
loop1:LOOP FETCH myCur INTO workshop_id,faculty_number,workshop_name,interaction_type,duration,start_date,organized_by;
IF done = 1 then LEAVE loop1;
END IF;
INSERT INTO faculty_interaction_info VALUES(workshop_id,faculty_number,workshop_name,interaction_type,duration,start_date,organized_by);
END LOOP;
DELETE FROM faculty_interaction_info_backup WHERE b_faculty_number=id;
END



//restore workshop organised
BEGIN
DECLARE done INT default 0;
DECLARE workshop_id BIGINT(15);
DECLARE faculty_number INT(3);
DECLARE workshop_name VARCHAR(100);
DECLARE venue VARCHAR(100);
DECLARE year_conducted VARCHAR(15);
DECLARE myCur CURSOR for SELECT * FROM workshop_organized_backup WHERE b_faculty_number=id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN myCur;
loop1:LOOP FETCH myCur INTO workshop_id,faculty_number,workshop_name,venue,year_conducted;
IF done = 1 then LEAVE loop1;
END IF;
INSERT INTO workshop_organized VALUES(workshop_id,faculty_number,workshop_name,venue,year_conducted);
END LOOP;
DELETE FROM workshop_organized_backup WHERE b_faculty_number=id;
END



//restore faculty
BEGIN
DECLARE done INT default 0;
DECLARE username VARCHAR(30);
DECLARE password VARCHAR(100);
DECLARE unique_id INT(4);
DECLARE faculty_name VARCHAR(30);
DECLARE myCur CURSOR for SELECT * FROM fi_login_backup WHERE b_unique_id=id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN myCur;
loop1:LOOP FETCH myCur INTO username,password,unique_id,faculty_name;
IF done = 1 then LEAVE loop1;
END IF;
INSERT INTO fi_login VALUES(username,password,unique_id,faculty_name);
END LOOP;
DELETE FROM fi_login_backup WHERE b_unique_id=id;
END