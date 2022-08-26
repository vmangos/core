DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220826180318');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220826180318');
-- Add your query below.

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-4 WHERE `item`=11129 AND `entry`=9026;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-3 WHERE `item`=11129 AND `entry`=8910;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-3 WHERE `item`=11129 AND `entry`=8905;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-2 WHERE `item`=11129 AND `entry`=8911;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-2 WHERE `item`=11129 AND `entry`=8909;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-2 WHERE `item`=11129 AND `entry`=8906;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-1.8 WHERE `item`=11129 AND `entry`=9025;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-1.6 WHERE `item`=11129 AND `entry`=9156;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-1.6 WHERE `item`=11129 AND `entry`=8908;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-1.3 WHERE `item`=11129 AND `entry`=8281;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-1 WHERE `item`=11129 AND `entry`=8923;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-0.5 WHERE `item`=11129 AND `entry`=9017;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
