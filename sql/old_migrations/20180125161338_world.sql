DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180125161338');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180125161338');
-- Add your query below.


-- Officer Areyn.
-- https://web.archive.org/web/20060522102802/http://wow.allakhazam.com:80/db/mob.html?wmob=12805
-- Add spawn point.
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (590006, 12805, 0, 0, 0, -8759.18, 389.112, 101.056, 0.648394, 420, 440, 0, 0, 4108, 0, 0, 0, 0, 0, 0, 10);
-- Add equipment.
UPDATE `creature_template` SET `equipment_id`=12805 WHERE `entry`=12805;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (12805, 1899, 1984, 0);
-- Add vendor items.
DELETE FROM `npc_vendor` WHERE `entry`=12805;
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 15196, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 16342, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18440, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18441, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18442, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18443, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18444, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18445, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18447, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18448, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18449, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18452, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18453, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18454, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18455, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18456, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18457, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18664, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18854, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18856, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18857, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18858, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18859, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18862, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18863, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12805, 18864, 0, 0);

-- Master Sergeant Biggins.
-- https://web.archive.org/web/20060621162134/http://wow.allakhazam.com:80/db/mob.html?wmob=12781
-- Remove wrong spawn.
DELETE FROM `creature` WHERE `guid`=755771;
-- Add equipment.
UPDATE `creature_template` SET `equipment_id`=12781 WHERE `entry`=12781;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (12781, 12744, 0, 0);
-- Add vendor items.
DELETE FROM `npc_vendor` WHERE `entry`=12781;
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12781, 15198, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12781, 18606, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12781, 18839, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12781, 18841, 0, 0);

-- Sergeant Ba'sha.
-- https://web.archive.org/web/20060513194216/http://wow.allakhazam.com:80/db/mob.html?wmob=12799
-- Add spawn point.
-- https://youtu.be/OlnnPZbg3T0?t=6m41s
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (590007, 12799, 1, 0, 0, 1632.51, -4262.25, 49.0004, 3.93951, 420, 440, 0, 0, 4108, 0, 0, 0, 0, 0, 0, 10);
-- Add equipment.
UPDATE `creature_template` SET `equipment_id`=12799 WHERE `entry`=12799;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (12799, 10612, 0, 0);
-- Add vendor items.
DELETE FROM `npc_vendor` WHERE `entry`=12799;
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 15197, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 15200, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 16335, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 16341, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 16486, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 16497, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 16532, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18427, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18428, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18429, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18430, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18432, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18434, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18435, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18436, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18437, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18461, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18675, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18834, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18845, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18846, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18849, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18850, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18851, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18852, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12799, 18853, 0, 0);

-- Brave Stonehide.
-- Remove wrong spawn.
DELETE FROM `creature` WHERE `guid`=748287;
-- Add equipment to Brave Stonehide.
UPDATE `creature_template` SET `equipment_id`=12793 WHERE `entry`=12793;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (12793, 6680, 0, 0);
-- Add vendor items.
DELETE FROM `npc_vendor` WHERE `entry`=12793;
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12793, 15199, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12793, 18607, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12793, 18839, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (12793, 18841, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
