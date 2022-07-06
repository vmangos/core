DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211204063349');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211204063349');
-- Add your query below.


-- Completion script for quest Devils in Westfall.
DELETE FROM `quest_end_scripts` WHERE `id`=1076;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1076, 0, 15, 6671, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Devils in Westfall: Collin Mauren - Cast Spell Create Scroll'),
(1076, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1437, 0, 0, 0, 0, 0, 0, 0, 0, 'Devils in Westfall: Collin Mauren - Say Text');
UPDATE `quest_template` SET `CompleteScript`=1076 WHERE `entry`=1076;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
