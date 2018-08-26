DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180609213537');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180609213537');
-- Add your query below.

SET @GUID := '35876';
SET @POOL := '22909';

UPDATE `quest_template` SET `SrcItemId`='0', `SrcItemCount`='0' WHERE `entry`='4903';

DELETE FROM `gameobject` WHERE `id`='175785';
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@GUID + 0, '175785', '229', '-10.52417', '-391.3383', '48.821370', '0', '0', '0', '-0.8746195', '0.48481010', '5', '5', '0', '1'),
(@GUID + 1, '175785', '229', '-12.27355', '-446.6286', '-18.64427', '0', '0', '0', '0.91705990', '0.39874950', '5', '5', '0', '1'),
(@GUID + 2, '175785', '229', '-18.37604', '-299.2709', '31.618260', '0', '0', '0', '0.99965670', '0.02620165', '5', '5', '0', '1'),
(@GUID + 3, '175785', '229', '-16.12174', '-492.5576', '90.658520', '0', '0', '0', '0.36650090', '0.93041770', '5', '5', '0', '1');

REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@POOL, '1', 'LBRS - Inconspicuous Documents');

REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES
('175785', @POOL, '0', 'LBRS - Inconspicuous Documents');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
