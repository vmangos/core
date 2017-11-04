DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171014032713');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171014032713');
-- Add your query below.

-- Lethon Shade immune to AoE
UPDATE `creature_template` SET `minhealth`=1, `maxhealth`=1, `flags_extra`=`flags_extra` | 16384 WHERE `entry`=15261;

-- Nefarian Totems
UPDATE `creature_template` SET `flags_extra`=`flags_extra` | 16384 WHERE `entry` IN (14662,14663,14666,14664);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
