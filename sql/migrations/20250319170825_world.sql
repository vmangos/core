DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250319170825');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250319170825');
-- Add your query below.


-- Inserted 2 new target types after TARGET_T_HOSTILE_RANDOM_NOT_TOP (5).
UPDATE `creature_ai_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
UPDATE `creature_movement_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
UPDATE `creature_spells_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
UPDATE `event_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
UPDATE `generic_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
UPDATE `gossip_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
UPDATE `gameobject_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
UPDATE `spell_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
UPDATE `quest_end_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
UPDATE `quest_start_scripts` SET `target_type`=`target_type`+2 WHERE `target_type`>5;
-- SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (10)
UPDATE `creature_ai_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
UPDATE `creature_movement_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
UPDATE `creature_spells_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
UPDATE `event_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
UPDATE `generic_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
UPDATE `gossip_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
UPDATE `gameobject_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
UPDATE `spell_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
UPDATE `quest_end_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
UPDATE `quest_start_scripts` SET `dataint3`=`dataint3`+2 WHERE `dataint3`>5 && `command`=10;
-- SCRIPT_COMMAND_MODIFY_THREAT (29)
UPDATE `creature_ai_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
UPDATE `creature_movement_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
UPDATE `creature_spells_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
UPDATE `event_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
UPDATE `generic_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
UPDATE `gossip_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
UPDATE `gameobject_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
UPDATE `spell_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
UPDATE `quest_end_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
UPDATE `quest_start_scripts` SET `datalong`=`datalong`+2 WHERE `datalong`>5 && `command`=29;
-- Spell list targets.
UPDATE `creature_spells` SET `castTarget_1`=`castTarget_1`+2 WHERE `castTarget_1`>5;
UPDATE `creature_spells` SET `castTarget_2`=`castTarget_2`+2 WHERE `castTarget_2`>5;
UPDATE `creature_spells` SET `castTarget_3`=`castTarget_3`+2 WHERE `castTarget_3`>5;
UPDATE `creature_spells` SET `castTarget_4`=`castTarget_4`+2 WHERE `castTarget_4`>5;
UPDATE `creature_spells` SET `castTarget_5`=`castTarget_5`+2 WHERE `castTarget_5`>5;
UPDATE `creature_spells` SET `castTarget_6`=`castTarget_6`+2 WHERE `castTarget_6`>5;
UPDATE `creature_spells` SET `castTarget_7`=`castTarget_7`+2 WHERE `castTarget_7`>5;
UPDATE `creature_spells` SET `castTarget_8`=`castTarget_8`+2 WHERE `castTarget_8`>5;

-- Venom Stalker
DELETE FROM `creature_ai_scripts` WHERE `id`=1597601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1597601, 0, 0, 15, 28431, 0, 0, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 'Venom Stalker - Cast Poison Charge');
-- Necro Stalker
DELETE FROM `creature_ai_scripts` WHERE `id`=1645301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1645301, 0, 0, 15, 28431, 0, 0, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 'Necro Stalker - Cast Poison Charge');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
