DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260629001237');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260629001237');
-- Add your query below.


-- Abercrombie's Crate
DELETE FROM `gameobject_template` WHERE `entry`=167;
DELETE FROM `locales_gameobject` WHERE `entry`=167;
DELETE FROM `gameobject_loot_template` WHERE `entry`=167;

-- Wanted: Chok'Sul
DELETE FROM `gameobject_template` WHERE `entry`=254;
DELETE FROM `locales_gameobject` WHERE `entry`=254;

-- Graveyard Banner
DELETE FROM `gameobject_template` WHERE `entry`=13756;
DELETE FROM `locales_gameobject` WHERE `entry`=13756;

-- Mine Banner
DELETE FROM `gameobject_template` WHERE `entry`=15001;
DELETE FROM `locales_gameobject` WHERE `entry`=15001;

-- Lumber Mill Banner
DELETE FROM `gameobject_template` WHERE `entry`=15002;
DELETE FROM `locales_gameobject` WHERE `entry`=15002;

-- Farm Banner
DELETE FROM `gameobject_template` WHERE `entry`=15003;
DELETE FROM `locales_gameobject` WHERE `entry`=15003;

-- Blacksmith Banner
DELETE FROM `gameobject_template` WHERE `entry`=15004;
DELETE FROM `locales_gameobject` WHERE `entry`=15004;

-- Stable Banner
DELETE FROM `gameobject_template` WHERE `entry`=15005;
DELETE FROM `locales_gameobject` WHERE `entry`=15005;

-- Cracked Necrotic Crystal
DELETE FROM `gameobject_template` WHERE `entry`=16431;
DELETE FROM `locales_gameobject` WHERE `entry`=16431;

-- TEST House
DELETE FROM `gameobject_template` WHERE `entry`=20668;
DELETE FROM `locales_gameobject` WHERE `entry`=20668;

-- Lashh'an Spell Circle
DELETE FROM `gameobject_template` WHERE `entry`=21511;
DELETE FROM `locales_gameobject` WHERE `entry`=21511;

-- Gizmorium Shipping Crate
DELETE FROM `gameobject_template` WHERE `entry`=23505;
DELETE FROM `locales_gameobject` WHERE `entry`=23505;

-- Big house
DELETE FROM `gameobject_template` WHERE `entry`=90000;
DELETE FROM `locales_gameobject` WHERE `entry`=90000;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=92254;
DELETE FROM `locales_gameobject` WHERE `entry`=92254;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=111839;
DELETE FROM `locales_gameobject` WHERE `entry`=111839;

-- Bonefire
DELETE FROM `gameobject_template` WHERE `entry`=112879;
DELETE FROM `locales_gameobject` WHERE `entry`=112879;

-- auctionhouse
DELETE FROM `gameobject_template` WHERE `entry`=151992;
DELETE FROM `locales_gameobject` WHERE `entry`=151992;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=181488;
DELETE FROM `locales_gameobject` WHERE `entry`=181488;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=181489;
DELETE FROM `locales_gameobject` WHERE `entry`=181489;

-- Summoning Portal
DELETE FROM `gameobject_template` WHERE `entry`=181810;
DELETE FROM `locales_gameobject` WHERE `entry`=181810;

-- Campfire
DELETE FROM `gameobject_template` WHERE `entry`=181870;
DELETE FROM `locales_gameobject` WHERE `entry`=181870;

-- Boat to Auberdine
DELETE FROM `gameobject_template` WHERE `entry`=181985;
DELETE FROM `locales_gameobject` WHERE `entry`=181985;

-- Dark Brazier
DELETE FROM `gameobject_template` WHERE `entry`=182013;
DELETE FROM `locales_gameobject` WHERE `entry`=182013;

-- Dark Brazier
DELETE FROM `gameobject_template` WHERE `entry`=182014;
DELETE FROM `locales_gameobject` WHERE `entry`=182014;

-- Dark Brazier
DELETE FROM `gameobject_template` WHERE `entry`=182018;
DELETE FROM `locales_gameobject` WHERE `entry`=182018;

-- Dark Brazier
DELETE FROM `gameobject_template` WHERE `entry`=182020;
DELETE FROM `locales_gameobject` WHERE `entry`=182020;

-- Dark Brazier
DELETE FROM `gameobject_template` WHERE `entry`=182021;
DELETE FROM `locales_gameobject` WHERE `entry`=182021;

