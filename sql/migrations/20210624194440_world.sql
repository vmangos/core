DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210624194440');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210624194440');
-- Add your query below.


-- Correct Barbs Aura Passive for Mudrock Spikeshell 4397 (credit cmangos)
UPDATE `creature_template` SET `auras` = '9464' WHERE `entry` = 4397;

-- Fix Creature Stuck Underground
UPDATE `creature` SET `position_z` = 79.5248 WHERE `guid` = 15226;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
