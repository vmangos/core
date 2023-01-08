SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230104112356');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230104112356');
-- Add your query below.

UPDATE `gameobject_template` SET `faction`=114 WHERE `entry` IN (181853, 181852);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (32061, 1, 17690, 0, 0, 5086, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (32061, 1, 17689, 0, 0, 5086, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (32061, 1, 17696, 0, 0, 5086, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (32061, 1, 17698, 0, 0, 5086, 5875);

DELETE FROM `creature_movement_scripts` WHERE `id`=1803913;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1803913, 0, 0, 15, 24221, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Victory - Cast Spell Teleport Spawn-out'),
(1803913, 0, 0, 18, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Victory - Despawn');

UPDATE `creature_template` SET `spawn_spell_id`=17321 WHERE `entry`=18039;
UPDATE `creature_template` SET `auras`='16577' WHERE `entry`=10821;

-- End of migration.
END IF;
END??
delimiter ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
