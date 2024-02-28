CREATE TABLE people (
people_id int,
age	int,
gender varchar(255),
primary key(people_id)

);



CREATE TABLE people_daily_nutrition(
people_id int,
protein int,
fat int,
fiber int,
carbs int,
foreign key (people_id) references people(people_id)
);

CREATE TABLE food(
food_id int,
food_name varchar(400),
food_group_id int,
primary key(food_id),
foreign key (food_group_id) references food_group (food_group_id)
);



CREATE TABLE food_nutrition(
food_id int,
food_measurement int,
measurement_unit varchar(400),
calorie int,
protein int,
fat int,
fiber int,
carbs int,
foreign key (food_id) references food(food_id)
);

CREATE TABLE food_group(
	food_group_id int,
    food_group_name varchar(400),
    primary key(food_group_id)
);

CREATE TABLE people_calorie_level (
people_id int,
calorie_leve int,
foreign key (people_id) references people(people_id)
);

