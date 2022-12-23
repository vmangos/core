DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221223093116');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221223093116');
-- Add your query below.

DELETE FROM `creature_ai_events` WHERE `creature_id`=10596;
DELETE FROM `creature_ai_scripts` WHERE `id`=1059603;

UPDATE `creature_template` SET `ai_name` = '', `script_name`='boss_mother_smolderweb' WHERE `entry`=10596;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
