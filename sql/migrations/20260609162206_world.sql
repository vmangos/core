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

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=180913;

-- Campfire
UPDATE `gameobject_template` SET `data2` = 2 WHERE `entry`=2061;

-- Wanted Poster: Deathclasp
UPDATE `gameobject_template` SET `data8` = 0 WHERE `entry`=180448;

-- Bonfire Damage
UPDATE `gameobject_template` SET `data2` = 5 WHERE `entry`=2066;

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=141838;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=61919;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=61920;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=61921;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=61922;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=61923;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=61924;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=61925;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=138614;

-- Ironforge Auction house
UPDATE `gameobject_template` SET `type` = 20 WHERE `entry`=176924;

-- Grasp of C'Thun
UPDATE `gameobject_template` SET `data1` = 1 WHERE `entry`=180745;

-- Summoning Portal
UPDATE `gameobject_template` SET `data5` = 0, `data7` = 0 WHERE `entry`=36727;

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=181130;

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

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=144133;

-- Glyphed Crystal Prism
UPDATE `gameobject_template` SET `data2` = 196608 WHERE `entry`=180514;

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=2575;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=60439;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=60440;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=60395;

-- Boucher's Cauldron
UPDATE `gameobject_template` SET `displayid` = 751 WHERE `entry`=59850;

-- Wooden Chair
UPDATE `gameobject_template` SET `displayid` = 380 WHERE `entry`=60438;

-- Zandalar Cage
UPDATE `gameobject_template` SET `data2` = 0 WHERE `entry`=180104;

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=179844;

-- Fire
UPDATE `gameobject_template` SET `displayid` = 349 WHERE `entry`=176460;

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

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 351 WHERE `entry`=3936;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 351 WHERE `entry`=3938;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 351 WHERE `entry`=3941;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 351 WHERE `entry`=3942;

-- Mighty Blaze
UPDATE `gameobject_template` SET `displayid` = 350 WHERE `entry`=3943;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 351 WHERE `entry`=3939;

-- Mighty Blaze
UPDATE `gameobject_template` SET `displayid` = 350 WHERE `entry`=3937;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 351 WHERE `entry`=3940;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147443;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147444;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147448;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147442;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147450;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147440;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147445;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147436;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147438;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147447;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147435;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147439;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147441;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147446;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147437;

-- Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=147449;

-- Naxxramas Portal
UPDATE `gameobject_template` SET `data11` = 1, `data12` = 129 WHERE `entry`=181576;

-- Muddy Churning Waters
DELETE FROM `gameobject_template` WHERE `entry`=180369 && `patch`=7;

-- School of Tastyfish
DELETE FROM `gameobject_template` WHERE `entry`=180248 && `patch`=7;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 349 WHERE `entry`=3851;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 349 WHERE `entry`=3850;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 349 WHERE `entry`=3849;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 349 WHERE `entry`=3847;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 349 WHERE `entry`=3848;

-- Fierce Blaze
UPDATE `gameobject_template` SET `displayid` = 349 WHERE `entry`=174859;

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=175144;

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=2728;

-- Cat Figurine
UPDATE `gameobject_template` SET `type` = 3, `data1` = 2768, `data3` = 1, `data5` = 0, `data7` = 12653, `script_name`='' WHERE `entry`=13873;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayid`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`) VALUES (12653, 6, 327, 'Ghost Saber Trap', 1, 0, 20, 0, 5968, 0, 0, -1);

-- Champions' Hall
UPDATE `gameobject_template` SET `displayid` = 173 WHERE `entry`=179736;

-- Thane's Boots
UPDATE `gameobject_template` SET `displayid` = 179 WHERE `entry`=164908;

-- The Silver Shield
UPDATE `gameobject_template` SET `displayid` = 171 WHERE `entry`=2150;

-- Lionheart Armory
UPDATE `gameobject_template` SET `displayid` = 171 WHERE `entry`=66780;

-- Stormwind Visitor's Center
UPDATE `gameobject_template` SET `displayid` = 177 WHERE `entry`=63195;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24530;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24531;

-- Everyday Merchandise
UPDATE `gameobject_template` SET `displayid` = 176 WHERE `entry`=2146;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24496;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24528;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24529;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24388;

-- Weller's Arsenal
UPDATE `gameobject_template` SET `displayid` = 173 WHERE `entry`=2139;

-- The Gilded Rose
UPDATE `gameobject_template` SET `displayid` = 180 WHERE `entry`=112898;

-- The Empty Quiver
UPDATE `gameobject_template` SET `displayid` = 172 WHERE `entry`=2138;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24532;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24498;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24533;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24534;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24536;

-- Stone Bench
UPDATE `gameobject_template` SET `displayid` = 622 WHERE `entry`=24537;

-- Canal Tailor and Fit Shop
UPDATE `gameobject_template` SET `displayid` = 179 WHERE `entry`=23295;

-- Stormwind Staves
UPDATE `gameobject_template` SET `displayid` = 173 WHERE `entry`=2162;

-- Duncan's Textiles
UPDATE `gameobject_template` SET `displayid` = 179 WHERE `entry`=2161;

-- Larson Clothiers
UPDATE `gameobject_template` SET `displayid` = 179 WHERE `entry`=23296;

-- The Blue Recluse
UPDATE `gameobject_template` SET `displayid` = 180 WHERE `entry`=2169;

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=142078;

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=153459;

-- SI:7
UPDATE `gameobject_template` SET `displayid` = 173 WHERE `entry`=179737;

-- Suppression Device
UPDATE `gameobject_template` SET `type` = 6, `data0` = 55, `data3` = 22247, `data4` = 0, `data6` = 235929600, `script_name`='go_suppression' WHERE `entry`=179784;

-- Forge
UPDATE `gameobject_template` SET `displayid` = 233 WHERE `entry`=179863;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