-- Dark Brazier
DELETE FROM `gameobject_template` WHERE `entry`=182022;
DELETE FROM `locales_gameobject` WHERE `entry`=182022;

-- Dark Brazier
DELETE FROM `gameobject_template` WHERE `entry`=182023;
DELETE FROM `locales_gameobject` WHERE `entry`=182023;

-- Dark Brazier
DELETE FROM `gameobject_template` WHERE `entry`=182028;
DELETE FROM `locales_gameobject` WHERE `entry`=182028;

-- Dark Brazier
DELETE FROM `gameobject_template` WHERE `entry`=182029;
DELETE FROM `locales_gameobject` WHERE `entry`=182029;

-- Draenei Explosives
DELETE FROM `gameobject_template` WHERE `entry`=182088;
DELETE FROM `locales_gameobject` WHERE `entry`=182088;

-- Vector Coil Fire (S)
DELETE FROM `gameobject_template` WHERE `entry`=182089;
DELETE FROM `locales_gameobject` WHERE `entry`=182089;

-- Draenei Explosives
DELETE FROM `gameobject_template` WHERE `entry`=182091;
DELETE FROM `locales_gameobject` WHERE `entry`=182091;

-- 0
DELETE FROM `gameobject_template` WHERE `entry`=182215;
DELETE FROM `locales_gameobject` WHERE `entry`=182215;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=182216;
DELETE FROM `locales_gameobject` WHERE `entry`=182216;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=182217;
DELETE FROM `locales_gameobject` WHERE `entry`=182217;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=182218;
DELETE FROM `locales_gameobject` WHERE `entry`=182218;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=182219;
DELETE FROM `locales_gameobject` WHERE `entry`=182219;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=182220;
DELETE FROM `locales_gameobject` WHERE `entry`=182220;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=182221;
DELETE FROM `locales_gameobject` WHERE `entry`=182221;

-- Eye of Veil Skith
DELETE FROM `gameobject_template` WHERE `entry`=182506;
DELETE FROM `locales_gameobject` WHERE `entry`=182506;

-- Eye of Veil Reskk
DELETE FROM `gameobject_template` WHERE `entry`=182507;
DELETE FROM `locales_gameobject` WHERE `entry`=182507;

-- Terokkar Chokeberry Bush
DELETE FROM `gameobject_template` WHERE `entry`=182526;
DELETE FROM `locales_gameobject` WHERE `entry`=182526;

-- Burning Fire
DELETE FROM `gameobject_template` WHERE `entry`=183314;
DELETE FROM `locales_gameobject` WHERE `entry`=183314;

-- Burning Fire
DELETE FROM `gameobject_template` WHERE `entry`=183315;
DELETE FROM `locales_gameobject` WHERE `entry`=183315;

-- Durnholde Keep
DELETE FROM `gameobject_template` WHERE `entry`=184057;
DELETE FROM `locales_gameobject` WHERE `entry`=184057;

-- Tarren Mill
DELETE FROM `gameobject_template` WHERE `entry`=184058;
DELETE FROM `locales_gameobject` WHERE `entry`=184058;

-- Southshore
DELETE FROM `gameobject_template` WHERE `entry`=184059;
DELETE FROM `locales_gameobject` WHERE `entry`=184059;

-- Tarren Mill
DELETE FROM `gameobject_template` WHERE `entry`=184060;
DELETE FROM `locales_gameobject` WHERE `entry`=184060;

-- Southshore
DELETE FROM `gameobject_template` WHERE `entry`=184061;
DELETE FROM `locales_gameobject` WHERE `entry`=184061;

-- Durnholde Keep
DELETE FROM `gameobject_template` WHERE `entry`=184067;
DELETE FROM `locales_gameobject` WHERE `entry`=184067;

-- Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=184161;
DELETE FROM `locales_gameobject` WHERE `entry`=184161;

-- 
DELETE FROM `gameobject_template` WHERE `entry`=184461;
DELETE FROM `locales_gameobject` WHERE `entry`=184461;

-- Legion Hold Forge
DELETE FROM `gameobject_template` WHERE `entry`=184846;
DELETE FROM `locales_gameobject` WHERE `entry`=184846;

-- Sealed Tome
DELETE FROM `gameobject_template` WHERE `entry`=184847;
DELETE FROM `locales_gameobject` WHERE `entry`=184847;

