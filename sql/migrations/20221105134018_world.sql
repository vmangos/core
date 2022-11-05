DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221105134018');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221105134018');
-- Add your query below.

-- https://www.wowhead.com/tbc/quest=8388/for-great-honor
DELETE FROM `creature_questrelation` WHERE `quest`=8388;
DELETE FROM `quest_template` WHERE `entry`=8388;

-- https://www.wowhead.com/tbc/quest=8367/for-great-honor
DELETE FROM `creature_questrelation` WHERE `quest`=8367;
DELETE FROM `quest_template` WHERE `entry`=8367;

-- https://www.wowhead.com/tbc/quest=8371/concerted-efforts
DELETE FROM `creature_questrelation` WHERE `quest`=8371;
DELETE FROM `quest_template` WHERE `entry`=8371;

-- https://www.wowhead.com/tbc/quest=8385/concerted-efforts
DELETE FROM `creature_questrelation` WHERE `quest`=8385;
DELETE FROM `quest_template` WHERE `entry`=8385;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
