DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220602091743');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220602091743');
-- Add your query below.

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-17 WHERE `item`=3916 AND `entry`=667;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-19 WHERE `item`=3916 AND `entry`=784;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-17 WHERE `item`=3916 AND `entry`=783;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-19 WHERE `item`=3916 AND `entry`=782;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-16 WHERE `item`=3916 AND `entry`=781;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `item`=3916 AND `entry`=780;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-17 WHERE `item`=3916 AND `entry`=696;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-17 WHERE `item`=3916 AND `entry`=672;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-18 WHERE `item`=3916 AND `entry`=670;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-18 WHERE `item`=3916 AND `entry`=669;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-13 WHERE `item`=3916 AND `entry`=1059;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
