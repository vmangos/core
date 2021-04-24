DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201101150000');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201101150000');
-- Add your query below.


-- Conditions to check if Feast gameobjects are spawned.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21145, 21, 21145, 30, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21146, 21, 21146, 30, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21147, 21, 21147, 30, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21148, 21, 21148, 30, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21149, -2, 21145, 21146, 21147, 21148, 0);

-- Add completion script for quest Feast at the Blue Recluse.
DELETE FROM `quest_end_scripts` WHERE `id`=1271;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1271, 0, 32, 21149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Angus Stern - Terminate Script if Feast Spawned'),
(1271, 1, 76, 21145, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9084.64, 830.321, 109.609, 0.541051, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Boar'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9069.08, 829.032, 109.426, 2.68781, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21146, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9074.48, 836.473, 109.429, 5.63741, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Fish'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9087.68, 830.554, 116.726, 1.39626, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9075.43, 838.106, 109.469, 2.74016, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9094.81, 836.335, 116.708, 1.09956, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9093.54, 836.906, 116.729, 2.02458, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9072.99, 838.187, 109.431, 5.21854, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9085.21, 815.248, 116.722, 4.90438, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9072.33, 837.085, 109.424, 1.16937, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9087.12, 831.972, 116.775, 4.5204, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9059.74, 838.837, 110.217, 0.90757, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21146, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9070.34, 830.482, 109.438, 1.71042, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Fish'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9057.81, 838.719, 110.234, 2.54818, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21147, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9071.5, 829.084, 109.455, 3.61284, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Fruit'),
(1271, 1, 76, 21145, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9082.94, 825.944, 109.609, 3.54302, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Boar'),
(1271, 1, 76, 21147, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9081.27, 822.605, 109.609, 3.45576, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Fruit'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9079.41, 828.787, 109.435, 1.0821, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21146, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9080.98, 821.016, 109.609, 5.3058, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Fish'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9081.09, 828.564, 109.432, 1.64061, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21146, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9080.44, 819.65, 109.609, 5.51524, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Fish'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9081.13, 830.215, 109.446, 2.26892, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21146, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9059.53, 839.946, 110.231, 2.00713, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Fish'),
(1271, 1, 76, 21145, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9058.3, 837.403, 110.217, 5.044, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Boar'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9071.01, 828.135, 109.431, 5.98648, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21148, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9072.72, 829.445, 109.473, 5.61996, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Goblet'),
(1271, 1, 76, 21146, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9079.9, 818.185, 109.609, 5.11382, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Fish'),
(1271, 1, 76, 21147, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9083.82, 828.115, 109.609, 2.44346, 0, 'Feast at the Blue Recluse: Summon GameObject Feast Fruit'),
(1271, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.453786, 0, 'Feast at the Blue Recluse: Angus Stern - Set Orientation'),
(1271, 1, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Angus Stern - Emote OneShotShout'),
(1271, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Angus Stern - Remove Npc Flags'),
(1271, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1718, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Angus Stern - Say Text'),
(1271, 5, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.5708, 0, 'Feast at the Blue Recluse: Angus Stern - Set Orientation'),
(1271, 5, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Angus Stern - Emote OneShotPoint'),
(1271, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1719, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Angus Stern - Say Text'),
(1271, 10, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.558505, 0, 'Feast at the Blue Recluse: Angus Stern - Set Orientation'),
(1271, 10, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Angus Stern - Add Npc Flags'),
(1271, 12, 35, 1, 0, 0, 0, 3628, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.518691, 0, 'Feast at the Blue Recluse: Steven Lohan - Set Orientation'),
(1271, 12, 1, 21, 0, 0, 0, 3628, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Steven Lohan - Emote OneShotApplaud'),
(1271, 12, 1, 4, 0, 0, 0, 1311, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Joachim Brenlow - Emote OneShotCheer'),
(1271, 12, 0, 0, 0, 0, 0, 3628, 30, 8, 3, 1736, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Steven Lohan - Say Text'),
(1271, 14, 35, 1, 0, 0, 0, 3628, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.401426, 0, 'Feast at the Blue Recluse: Steven Lohan - Set Orientation'),
(1271, 14, 1, 4, 0, 0, 0, 3628, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Steven Lohan - Emote OneShotCheer'),
(1271, 14, 0, 0, 0, 0, 0, 1311, 30, 8, 3, 1733, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Joachim Brenlow - Say Text'),
(1271, 17, 1, 10, 0, 0, 0, 1311, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Joachim Brenlow - Emote State'),
(1271, 20, 1, 0, 0, 0, 0, 1311, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Feast at the Blue Recluse: Joachim Brenlow - Emote State');
UPDATE `quest_template` SET `CompleteScript`=1271 WHERE `entry`=1271;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
