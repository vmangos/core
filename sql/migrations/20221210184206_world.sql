DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221210184206');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221210184206');
-- Add your query below.


-- Correct drop chance of Scarlet Belt.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=3 WHERE `item`=10329 && `entry`=4298;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `item`=10329 && `entry`=4295;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
