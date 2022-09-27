DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220925022431');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220925022431');
-- Add your query below.

-- Set Mulgore, Red Cloud Mesa GY for Brambleblade Ravine
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (34, 358, 67, 0);

-- Condition to return false if quest 769 is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (769, 8, 769, 0, 0, 0, 1);

-- Quest 769 (Kodo Hide Bag) requires a Leatherworking skill of 10 instead of 1, should not be available if it has already been completed.
UPDATE `quest_template` SET `RequiredSkillValue` = 10, `RequiredCondition` = 769 WHERE `entry` = 769;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
