DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220617125040');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220617125040');
-- Add your query below.

-- Remove effect mod of Haunting Spirits which caused to many ticks
DELETE FROM `spell_effect_mod` WHERE `Id`=7057;

-- Remove (money) loot from Haunting Spirits, Wrath Phantom, Spiteful Phantom
UPDATE `creature_template` SET `gold_min`=0,`gold_max`=0 WHERE `entry` IN(4958,10388,10389);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
