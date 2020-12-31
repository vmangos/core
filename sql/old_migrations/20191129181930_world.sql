DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191129181930');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191129181930');
-- Add your query below.


UPDATE `creature_template` SET `xp_multiplier`=0 WHERE `type`=8 && `entry` NOT IN (10441, 10461, 10536);
UPDATE `creature_template` SET `script_name`='' WHERE `script_name`='npc_critter';
UPDATE `creature_template` SET `ai_name`='ReactorAI' WHERE `entry`=2848;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
