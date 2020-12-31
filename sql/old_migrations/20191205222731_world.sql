DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191205222731');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191205222731');
-- Add your query below.


-- Move localized faction texts to separate table.
CREATE TABLE IF NOT EXISTS `locales_faction` (
  `entry` int(10) unsigned NOT NULL,
  `name_loc1` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc2` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc3` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc4` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc5` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc6` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description_loc1` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description_loc2` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description_loc3` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description_loc4` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description_loc5` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description_loc6` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `locales_faction` SELECT `id`, `name2`, `name3`, `name4`, `name5`, `name6`, `name7`, `description2`, `description3`, `description4`, `description5`, `description6`, `description7` FROM `faction` WHERE `build`=5875;

ALTER TABLE `faction`
	CHANGE COLUMN `name1` `name` VARCHAR(256) NOT NULL DEFAULT '' COLLATE 'utf8_unicode_ci' AFTER `team`,
	CHANGE COLUMN `description1` `description` VARCHAR(512) NOT NULL DEFAULT '' COLLATE 'utf8_unicode_ci' AFTER `name`,
	DROP COLUMN `name2`,
	DROP COLUMN `name3`,
	DROP COLUMN `name4`,
	DROP COLUMN `name5`,
	DROP COLUMN `name6`,
	DROP COLUMN `name7`,
	DROP COLUMN `name8`,
	DROP COLUMN `description2`,
	DROP COLUMN `description3`,
	DROP COLUMN `description4`,
	DROP COLUMN `description5`,
	DROP COLUMN `description6`,
	DROP COLUMN `description7`,
	DROP COLUMN `description8`;

DELETE FROM `faction` WHERE `id`=1 && `build`=5875;
DELETE FROM `faction` WHERE `id`=2 && `build`=5875;
DELETE FROM `faction` WHERE `id`=3 && `build`=5875;
DELETE FROM `faction` WHERE `id`=4 && `build`=5875;
DELETE FROM `faction` WHERE `id`=5 && `build`=5875;
DELETE FROM `faction` WHERE `id`=6 && `build`=5875;
DELETE FROM `faction` WHERE `id`=7 && `build`=5875;
DELETE FROM `faction` WHERE `id`=8 && `build`=5875;
DELETE FROM `faction` WHERE `id`=9 && `build`=5875;
DELETE FROM `faction` WHERE `id`=14 && `build`=5875;
DELETE FROM `faction` WHERE `id`=15 && `build`=5875;
DELETE FROM `faction` WHERE `id`=16 && `build`=5875;
DELETE FROM `faction` WHERE `id`=17 && `build`=5875;
DELETE FROM `faction` WHERE `id`=18 && `build`=5875;
DELETE FROM `faction` WHERE `id`=19 && `build`=5875;
DELETE FROM `faction` WHERE `id`=20 && `build`=5875;
DELETE FROM `faction` WHERE `id`=21 && `build`=5875;
DELETE FROM `faction` WHERE `id`=22 && `build`=5875;
DELETE FROM `faction` WHERE `id`=23 && `build`=5875;
DELETE FROM `faction` WHERE `id`=24 && `build`=5875;
DELETE FROM `faction` WHERE `id`=25 && `build`=5875;
DELETE FROM `faction` WHERE `id`=26 && `build`=5875;
DELETE FROM `faction` WHERE `id`=27 && `build`=5875;
DELETE FROM `faction` WHERE `id`=28 && `build`=5875;
DELETE FROM `faction` WHERE `id`=29 && `build`=5875;
DELETE FROM `faction` WHERE `id`=30 && `build`=5875;
DELETE FROM `faction` WHERE `id`=31 && `build`=5875;
DELETE FROM `faction` WHERE `id`=32 && `build`=5875;
DELETE FROM `faction` WHERE `id`=33 && `build`=5875;
DELETE FROM `faction` WHERE `id`=34 && `build`=5875;
DELETE FROM `faction` WHERE `id`=35 && `build`=5875;
DELETE FROM `faction` WHERE `id`=36 && `build`=5875;
DELETE FROM `faction` WHERE `id`=37 && `build`=5875;
DELETE FROM `faction` WHERE `id`=38 && `build`=5875;
DELETE FROM `faction` WHERE `id`=39 && `build`=5875;
DELETE FROM `faction` WHERE `id`=40 && `build`=5875;
DELETE FROM `faction` WHERE `id`=41 && `build`=5875;
DELETE FROM `faction` WHERE `id`=42 && `build`=5875;
DELETE FROM `faction` WHERE `id`=43 && `build`=5875;
DELETE FROM `faction` WHERE `id`=44 && `build`=5875;
DELETE FROM `faction` WHERE `id`=45 && `build`=5875;
DELETE FROM `faction` WHERE `id`=46 && `build`=5875;
DELETE FROM `faction` WHERE `id`=47 && `build`=5875;
DELETE FROM `faction` WHERE `id`=48 && `build`=5875;
DELETE FROM `faction` WHERE `id`=49 && `build`=5875;
DELETE FROM `faction` WHERE `id`=50 && `build`=5875;
DELETE FROM `faction` WHERE `id`=51 && `build`=5875;
DELETE FROM `faction` WHERE `id`=52 && `build`=5875;
DELETE FROM `faction` WHERE `id`=53 && `build`=5875;
DELETE FROM `faction` WHERE `id`=54 && `build`=5875;
DELETE FROM `faction` WHERE `id`=55 && `build`=5875;
DELETE FROM `faction` WHERE `id`=56 && `build`=5875;
DELETE FROM `faction` WHERE `id`=57 && `build`=5875;
DELETE FROM `faction` WHERE `id`=58 && `build`=5875;
DELETE FROM `faction` WHERE `id`=59 && `build`=5875;
DELETE FROM `faction` WHERE `id`=60 && `build`=5875;
DELETE FROM `faction` WHERE `id`=61 && `build`=5875;
DELETE FROM `faction` WHERE `id`=62 && `build`=5875;
DELETE FROM `faction` WHERE `id`=63 && `build`=5875;
DELETE FROM `faction` WHERE `id`=64 && `build`=5875;
DELETE FROM `faction` WHERE `id`=65 && `build`=5875;
DELETE FROM `faction` WHERE `id`=66 && `build`=5875;
DELETE FROM `faction` WHERE `id`=67 && `build`=5875;
DELETE FROM `faction` WHERE `id`=68 && `build`=5875;
DELETE FROM `faction` WHERE `id`=69 && `build`=5875;
DELETE FROM `faction` WHERE `id`=70 && `build`=5875;
DELETE FROM `faction` WHERE `id`=71 && `build`=5875;
DELETE FROM `faction` WHERE `id`=72 && `build`=5875;
DELETE FROM `faction` WHERE `id`=73 && `build`=5875;
DELETE FROM `faction` WHERE `id`=74 && `build`=5875;
DELETE FROM `faction` WHERE `id`=75 && `build`=5875;
DELETE FROM `faction` WHERE `id`=76 && `build`=5875;
DELETE FROM `faction` WHERE `id`=77 && `build`=5875;
DELETE FROM `faction` WHERE `id`=78 && `build`=5875;
DELETE FROM `faction` WHERE `id`=79 && `build`=5875;
DELETE FROM `faction` WHERE `id`=80 && `build`=5875;
DELETE FROM `faction` WHERE `id`=81 && `build`=5875;
DELETE FROM `faction` WHERE `id`=82 && `build`=5875;
DELETE FROM `faction` WHERE `id`=83 && `build`=5875;
DELETE FROM `faction` WHERE `id`=84 && `build`=5875;
DELETE FROM `faction` WHERE `id`=85 && `build`=5875;
DELETE FROM `faction` WHERE `id`=86 && `build`=5875;
DELETE FROM `faction` WHERE `id`=87 && `build`=5875;
DELETE FROM `faction` WHERE `id`=88 && `build`=5875;
DELETE FROM `faction` WHERE `id`=89 && `build`=5875;
DELETE FROM `faction` WHERE `id`=90 && `build`=5875;
DELETE FROM `faction` WHERE `id`=91 && `build`=5875;
DELETE FROM `faction` WHERE `id`=92 && `build`=5875;
DELETE FROM `faction` WHERE `id`=93 && `build`=5875;
DELETE FROM `faction` WHERE `id`=94 && `build`=5875;
DELETE FROM `faction` WHERE `id`=108 && `build`=5875;
DELETE FROM `faction` WHERE `id`=109 && `build`=5875;
DELETE FROM `faction` WHERE `id`=110 && `build`=5875;
DELETE FROM `faction` WHERE `id`=111 && `build`=5875;
DELETE FROM `faction` WHERE `id`=128 && `build`=5875;
DELETE FROM `faction` WHERE `id`=148 && `build`=5875;
DELETE FROM `faction` WHERE `id`=168 && `build`=5875;
DELETE FROM `faction` WHERE `id`=169 && `build`=5875;
DELETE FROM `faction` WHERE `id`=189 && `build`=5875;
DELETE FROM `faction` WHERE `id`=209 && `build`=5875;
DELETE FROM `faction` WHERE `id`=229 && `build`=5875;
DELETE FROM `faction` WHERE `id`=249 && `build`=5875;
DELETE FROM `faction` WHERE `id`=269 && `build`=5875;
DELETE FROM `faction` WHERE `id`=270 && `build`=5875;
DELETE FROM `faction` WHERE `id`=289 && `build`=5875;
DELETE FROM `faction` WHERE `id`=309 && `build`=5875;
DELETE FROM `faction` WHERE `id`=310 && `build`=5875;
DELETE FROM `faction` WHERE `id`=311 && `build`=5875;
DELETE FROM `faction` WHERE `id`=329 && `build`=5875;
DELETE FROM `faction` WHERE `id`=349 && `build`=5875;
DELETE FROM `faction` WHERE `id`=369 && `build`=5875;
DELETE FROM `faction` WHERE `id`=389 && `build`=5875;
DELETE FROM `faction` WHERE `id`=409 && `build`=5875;
DELETE FROM `faction` WHERE `id`=429 && `build`=5875;
DELETE FROM `faction` WHERE `id`=449 && `build`=5875;
DELETE FROM `faction` WHERE `id`=450 && `build`=5875;
DELETE FROM `faction` WHERE `id`=469 && `build`=5875;
DELETE FROM `faction` WHERE `id`=470 && `build`=5875;
DELETE FROM `faction` WHERE `id`=471 && `build`=5875;
DELETE FROM `faction` WHERE `id`=489 && `build`=5875;
DELETE FROM `faction` WHERE `id`=509 && `build`=5875;
DELETE FROM `faction` WHERE `id`=510 && `build`=5875;
DELETE FROM `faction` WHERE `id`=511 && `build`=5875;
DELETE FROM `faction` WHERE `id`=529 && `build`=5875;
DELETE FROM `faction` WHERE `id`=530 && `build`=5875;
DELETE FROM `faction` WHERE `id`=531 && `build`=5875;
DELETE FROM `faction` WHERE `id`=532 && `build`=5875;
DELETE FROM `faction` WHERE `id`=549 && `build`=5875;
DELETE FROM `faction` WHERE `id`=550 && `build`=5875;
DELETE FROM `faction` WHERE `id`=551 && `build`=5875;
DELETE FROM `faction` WHERE `id`=569 && `build`=5875;
DELETE FROM `faction` WHERE `id`=570 && `build`=5875;
DELETE FROM `faction` WHERE `id`=571 && `build`=5875;
DELETE FROM `faction` WHERE `id`=572 && `build`=5875;
DELETE FROM `faction` WHERE `id`=573 && `build`=5875;
DELETE FROM `faction` WHERE `id`=574 && `build`=5875;
DELETE FROM `faction` WHERE `id`=575 && `build`=5875;
DELETE FROM `faction` WHERE `id`=576 && `build`=5875;
DELETE FROM `faction` WHERE `id`=577 && `build`=5875;
DELETE FROM `faction` WHERE `id`=589 && `build`=5875;
DELETE FROM `faction` WHERE `id`=609 && `build`=5875;
DELETE FROM `faction` WHERE `id`=629 && `build`=5875;
DELETE FROM `faction` WHERE `id`=630 && `build`=5875;
DELETE FROM `faction` WHERE `id`=649 && `build`=5875;
DELETE FROM `faction` WHERE `id`=669 && `build`=5875;
DELETE FROM `faction` WHERE `id`=670 && `build`=5875;
DELETE FROM `faction` WHERE `id`=671 && `build`=5875;
DELETE FROM `faction` WHERE `id`=672 && `build`=5875;
DELETE FROM `faction` WHERE `id`=673 && `build`=5875;
DELETE FROM `faction` WHERE `id`=674 && `build`=5875;
DELETE FROM `faction` WHERE `id`=675 && `build`=5875;
DELETE FROM `faction` WHERE `id`=676 && `build`=5875;
DELETE FROM `faction` WHERE `id`=677 && `build`=5875;
DELETE FROM `faction` WHERE `id`=678 && `build`=5875;
DELETE FROM `faction` WHERE `id`=679 && `build`=5875;
DELETE FROM `faction` WHERE `id`=689 && `build`=5875;
DELETE FROM `faction` WHERE `id`=709 && `build`=5875;
DELETE FROM `faction` WHERE `id`=729 && `build`=5875;
DELETE FROM `faction` WHERE `id`=730 && `build`=5875;
DELETE FROM `faction` WHERE `id`=749 && `build`=5875;
DELETE FROM `faction` WHERE `id`=750 && `build`=5875;
DELETE FROM `faction` WHERE `id`=769 && `build`=5875;
DELETE FROM `faction` WHERE `id`=770 && `build`=5875;
DELETE FROM `faction` WHERE `id`=771 && `build`=5875;
DELETE FROM `faction` WHERE `id`=789 && `build`=5875;
DELETE FROM `faction` WHERE `id`=790 && `build`=5875;
DELETE FROM `faction` WHERE `id`=809 && `build`=5875;
DELETE FROM `faction` WHERE `id`=829 && `build`=5875;
DELETE FROM `faction` WHERE `id`=849 && `build`=5875;
DELETE FROM `faction` WHERE `id`=869 && `build`=5875;
DELETE FROM `faction` WHERE `id`=889 && `build`=5875;
DELETE FROM `faction` WHERE `id`=890 && `build`=5875;
DELETE FROM `faction` WHERE `id`=891 && `build`=5875;
DELETE FROM `faction` WHERE `id`=892 && `build`=5875;
DELETE FROM `faction` WHERE `id`=893 && `build`=5875;
DELETE FROM `faction` WHERE `id`=909 && `build`=5875;
DELETE FROM `faction` WHERE `id`=910 && `build`=5875;
DELETE FROM `faction` WHERE `id`=912 && `build`=5875;
DELETE FROM `faction` WHERE `id`=915 && `build`=5875;
DELETE FROM `faction` WHERE `id`=916 && `build`=5875;
DELETE FROM `faction` WHERE `id`=917 && `build`=5875;
DELETE FROM `faction` WHERE `id`=918 && `build`=5875;
DELETE FROM `faction` WHERE `id`=919 && `build`=5875;
DELETE FROM `faction` WHERE `id`=920 && `build`=5875;
DELETE FROM `faction` WHERE `id`=921 && `build`=5875;
DELETE FROM `faction` WHERE `id`=928 && `build`=5875;
DELETE FROM `faction` WHERE `id`=931 && `build`=5875;

-- Move localized taxi node texts to separate table.
CREATE TABLE IF NOT EXISTS `locales_taxi_node` (
  `entry` int(10) unsigned NOT NULL,
  `name_loc1` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc2` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc3` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc4` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc5` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_loc6` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `locales_taxi_node` SELECT `id`, `name2`, `name3`, `name4`, `name5`, `name6`, `name7` FROM `taxi_nodes` WHERE `build`=5875;

ALTER TABLE `taxi_nodes`
	CHANGE COLUMN `name1` `name` VARCHAR(256) NOT NULL DEFAULT '' AFTER `z`,
	DROP COLUMN `name2`,
	DROP COLUMN `name3`,
	DROP COLUMN `name4`,
	DROP COLUMN `name5`,
	DROP COLUMN `name6`,
	DROP COLUMN `name7`,
	DROP COLUMN `name8`;

DELETE FROM `taxi_nodes` WHERE `id`=1 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=2 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=3 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=4 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=5 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=6 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=7 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=8 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=9 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=10 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=11 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=12 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=13 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=14 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=15 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=16 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=17 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=18 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=19 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=20 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=21 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=22 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=23 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=24 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=25 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=26 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=27 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=28 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=29 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=30 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=31 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=32 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=33 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=34 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=35 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=36 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=37 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=38 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=39 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=40 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=41 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=42 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=43 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=44 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=45 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=46 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=47 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=48 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=49 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=50 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=51 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=52 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=53 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=54 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=55 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=56 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=57 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=58 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=59 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=60 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=61 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=62 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=63 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=64 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=65 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=66 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=67 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=68 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=69 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=70 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=71 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=72 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=73 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=74 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=75 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=76 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=77 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=78 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=79 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=80 && `build`=5875;
DELETE FROM `taxi_nodes` WHERE `id`=81 && `build`=5875;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
