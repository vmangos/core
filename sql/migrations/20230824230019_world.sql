DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230824230019');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230824230019');
-- Add your query below.


-- 9208: Extra Targets Of Scripted Map Event 9208 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9208, 47, 9208, 121, 0, 0, 0);

-- New script for using Glyphs of Calling during quest The Calling.
DELETE FROM `event_scripts` WHERE `id`=9208;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(9208, 0, 0, 61, 9208, 7200, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Glyphs of Calling: Start Scripted Map Event'),
(9208, 3, 0, 10, 15286, 7200000, 0, 0, 0, 0, 0, 0, 0, 920801, -1, 1, -7258.49, 828.158, 3.21053, 4.29351, 0, 'Glyphs of Calling: Summon Creature Xil\'xix'),
(9208, 3, 0, 10, 15288, 7200000, 0, 0, 0, 0, 0, 0, 0, 920801, -1, 1, -7223.8, 820.815, 4.89979, 0.0872665, 0, 'Glyphs of Calling: Summon Creature Aluntir'),
(9208, 3, 0, 10, 15290, 7200000, 0, 0, 0, 0, 0, 0, 0, 920801, -1, 1, -7268.27, 878.263, 1.88339, 1.85005, 0, 'Glyphs of Calling: Summon Creature Arakis'),
(9208, 4, 0, 69, 9208, 0, 0, 0, 0, 0, 0, 0, 9208, 920802, 0, 0, 0, 0, 0, 0, 0, 'Glyphs of Calling: Edit Scripted Map Event');
DELETE FROM `generic_scripts` WHERE `id`=920801;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(920801, 0, 0, 63, 9208, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 'The Calling: Adds - Add to Map Event');
DELETE FROM `generic_scripts` WHERE `id`=920802;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(920802, 0, 0, 10, 14862, 7200000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -7307.85, 838.671, 1.64449, 0.750492, 0, 'The Calling: Summon Creature Emissary Roman\'khan');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
