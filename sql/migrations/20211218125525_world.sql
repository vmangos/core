DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211218125525');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211218125525');
-- Add your query below.


-- Start script for quest Hinott's Assistance.
DELETE FROM `quest_start_scripts` WHERE `id`=2480;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2480, 0, 3, 0, 712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -7.51821, -905.526, 57.5456, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Move'),
(2480, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Remove Npc Flags'),
(2480, 2, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.7822, 0, 'Hinott\'s Assistance: Serge Hinott - Set Orientation'),
(2480, 3, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Set Emote State to STATE_USESTANDING_NOSHEATHE'),
(2480, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Set Emote State to ONESHOT_NONE'),
(2480, 6, 3, 0, 1112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4.75248, -905.37, 57.5453, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Move'),
(2480, 8, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.7473, 0, 'Hinott\'s Assistance: Serge Hinott - Set Orientation'),
(2480, 10, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Set Emote State to STATE_USESTANDING_NOSHEATHE'),
(2480, 13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Set Emote State to ONESHOT_NONE'),
(2480, 18, 3, 0, 1079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4.51855, -902.432, 57.5444, 0.139626, 0, 'Hinott\'s Assistance: Serge Hinott - Move'),
(2480, 23, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Set Emote State to STATE_USESTANDING'),
(2480, 26, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Set Emote State to ONESHOT_NONE'),
(2480, 31, 1, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Set Emote State to STATE_WORK'),
(2480, 32, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Set Emote State to ONESHOT_NONE'),
(2480, 33, 76, 130358, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -5.87912, -902.557, 58.5506, 6.05629, 0, 'Hinott\'s Assistance: Summon GameObject Chemical Bomb'),
(2480, 33, 76, 130358, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -33.3504, -925.008, 62.2412, 3.00195, 0, 'Hinott\'s Assistance: Summon GameObject Chemical Bomb'),
(2480, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3326, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Say Text'),
(2480, 36, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Emote OneShotTalk'),
(2480, 39, 3, 0, 708, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9.28586, -905.473, 57.7018, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Move'),
(2480, 41, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.37881, 0, 'Hinott\'s Assistance: Serge Hinott - Set Orientation'),
(2480, 44, 7, 2480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Complete Quest Hinott\'s Assistance'),
(2480, 45, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Add Npc Flags');
UPDATE `quest_template` SET `StartScript`=2480 WHERE `entry`=2480;

-- Completion script for quest Hinott's Assistance.
DELETE FROM `quest_end_scripts` WHERE `id`=2480;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2480, 0, 15, 2995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hinott\'s Assistance: Serge Hinott - Cast Spell Poisons');
UPDATE `quest_template` SET `CompleteScript`=2480 WHERE `entry`=2480;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