-- Felcannon Ammunition
DELETE FROM `gameobject_template` WHERE `entry`=184961;
DELETE FROM `locales_gameobject` WHERE `entry`=184961;

-- Felcannon Ammunition
DELETE FROM `gameobject_template` WHERE `entry`=184962;
DELETE FROM `locales_gameobject` WHERE `entry`=184962;

-- Felcannon Ammunition
DELETE FROM `gameobject_template` WHERE `entry`=184963;
DELETE FROM `locales_gameobject` WHERE `entry`=184963;

-- Eclipsion Communication Device
DELETE FROM `gameobject_template` WHERE `entry`=185121;
DELETE FROM `locales_gameobject` WHERE `entry`=185121;

-- Moonglade Fountain
DELETE FROM `gameobject_template` WHERE `entry`=185493;
DELETE FROM `locales_gameobject` WHERE `entry`=185493;
DELETE FROM `gameobject` WHERE `id`=185493;

-- Beer Wagon
DELETE FROM `gameobject_template` WHERE `entry`=186250;
DELETE FROM `locales_gameobject` WHERE `entry`=186250;

-- Grimbooze's Secret Recipe
DELETE FROM `gameobject_template` WHERE `entry`=186263;
DELETE FROM `locales_gameobject` WHERE `entry`=186263;

-- Kyle's Lunch
DELETE FROM `gameobject_template` WHERE `entry`=186265;
DELETE FROM `locales_gameobject` WHERE `entry`=186265;

-- Cauldron
DELETE FROM `gameobject_template` WHERE `entry`=186451;
DELETE FROM `locales_gameobject` WHERE `entry`=186451;
DELETE FROM `gameobject` WHERE `id`=186451;

-- Dark Iron Sabotage Plans
DELETE FROM `gameobject_template` WHERE `entry`=186881;
DELETE FROM `locales_gameobject` WHERE `entry`=186881;

-- Cannon
DELETE FROM `gameobject_template` WHERE `entry`=193011;
DELETE FROM `locales_gameobject` WHERE `entry`=193011;

-- Mug Smoke
DELETE FROM `gameobject_template` WHERE `entry`=190396;
DELETE FROM `locales_gameobject` WHERE `entry`=190396;

-- Doodad_Nox_door_spider02
DELETE FROM `gameobject_template` WHERE `entry`=194022;
DELETE FROM `locales_gameobject` WHERE `entry`=194022;

-- Shopping Centre
DELETE FROM `gameobject_template` WHERE `entry`=200001;
DELETE FROM `locales_gameobject` WHERE `entry`=200001;

-- Warsong Clan Banner 07
DELETE FROM `gameobject_template` WHERE `entry`=210068;
DELETE FROM `locales_gameobject` WHERE `entry`=210068;

-- New Year Alliance Hanging Banner
DELETE FROM `gameobject_template` WHERE `entry`=210210;
DELETE FROM `locales_gameobject` WHERE `entry`=210210;

-- New Year Alliance Hanging Banner 02
DELETE FROM `gameobject_template` WHERE `entry`=210211;
DELETE FROM `locales_gameobject` WHERE `entry`=210211;

-- New Year Horde Hanging Banner
DELETE FROM `gameobject_template` WHERE `entry`=210212;
DELETE FROM `locales_gameobject` WHERE `entry`=210212;

-- New Year Horde Hanging Banner 02
DELETE FROM `gameobject_template` WHERE `entry`=210213;
DELETE FROM `locales_gameobject` WHERE `entry`=210213;

-- New Year Alliance Standing Banner
DELETE FROM `gameobject_template` WHERE `entry`=210214;
DELETE FROM `locales_gameobject` WHERE `entry`=210214;

-- New Year Horde Standing Banner
DELETE FROM `gameobject_template` WHERE `entry`=210215;
DELETE FROM `locales_gameobject` WHERE `entry`=210215;

-- Excavation Tent Pavillion
DELETE FROM `gameobject_template` WHERE `entry`=210286;
DELETE FROM `locales_gameobject` WHERE `entry`=210286;

-- Ahn'Qiraj Ossirian Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210312;
DELETE FROM `locales_gameobject` WHERE `entry`=210312;

-- Ahn'Qiraj Ossirian Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210313;
DELETE FROM `locales_gameobject` WHERE `entry`=210313;

-- Communication Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210327;
DELETE FROM `locales_gameobject` WHERE `entry`=210327;

