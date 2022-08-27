DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220817190207');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220817190207');
-- Add your query below.


-- Increase respawn time for Taelan to prevent him from respawning prematurely.
UPDATE `creature` SET `spawntimesecsmin`=3600, `spawntimesecsmax`=3600 wHERE `guid`=45436;

-- Respawn Taelan after event is completed.
DELETE FROM `generic_scripts` WHERE `id`=6611;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(6611, 0, 0, 7, 5944, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Complete Quest'),
(6611, 0, 1, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Highlord Taelan Fordring - Respawn');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
