DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231203135355');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231203135355');
-- Add your query below.


-- Remove custom creature Burning Adrenaline Trigger. It does not seem to be used.
DELETE FROM `creature_template` WHERE `entry`=160016;

-- Assign spawn spell to Rookery Whelp.
UPDATE `creature_template` SET `spawn_spell_id`=15750 WHERE `entry`=10161;

-- Remove custom creature Rookery Whelp.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (16001501, 16001502);
DELETE FROM `creature_ai_events` WHERE `creature_id`=160015;
DELETE FROM `creature_template` WHERE `entry`=160015;

-- Remove custom creature Solakar Trigger.
DELETE FROM `creature_template` WHERE `entry`=160014;
DELETE FROM `creature` WHERE `id`=160014;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