-- Communication Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210328;
DELETE FROM `locales_gameobject` WHERE `entry`=210328;

-- Communication Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210329;
DELETE FROM `locales_gameobject` WHERE `entry`=210329;

-- Communication Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210330;
DELETE FROM `locales_gameobject` WHERE `entry`=210330;

-- Communication Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210331;
DELETE FROM `locales_gameobject` WHERE `entry`=210331;

-- Communication Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210332;
DELETE FROM `locales_gameobject` WHERE `entry`=210332;

-- Ahn'Qiraj Gong
DELETE FROM `gameobject_template` WHERE `entry`=210334;
DELETE FROM `locales_gameobject` WHERE `entry`=210334;

-- Twilight Tablet
DELETE FROM `gameobject_template` WHERE `entry`=210335;
DELETE FROM `locales_gameobject` WHERE `entry`=210335;

-- Twilight Tablet
DELETE FROM `gameobject_template` WHERE `entry`=210336;
DELETE FROM `locales_gameobject` WHERE `entry`=210336;

-- Glyphed Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210337;
DELETE FROM `locales_gameobject` WHERE `entry`=210337;

-- Gorishi Silithid Crystal
DELETE FROM `gameobject_template` WHERE `entry`=210338;
DELETE FROM `locales_gameobject` WHERE `entry`=210338;

-- Ahn'Qiraj Sand Trap
DELETE FROM `gameobject_template` WHERE `entry`=210339;
DELETE FROM `locales_gameobject` WHERE `entry`=210339;

-- Hive Fireflies 01
DELETE FROM `gameobject_template` WHERE `entry`=210341;
DELETE FROM `locales_gameobject` WHERE `entry`=210341;

-- Sand Worm Rock Base
DELETE FROM `gameobject_template` WHERE `entry`=210343;
DELETE FROM `locales_gameobject` WHERE `entry`=210343;

-- Silithus Crystal Formation 03
DELETE FROM `gameobject_template` WHERE `entry`=210344;
DELETE FROM `locales_gameobject` WHERE `entry`=210344;

-- Floating Red Crystal Broken 03
DELETE FROM `gameobject_template` WHERE `entry`=210345;
DELETE FROM `locales_gameobject` WHERE `entry`=210345;

-- Floating Red Crystal Broken 01
DELETE FROM `gameobject_template` WHERE `entry`=210346;
DELETE FROM `locales_gameobject` WHERE `entry`=210346;

-- Ahn'Qiraj Door 01
DELETE FROM `gameobject_template` WHERE `entry`=210347;
DELETE FROM `locales_gameobject` WHERE `entry`=210347;

-- Floating Purple Crystal Broken 01
DELETE FROM `gameobject_template` WHERE `entry`=210348;
DELETE FROM `locales_gameobject` WHERE `entry`=210348;

-- Gastric Exit
DELETE FROM `gameobject_template` WHERE `entry`=210349;
DELETE FROM `locales_gameobject` WHERE `entry`=210349;

-- Anvil
DELETE FROM `gameobject_template` WHERE `entry`=211016;
DELETE FROM `locales_gameobject` WHERE `entry`=211016;

-- Kre'tal's Wagon
DELETE FROM `gameobject_template` WHERE `entry`=211017;
DELETE FROM `locales_gameobject` WHERE `entry`=211017;

-- Asheron's Tome of Summoning
DELETE FROM `gameobject_template` WHERE `entry`=211018;
DELETE FROM `locales_gameobject` WHERE `entry`=211018;

-- Altar of Hyjal
DELETE FROM `gameobject_template` WHERE `entry`=211019;
DELETE FROM `locales_gameobject` WHERE `entry`=211019;

-- Summoning Circle
DELETE FROM `gameobject_template` WHERE `entry`=211020;
DELETE FROM `locales_gameobject` WHERE `entry`=211020;

-- Eye of Asheron
DELETE FROM `gameobject_template` WHERE `entry`=211021;
DELETE FROM `locales_gameobject` WHERE `entry`=211021;

-- Commander's Tent
DELETE FROM `gameobject_template` WHERE `entry`=211022;
DELETE FROM `locales_gameobject` WHERE `entry`=211022;

-- Black Portal
DELETE FROM `gameobject_template` WHERE `entry`=211023;
DELETE FROM `locales_gameobject` WHERE `entry`=211023;

