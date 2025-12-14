DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231024111757');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231024111757');
-- Add your query below.


-- Fix quest Dancing for Marzipan.
DELETE FROM `creature_ai_scripts` WHERE `id`=674601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(674601, 0, 0, 8, 6746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Pala - Complete Quest Dancing for Marzipan'),
(674601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10800, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Pala - Say Text');
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry`=8360;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
