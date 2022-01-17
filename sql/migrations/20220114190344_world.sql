DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220114190344');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220114190344');
-- Add your query below.

DELETE FROM `quest_end_scripts` WHERE `id`=8425;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(8425, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Feathers: Fallen Hero of the Horde - Remove NPC flags'),
(8425, 0, 1, 15, 25098, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Feathers: Fallen Hero of the Horde - Transform'),
(8425, 2, 0, 15, 25101, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Feathers: Fallen Hero of the Horde - Battleshout'),
(8425, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10893, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Feathers: Fallen Hero of the Horde - SayText'),
(8425, 5, 0, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Feathers: Fallen Hero of the Horde - Kneel'),
(8425, 8, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Feathers: Fallen Hero of the Horde - Stand'),
(8425, 8, 1, 15, 25100, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Feathers: Fallen Hero of the Horde - Transform back'),
(8425, 8, 2, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Feathers: Fallen Hero of the Horde - Add NPC flags');

UPDATE `quest_template` SET `CompleteScript`=8425 WHERE `entry`=8425;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
