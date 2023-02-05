DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230203200739');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230203200739');
-- Add your query below.

DELETE FROM `script_texts` WHERE `entry`= -1109005;
DELETE FROM `script_texts` WHERE `entry`= -1109011;
DELETE FROM `script_texts` WHERE `entry`= -1109012;
DELETE FROM `script_texts` WHERE `entry`= -1109013;
DELETE FROM `script_texts` WHERE `entry`= -1109014;

UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=5861 WHERE `entry`=4490; -- The shield be down! Rise up Atal'ai! Rise up!
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=5866 WHERE `entry`=6220; -- Turn back! Do not wake the dreamer!
UPDATE `broadcast_text` SET `chat_type`=1, `sound_id`=5860 WHERE `entry`=6216; -- I'll feast on your bones!

-- Remove c++ script assignment from Atal'ai Statue
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry` IN (148830, 148831, 148832, 148833, 148834, 148835);

-- Convert Atal'ai Statue onUse() script to db
-- Since GAMEOBJECT_TYPE_GOOBER using event_scripts.
-- Atal'ai gameobjects had field data2 already occupied with ids, using those for linking the event script:
DELETE FROM `event_scripts` WHERE `id` IN (3094,3095,3097,3098,3099,3100);
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3094, 0, 0, 38, 148830, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atal\'ai Statue - process secret circle'),
(3095, 0, 0, 38, 148831, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atal\'ai Statue - process secret circle'),
(3097, 0, 0, 38, 148832, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atal\'ai Statue - process secret circle'),
(3098, 0, 0, 38, 148833, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atal\'ai Statue - process secret circle'),
(3099, 0, 0, 38, 148834, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atal\'ai Statue - process secret circle'),
(3100, 0, 0, 38, 148835, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atal\'ai Statue - process secret circle');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
