DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191126170010');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191126170010');
-- Add your query below.


-- Archbishop Benedictus should cast Power Word Fortitude on player after accepting quest Bring the Light.
DELETE FROM `quest_start_scripts` WHERE `id`=3636;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3636, 0, 15, 2791, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bring the Light: Archbishop Benedictus - Cast Power Word: Fortitude');
UPDATE `quest_template` SET `StartScript`=3636, `CompleteEmote`=0, `OfferRewardEmote1`=0, `OfferRewardEmote2`=0 WHERE `entry`=3636;

-- Brother Sarno should only greet players and should also do a wave emote.
DELETE FROM `creature_ai_events` WHERE `creature_id`=7917;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (791702, 7917, 85, 10, 0, 100, 1, 1, 20, 20000, 60000, 791702, 0, 0, 'Brother Sarno - Greet players on entering cathedral');
DELETE FROM `creature_ai_scripts` WHERE `id`=791702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (791702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3988, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Sarno - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (791702, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Sarno - Emote Wave');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
