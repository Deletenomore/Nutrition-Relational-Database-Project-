-- Subquery
-- Return the essentailly daily amount of beef if a person is 28 years old.
SELECT
age,
gender,
food_name,
people_daily_nutrition.protein * (food_nutrition.food_measurement/food_nutrition.protein) as amount,
measurement_unit
FROM  ( people NATURAL JOIN people_daily_nutrition NATURAL JOIN people_calorie_level) CROSS JOIN (food NATURAL JOIN food_nutrition)
WHERE age = 28 AND food_name = 'beef';


-- Aggregation Query
-- Return the number of food items grouped by the food group name
SELECT
count(food_id) AS the_food_items_count,
food_group_name
FROM food NATURAL JOIN food_group
GROUP BY food_group_name
ORDER BY count(food_id) asc;


-- Create Triggers for the table before Insertion Operation
-- Trigger for assigning a new primary key for a new tuple for the table "food"
delimiter //
CREATE TRIGGER food_id_creator
BEFORE INSERT ON food
FOR EACH ROW
BEGIN
	DECLARE newID INT;
	IF NOT EXISTS(SELECT food_id FROM Food WHERE Food_ID = new.Food_ID) THEN
		SELECT MAX(food_ID)+1 INTO newID from Food;
		SET NEW.Food_ID = newID;
	END IF;
END;//
delimiter ;
-- -- --

-- Trigger for assigning a new primary key for a new tuple for the table "people"
delimiter //
CREATE TRIGGER people_ID_Creator
BEFORE INSERT ON people
FOR EACH ROW
BEGIN
	DECLARE pid INT;
	IF NOT EXISTS(SELECT people_id FROM people WHERE people_id = new.people_id) THEN
		SELECT MAX(people_id)+1 INTO pid from people;
		SET NEW.people_id = pid;
	END IF;
END;//
delimiter ;
-- -- --


-- Trigger for assigning a new primary key for a new tuple for the table "food_group"
delimiter //
CREATE TRIGGER foodGroup_ID_Creator
BEFORE INSERT ON food_group
FOR EACH ROW
BEGIN
	DECLARE tempID INT;
	IF NOT EXISTS(SELECT food_group_id FROM food_group WHERE food_group_id = new.food_group_id) THEN
		SELECT MAX(food_group_id)+1 INTO tempID from food_group;
		SET NEW.food_group_id = tempID;
	END IF;
END;//
delimiter ;
-- -- --


-- Insertion Query
-- Insertion a new item into food table
INSERT INTO food VALUE (
	-1, 'Biscuits', 3010
);
SELECT*
FROM food 
WHERE food_name = 'Biscuits' ;

-- UPDATE Query
DELETE FROM food 
WHERE food_id= 1300;

SELECT*
FROM food 
WHERE food_name = 'Biscuits' ;




