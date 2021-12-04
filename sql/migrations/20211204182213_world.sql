DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211204182213');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211204182213');
-- Add your query below.


-- Completion script for quest The Stave of Equinex.
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2879, 1, 76, 146082, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2976.61, 2743.18, 52.4701, 0.680677, 0, 'The Stave of Equinex - Equinex Monolith: Summon GameObject Equinex Monolith Lights 1'),
(2879, 1, 76, 146083, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2977.17, 2743.14, 52.4016, 6.21337, 0, 'The Stave of Equinex - Equinex Monolith: Summon GameObject Equinex Monolith Lights 2');
UPDATE `quest_template` SET `CompleteScript` = 2879 WHERE `entry` = 2879;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
