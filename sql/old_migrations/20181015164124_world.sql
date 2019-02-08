DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181015164124');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181015164124');
-- Add your query below.


-- Coldtooth Mine NPCs

-- Kobolds
UPDATE `creature_template` SET `faction_A`=26, `faction_H`=26 WHERE `entry` IN (11603, 11604, 11677);
-- Alliance
UPDATE `creature_template` SET `faction_A`=1216, `faction_H`=1216 WHERE `entry` IN (13086, 13087, 13096, 13317, 13551, 13550, 13549, 13548, 13547, 13546);
-- Horde
UPDATE `creature_template` SET `faction_A`=1214, `faction_H`=1214 WHERE `entry` IN (13088, 13089, 13097, 13316, 13539, 13538, 13537, 13536, 13535, 13534);


-- Irondeep Mine NPCs

-- Alliance
UPDATE `creature_template` SET `faction_A`=1216, `faction_H`=1216 WHERE `entry` IN (13078, 13396, 13098, 13080, 13557, 13556, 13555, 13554, 13553, 13552);
-- Horde
UPDATE `creature_template` SET `faction_A`=1214, `faction_H`=1214 WHERE `entry` IN (13079, 13081, 13099, 13397, 13545, 13542, 13540, 13544, 13543, 13541);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
