DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211202023408');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211202023408');
-- Add your query below.


-- Improve start script for quest Vyletongue Corruption.
DELETE FROM `quest_start_scripts` WHERE `id`=7041;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(7041, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vyletongue Corruption: Talendria - Emote OneShotPoint'),
(7041, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.663225, 0, 'Vyletongue Corruption: Talendria - Set Orientation'),
(7041, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vyletongue Corruption: Talendria - Remove Npc Flags'),
(7041, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8923, 0, 0, 0, 0, 0, 0, 0, 0, 'Vyletongue Corruption: Talendria - Say Text'),
(7041, 3, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.58309, 0, 'Vyletongue Corruption: Talendria - Set Orientation'),
(7041, 4, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vyletongue Corruption: Talendria - Add Npc Flags');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
