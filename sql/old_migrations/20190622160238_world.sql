DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190622160238');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190622160238');
-- Add your query below.


-- Fix previous quest required by Speak to Nafien.
UPDATE `quest_template` SET `PrevQuestId`=8460 WHERE `entry`=8462;

-- Fix previous quest required by Feathers for Grazle.
UPDATE `quest_template` SET `PrevQuestId`=8460 WHERE `entry`=8466;

-- Fix condition for Deadwood Headdress Feather.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (30, 8, 8460, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (31, -2, 11, 30, 0, 0, 0);
UPDATE `creature_loot_template` SET `condition_id`=31 WHERE `condition_id`=11;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
