DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171202225258');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171202225258');
-- Add your query below.


-- Add end script for quest For Love Eternal.
UPDATE `quest_template` SET `CompleteScript`=963 WHERE `entry`=963;
DELETE FROM `quest_end_scripts` WHERE `id`=963;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(963, 0, 10, 3843, 43000, 0, 0, 0, 0, 0, 0, 0, 6426.55, 602.109, 9.457, 3.906, 'For Love Eternal - Spawn Anaya'),
(963, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw stands up'),
(963, 4, 0, 0, 0, 0, 0, 0, 1278, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Say Text 1'),
(963, 4, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Emote Shrug'),
(963, 9, 0, 0, 3843, 10, 0, 0, 1279, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Anaya Say Text 1'),
(963, 9, 1, 1, 3843, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Anaya Emote Talk'),
(963, 13, 0, 0, 0, 0, 0, 0, 1280, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Say Text 2'),
(963, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Emote Talk'),
(963, 17, 0, 0, 0, 0, 0, 0, 1281, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Say Text 3'),
(963, 17, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Emote Talk'),
(963, 21, 0, 0, 3843, 10, 0, 0, 1282, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Anaya Say Text 2'),
(963, 21, 1, 1, 3843, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Anaya Emote Talk'),
(963, 27, 0, 0, 3843, 10, 0, 0, 1283, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Anaya Say Text 3'),
(963, 27, 1, 1, 3843, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Anaya Emote Talk'),
(963, 31, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw kneel down'),
(963, 34, 0, 0, 0, 0, 0, 0, 1286, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Say Text 4'),
(963, 34, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Emote Yell'),
(963, 40, 0, 0, 3843, 10, 0, 0, 1284, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Anaya Say Text 4'),
(963, 40, 1, 1, 3843, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Anaya Emote Talk'),
(963, 42, 0, 0, 3843, 10, 0, 0, 1285, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Anaya Say Text 5 (emoted)'),
(963, 45, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw stands up'),
(963, 45, 0, 0, 0, 0, 0, 0, 1287, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Say Text 5'),
(963, 45, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw Emote Yell'),
(963, 47, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For Love Eternal - Cerellean Whiteclaw kneel down');

-- Anaya does not need an EventAI script.
UPDATE `creature_template` SET `MovementType`=0, `AIName`='' WHERE `entry`=3843;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=3843;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-670, -669, -668, -667, -666, -665, -664, -663, -662, -661);
-- Add EventAI script for Cerellean Whiteclaw. He should cry periodically.
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=3644;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (364401, 3644, 1, 0, 100, 1, 50000, 50000, 50000, 50000, 5, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cerellean Whiteclaw - Cry Periodically');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
