DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181107143613');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181107143613');
-- Add your query below.


-- Fix spawning Urok Doomhowl.
DELETE FROM `event_scripts` WHERE `id`=4845;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4845, 0, 76, 175584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -13.8113, -396.202, 48.536, 3.0208, 0, 'Challenge to Urok - Summon GameObject Challenge to Urok');
UPDATE `gameobject` SET `spawntimesecsmin`=3600000, `spawntimesecsmax`=3600000 WHERE `guid`=324139;
UPDATE `gameobject_template` SET `ScriptName`='' WHERE `entry`=175621;
UPDATE `spell_script_target` SET `conditionId`=122 WHERE `entry`=16447;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
