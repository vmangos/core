DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221117074037');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221117074037');
-- Add your query below.


-- Klaven's Tower - correct chance of key to -100
UPDATE `pickpocketing_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=7051 AND `item`=7923;

-- Update Lothos Riftwalker's involvedrelation
UPDATE `creature_involvedrelation` SET `patch_min`=3 WHERE `id`=14387 AND `quest`=7848;

-- Dark Iron Landmine
UPDATE `creature_ai_scripts` SET `datalong2`=3, `data_flags`=0 WHERE `id`=803504 AND `command`=15;

-- Ashenvale Outrunner: Fix unused EventAI
UPDATE `creature_template` SET `ai_name`="" WHERE `entry`=12856;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
