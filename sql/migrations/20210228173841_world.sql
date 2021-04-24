DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210228173841');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210228173841');
-- Add your query below.


-- Add Retribution Aura and Double Attack auras to Highlord Bolvar Fordragon.
UPDATE `creature_template` SET `auras`='8990 18943' WHERE `entry`=1748;

-- Correct wrong spell id of Shield Wall used by Highlord Bolvar Fordragon.
DELETE FROM `creature_ai_scripts` WHERE `id`=174801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (174801, 0, 15, 15062, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Bolvar Fordragon - Cast Shield Wall');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
