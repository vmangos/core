DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171021174758');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171021174758');
-- Add your query below.

-- Fix equipment for some NPCs in AV.
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (13138, 13925, 0, 2551);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (13356, 1903, 2081, 0);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (13357, 1906, 12290, 0);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (13597, 13627, 0, 2550);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (13598, 1906, 0, 0);
UPDATE `creature_template` SET `equipment_id`=13356 WHERE `entry`=13356;
UPDATE `creature_template` SET `equipment_id`=13357 WHERE `entry`=13357;
UPDATE `creature_template` SET `equipment_id`=13597 WHERE `entry`=13597;
UPDATE `creature_template` SET `equipment_id`=13598 WHERE `entry`=13598;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
