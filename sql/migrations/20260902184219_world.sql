DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260902184219');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260902184219');
-- Add your query below.


-- Condition assigned to scripted map event checks for player around the target, so target Pyroguard Emberseer in that command.
DELETE FROM `event_scripts` WHERE `id`=4884;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4884, 0, 0, 61, 4884, 1200, 0, 0, 9816, 100, 10, 8, 0, 48841, 239, 48842, 0, 0, 0, 0, 0, 'Emberseer Start - Start Map Event'),
(4884, 0, 1, 44, 2, 0, 0, 0, 9816, 100, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberseer Start - Start Phase 2 on Pyroguard Emberseer'),
(4884, 0, 2, 68, 103162, 2, 10316, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberseer Start - Start Script on Incarcerators'),
(4884, 0, 3, 80, 1, 0, 0, 0, 260283, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberseer Start - Close Door'),
(4884, 0, 4, 80, 1, 0, 0, 0, 260284, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberseer Start - Close Door');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
