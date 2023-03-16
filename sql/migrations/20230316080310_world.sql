DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230316080310');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230316080310');
-- Add your query below.


-- Remove custom copy of High Overlord Saurfang.
DELETE FROM `creature_template` WHERE `entry`=987000;
UPDATE `creature_template` SET `script_name`='npc_aqwar_saurfang' WHERE `entry`=14720;
UPDATE `creature` SET `id`=14720 WHERE `id`=987000;

-- Remove custom creature Faerlina RP.
DELETE FROM `creature_template` WHERE `entry`=533004;
DELETE FROM `creature` WHERE `id`=533004;
UPDATE `creature` SET `id`=15981 WHERE `guid`=302477;
UPDATE `creature` SET `id`=15980 WHERE `guid`=302478;
-- 15981: Source's Guid Is 302449 Or 302453 Or 302462 Or 302469
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15981, 52, 302449, 302453, 302462, 302469, 0);
-- 15982: Source's Guid Is 302477 Or 302489
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15982, 52, 302477, 302489, 0, 0, 0);
-- 15983: (15981: Source's Guid Is 302449 Or 302453 Or 302462 Or 302469) Or (15982: Source's Guid Is 302477 Or 302489)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15983, -2, 15981, 15982, 0, 0, 0);
-- Events list for Naxxramas Acolyte
DELETE FROM `creature_ai_events` WHERE `creature_id`=15981;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1598101, 15981, 15983, 1, 0, 100, 1, 5000, 10000, 30000, 60000, 1598101, 0, 0, 'Naxxramas Acolyte - Start RP Script on Group OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=1598101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1598101, 0, 0, 90, 15981, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Naxxramas Acolyte - Start Script on Group');
DELETE FROM `generic_scripts` WHERE `id`=15981;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(15981, 0, 0, 28, 8, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 117, 'Naxxramas Acolyte - Set Stand State to Kneel'),
(15981, 10, 0, 15, 21157, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 117, 'Naxxramas Acolyte - Cast Spell Dark Channeling'),
(15981, 11, 0, 28, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naxxramas Acolyte - Set Stand State to Standing'),
(15981, 21, 0, 14, 21157, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naxxramas Acolyte - Remove Aura Dark Channeling');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15981;

-- Remove custom creature Anub'Rekhan.
DELETE FROM `creature_template` WHERE `entry`=533003;

-- Remove custom creature Plague Cloud.
DELETE FROM `creature_template` WHERE `entry`=533002;



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