-- Black Portal
DELETE FROM `gameobject_template` WHERE `entry`=211024;
DELETE FROM `locales_gameobject` WHERE `entry`=211024;

-- Banner
DELETE FROM `gameobject_template` WHERE `entry`=211029;
DELETE FROM `locales_gameobject` WHERE `entry`=211029;

-- Gold Mine
DELETE FROM `gameobject_template` WHERE `entry`=211032;
DELETE FROM `locales_gameobject` WHERE `entry`=211032;

-- Aura
DELETE FROM `gameobject_template` WHERE `entry`=211033;
DELETE FROM `locales_gameobject` WHERE `entry`=211033;

-- Aura
DELETE FROM `gameobject_template` WHERE `entry`=211034;
DELETE FROM `locales_gameobject` WHERE `entry`=211034;

-- Lair Exit
DELETE FROM `gameobject_template` WHERE `entry`=211035;
DELETE FROM `locales_gameobject` WHERE `entry`=211035;

-- Fire Totem
DELETE FROM `gameobject_template` WHERE `entry`=211036;
DELETE FROM `locales_gameobject` WHERE `entry`=211036;

-- Tree Stump
DELETE FROM `gameobject_template` WHERE `entry`=211052;
DELETE FROM `locales_gameobject` WHERE `entry`=211052;

-- Mysterious Monument
DELETE FROM `gameobject_template` WHERE `entry`=211053;
DELETE FROM `locales_gameobject` WHERE `entry`=211053;

-- Lava Crack
DELETE FROM `gameobject_template` WHERE `entry`=211054;
DELETE FROM `locales_gameobject` WHERE `entry`=211054;

-- Elwynn Fence
DELETE FROM `gameobject_template` WHERE `entry`=211062;
DELETE FROM `locales_gameobject` WHERE `entry`=211062;

-- Elwynn Fence
DELETE FROM `gameobject_template` WHERE `entry`=211063;
DELETE FROM `locales_gameobject` WHERE `entry`=211063;

-- Rockwall Fence
DELETE FROM `gameobject_template` WHERE `entry`=211064;
DELETE FROM `locales_gameobject` WHERE `entry`=211064;

-- Grave
DELETE FROM `gameobject_template` WHERE `entry`=211065;
DELETE FROM `locales_gameobject` WHERE `entry`=211065;

-- Sarcophag
DELETE FROM `gameobject_template` WHERE `entry`=211067;
DELETE FROM `locales_gameobject` WHERE `entry`=211067;

-- Fire Totem
DELETE FROM `gameobject_template` WHERE `entry`=211068;
DELETE FROM `locales_gameobject` WHERE `entry`=211068;

-- Mephistroph's HellFire
DELETE FROM `gameobject_template` WHERE `entry`=211084;
DELETE FROM `locales_gameobject` WHERE `entry`=211084;

-- Swirling Maelstrom
DELETE FROM `gameobject_template` WHERE `entry`=300057;
DELETE FROM `locales_gameobject` WHERE `entry`=300057;
UPDATE `gameobject` SET `id`=180669, `position_x`=3489.12, `position_y`=-6614.89, `position_z`=-0.0012, `orientation`=4.62512, `rotation0`=0,`rotation1`=0, `rotation2`=-0.737277, `rotation3`=0.675591 WHERE `id`=300057;
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=180669;

-- Porte de UBRS
DELETE FROM `gameobject_template` WHERE `entry`=300200;
DELETE FROM `locales_gameobject` WHERE `entry`=300200;

-- Porte de sortie de l'arene UBRS
DELETE FROM `gameobject_template` WHERE `entry`=300202;
DELETE FROM `locales_gameobject` WHERE `entry`=300202;

-- Apple Bob
DELETE FROM `gameobject_template` WHERE `entry`=300203;
DELETE FROM `locales_gameobject` WHERE `entry`=300203;

-- Door
DELETE FROM `gameobject_template` WHERE `entry`=300601;
DELETE FROM `locales_gameobject` WHERE `entry`=300601;

-- Equipment Crates
DELETE FROM `gameobject_template` WHERE `entry`=987658;
DELETE FROM `locales_gameobject` WHERE `entry`=987658;

-- Kroshius' Remains
DELETE FROM `gameobject_template` WHERE `entry`=3000491;
DELETE FROM `locales_gameobject` WHERE `entry`=3000491;
DELETE FROM `gameobject` WHERE `id`=3000491;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
