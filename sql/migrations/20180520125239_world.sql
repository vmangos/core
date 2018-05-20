DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180520125239');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180520125239');
-- Add your query below.


-- Make Scarshield Portal use the proper spell Id for summoning Burning Felguard.
DELETE FROM `creature_ai_scripts` WHERE `id`=970703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (970703, 0, 15, 16004, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarshield Portal - Cast Summon Burning Felguard');

-- Prevent Burning Felguard from respawning and add equipment.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1026301);
DELETE FROM `creature_ai_events` WHERE `creature_id`=10263;
UPDATE `creature_template` SET `AIName`='', `equipment_id`=10263 WHERE `entry`=10263;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (10263, 10614, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
