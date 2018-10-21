DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181013142221');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181013142221');
-- Add your query below.


-- Update old scripts to use new way of moving away on rooted target.
DELETE FROM `creature_ai_scripts` WHERE `id`=148701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (148701, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Splinter Fist Enslaver - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=242801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (242801, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Jailor Marlgen - Move Away from Target');
UPDATE `creature_ai_events` SET `event_type`=33, `event_param1`=10000, `event_param2`=10000, `event_param3`=0, `event_param4`=0 WHERE `id` IN (148701, 242801);
UPDATE `creature_ai_events` SET `event_type`=33, `event_param1`=`event_param3`, `event_param2`=`event_param4`, `event_param3`=0, `event_param4`=0 WHERE `id` IN (238705, 188901, 227601, 9503, 449402, 218401, 59901, 903801, 904103, 971702, 59601, 446001, 828301, 1373901, 1224202, 1373801, 1224302, 1188301, 1521301);
DELETE FROM `creature_ai_scripts` WHERE `id`=238705;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (238705, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Hillsbrad Councilman - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=188901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (188901, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Dalaran Wizard - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=227601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (227601, 0, 20, 18, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Magistrate Henry Maleb - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=9503;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9503, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Defias Smuggler - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=449402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (449402, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Scarlet Spellbinder - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=218401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (218401, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 2428, 'Lady Moongazer - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=59901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (59901, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Marisa du\'Paige - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=903801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (903801, 0, 20, 18, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Seeth\'rel - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=904103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (904103, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Warder Stilgiss - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=971702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (971702, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Bloodaxe Summoner - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=59601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (59601, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Brainwashed Noble - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=446001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (446001, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Murkgill Lord - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=828301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (828301, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Slave Master Blackheart - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=1373901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1373901, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Maraudos - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=1224202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1224202, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Spirit of Maraudos - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=1373801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1373801, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Veng - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=1224302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1224302, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Spirit of Veng - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=1188301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1188301, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Twilight Master - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=1521301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1521301, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Twilight Overlord - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=212003;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (212003, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 20792, 'Archmage Ataeric - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=212002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (212002, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Archmage Ataeric - Move Away from Target');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
