DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191007170003');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191007170003');
-- Add your query below.


-- Powerful Healing Ward should always be type 10 (Not specified).
DELETE FROM `creature_template` WHERE `entry`=14987 && `patch`=10;

-- Correct type of all creatures.
UPDATE `creature_template` SET `type`=1 WHERE `entry`=284;
UPDATE `creature_template` SET `type`=3 WHERE `entry`=304;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=305;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=307;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=308;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=356;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=358;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=359;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=2540;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=2671;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15546;
UPDATE `creature_template` SET `type`=8 WHERE `entry`=2848;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=2876;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=2880;
UPDATE `creature_template` SET `type`=8 WHERE `entry`=3444;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=3652;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=3722;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=4269;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=4270;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=4271;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=4272;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=4710;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=4777;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=4785;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=4795;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=5055;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=5763;
UPDATE `creature_template` SET `type`=4 WHERE `entry`=5764;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=5780;
UPDATE `creature_template` SET `type`=4 WHERE `entry`=5854;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=5914;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=6074;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=6075;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=6347;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=6348;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=6349;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=6486;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=6509;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=6510;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=6511;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=6512;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7706;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=16377;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=16371;
UPDATE `creature_template` SET `type`=4 WHERE `entry`=7039;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=7076;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=7077;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=7273;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=7309;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7322;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7381;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7382;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7384;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7385;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7389;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7390;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7395;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7543;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7553;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7555;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7562;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7565;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7567;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7684;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7686;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7687;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7690;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7707;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7708;
UPDATE `creature_template` SET `type`=9 WHERE `entry`=7739;
UPDATE `creature_template` SET `type`=9 WHERE `entry`=7749;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=7768;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=7769;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=7808;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=8149;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=8156;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=8324;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=8376;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=8437;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=8438;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=8440;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=8443;
UPDATE `creature_template` SET `type`=4 WHERE `entry`=8907;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=9158;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=9436;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=9498;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=9656;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=9657;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=10040;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=10041;
UPDATE `creature_template` SET `type`=9 WHERE `entry`=10180;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=10322;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=10336;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=10337;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=10338;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=10370;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=10658;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=10697;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=10718;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=10925;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=11021;
UPDATE `creature_template` SET `type`=9 WHERE `entry`=11147;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=11153;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=11154;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=11155;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=11326;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=11689;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=12138;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=12144;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=12149;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=12202;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=12219;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=12220;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=12258;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=12276;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=12344;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7704;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=12348;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=12361;
UPDATE `creature_template` SET `type`=9 WHERE `entry`=11150;
UPDATE `creature_template` SET `type`=9 WHERE `entry`=10179;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=4778;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=4780;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=12381;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=12382;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=12461;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=12940;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=12999;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=13301;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=13756;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=13778;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=13796;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14026;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14027;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14028;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14029;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14030;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14031;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14081;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14122;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14235;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14329;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14330;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=14331;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14332;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14333;
UPDATE `creature_template` SET `type`=9 WHERE `entry`=14334;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14335;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14336;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14366;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14370;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14421;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14434;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14449;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14453;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14465;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14466;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14495;
UPDATE `creature_template` SET `type`=3 WHERE `entry`=14505;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=14515;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14524;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14525;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14526;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14557;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14565;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14645;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14732;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14744;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14745;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14752;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14848;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=14986;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15001;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15002;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15003;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15004;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15005;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15045;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15046;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15047;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15062;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15063;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15064;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15074;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15075;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15086;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15087;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15089;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15107;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15108;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15114;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15140;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15141;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=15193;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15224;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15104;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=306;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=14862;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15286;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15288;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15290;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15333;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15334;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15391;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15392;
UPDATE `creature_template` SET `type`=4 WHERE `entry`=15428;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15429;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15620;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15631;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15667;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15698;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15706;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15725;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15726;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15802;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15740;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15904;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15910;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15964;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=16193;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15714;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15715;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15716;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15713;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=11195;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15090;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15666;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=15665;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15524;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15186;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=17266;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=4268;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=16547;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=16143;
UPDATE `creature_template` SET `type`=8 WHERE `entry`=16479;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7689;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=16069;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15699;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15742;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15741;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7552;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=16085;
UPDATE `creature_template` SET `type`=8 WHERE `entry`=12861;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=14877;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=14966;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15109;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=14941;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=14967;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=14968;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15729;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15832;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15838;
UPDATE `creature_template` SET `type`=2 WHERE `entry`=7546;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7547;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7548;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7551;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7554;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7556;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7558;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7559;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7561;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=7570;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=9256;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=9936;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=11179;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14629;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14630;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14631;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14632;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=14633;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=15705;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=15710;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=16306;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=16336;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=16338;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=16419;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=16701;
UPDATE `creature_template` SET `type`=4 WHERE `entry`=10989;
UPDATE `creature_template` SET `type`=5 WHERE `entry`=10985;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=364;
UPDATE `creature_template` SET `type`=7 WHERE `entry`=11500;
UPDATE `creature_template` SET `type`=9 WHERE `entry`=16121;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=17286;
UPDATE `creature_template` SET `type`=6 WHERE `entry`=7276;
UPDATE `creature_template` SET `type`=10 WHERE `entry`=8138;
UPDATE `creature_template` SET `type`=1 WHERE `entry`=16445;

