DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190115214718');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190115214718');
-- Add your query below.


-- Fix Earthgrab Totem not rooting enemies.
UPDATE `creature_template` SET `spell1`=8378, `AIName`='TotemAI', `ScriptName`='' WHERE `entry`=6066;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
