DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260609162206');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260609162206');
-- Add your query below.


-- Doodad_Nox_door_slime01
UPDATE `gameobject_template` SET `data2` = 196608 WHERE `entry`=181198;

-- Vaccuum - Enter Gate
UPDATE `gameobject_template` SET `data0` = 1 WHERE `entry`=181124;

-- Doodad_Nox_door_slime02
UPDATE `gameobject_template` SET `data2` = 196608 WHERE `entry`=181199;

-- Campfire
UPDATE `gameobject_template` SET `data2` = 2 WHERE `entry`=2061;

-- Wanted Poster: Deathclasp
UPDATE `gameobject_template` SET `data8` = 0 WHERE `entry`=180448;

-- Bonfire Damage
UPDATE `gameobject_template` SET `data2` = 5 WHERE `entry`=2066;

-- Ironforge Auction house
UPDATE `gameobject_template` SET `type` = 20 WHERE `entry`=176924;

-- Grasp of C'Thun
UPDATE `gameobject_template` SET `data1` = 1 WHERE `entry`=180745;

-- Summoning Portal
UPDATE `gameobject_template` SET `data5` = 0, `data7` = 0 WHERE `entry`=36727;

-- Icebellow Furnace
UPDATE `gameobject_template` SET `data3` = 196608 WHERE `entry`=181168;

-- Icebellow Furnace
UPDATE `gameobject_template` SET `data3` = 196608 WHERE `entry`=181169;

-- Heigan - Exit Door
UPDATE `gameobject_template` SET `data0` = 0 WHERE `entry`=181496;

-- Plague Fissure
UPDATE `gameobject_template` SET `data3` = 29731 WHERE `entry`=181537;

-- Loatheb - Entrance Door
UPDATE `gameobject_template` SET `data0` = 1 WHERE `entry`=181241;

-- Loatheb Fight Door 02 (not used)
UPDATE `gameobject_template` SET `data2` = 196608 WHERE `entry`=181242;

-- Loatheb Fight Door 03 (not used)
UPDATE `gameobject_template` SET `data2` = 196608 WHERE `entry`=181243;

-- Loatheb Fight Door 01 (not used)
UPDATE `gameobject_template` SET `data2` = 196608 WHERE `entry`=181240;

-- Naxxramas Portal
UPDATE `gameobject_template` SET `data11` = 1, `data12` = 129 WHERE `entry`=181575;

-- Naxxramas Portal
UPDATE `gameobject_template` SET `data11` = 1, `data12` = 129 WHERE `entry`=181577;

-- Naxx Teleporter trap
INSERT INTO `gameobject_template` (`entry`, `type`, `displayid`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (129, 6, 0, 'Naxx Teleporter trap', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Glyphed Crystal Prism
UPDATE `gameobject_template` SET `data2` = 196608 WHERE `entry`=180514;

-- Zandalar Cage
UPDATE `gameobject_template` SET `data2` = 0 WHERE `entry`=180104;

-- Hakkari Thorium Vein
UPDATE `gameobject_template` SET `data4` = 2, `data5` = 4 WHERE `entry`=180215;

-- Wushoolay, the Storm Witch
UPDATE `gameobject_template` SET `data3` = 6451, `script_name`='' WHERE `entry`=180393;
-- 15085: Game Event 32 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15085, 12, 32, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6451, 7674, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6451, 7675, 15085);

-- Renataki, of the Thousand Blades
UPDATE `gameobject_template` SET `data3` = 6450, `script_name`='' WHERE `entry`=180365;
-- 15084: Game Event 31 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15084, 12, 31, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6450, 7672, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6450, 7673, 15084);

-- Hazza'rah, the Dreamweaver
UPDATE `gameobject_template` SET `data3` = 6449, `script_name`='' WHERE `entry`=180364;
-- 15083: Game Event 30 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15083, 12, 30, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6449, 7670, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6449, 7671, 15083);

-- Gri'lek, with the Iron Blood
UPDATE `gameobject_template` SET `data3` = 6448, `script_name`='' WHERE `entry`=180358;
-- 15082: Game Event 29 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15082, 12, 29, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6448, 7643, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6448, 7669, 15082);

-- Purple Lotus
UPDATE `gameobject_template` SET `data9` = 0 WHERE `entry`=180165;

-- Naxxramas Portal
UPDATE `gameobject_template` SET `data11` = 1, `data12` = 129 WHERE `entry`=181576;

-- Muddy Churning Waters
DELETE FROM `gameobject_template` WHERE `entry`=180369 && `patch`=7;

-- School of Tastyfish
DELETE FROM `gameobject_template` WHERE `entry`=180248 && `patch`=7;

-- Cat Figurine
UPDATE `gameobject_template` SET `type` = 3, `data1` = 2768, `data3` = 1, `data5` = 0, `data7` = 12653, `script_name`='' WHERE `entry`=13873;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayid`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`) VALUES (12653, 6, 327, 'Ghost Saber Trap', 1, 0, 20, 0, 5968, 0, 0, -1);

-- Suppression Device
UPDATE `gameobject_template` SET `type` = 6, `data0` = 55, `data3` = 22247, `data4` = 0, `data6` = 235929600, `script_name`='go_suppression' WHERE `entry`=179784;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
