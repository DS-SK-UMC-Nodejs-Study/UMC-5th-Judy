CREATE TABLE `user` (
	`id`	bigint	NOT NULL,
	`name`	varchar(20)	NOT NULL,
	`gender`	varchar(10)	NULL,
	`birth`	datetime	NOT NULL,
	`address`	varchar(100)	NOT NULL,
	`created_at`	datetime(6)	NOT NULL,
	`updated_at`	datetime(6)	NOT NULL,
	`email`	varchar(20)	NULL,
	`phone_number`	varchar(20)	NULL,
	`nickname`	varchar(20)	NOT NULL,
	`point`	bigint	NOT NULL,
	`status`	varchar(15)	NOT NULL,
	`inactive_date`	datetime	NULL,
	`profile_image`	varchar(100)	NULL
);
ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`id`
);

CREATE TABLE `mission` (
	`id`	bigint	NOT NULL,
	`store_id`	bigint	NOT NULL,
	`content`	varchar(50)	NOT NULL,
	`point`	bigint	NOT NULL
);
ALTER TABLE `mission` ADD CONSTRAINT `PK_MISSION` PRIMARY KEY (
	`id`
);

CREATE TABLE `my_mission` (
	`id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`mission_id`	bigint	NOT NULL,
	`status`	varchar(15)	NOT NULL,	-- 진행중/진행완료
	`number`	bigint	NOT NULL,
	`created_at`	datetime(6)	NOT NULL
);
ALTER TABLE `my_mission` ADD CONSTRAINT `PK_MY_MISSION` PRIMARY KEY (
	`id`
);

CREATE TABLE `store` (
	`id`	bigint	NOT NULL,
	`food_category_id`	bigint	NOT NULL,
	`name`	varchar(20)	NOT NULL,
	`status`	varchar(20)	NOT NULL,	-- 영업중/영업 종료
	`star_rating`	decimal	NOT NULL,
	`address`	varchar(20)	NOT NULL,
	`dong`	varchar(10)	NOT NULL
);
ALTER TABLE `store` ADD CONSTRAINT `PK_STORE` PRIMARY KEY (
	`id`
);

CREATE TABLE `review` (
	`id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`store_id`	bigint	NOT NULL,
	`star_rating`	decimal	NOT NULL,
	`content`	varchar(100)	NOT NULL
);
ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`id`
);

CREATE TABLE `review_image` (
	`id`	bigint	NOT NULL,
	`review_id`	bigint	NOT NULL,
	`image`	varchar(100)	NULL
);
ALTER TABLE `review_image` ADD CONSTRAINT `PK_REVIEW_IMAGE` PRIMARY KEY (
	`id`
);

CREATE TABLE `food_category` (
	`id`	bigint	NOT NULL,
	`name`	varchar(20)	NOT NULL
);
ALTER TABLE `food_category` ADD CONSTRAINT `PK_FOOD_CATEGORY` PRIMARY KEY (
	`id`
);

CREATE TABLE `user_food_category` (
	`id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`foor_category_id`	bigint	NOT NULL
);
ALTER TABLE `user_food_category` ADD CONSTRAINT `PK_USER_FOOD_CATEGORY` PRIMARY KEY (
	`id`
);

ALTER TABLE `mission` ADD CONSTRAINT `FK_store_TO_mission_1` FOREIGN KEY (
	`store_id`
)
REFERENCES `store` (
	`id`
);

ALTER TABLE `my_mission` ADD CONSTRAINT `FK_user_TO_my_mission_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`id`
);

ALTER TABLE `my_mission` ADD CONSTRAINT `FK_mission_TO_my_mission_1` FOREIGN KEY (
	`mission_id`
)
REFERENCES `mission` (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_user_TO_review_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_store_TO_review_1` FOREIGN KEY (
	`store_id`
)
REFERENCES `store` (
	`id`
);

ALTER TABLE `review_image` ADD CONSTRAINT `FK_review_TO_review_image_1` FOREIGN KEY (
	`review_id`
)
REFERENCES `review` (
	`id`
);

ALTER TABLE `store` ADD CONSTRAINT `FK_food_category_TO_store_1` FOREIGN KEY (
	`food_category_id`
)
REFERENCES `food_category` (
	`id`
);

ALTER TABLE `user_food_category` ADD CONSTRAINT `FK_user_TO_user_food_category_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`id`
);

ALTER TABLE `user_food_category` ADD CONSTRAINT `FK_food_category_TO_user_food_category_1` FOREIGN KEY (
	`foor_category_id`
)
REFERENCES `food_category` (
	`id`
);

