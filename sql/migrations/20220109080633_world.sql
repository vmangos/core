DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220109080633');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220109080633');
-- Add your query below.


-- Correct drop chance of Wavethrasher Scales.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-20 WHERE `item`=20087 && `entry`=6347;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=20087 && `entry`=6348;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-10 WHERE `item`=20087 && `entry`=6349;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