-- These creatures become type 11 (Totem) in patch 1.12.
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES 
(2523, 10, 4589, 0, 0, 0, 'Searing Totem', NULL, 0, 19, 19, 860, 860, 355, 355, 20, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 88, 1, 1820, 2002, 1, 0, 0, 0, 0, 0, 0, 0, 30.4304, 41.8418, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22048, 0, 0, 0, 0, 0, 4, 22, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(2630, 10, 4588, 0, 0, 0, 'Earthbind Totem', NULL, 0, 13, 13, 5, 5, 300, 300, 0, 82, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 68, 1, 1880, 2068, 1, 0, 0, 0, 0, 0, 0, 0, 21.5072, 29.5724, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6474, 0, 0, 0, 0, 0, 3, 17, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3527, 10, 4587, 0, 0, 0, 'Healing Stream Totem', NULL, 0, 21, 21, 980, 980, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 94, 1, 1770, 1947, 1, 0, 0, 0, 0, 0, 0, 0, 32.7096, 44.9757, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5672, 0, 0, 0, 0, 0, 4, 19, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3573, 10, 4587, 0, 0, 0, 'Mana Spring Totem', NULL, 0, 26, 26, 1309, 1309, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 110, 1, 1740, 1914, 1, 0, 0, 10, 0, 0, 0, 0, 39.8112, 54.7404, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5677, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3579, 10, 4588, 0, 0, 0, 'Stoneclaw Totem', NULL, 0, 8, 8, 334, 334, 333, 333, 20, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 58, 1, 1920, 2112, 1, 0, 0, 0, 0, 0, 0, 0, 13.5168, 18.5856, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5728, 0, 0, 0, 0, 0, 4, 18, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3902, 10, 4589, 0, 0, 0, 'Searing Totem II', NULL, 0, 20, 20, 919, 919, 570, 570, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 90, 1, 1810, 1991, 1, 0, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6350, 0, 0, 0, 39020, 0, 7, 36, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3903, 10, 4589, 0, 0, 0, 'Searing Totem III', NULL, 0, 37, 37, 2192, 2192, 910, 910, 0, 45, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 144, 1, 1640, 1804, 1, 0, 0, 0, 0, 0, 0, 0, 53.3984, 73.4228, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6351, 0, 0, 0, 0, 0, 13, 67, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3904, 10, 4589, 0, 0, 0, 'Searing Totem IV', NULL, 0, 45, 45, 2972, 2972, 1200, 1200, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 204, 1, 1550, 1705, 1, 0, 0, 0, 0, 0, 0, 0, 61.38, 84.3975, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6352, 0, 0, 0, 0, 0, 19, 93, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3906, 10, 4587, 0, 0, 0, 'Healing Stream Totem II', NULL, 0, 35, 35, 2016, 2016, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 138, 1, 1660, 1826, 1, 0, 0, 0, 0, 0, 0, 0, 51.128, 70.301, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6371, 0, 0, 0, 0, 0, 4, 22, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3907, 10, 4587, 0, 0, 0, 'Healing Stream Totem III', NULL, 0, 45, 45, 2972, 2972, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 204, 1, 1550, 1705, 1, 0, 0, 0, 0, 0, 0, 0, 61.38, 84.3975, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6372, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3908, 10, 4587, 0, 0, 0, 'Healing Stream Totem IV', NULL, 0, 50, 50, 3517, 3517, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 226, 1, 1500, 1650, 1, 0, 0, 0, 0, 0, 0, 0, 66, 90.75, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10460, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3909, 10, 4587, 0, 0, 0, 'Healing Stream Totem V', NULL, 0, 60, 60, 5, 5, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1410, 1551, 1, 0, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10461, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3911, 10, 4588, 0, 0, 0, 'Stoneclaw Totem II', NULL, 0, 29, 29, 1528, 1528, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 120, 1, 1720, 1892, 1, 0, 0, 0, 0, 0, 0, 0, 43.8944, 60.3548, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6397, 0, 0, 0, 0, 0, 6, 31, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3912, 10, 4588, 0, 0, 0, 'Stoneclaw Totem III', NULL, 0, 40, 40, 2471, 2471, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 156, 1, 1610, 1771, 1, 0, 0, 0, 0, 0, 0, 0, 56.672, 77.924, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6398, 0, 0, 0, 0, 0, 8, 39, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3913, 10, 4588, 0, 0, 0, 'Stoneclaw Totem IV', NULL, 0, 38, 38, 2284, 2284, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 148, 1, 1630, 1793, 1, 0, 0, 0, 0, 0, 0, 0, 54.5072, 74.9474, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6399, 0, 0, 0, 0, 0, 9, 43, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(3968, 10, 4590, 0, 0, 0, 'Sentry Totem', NULL, 0, 40, 40, 2471, 2471, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 156, 1, 1590, 1749, 1, 0, 0, 0, 0, 0, 0, 0, 55.968, 76.956, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 30, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(5873, 10, 4588, 0, 0, 0, 'Stoneskin Totem', NULL, 0, 9, 9, 372, 372, 370, 370, 20, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 60, 1, 1910, 2101, 1, 0, 0, 0, 0, 0, 0, 0, 15.1272, 20.7999, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8072, 0, 0, 0, 0, 0, 4, 18, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5874, 10, 4588, 0, 0, 0, 'Strength of Earth Totem', NULL, 0, 14, 14, 594, 594, 596, 596, 20, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 70, 1, 1850, 2035, 1, 0, 0, 0, 0, 0, 0, 0, 22.792, 31.339, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8076, 0, 0, 0, 0, 0, 7, 33, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5879, 10, 4683, 0, 0, 0, 'Fire Nova Totem', NULL, 0, 14, 14, 594, 594, 596, 596, 20, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 70, 1, 1850, 2035, 1, 0, 0, 10, 0, 0, 0, 0, 22.792, 31.339, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8443, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5913, 10, 4588, 0, 0, 0, 'Tremor Totem', NULL, 0, 53, 53, 3866, 3866, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 238, 1, 1480, 1628, 1, 0, 0, 0, 0, 0, 0, 0, 69.0272, 94.9124, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8145, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5919, 10, 4588, 0, 0, 0, 'Stoneskin Totem II', NULL, 0, 14, 14, 594, 594, 300, 300, 20, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 70, 1, 1870, 2057, 1, 0, 0, 0, 0, 0, 0, 0, 23.0384, 31.6778, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8156, 0, 0, 0, 0, 0, 3, 17, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5920, 10, 4588, 0, 0, 0, 'Stoneskin Totem III', NULL, 0, 25, 25, 1240, 1240, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 106, 1, 1750, 1925, 1, 0, 0, 0, 0, 0, 0, 0, 38.5, 52.9375, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8157, 0, 0, 0, 0, 0, 4, 20, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5921, 10, 4588, 0, 0, 0, 'Strength of Earth Totem II', NULL, 0, 24, 24, 1172, 1172, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 104, 1, 1770, 1947, 1, 0, 0, 0, 0, 0, 0, 0, 37.3824, 51.4008, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8162, 0, 0, 0, 0, 0, 4, 20, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5922, 10, 4588, 0, 0, 0, 'Strength of Earth Totem III', NULL, 0, 38, 38, 2284, 2284, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 148, 1, 1610, 1771, 1, 0, 0, 0, 0, 0, 0, 0, 53.8384, 74.0278, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8163, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5923, 10, 4587, 0, 0, 0, 'Poison Cleansing Totem', NULL, 0, 38, 38, 2284, 2284, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 148, 1, 1610, 1771, 1, 0, 0, 0, 0, 0, 0, 0, 53.8384, 74.0278, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8167, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5924, 10, 4587, 0, 0, 0, 'Cleansing Totem', NULL, 0, 38, 38, 2284, 2284, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 148, 1, 1610, 1771, 1, 0, 0, 0, 0, 0, 0, 0, 53.8384, 74.0278, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8172, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5925, 10, 4590, 0, 0, 0, 'Grounding Totem', NULL, 0, 38, 38, 5, 5, 300, 300, 0, 7, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 148, 1, 1610, 1771, 1, 0, 0, 0, 0, 0, 0, 0, 53.8384, 74.0278, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8179, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 'TotemGlebe'),
(5926, 10, 4589, 0, 0, 0, 'Frost Resistance Totem', NULL, 0, 24, 24, 1172, 1172, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 104, 1, 1760, 1936, 1, 0, 0, 0, 0, 0, 0, 0, 37.1712, 51.1104, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8182, 0, 0, 0, 0, 0, 4, 20, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5927, 10, 4587, 0, 0, 0, 'Fire Resistance Totem', NULL, 0, 35, 35, 2016, 2016, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 138, 1, 1640, 1804, 1, 0, 0, 0, 0, 0, 0, 0, 50.512, 69.454, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8185, 0, 0, 0, 0, 0, 4, 22, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5929, 10, 4589, 0, 0, 0, 'Magma Totem', NULL, 0, 31, 31, 1684, 1684, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 126, 1, 1700, 1870, 1, 0, 0, 10, 0, 0, 0, 0, 46.376, 63.767, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8188, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(5950, 10, 4589, 0, 0, 0, 'Flametongue Totem', NULL, 0, 28, 28, 1454, 1454, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 116, 1, 1730, 1903, 1, 0, 0, 0, 0, 0, 0, 0, 42.6272, 58.6124, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8229, 0, 0, 0, 0, 0, 4, 21, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(6012, 10, 4589, 0, 0, 0, 'Flametongue Totem II', NULL, 0, 46, 46, 3077, 3077, 300, 300, 0, 35, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 208, 1, 1550, 1705, 1, 0, 0, 0, 0, 0, 0, 0, 62.744, 86.273, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8251, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(6016, 10, 2419, 0, 0, 0, 'Elemental Protection Totem', NULL, 0, 54, 54, 3986, 3986, 300, 300, 0, 74, 0, 0.01, 1.14286, 1, 20, 5, 0, 0, 1, 9, 9, 0, 244, 1, 1460, 1606, 1, 0, 0, 0, 0, 0, 0, 0, 69.3792, 95.3964, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8263, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 646016863, 0, 0, ''),
(6017, 10, 1421, 0, 0, 0, 'Lava Spout Totem', NULL, 0, 37, 37, 2192, 2192, 300, 300, 0, 82, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 144, 1, 1640, 1804, 1, 262144, 0, 0, 0, 0, 0, 0, 53.3984, 73.4228, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8266, 0, 0, 0, 0, 0, 4, 22, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(6066, 10, 2420, 0, 0, 0, 'Earthgrab Totem', NULL, 0, 50, 50, 22, 22, 1286, 1286, 0, 16, 0, 0.84, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 226, 1, 1510, 1661, 1, 262144, 0, 0, 0, 0, 0, 0, 66.44, 91.355, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8378, 0, 0, 0, 0, 0, 0, 0, 'TotemAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(6110, 10, 4683, 0, 0, 0, 'Fire Nova Totem II', NULL, 0, 24, 24, 1172, 1172, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 104, 1, 1760, 1936, 1, 0, 0, 0, 0, 0, 0, 0, 37.1712, 51.1104, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8504, 0, 0, 0, 0, 0, 4, 20, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(6111, 10, 4683, 0, 0, 0, 'Fire Nova Totem III', NULL, 0, 37, 37, 2192, 2192, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 144, 1, 1640, 1804, 1, 0, 0, 0, 0, 0, 0, 0, 53.3984, 73.4228, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8505, 0, 0, 0, 0, 0, 4, 22, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(6112, 10, 4590, 0, 0, 0, 'Windfury Totem', NULL, 0, 35, 35, 2016, 2016, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 138, 1, 1660, 1826, 1, 0, 0, 10, 0, 0, 0, 0, 51.128, 70.301, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8515, 8516, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7366, 10, 4588, 0, 0, 0, 'Stoneskin Totem IV', NULL, 0, 38, 38, 2284, 2284, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 148, 1, 1630, 1793, 1, 0, 0, 0, 0, 0, 0, 0, 54.5072, 74.9474, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10403, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7367, 10, 4588, 0, 0, 0, 'Stoneskin Totem V', NULL, 0, 45, 45, 2972, 2972, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 204, 1, 1550, 1705, 1, 0, 0, 0, 0, 0, 0, 0, 61.38, 84.3975, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10404, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7368, 10, 4588, 0, 0, 0, 'Stoneskin Totem VI', NULL, 0, 54, 54, 3986, 3986, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 244, 1, 1440, 1584, 1, 0, 0, 0, 0, 0, 0, 0, 68.4288, 94.0896, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10405, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7398, 10, 4588, 0, 0, 0, 'Stoneclaw Totem V', NULL, 0, 53, 53, 3866, 3866, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 238, 1, 1480, 1628, 1, 0, 0, 0, 0, 0, 0, 0, 69.0272, 94.9124, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10425, 0, 0, 0, 0, 0, 11, 55, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7399, 10, 4588, 0, 0, 0, 'Stoneclaw Totem VI', NULL, 0, 58, 58, 4484, 4484, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 262, 1, 1430, 1573, 1, 0, 0, 0, 0, 0, 0, 0, 72.9872, 100.357, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10426, 0, 0, 0, 0, 0, 13, 64, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7400, 10, 4589, 0, 0, 0, 'Searing Totem V', NULL, 0, 50, 50, 3517, 3517, 1700, 1700, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 226, 1, 1510, 1661, 1, 0, 0, 0, 0, 0, 0, 0, 66.44, 91.355, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10435, 0, 0, 0, 0, 0, 27, 135, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7402, 10, 4589, 0, 0, 0, 'Searing Totem VI', NULL, 0, 60, 60, 5, 5, 2184, 2184, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1410, 1551, 1, 0, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10436, 0, 0, 0, 0, 0, 36, 181, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7403, 10, 4588, 0, 0, 0, 'Strength of Earth Totem IV', NULL, 0, 53, 53, 3866, 3866, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 238, 1, 1450, 1595, 1, 0, 0, 0, 0, 0, 0, 0, 67.628, 92.9885, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10441, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7412, 10, 4589, 0, 0, 0, 'Frost Resistance Totem II', NULL, 0, 52, 52, 3748, 3748, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 234, 1, 1490, 1639, 1, 0, 0, 0, 0, 0, 0, 0, 68.1824, 93.7508, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10476, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7413, 10, 4589, 0, 0, 0, 'Frost Resistance Totem III', NULL, 0, 57, 57, 4356, 4356, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 258, 1, 1430, 1573, 1, 0, 0, 0, 0, 0, 0, 0, 71.7288, 98.6271, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10477, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7414, 10, 4587, 0, 0, 0, 'Mana Spring Totem II', NULL, 0, 45, 45, 2972, 2972, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 204, 1, 1560, 1716, 1, 0, 0, 0, 0, 0, 0, 0, 61.776, 84.942, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10491, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7415, 10, 4587, 0, 0, 0, 'Mana Spring Totem III', NULL, 0, 52, 52, 3748, 3748, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 234, 1, 1470, 1617, 1, 0, 0, 0, 0, 0, 0, 0, 67.2672, 92.4924, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10493, 0, 0, 0, 0, 0, 47, 233, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7416, 10, 4587, 0, 0, 0, 'Mana Spring Totem IV', NULL, 0, 56, 56, 4231, 4231, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 254, 1, 1430, 1573, 1, 0, 0, 0, 0, 0, 0, 0, 70.4704, 96.8968, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10494, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7423, 10, 4589, 0, 0, 0, 'Flametongue Totem III', NULL, 0, 46, 46, 3077, 3077, 300, 300, 0, 35, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 208, 1, 1550, 1705, 1, 0, 0, 0, 0, 0, 0, 0, 62.744, 86.273, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10524, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7424, 10, 4587, 0, 0, 0, 'Fire Resistance Totem II', NULL, 0, 55, 55, 4108, 4108, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 248, 1, 1450, 1595, 1, 0, 0, 0, 0, 0, 0, 0, 70.18, 96.4975, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10534, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7425, 10, 4587, 0, 0, 0, 'Fire Resistance Totem III', NULL, 0, 58, 58, 4484, 4484, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 262, 1, 1420, 1562, 1, 0, 0, 0, 0, 0, 0, 0, 72.4768, 99.6556, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10535, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7464, 10, 4589, 0, 0, 0, 'Magma Totem II', NULL, 0, 38, 38, 2284, 2284, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 148, 1, 1610, 1771, 1, 0, 0, 0, 0, 0, 0, 0, 53.8384, 74.0278, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10582, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7465, 10, 4589, 0, 0, 0, 'Magma Totem III', NULL, 0, 51, 51, 3632, 3632, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 230, 1, 1480, 1628, 1, 0, 0, 0, 0, 0, 0, 0, 66.4224, 91.3308, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10583, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7466, 10, 4589, 0, 0, 0, 'Magma Totem IV', NULL, 0, 56, 56, 4231, 4231, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 254, 1, 1430, 1573, 1, 0, 0, 0, 0, 0, 0, 0, 70.4704, 96.8968, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10584, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7467, 10, 4590, 0, 0, 0, 'Nature Resistance Totem', NULL, 0, 34, 34, 1930, 1930, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 134, 1, 1670, 1837, 1, 0, 0, 0, 0, 0, 0, 0, 49.9664, 68.7038, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10596, 0, 0, 0, 0, 0, 4, 22, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7468, 10, 4590, 0, 0, 0, 'Nature Resistance Totem II', NULL, 0, 57, 57, 4356, 4356, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 258, 1, 1440, 1584, 1, 0, 0, 0, 0, 0, 0, 0, 72.2304, 99.3168, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10598, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7469, 10, 4590, 0, 0, 0, 'Nature Resistance Totem III', NULL, 0, 60, 60, 5, 5, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1410, 1551, 1, 0, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10599, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7483, 10, 4590, 0, 0, 0, 'Windfury Totem II', NULL, 0, 48, 48, 3294, 3294, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 216, 1, 1510, 1661, 1, 0, 0, 0, 0, 0, 0, 0, 63.7824, 87.7008, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10609, 10608, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7484, 10, 4590, 0, 0, 0, 'Windfury Totem III', NULL, 0, 60, 60, 4400, 4400, 0, 0, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1410, 1551, 1, 0, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10612, 10610, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7486, 10, 4590, 0, 0, 0, 'Grace of Air Totem', NULL, 0, 43, 43, 2766, 2766, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 182, 1, 1560, 1716, 1, 0, 0, 0, 0, 0, 0, 0, 59.0304, 81.1668, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8836, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7487, 10, 4590, 0, 0, 0, 'Grace of Air Totem II', NULL, 0, 60, 60, 5, 5, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1410, 1551, 1, 0, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10626, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7844, 10, 4683, 0, 0, 0, 'Fire Nova Totem IV', NULL, 0, 47, 47, 3184, 3184, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 212, 1, 1540, 1694, 1, 0, 0, 0, 0, 0, 0, 0, 63.6944, 87.5798, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11310, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(7845, 10, 4683, 0, 0, 0, 'Fire Nova Totem V', NULL, 0, 52, 52, 3748, 3748, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 234, 1, 1470, 1617, 1, 0, 0, 0, 0, 0, 0, 0, 67.2672, 92.4924, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11311, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(8510, 10, 2420, 0, 0, 0, 'Atal\'ai Totem', NULL, 0, 51, 51, 920, 920, 0, 0, 0, 35, 0, 0.01, 1.14286, 1, 20, 5, 0, 0, 1, 9, 9, 0, 230, 1, 1510, 1661, 1, 0, 0, 0, 0, 0, 0, 0, 66.44, 91.355, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12507, 0, 0, 0, 0, 0, 33, 167, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(9637, 10, 4589, 0, 0, 0, 'Scorching Totem', NULL, 0, 52, 52, 3748, 3748, 2184, 2184, 0, 35, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 234, 1, 1490, 1639, 1, 0, 0, 0, 0, 0, 0, 0, 68.1824, 93.7508, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15037, 0, 0, 0, 0, 0, 35, 175, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(9687, 10, 4590, 0, 0, 0, 'Windwall Totem', NULL, 0, 45, 45, 2972, 2972, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 204, 1, 1560, 1716, 1, 0, 0, 0, 0, 0, 0, 0, 61.776, 84.942, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15108, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(9688, 10, 4590, 0, 0, 0, 'Windwall Totem II', NULL, 0, 45, 45, 2972, 2972, 300, 300, 0, 35, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 204, 1, 1560, 1716, 1, 0, 0, 0, 0, 0, 0, 0, 61.776, 84.942, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15109, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(9689, 10, 4590, 0, 0, 0, 'Windwall Totem III', NULL, 0, 59, 59, 4612, 4612, 300, 300, 0, 35, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 268, 1, 1420, 1562, 1, 0, 0, 0, 0, 0, 0, 0, 73.7264, 101.374, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15110, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(10183, 10, 4590, 0, 0, 0, 'Moonflare Totem', NULL, 0, 54, 55, 3986, 3986, 3000, 3000, 0, 82, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 244, 1, 1470, 1617, 1, 0, 0, 0, 0, 0, 0, 0, 69.8544, 96.0498, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15789, 0, 0, 0, 0, 0, 91, 453, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(10217, 10, 4589, 0, 0, 0, 'Flame Buffet Totem', NULL, 0, 56, 57, 4231, 4231, 300, 300, 0, 35, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 254, 1, 1450, 1595, 1, 0, 0, 0, 0, 0, 0, 0, 71.456, 98.252, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16168, 0, 0, 0, 0, 0, 50, 251, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(10467, 10, 4587, 0, 0, 0, 'Mana Tide Totem', NULL, 0, 42, 42, 2666, 2666, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 172, 1, 1590, 1749, 1, 0, 0, 0, 0, 0, 0, 0, 58.7664, 80.8038, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16191, 0, 0, 0, 0, 0, 5, 23, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(10557, 10, 4589, 0, 0, 0, 'Flametongue Totem IV', NULL, 0, 46, 46, 3077, 3077, 300, 300, 0, 35, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 208, 1, 1550, 1705, 1, 0, 0, 0, 0, 0, 0, 0, 62.744, 86.273, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16388, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(11100, 10, 4587, 0, 0, 0, 'Mana Tide Totem II', NULL, 0, 52, 52, 3748, 3748, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 234, 1, 1460, 1606, 1, 0, 0, 0, 0, 0, 0, 0, 66.8096, 91.8632, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17355, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(11101, 10, 4587, 0, 0, 0, 'Mana Tide Totem III', NULL, 0, 60, 60, 5, 5, 300, 300, 0, 116, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1410, 1551, 1, 0, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17360, 0, 0, 0, 0, 0, 5, 25, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(12141, 10, 4587, 0, 0, 0, 'Ice Totem', NULL, 0, 53, 53, 3866, 3866, 300, 300, 0, 6, 0, 1.22, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 238, 1, 1480, 1628, 1, 0, 0, 0, 0, 0, 0, 0, 69.0272, 94.9124, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18977, 0, 0, 0, 0, 0, 5, 24, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(13916, 10, 11686, 0, 0, 0, 'Dire Maul Crystal Totem', NULL, 0, 52, 52, 3748, 3748, 2306, 2306, 0, 16, 2, 1.22, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 234, 1, 1470, 1617, 1, 0, 0, 0, 0, 0, 0, 0, 67.2672, 92.4924, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 677, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(14662, 10, 4683, 0, 0, 0, 'Corrupted Fire Nova Totem V', NULL, 0, 52, 52, 200, 2000, 300, 300, 0, 37, 0, 1.21, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 234, 1, 1490, 1639, 1, 131072, 0, 0, 0, 0, 0, 0, 68.1824, 93.7508, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11307, 11309, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 650346399, 0, 16641, 'npc_corrupted_totem'),
(14663, 10, 4588, 0, 0, 0, 'Corrupted Stoneskin Totem VI', NULL, 0, 54, 54, 200, 2000, 0, 0, 0, 37, 0, 1.22, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 244, 1, 1470, 1617, 1, 131072, 0, 0, 0, 0, 0, 0, 69.8544, 96.0498, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10405, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 650346399, 0, 16641, 'npc_corrupted_totem'),
(14664, 10, 4587, 0, 0, 0, 'Corrupted Healing Stream Totem V', NULL, 0, 60, 60, 200, 2000, 0, 0, 0, 37, 0, 1.26, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1410, 1551, 1, 131072, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10461, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 650346399, 0, 16641, 'npc_corrupted_totem'),
(14666, 10, 4590, 0, 0, 0, 'Corrupted Windfury Totem III', NULL, 0, 60, 60, 200, 2000, 300, 300, 0, 37, 0, 1.26, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1410, 1551, 1, 131072, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10612, 10610, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 650346399, 0, 16641, 'npc_corrupted_totem'),
(14667, 10, 11686, 0, 0, 0, 'Corrupted Totem', NULL, 0, 1, 1, 64, 64, 53, 53, 20, 14, 0, 0.91, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 44, 1, 2000, 2200, 1, 33685762, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 384, ''),
(15304, 10, 4587, 0, 0, 0, 'Ancient Mana Spring Totem', NULL, 0, 1, 1, 64, 64, 53, 53, 20, 7, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 44, 1, 2000, 2200, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24853, 0, 0, 0, 0, 0, 0, 1, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(15363, 10, 262, 0, 0, 0, 'Spirit Totem', NULL, 0, 35, 35, 2016, 2016, 300, 300, 0, 35, 0, 1.11, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 138, 1, 1660, 1826, 1, 0, 0, 0, 0, 0, 0, 0, 51.128, 70.301, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 115, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(15463, 10, 4590, 0, 0, 0, 'Grace of Air Totem III', NULL, 0, 60, 60, 5, 5, 300, 300, 0, 2, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1410, 1551, 1, 0, 0, 0, 0, 0, 0, 0, 74.448, 102.366, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25360, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(15464, 10, 4588, 0, 0, 0, 'Strength of Earth Totem V', NULL, 0, 60, 60, 5, 5, 300, 300, 0, 6, 0, 0.01, 1.14286, 0, 20, 5, 0, 0, 1, 9, 9, 0, 272, 1, 1850, 1850, 1, 0, 0, 0, 0, 0, 0, 0, 100, 130, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25362, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(15803, 10, 4590, 4590, 0, 0, 'Tranquil Air Totem', '', 0, 60, 60, 5, 5, 0, 0, 0, 35, 0, 1, 1.14286, 1, 20, 5, 0, 0, 1, 0, 0, 0, 272, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25909, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, ''),
(16385, 10, 4590, 0, 0, 0, 'Lightning Totem', NULL, 0, 62, 62, 6900, 6900, 0, 0, 4091, 21, 0, 0.00001, 0.00001, 0, 20, 5, 0, 0, 1, 0, 0, 0, 284, 1, 1318, 1551, 1, 0, 0, 0, 0, 0, 0, 0, 291.13, 405.862, 100, 11, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
