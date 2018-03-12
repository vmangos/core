DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180207115724');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180207115724');
-- Add your query below.


DELETE FROM `creature_ai_texts` WHERE `entry`=-1;
UPDATE `creature_ai_scripts` SET `action1_param1`=7133 WHERE `id`=10303;

DELETE FROM `creature_ai_texts` WHERE `entry`=-2;
UPDATE `creature_ai_scripts` SET `action1_param1`=1866 WHERE `action1_type`=1 && `action1_param1`=-2;
UPDATE `creature_ai_scripts` SET `action1_param2`=1866 WHERE `action1_type`=1 && `action1_param2`=-2;

DELETE FROM `creature_ai_texts` WHERE `entry`=-3;
UPDATE `creature_ai_scripts` SET `action1_param2`=1865 WHERE `action1_type`=1 && `action1_param2`=-3;

DELETE FROM `creature_ai_texts` WHERE `entry`=-4;
UPDATE `creature_ai_scripts` SET `action1_param2`=1867 WHERE `action1_type`=1 && `action1_param2`=-4;
UPDATE `creature_ai_scripts` SET `action1_param3`=1867 WHERE `action1_type`=1 && `action1_param3`=-4;

DELETE FROM `creature_ai_texts` WHERE `entry`=-5;
UPDATE `creature_ai_scripts` SET `action1_param1`=1871 WHERE `action1_type`=1 && `action1_param1`=-5;

DELETE FROM `creature_ai_texts` WHERE `entry`=-6;
UPDATE `creature_ai_scripts` SET `action1_param2`=1870 WHERE `action1_type`=1 && `action1_param2`=-6;

DELETE FROM `creature_ai_texts` WHERE `entry`=-7;
UPDATE `creature_ai_scripts` SET `action1_param1`=1868 WHERE `action1_type`=1 && `action1_param1`=-7;

DELETE FROM `creature_ai_texts` WHERE `entry`=-8;
UPDATE `creature_ai_scripts` SET `action1_param1`=1864 WHERE `action1_type`=1 && `action1_param1`=-8;
UPDATE `creature_ai_scripts` SET `action1_param2`=1864 WHERE `action1_type`=1 && `action1_param2`=-8;

DELETE FROM `creature_ai_texts` WHERE `entry`=-11;
UPDATE `broadcast_text` SET `Type`=2, `Sound`=645 WHERE `ID`=2441;
UPDATE `creature_ai_scripts` SET `action2_param1`=2441 WHERE `id`=582802;

DELETE FROM `creature_ai_texts` WHERE `entry`=-18;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5812 WHERE `ID`=6178;
UPDATE `creature_ai_scripts` SET `action1_param1`=6178 WHERE `id`=442002;

DELETE FROM `creature_ai_texts` WHERE `entry`=-22;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5774 WHERE `ID`=5619;
UPDATE `creature_ai_scripts` SET `action1_param1`=5619 WHERE `id`=64401;

DELETE FROM `creature_ai_texts` WHERE `entry`=-30;
UPDATE `creature_ai_scripts` SET `action1_param1`=3131 WHERE `action1_type`=1 && `action1_param1`=-30;

DELETE FROM `creature_ai_texts` WHERE `entry`=-31;
UPDATE `creature_ai_scripts` SET `action1_param1`=3367 WHERE `action1_type`=1 && `action1_param1`=-31;

DELETE FROM `creature_ai_texts` WHERE `entry`=-32;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5811 WHERE `ID`=6177;
UPDATE `creature_ai_scripts` SET `action1_param1`=6177 WHERE `id`=623501;

DELETE FROM `creature_ai_texts` WHERE `entry`=-33;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4142;
UPDATE `creature_ai_scripts` SET `action1_param1`=4142 WHERE `action1_type`=1 && `action1_param1`=-33;

DELETE FROM `creature_ai_texts` WHERE `entry`=-42;
UPDATE `creature_ai_scripts` SET `action1_param1`=1942 WHERE `action1_type`=1 && `action1_param1`=-42;

DELETE FROM `creature_ai_texts` WHERE `entry`=-102;
UPDATE `creature_ai_scripts` SET `action1_param2`=1939 WHERE `action1_type`=1 && `action1_param2`=-102;

DELETE FROM `creature_ai_texts` WHERE `entry`=-104;
UPDATE `creature_ai_scripts` SET `action1_param1`=455 WHERE `id`=136402;

DELETE FROM `creature_ai_texts` WHERE `entry`=-105;
UPDATE `creature_ai_scripts` SET `action1_param3`=1938 WHERE `action1_type`=1 && `action1_param3`=-105;

DELETE FROM `creature_ai_texts` WHERE `entry`=-107;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5807 WHERE `ID`=6173;
UPDATE `creature_ai_scripts` SET `action1_param1`=6173 WHERE `id`=780003;

DELETE FROM `creature_ai_texts` WHERE `entry`=-109;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5809 WHERE `ID`=6176;
UPDATE `creature_ai_scripts` SET `action3_param1`=6176 WHERE `id`=780006;

DELETE FROM `creature_ai_texts` WHERE `entry`=-110;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5810 WHERE `ID`=6175;
UPDATE `creature_ai_scripts` SET `action1_param1`=6175 WHERE `id`=780005;

DELETE FROM `creature_ai_texts` WHERE `entry`=-123;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5788 WHERE `ID`=6096;
UPDATE `creature_ai_scripts` SET `action1_param1`=6096 WHERE `id`=367302;

DELETE FROM `creature_ai_texts` WHERE `entry`=-134;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5814 WHERE `ID`=6183;
UPDATE `creature_ai_scripts` SET `action1_param1`=6183 WHERE `id`=442114;

DELETE FROM `creature_ai_texts` WHERE `entry`=-140;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5787 WHERE `ID`=6095;
UPDATE `creature_ai_scripts` SET `action1_param1`=6095 WHERE `id`=367002;

DELETE FROM `creature_ai_texts` WHERE `entry`=-161;
UPDATE `creature_ai_scripts` SET `action1_param3`=1941 WHERE `action1_type`=1 && `action1_param3`=-161;

DELETE FROM `creature_ai_texts` WHERE `entry`=-168;
UPDATE `creature_ai_scripts` SET `action1_param1`=508 WHERE `id`=31501;

DELETE FROM `creature_ai_texts` WHERE `entry`=-174;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=1149;
UPDATE `creature_ai_scripts` SET `action1_param1`=1149 WHERE `id`=64601;

DELETE FROM `creature_ai_texts` WHERE `entry`=-175;
UPDATE `creature_ai_scripts` SET `action2_param1`=1344 WHERE `id`=64605;

DELETE FROM `creature_ai_texts` WHERE `entry`=-177;
DELETE FROM `creature_ai_texts` WHERE `entry`=-178;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6422;
UPDATE `creature_ai_scripts` SET `action1_param1`=6422, `action1_param2`=0, `action1_param3`=0 WHERE `id`=1105801;

DELETE FROM `creature_ai_texts` WHERE `entry`=-182;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=8852;
UPDATE `creature_ai_scripts` SET `action1_param1`=8852 WHERE `id`=1360102;

DELETE FROM `creature_ai_texts` WHERE `entry`=-183;
UPDATE `creature_ai_scripts` SET `action1_param1`=2571 WHERE `action1_type`=1 && `action1_param1`=-183;

DELETE FROM `creature_ai_texts` WHERE `entry`=-184;
UPDATE `creature_ai_scripts` SET `action1_param2`=2569 WHERE `action1_type`=1 && `action1_param2`=-184;

DELETE FROM `creature_ai_texts` WHERE `entry`=-206;
UPDATE `creature_ai_scripts` SET `action1_param1`=185 WHERE `action1_type`=1 && `action1_param1`=-206;
UPDATE `creature_ai_scripts` SET `action2_param1`=185 WHERE `action2_type`=1 && `action2_param1`=-206;
UPDATE `creature_ai_scripts` SET `action3_param1`=185 WHERE `action3_type`=1 && `action3_param1`=-206;

DELETE FROM `creature_ai_texts` WHERE `entry`=-208;
UPDATE `creature_ai_scripts` SET `action1_param3`=179 WHERE `action1_type`=1 && `action1_param3`=-208;
UPDATE `creature_ai_scripts` SET `action2_param3`=179 WHERE `action2_type`=1 && `action2_param3`=-208;
UPDATE `creature_ai_scripts` SET `action3_param1`=179 WHERE `action3_type`=1 && `action3_param1`=-208;
UPDATE `creature_ai_scripts` SET `action3_param2`=179 WHERE `action3_type`=1 && `action3_param2`=-208;
UPDATE `creature_ai_scripts` SET `action3_param3`=179 WHERE `action3_type`=1 && `action3_param3`=-208;

DELETE FROM `creature_ai_texts` WHERE `entry`=-209;
UPDATE `creature_ai_scripts` SET `action1_param1`=479 WHERE `id`=55001;

DELETE FROM `creature_ai_texts` WHERE `entry`=-211;
UPDATE `creature_ai_scripts` SET `action1_param3`=473 WHERE `id`=55001;

DELETE FROM `creature_ai_texts` WHERE `entry`=-212;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=7271;

DELETE FROM `creature_ai_texts` WHERE `entry`=-233;
UPDATE `creature_ai_scripts` SET `action1_param1`=86 WHERE `id`=29501;

DELETE FROM `creature_ai_texts` WHERE `entry`=-274;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4351;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=4351;
DELETE FROM `creature_ai_scripts` WHERE `id`=435202;

DELETE FROM `creature_ai_texts` WHERE `entry`=-321;
UPDATE `creature_ai_scripts` SET `action1_param1`=1910 WHERE `id`=139703;
DELETE FROM `creature_ai_texts` WHERE `entry`=-322;
UPDATE `creature_ai_scripts` SET `action1_param2`=1911 WHERE `id`=139703;

DELETE FROM `creature_ai_texts` WHERE `entry`=-323;
UPDATE `creature_ai_scripts` SET `action1_param1`=1918 WHERE `id`=126002;

DELETE FROM `creature_ai_texts` WHERE `entry`=-330;
UPDATE `creature_ai_scripts` SET `action1_param1`=1225 WHERE `id`=369501;

DELETE FROM `creature_ai_texts` WHERE `entry`=-331;
UPDATE `creature_ai_scripts` SET `action1_param1`=1234 WHERE `action1_type`=1 && `action1_param1`=-331;

DELETE FROM `creature_ai_texts` WHERE `entry`=-358;
UPDATE `creature_ai_scripts` SET `action1_param2`=1935 WHERE `action1_type`=1 && `action1_param2`=-358;

DELETE FROM `creature_ai_texts` WHERE `entry`=-361;
UPDATE `creature_ai_scripts` SET `action1_param3`=1927 WHERE `action1_type`=1 && `action1_param3`=-361;

DELETE FROM `creature_ai_texts` WHERE `entry`=-363;
UPDATE `creature_ai_scripts` SET `action1_param2`=435 WHERE `id`=122201;

DELETE FROM `creature_ai_texts` WHERE `entry`=-366;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6329;
UPDATE `creature_ai_scripts` SET `action1_param1`=6329 WHERE `id`=1360201;

DELETE FROM `creature_ai_texts` WHERE `entry`=-370;
UPDATE `creature_ai_scripts` SET `action1_param3`=444 WHERE `id`=139801;

DELETE FROM `creature_ai_texts` WHERE `entry`=-371;
UPDATE `creature_ai_scripts` SET `action1_param2`=446 WHERE `id`=139902;

DELETE FROM `creature_ai_texts` WHERE `entry`=-372;
UPDATE `creature_ai_scripts` SET `action1_param3`=448 WHERE `id`=139902;

DELETE FROM `creature_ai_texts` WHERE `entry`=-374;
UPDATE `creature_ai_scripts` SET `action1_param1`=512, `action1_param2`=0, `action1_param3`=0 WHERE `id`=214901;

DELETE FROM `creature_ai_texts` WHERE `entry`=-375;
UPDATE `creature_ai_scripts` SET `action2_param1`=637 WHERE `action2_type`=1 && `action2_param1`=-375;

DELETE FROM `creature_ai_texts` WHERE `entry`=-376;
UPDATE `creature_ai_scripts` SET `action1_param1`=1875 WHERE `action1_type`=1 && `action1_param1`=-376;

DELETE FROM `creature_ai_texts` WHERE `entry`=-377;
UPDATE `creature_ai_scripts` SET `action1_param2`=1874 WHERE `action1_type`=1 && `action1_param2`=-377;

DELETE FROM `creature_ai_texts` WHERE `entry`=-388;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5801 WHERE `ID`=6170;
UPDATE `creature_ai_scripts` SET `action1_param1`=6170 WHERE `id`=483112;

DELETE FROM `creature_ai_texts` WHERE `entry`=-404;
UPDATE `creature_ai_scripts` SET `action1_param1`=9589 WHERE `id`=106301;

DELETE FROM `creature_ai_texts` WHERE `entry`=-405;
UPDATE `creature_ai_scripts` SET `action1_param1`=907 WHERE `id`=293101;

DELETE FROM `creature_ai_texts` WHERE `entry`=-412;
UPDATE `creature_ai_scripts` SET `action1_param2`=184 WHERE `action1_type`=1 && `action1_param2`=-412;
UPDATE `creature_ai_scripts` SET `action2_param2`=184 WHERE `action2_type`=1 && `action2_param2`=-412;
UPDATE `creature_ai_scripts` SET `action3_param3`=184 WHERE `action3_type`=1 && `action3_param3`=-412;

DELETE FROM `creature_ai_texts` WHERE `entry`=-431;
UPDATE `creature_ai_scripts` SET `action1_param3`=1098 WHERE `id`=350401;

DELETE FROM `creature_ai_texts` WHERE `entry`=-436;
UPDATE `creature_ai_scripts` SET `action1_param1`=1045 WHERE `id`=345101;

DELETE FROM `creature_ai_texts` WHERE `entry`=-437;
UPDATE `creature_ai_scripts` SET `action1_param1`=1046 WHERE `id`=345102;

DELETE FROM `creature_ai_texts` WHERE `entry`=-449;
DELETE FROM `creature_ai_texts` WHERE `entry`=-450;
UPDATE `creature_ai_scripts` SET `action1_param1`=503, `action1_param2`=504, `action1_param3`=505 WHERE `id`=204401;

DELETE FROM `creature_ai_texts` WHERE `entry`=-453;
UPDATE `creature_ai_scripts` SET `action1_param1`=71 WHERE `id`=27101;

DELETE FROM `creature_ai_texts` WHERE `entry`=-455;
UPDATE `creature_ai_scripts` SET `action1_param1`=67 WHERE `id`=27001;

DELETE FROM `creature_ai_texts` WHERE `entry`=-469;
UPDATE `creature_ai_scripts` SET `action1_param1`=895 WHERE `id`=273301;

DELETE FROM `creature_ai_texts` WHERE `entry`=-470;
UPDATE `creature_ai_scripts` SET `action1_param2`=896 WHERE `id`=273301;

DELETE FROM `creature_ai_texts` WHERE `entry`=-494;
UPDATE `creature_ai_scripts` SET `action1_param1`=2230 WHERE `id`=327701;

DELETE FROM `creature_ai_texts` WHERE `entry`=-527;
UPDATE `creature_ai_scripts` SET `action1_param1`=808 WHERE `action1_type`=1 && `action1_param1`=-527;

DELETE FROM `creature_ai_texts` WHERE `entry`=-532;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=841;
UPDATE `creature_ai_scripts` SET `action1_param1`=841 WHERE `id`=276301;

DELETE FROM `creature_ai_texts` WHERE `entry`=-539;
UPDATE `creature_ai_scripts` SET `action2_param1`=4515 WHERE `id`=856702;

DELETE FROM `creature_ai_texts` WHERE `entry`=-540;
UPDATE `creature_ai_scripts` SET `action2_param1`=4516 WHERE `id`=856703;

DELETE FROM `creature_ai_texts` WHERE `entry`=-548;
UPDATE `creature_ai_scripts` SET `action3_param1`=4561 WHERE `action3_type`=1 && `action3_param1`=-548;

DELETE FROM `creature_ai_texts` WHERE `entry`=-552;
UPDATE `creature_ai_scripts` SET `action1_param1`=11389 WHERE `id`=46603;

DELETE FROM `creature_ai_texts` WHERE `entry`=-566;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5802 WHERE `ID`=6171;
UPDATE `creature_ai_scripts` SET `action1_param1`=6171 WHERE `id`=483201;

DELETE FROM `creature_ai_texts` WHERE `entry`=-567;
UPDATE `creature_ai_scripts` SET `action2_type`=4, `action2_param1`=5804 WHERE `id`=483203;

DELETE FROM `creature_ai_texts` WHERE `entry`=-568;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5803 WHERE `ID`=6172;
UPDATE `creature_ai_scripts` SET `action1_type`=34, `action1_param1`=10, `action1_param2`=3, `action2_type`=0, `action2_param1`=0, `action2_param2`=0 WHERE `id`=483204;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (483205, 4832, 0, 5, 0, 100, 3, 15000, 15000, 0, 0, 1, 6172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Lord Kelris - Yell on Killed Target');

DELETE FROM `creature_ai_texts` WHERE `entry`=-569;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=2848;
UPDATE `creature_ai_scripts` SET `action1_param1`=2848 WHERE `id`=672901;

DELETE FROM `creature_ai_texts` WHERE `entry`=-576;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5852 WHERE `ID`=6212;
UPDATE `creature_ai_scripts` SET `action1_param1`=6212 WHERE `id`=729101;

DELETE FROM `creature_ai_texts` WHERE `entry`=-577;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5853 WHERE `ID`=6213;
UPDATE `creature_ai_scripts` SET `action1_param1`=6213 WHERE `id`=485402;

DELETE FROM `creature_ai_texts` WHERE `entry`=-585;
UPDATE `creature_ai_scripts` SET `action1_param1`=5544 WHERE `id`=1026202;

DELETE FROM `creature_ai_texts` WHERE `entry`=-654;
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=10025;
UPDATE `creature_ai_scripts` SET `action1_param1`=10025 WHERE `id`=1167702;

DELETE FROM `creature_ai_texts` WHERE `entry`=-769;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=1017;
UPDATE `creature_ai_scripts` SET `action1_param1`=1017 WHERE `action1_type`=1 && `action1_param1`=-769;

DELETE FROM `creature_ai_texts` WHERE `entry`=-770;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=1079;
UPDATE `creature_ai_scripts` SET `action1_param1`=1079 WHERE `id`=339501;

DELETE FROM `creature_ai_texts` WHERE `entry`=-817;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5859 WHERE `ID`=4485;
UPDATE `creature_ai_scripts` SET `action1_param1`=4485 WHERE `id`=858001;

DELETE FROM `creature_ai_texts` WHERE `entry`=-820;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4364;
UPDATE `creature_ai_scripts` SET `action1_param1`=4364 WHERE `id`=572102;

DELETE FROM `creature_ai_texts` WHERE `entry`=-828;
UPDATE `creature_ai_scripts` SET `action2_param1`=8398 WHERE `id`=1292102;

DELETE FROM `creature_ai_texts` WHERE `entry`=-895;
UPDATE `creature_ai_scripts` SET `action1_param1`=2626 WHERE `action1_type`=1 && `action1_param1`=-895;
UPDATE `creature_ai_scripts` SET `action1_param2`=2626 WHERE `action1_type`=1 && `action1_param2`=-895;
UPDATE `creature_ai_scripts` SET `action1_param3`=2626 WHERE `action1_type`=1 && `action1_param3`=-895;

DELETE FROM `creature_ai_texts` WHERE `entry`=-896;
UPDATE `creature_ai_scripts` SET `action1_param2`=2625 WHERE `action1_type`=1 && `action1_param2`=-896;
UPDATE `creature_ai_scripts` SET `action1_param3`=2625 WHERE `action1_type`=1 && `action1_param3`=-896;

DELETE FROM `creature_ai_texts` WHERE `entry`=-897;
UPDATE `creature_ai_scripts` SET `action1_param1`=2627 WHERE `action1_type`=1 && `action1_param1`=-897;
UPDATE `creature_ai_scripts` SET `action1_param3`=2627 WHERE `action1_type`=1 && `action1_param3`=-897;

DELETE FROM `creature_ai_scripts` WHERE `id` IN (944704, 945204);

DELETE FROM `creature_ai_texts` WHERE `entry`=-900;
UPDATE `creature_ai_scripts` SET `action1_param1`=2627 WHERE `action1_type`=1 && `action1_param1`=-900;
UPDATE `creature_ai_scripts` SET `action1_param3`=2627 WHERE `action1_type`=1 && `action1_param3`=-900;

DELETE FROM `creature_ai_texts` WHERE `entry`=-902;
UPDATE `creature_ai_scripts` SET `action1_param1`=2625 WHERE `action1_type`=1 && `action1_param1`=-902;
UPDATE `creature_ai_scripts` SET `action1_param2`=2625 WHERE `action1_type`=1 && `action1_param2`=-902;
UPDATE `creature_ai_scripts` SET `action1_param3`=2625 WHERE `action1_type`=1 && `action1_param3`=-902;

DELETE FROM `creature_ai_texts` WHERE `entry`=-903;
UPDATE `creature_ai_scripts` SET `action1_param1`=2626 WHERE `action1_type`=1 && `action1_param1`=-903;
UPDATE `creature_ai_scripts` SET `action1_param2`=2626 WHERE `action1_type`=1 && `action1_param2`=-903;
UPDATE `creature_ai_scripts` SET `action1_param3`=2626 WHERE `action1_type`=1 && `action1_param3`=-903;

DELETE FROM `creature_ai_texts` WHERE `entry`=-924;
UPDATE `creature_ai_scripts` SET `action1_param1`=629 WHERE `id`=227603;

DELETE FROM `creature_ai_texts` WHERE `entry`=-931;
UPDATE `creature_ai_scripts` SET `action1_param1`=601 WHERE `id`=243302;

DELETE FROM `creature_ai_texts` WHERE `entry`=-934;
UPDATE `creature_ai_scripts` SET `action1_param1`=623 WHERE `id`=243503;

DELETE FROM `creature_ai_texts` WHERE `entry`=-936;
UPDATE `creature_ai_scripts` SET `action1_param1`=600 WHERE `id`=294601;

DELETE FROM `creature_ai_texts` WHERE `entry`=-937;
UPDATE `creature_ai_scripts` SET `action1_param1`=599 WHERE `id`=243303;

DELETE FROM `creature_ai_texts` WHERE `entry`=-981;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=7274;
UPDATE `creature_ai_scripts` SET `action1_param2`=7274 WHERE `id`=1193601;

DELETE FROM `creature_ai_texts` WHERE `entry`=-985;
UPDATE `creature_ai_scripts` SET `action1_param1`=4491 WHERE `id`=858104;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1019;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=9500;
UPDATE `creature_ai_scripts` SET `action1_param1`=9500 WHERE `id`=1144704;

-- Silas Darkmoon
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1020, -1021, -1022, -1023);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=14823;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (1482301, 14823, 0, 1, 0, 100, 33, 30000, 30000, 150000, 150000, 1, 10153, 10154, 10155, 1, 10156, 10157, 10158, 0, 0, 0, 0, 'Silas Darkmoon - Random Say OOC');

DELETE FROM `creature_ai_texts` WHERE `entry`=-1024;
UPDATE `creature_ai_scripts` SET `action1_param1`=10133 WHERE `id`=1484501;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1025;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=10135;
UPDATE `creature_ai_scripts` SET `action1_param1`=10135 WHERE `id`=1484502;
UPDATE `creature_ai_scripts` SET `action1_param2`=10135 WHERE `id`=1484501;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1026;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=10134;
UPDATE `creature_ai_scripts` SET `action1_param3`=10134 WHERE `id`=1484501;
UPDATE `creature_ai_scripts` SET `action1_param2`=10134 WHERE `id`=1484502;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1027;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=10136;
UPDATE `creature_ai_scripts` SET `action1_param3`=10136 WHERE `id`=1484502;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1029;
UPDATE `creature_ai_scripts` SET `action1_param2`=2625 WHERE `id`=154001;
UPDATE `creature_ai_scripts` SET `action1_param3`=2625 WHERE `id`=153701;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1030;
UPDATE `creature_ai_scripts` SET `action1_param1`=317 WHERE `action1_type`=1 && `action1_param1`=-1030;
UPDATE `creature_ai_scripts` SET `action1_param3`=317 WHERE `action1_type`=1 && `action1_param3`=-1030;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1033;
UPDATE `creature_ai_scripts` SET `action1_param1`=574 WHERE `id`=165701;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1034;
UPDATE `creature_ai_scripts` SET `action1_param2`=575 WHERE `id`=165701;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1048;
DELETE FROM `creature_ai_scripts` WHERE `id`=1596301;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15963;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1058;
UPDATE `creature_ai_scripts` SET `action2_param1`=4541 WHERE `id`=766616;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1135;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5786 WHERE `ID`=6097;
UPDATE `creature_ai_scripts` SET `action1_param1`=6097 WHERE `id`=367101;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1305;
UPDATE `creature_ai_scripts` SET `action1_param1`=2627 WHERE `action1_type`=1 && `action1_param1`=-1305;
UPDATE `creature_ai_scripts` SET `action3_param1`=2627 WHERE `action3_type`=1 && `action3_param1`=-1305;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1306;
UPDATE `creature_ai_scripts` SET `action1_param2`=2625 WHERE `action1_type`=1 && `action1_param2`=-1306;
UPDATE `creature_ai_scripts` SET `action2_param1`=2625 WHERE `action2_type`=1 && `action2_param1`=-1306;
UPDATE `creature_ai_scripts` SET `action3_param1`=2625 WHERE `action3_type`=1 && `action3_param1`=-1306;
UPDATE `creature_ai_scripts` SET `action3_param2`=2625 WHERE `action3_type`=1 && `action3_param2`=-1306;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1307;
UPDATE `creature_ai_scripts` SET `action1_param3`=2626 WHERE `action1_type`=1 && `action1_param3`=-1307;
UPDATE `creature_ai_scripts` SET `action2_param2`=2626 WHERE `action2_type`=1 && `action2_param2`=-1307;
UPDATE `creature_ai_scripts` SET `action3_param2`=2626 WHERE `action3_type`=1 && `action3_param2`=-1307;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1317;
UPDATE `creature_ai_scripts` SET `action2_param1`=1408 WHERE `id`=325001;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1318;
UPDATE `creature_ai_scripts` SET `action1_param1`=1409 WHERE `id`=578101;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1319;
UPDATE `creature_ai_scripts` SET `action3_param1`=1410 WHERE `id`=578102;

DELETE FROM `creature_ai_texts` WHERE `entry`=-4809;
UPDATE `creature_ai_scripts` SET `action1_param1`=2407 WHERE `action1_type`=1 && `action1_param1`=-4809;

DELETE FROM `creature_ai_texts` WHERE `entry`=-4812;
UPDATE `creature_ai_scripts` SET `action1_param2`=2408 WHERE `action1_type`=1 && `action1_param2`=-4812;

DELETE FROM `creature_ai_texts` WHERE `entry`=-12840;
UPDATE `creature_ai_scripts` SET `action1_type`=4, `action1_param1`=5883 WHERE `id`=128401;

DELETE FROM `creature_ai_texts` WHERE `entry`=-14221;
DELETE FROM `creature_ai_scripts` WHERE `id`=1422102;

DELETE FROM `creature_ai_texts` WHERE `entry`=-125570;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=8273 WHERE `ID`=9960;
UPDATE `creature_ai_scripts` SET `action2_param1`=9960 WHERE `id`=1255702;

DELETE FROM `creature_ai_texts` WHERE `entry`=-125571;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=8272 WHERE `ID`=9958;
UPDATE `creature_ai_scripts` SET `action1_param1`=9958 WHERE `id`=1255705;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570201;
UPDATE `creature_ai_scripts` SET `action1_param1`=2049 WHERE `id`=570201;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570202;
UPDATE `creature_ai_scripts` SET `action1_param1`=2050 WHERE `id`=570202;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570203;
UPDATE `creature_ai_scripts` SET `action1_param1`=2051 WHERE `id`=570203;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570204;
UPDATE `creature_ai_scripts` SET `action1_param1`=2052 WHERE `id`=570204;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570205;
UPDATE `creature_ai_scripts` SET `action1_param1`=2053 WHERE `id`=570205;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570206;
UPDATE `creature_ai_scripts` SET `action1_param1`=2054 WHERE `id`=570206;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570207;
UPDATE `creature_ai_scripts` SET `action1_param1`=2055 WHERE `id`=570207;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570208;
UPDATE `creature_ai_scripts` SET `action1_param1`=2056 WHERE `id`=570208;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570209;
UPDATE `creature_ai_scripts` SET `action1_param1`=2057 WHERE `id`=570209;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570210;
UPDATE `creature_ai_scripts` SET `action1_param1`=2058 WHERE `id`=570210;

DELETE FROM `creature_ai_texts` WHERE `entry`=-570211;
UPDATE `creature_ai_scripts` SET `action1_param1`=2059 WHERE `id`=570211;

DELETE FROM `creature_ai_texts` WHERE `entry`=-791702;
UPDATE `broadcast_text` SET `Language`=7 WHERE `ID`=3988;
UPDATE `creature_ai_scripts` SET `action1_param1`=3988 WHERE `id`=791702;

DELETE FROM `creature_ai_texts` WHERE `entry`=-954601;
UPDATE `creature_ai_scripts` SET `action1_param1`=4949 WHERE `id`=954601;

DELETE FROM `creature_ai_texts` WHERE `entry`=-954602;
UPDATE `creature_ai_scripts` SET `action1_param1`=4955 WHERE `id`=954602;

DELETE FROM `creature_ai_texts` WHERE `entry`=-1081701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1081711;

-- Replacing AI text -46 with BC text 7798.
DELETE FROM `creature_ai_texts` WHERE `entry`=-46;

-- Replacing AI text -47 with BC text 1150.
DELETE FROM `creature_ai_texts` WHERE `entry`=-47;

-- Replacing AI text -73 with BC text 7272.
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=7272;
DELETE FROM `creature_ai_texts` WHERE `entry`=-73;

-- Replacing AI text -74 with BC text 3829.
DELETE FROM `creature_ai_texts` WHERE `entry`=-74;

-- Replacing AI text -99 with BC text 6094.
UPDATE `broadcast_text` SET `Sound`=5785 WHERE `ID`=6094;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6094;
DELETE FROM `creature_ai_texts` WHERE `entry`=-99;

-- Replacing AI text -100 with BC text 2481.
DELETE FROM `creature_ai_texts` WHERE `entry`=-100;

-- Replacing AI text -101 with BC text 1937.
DELETE FROM `creature_ai_texts` WHERE `entry`=-101;

-- Replacing AI text -103 with BC text 1940.
DELETE FROM `creature_ai_texts` WHERE `entry`=-103;

-- Replacing AI text -106 with BC text 1191.
DELETE FROM `creature_ai_texts` WHERE `entry`=-106;

-- Replacing AI text -108 with BC text 6174.
UPDATE `broadcast_text` SET `Sound`=5808 WHERE `ID`=6174;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6174;
DELETE FROM `creature_ai_texts` WHERE `entry`=-108;

-- Replacing AI text -133 with BC text 6179.
UPDATE `broadcast_text` SET `Sound`=5813 WHERE `ID`=6179;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6179;
DELETE FROM `creature_ai_texts` WHERE `entry`=-133;

-- Replacing AI text -135 with BC text 6181.
UPDATE `broadcast_text` SET `Sound`=5815 WHERE `ID`=6181;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6181;
DELETE FROM `creature_ai_texts` WHERE `entry`=-135;

-- Replacing AI text -136 with BC text 6182.
UPDATE `broadcast_text` SET `Sound`=5816 WHERE `ID`=6182;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6182;
DELETE FROM `creature_ai_texts` WHERE `entry`=-136;

-- Replacing AI text -137 with BC text 5059.
DELETE FROM `creature_ai_texts` WHERE `entry`=-137;

-- Replacing AI text -162 with BC text 605.
DELETE FROM `creature_ai_texts` WHERE `entry`=-162;

-- Replacing AI text -163 with BC text 6184.
UPDATE `broadcast_text` SET `Sound`=5822 WHERE `ID`=6184;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6184;
DELETE FROM `creature_ai_texts` WHERE `entry`=-163;

-- Replacing AI text -164 with BC text 4435.
UPDATE `broadcast_text` SET `Sound`=5819 WHERE `ID`=4435;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4435;
DELETE FROM `creature_ai_texts` WHERE `entry`=-164;

-- Replacing AI text -165 with BC text 4436.
UPDATE `broadcast_text` SET `Sound`=5820 WHERE `ID`=4436;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4436;
DELETE FROM `creature_ai_texts` WHERE `entry`=-165;

-- Replacing AI text -166 with BC text 4437.
UPDATE `broadcast_text` SET `Sound`=5821 WHERE `ID`=4437;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4437;
DELETE FROM `creature_ai_texts` WHERE `entry`=-166;

-- Replacing AI text -167 with BC text 1176.
DELETE FROM `creature_ai_texts` WHERE `entry`=-167;

-- Replacing AI text -169 with BC text 6061.
UPDATE `broadcast_text` SET `Sound`=5780 WHERE `ID`=6061;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6061;
DELETE FROM `creature_ai_texts` WHERE `entry`=-169;

-- Replacing AI text -170 with BC text 6062.
UPDATE `broadcast_text` SET `Sound`=5781 WHERE `ID`=6062;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6062;
DELETE FROM `creature_ai_texts` WHERE `entry`=-170;

-- Replacing AI text -171 with BC text 6063.
UPDATE `broadcast_text` SET `Sound`=5782 WHERE `ID`=6063;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6063;
DELETE FROM `creature_ai_texts` WHERE `entry`=-171;

-- Replacing AI text -172 with BC text 6064.
UPDATE `broadcast_text` SET `Sound`=5783 WHERE `ID`=6064;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6064;
DELETE FROM `creature_ai_texts` WHERE `entry`=-172;

-- Replacing AI text -173 with BC text 6065.
UPDATE `broadcast_text` SET `Sound`=5784 WHERE `ID`=6065;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6065;
DELETE FROM `creature_ai_texts` WHERE `entry`=-173;

-- Replacing AI text -176 with BC text 1345.
DELETE FROM `creature_ai_texts` WHERE `entry`=-176;

-- Replacing AI text -185 with BC text 2570.
DELETE FROM `creature_ai_texts` WHERE `entry`=-185;

-- Replacing AI text -186 with BC text 5773.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=5773;
DELETE FROM `creature_ai_texts` WHERE `entry`=-186;

-- Replacing AI text -188 with BC text 2425.
DELETE FROM `creature_ai_texts` WHERE `entry`=-188;

-- Replacing AI text -189 with BC text 2424.
DELETE FROM `creature_ai_texts` WHERE `entry`=-189;

-- Replacing AI text -190 with BC text 2422.
DELETE FROM `creature_ai_texts` WHERE `entry`=-190;

-- Replacing AI text -191 with BC text 2423.
DELETE FROM `creature_ai_texts` WHERE `entry`=-191;

-- Replacing AI text -192 with BC text 903.
DELETE FROM `creature_ai_texts` WHERE `entry`=-192;

-- Replacing AI text -193 with BC text 904.
DELETE FROM `creature_ai_texts` WHERE `entry`=-193;

-- Replacing AI text -194 with BC text 902.
DELETE FROM `creature_ai_texts` WHERE `entry`=-194;

-- Replacing AI text -195 with BC text 899.
DELETE FROM `creature_ai_texts` WHERE `entry`=-195;

-- Replacing AI text -196 with BC text 905.
DELETE FROM `creature_ai_texts` WHERE `entry`=-196;

-- Replacing AI text -197 with BC text 901.
DELETE FROM `creature_ai_texts` WHERE `entry`=-197;

-- Replacing AI text -198 with BC text 6169.
UPDATE `broadcast_text` SET `Sound`=5799 WHERE `ID`=6169;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6169;
DELETE FROM `creature_ai_texts` WHERE `entry`=-198;

-- Replacing AI text -200 with BC text 2231.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=2231;
DELETE FROM `creature_ai_texts` WHERE `entry`=-200;

-- Replacing AI text -201 with BC text 2230.
DELETE FROM `creature_ai_texts` WHERE `entry`=-201;

-- Replacing AI text -202 with BC text 2229.
DELETE FROM `creature_ai_texts` WHERE `entry`=-202;

-- Replacing AI text -207 with BC text 183.
DELETE FROM `creature_ai_texts` WHERE `entry`=-207;

-- Replacing AI text -210 with BC text 478.
DELETE FROM `creature_ai_texts` WHERE `entry`=-210;

-- Replacing AI text -213 with BC text 1913.
DELETE FROM `creature_ai_texts` WHERE `entry`=-213;

-- Replacing AI text -214 with BC text 1914.
DELETE FROM `creature_ai_texts` WHERE `entry`=-214;

-- Replacing AI text -215 with BC text 1915.
DELETE FROM `creature_ai_texts` WHERE `entry`=-215;

-- Replacing AI text -228 with BC text 10435.
DELETE FROM `creature_ai_texts` WHERE `entry`=-228;

-- Replacing AI text -229 with BC text 1909.
DELETE FROM `creature_ai_texts` WHERE `entry`=-229;

-- Replacing AI text -230 with BC text 10434.
DELETE FROM `creature_ai_texts` WHERE `entry`=-230;

-- Replacing AI text -231 with BC text 1912.
DELETE FROM `creature_ai_texts` WHERE `entry`=-231;

-- Replacing AI text -232 with BC text 2867.
DELETE FROM `creature_ai_texts` WHERE `entry`=-232;

-- Replacing AI text -311 with BC text 5952.
DELETE FROM `creature_ai_texts` WHERE `entry`=-311;

-- Replacing AI text -320 with BC text 6221.
UPDATE `broadcast_text` SET `Sound`=5872 WHERE `ID`=6221;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6221;
DELETE FROM `creature_ai_texts` WHERE `entry`=-320;

-- Replacing AI text -324 with BC text 1917.
DELETE FROM `creature_ai_texts` WHERE `entry`=-324;

-- Replacing AI text -341 with BC text 1327.
DELETE FROM `creature_ai_texts` WHERE `entry`=-341;

-- Replacing AI text -342 with BC text 1048.
DELETE FROM `creature_ai_texts` WHERE `entry`=-342;

-- Replacing AI text -343 with BC text 1685.
DELETE FROM `creature_ai_texts` WHERE `entry`=-343;

-- Replacing AI text -344 with BC text 1679.
DELETE FROM `creature_ai_texts` WHERE `entry`=-344;

-- Replacing AI text -345 with BC text 1682.
DELETE FROM `creature_ai_texts` WHERE `entry`=-345;

-- Replacing AI text -346 with BC text 741.
DELETE FROM `creature_ai_texts` WHERE `entry`=-346;

-- Replacing AI text -353 with BC text 1921.
DELETE FROM `creature_ai_texts` WHERE `entry`=-353;

-- Replacing AI text -354 with BC text 1920.
DELETE FROM `creature_ai_texts` WHERE `entry`=-354;

-- Replacing AI text -355 with BC text 447.
DELETE FROM `creature_ai_texts` WHERE `entry`=-355;

-- Replacing AI text -356 with BC text 443.
DELETE FROM `creature_ai_texts` WHERE `entry`=-356;

-- Replacing AI text -357 with BC text 1936.
DELETE FROM `creature_ai_texts` WHERE `entry`=-357;

-- Replacing AI text -359 with BC text 1925.
DELETE FROM `creature_ai_texts` WHERE `entry`=-359;

-- Replacing AI text -360 with BC text 1926.
DELETE FROM `creature_ai_texts` WHERE `entry`=-360;

-- Replacing AI text -362 with BC text 436.
DELETE FROM `creature_ai_texts` WHERE `entry`=-362;

-- Replacing AI text -364 with BC text 638.
DELETE FROM `creature_ai_texts` WHERE `entry`=-364;

-- Replacing AI text -365 with BC text 789.
DELETE FROM `creature_ai_texts` WHERE `entry`=-365;

-- Replacing AI text -367 with BC text 1931.
DELETE FROM `creature_ai_texts` WHERE `entry`=-367;

-- Replacing AI text -368 with BC text 1928.
DELETE FROM `creature_ai_texts` WHERE `entry`=-368;

-- Replacing AI text -369 with BC text 1929.
DELETE FROM `creature_ai_texts` WHERE `entry`=-369;

-- Replacing AI text -373 with BC text 434.
DELETE FROM `creature_ai_texts` WHERE `entry`=-373;

-- Replacing AI text -406 with BC text 1934.
DELETE FROM `creature_ai_texts` WHERE `entry`=-406;

-- Replacing AI text -407 with BC text 509.
DELETE FROM `creature_ai_texts` WHERE `entry`=-407;

-- Replacing AI text -408 with BC text 1147.
DELETE FROM `creature_ai_texts` WHERE `entry`=-408;

-- Replacing AI text -409 with BC text 1146.
DELETE FROM `creature_ai_texts` WHERE `entry`=-409;

-- Replacing AI text -410 with BC text 5954.
DELETE FROM `creature_ai_texts` WHERE `entry`=-410;

-- Replacing AI text -411 with BC text 182.
DELETE FROM `creature_ai_texts` WHERE `entry`=-411;

-- Replacing AI text -413 with BC text 186.
DELETE FROM `creature_ai_texts` WHERE `entry`=-413;

-- Replacing AI text -414 with BC text 1659.
DELETE FROM `creature_ai_texts` WHERE `entry`=-414;

-- Replacing AI text -415 with BC text 1662.
DELETE FROM `creature_ai_texts` WHERE `entry`=-415;

-- Replacing AI text -416 with BC text 1661.
DELETE FROM `creature_ai_texts` WHERE `entry`=-416;

-- Replacing AI text -429 with BC text 1092.
DELETE FROM `creature_ai_texts` WHERE `entry`=-429;

-- Replacing AI text -430 with BC text 1099.
DELETE FROM `creature_ai_texts` WHERE `entry`=-430;

-- Replacing AI text -432 with BC text 1100.
DELETE FROM `creature_ai_texts` WHERE `entry`=-432;

-- Replacing AI text -433 with BC text 1094.
DELETE FROM `creature_ai_texts` WHERE `entry`=-433;

-- Replacing AI text -434 with BC text 1097.
DELETE FROM `creature_ai_texts` WHERE `entry`=-434;

-- Replacing AI text -435 with BC text 5950.
DELETE FROM `creature_ai_texts` WHERE `entry`=-435;

-- Replacing AI text -438 with BC text 6234.
DELETE FROM `creature_ai_texts` WHERE `entry`=-438;

-- Replacing AI text -448 with BC text 5788.
DELETE FROM `creature_ai_texts` WHERE `entry`=-448;

-- Replacing AI text -451 with BC text 964.
DELETE FROM `creature_ai_texts` WHERE `entry`=-451;

-- Replacing AI text -452 with BC text 966.
DELETE FROM `creature_ai_texts` WHERE `entry`=-452;

-- Replacing AI text -454 with BC text 70.
DELETE FROM `creature_ai_texts` WHERE `entry`=-454;

-- Replacing AI text -456 with BC text 965.
DELETE FROM `creature_ai_texts` WHERE `entry`=-456;

-- Replacing AI text -457 with BC text 72.
DELETE FROM `creature_ai_texts` WHERE `entry`=-457;

-- Replacing AI text -458 with BC text 69.
DELETE FROM `creature_ai_texts` WHERE `entry`=-458;

-- Replacing AI text -459 with BC text 63.
DELETE FROM `creature_ai_texts` WHERE `entry`=-459;

-- Replacing AI text -460 with BC text 111.
DELETE FROM `creature_ai_texts` WHERE `entry`=-460;

-- Replacing AI text -461 with BC text 110.
DELETE FROM `creature_ai_texts` WHERE `entry`=-461;

-- Replacing AI text -462 with BC text 68.
DELETE FROM `creature_ai_texts` WHERE `entry`=-462;

-- Replacing AI text -471 with BC text 757.
DELETE FROM `creature_ai_texts` WHERE `entry`=-471;

-- Replacing AI text -472 with BC text 758.
DELETE FROM `creature_ai_texts` WHERE `entry`=-472;

-- Replacing AI text -473 with BC text 759.
DELETE FROM `creature_ai_texts` WHERE `entry`=-473;

-- Replacing AI text -490 with BC text 7597.
DELETE FROM `creature_ai_texts` WHERE `entry`=-490;

-- Replacing AI text -491 with BC text 7599.
DELETE FROM `creature_ai_texts` WHERE `entry`=-491;

-- Replacing AI text -492 with BC text 7596.
DELETE FROM `creature_ai_texts` WHERE `entry`=-492;

-- Replacing AI text -502 with BC text 23460.
DELETE FROM `creature_ai_texts` WHERE `entry`=-502;

-- Replacing AI text -503 with BC text 23459.
DELETE FROM `creature_ai_texts` WHERE `entry`=-503;

-- Replacing AI text -528 with BC text 807.
DELETE FROM `creature_ai_texts` WHERE `entry`=-528;

-- Replacing AI text -529 with BC text 812.
DELETE FROM `creature_ai_texts` WHERE `entry`=-529;

-- Replacing AI text -530 with BC text 815.
DELETE FROM `creature_ai_texts` WHERE `entry`=-530;

-- Replacing AI text -531 with BC text 814.
DELETE FROM `creature_ai_texts` WHERE `entry`=-531;

-- Replacing AI text -545 with BC text 9091.
DELETE FROM `creature_ai_texts` WHERE `entry`=-545;

-- Replacing AI text -546 with BC text 9093.
DELETE FROM `creature_ai_texts` WHERE `entry`=-546;

-- Replacing AI text -547 with BC text 9092.
DELETE FROM `creature_ai_texts` WHERE `entry`=-547;

-- Replacing AI text -549 with BC text 4561.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4561;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4562;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4566;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4568;
DELETE FROM `creature_ai_texts` WHERE `entry`=-549;

-- Replacing AI text -550 with BC text 1151.
DELETE FROM `creature_ai_texts` WHERE `entry`=-550;

-- Replacing AI text -551 with BC text 1064.
DELETE FROM `creature_ai_texts` WHERE `entry`=-551;

-- Replacing AI text -554 with BC text 1224.
DELETE FROM `creature_ai_texts` WHERE `entry`=-554;

-- Replacing AI text -578 with BC text 6214.
UPDATE `broadcast_text` SET `Sound`=5854 WHERE `ID`=6214;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6214;
DELETE FROM `creature_ai_texts` WHERE `entry`=-578;

-- Replacing AI text -579 with BC text 3541.
DELETE FROM `creature_ai_texts` WHERE `entry`=-579;

-- Replacing AI text -580 with BC text 3542.
DELETE FROM `creature_ai_texts` WHERE `entry`=-580;

-- Replacing AI text -581 with BC text 3543.
DELETE FROM `creature_ai_texts` WHERE `entry`=-581;

-- Replacing AI text -582 with BC text 5542.
DELETE FROM `creature_ai_texts` WHERE `entry`=-582;

-- Replacing AI text -583 with BC text 5539.
DELETE FROM `creature_ai_texts` WHERE `entry`=-583;

-- Replacing AI text -584 with BC text 5540.
DELETE FROM `creature_ai_texts` WHERE `entry`=-584;

-- Replacing AI text -586 with BC text 5543.
DELETE FROM `creature_ai_texts` WHERE `entry`=-586;

-- Replacing AI text -587 with BC text 5545.
DELETE FROM `creature_ai_texts` WHERE `entry`=-587;

-- Replacing AI text -647 with BC text 9489.
DELETE FROM `creature_ai_texts` WHERE `entry`=-647;

-- Replacing AI text -649 with BC text 9414.
DELETE FROM `creature_ai_texts` WHERE `entry`=-649;

-- Replacing AI text -658 with BC text 1356.
DELETE FROM `creature_ai_texts` WHERE `entry`=-658;

-- Replacing AI text -659 with BC text 1357.
DELETE FROM `creature_ai_texts` WHERE `entry`=-659;

-- Replacing AI text -660 with BC text 1358.
DELETE FROM `creature_ai_texts` WHERE `entry`=-660;

-- Replacing AI text -694 with BC text 3263.
DELETE FROM `creature_ai_texts` WHERE `entry`=-694;

-- Replacing AI text -704 with BC text 5460.
DELETE FROM `creature_ai_texts` WHERE `entry`=-704;

-- Replacing AI text -705 with BC text 4726.
DELETE FROM `creature_ai_texts` WHERE `entry`=-705;

-- Replacing AI text -706 with BC text 5459.
DELETE FROM `creature_ai_texts` WHERE `entry`=-706;

-- Replacing AI text -710 with BC text 4166.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4166;
DELETE FROM `creature_ai_texts` WHERE `entry`=-710;

-- Replacing AI text -711 with BC text 4177.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4177;
DELETE FROM `creature_ai_texts` WHERE `entry`=-711;

-- Replacing AI text -712 with BC text 4178.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4178;
DELETE FROM `creature_ai_texts` WHERE `entry`=-712;

-- Replacing AI text -713 with BC text 3691.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=3691;
DELETE FROM `creature_ai_texts` WHERE `entry`=-713;

-- Replacing AI text -714 with BC text 3689.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=3689;
DELETE FROM `creature_ai_texts` WHERE `entry`=-714;

-- Replacing AI text -715 with BC text 3692.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=3692;
DELETE FROM `creature_ai_texts` WHERE `entry`=-715;

-- Replacing AI text -716 with BC text 3693.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=3693;
DELETE FROM `creature_ai_texts` WHERE `entry`=-716;

-- Replacing AI text -764 with BC text 6260.
DELETE FROM `creature_ai_texts` WHERE `entry`=-764;

-- Replacing AI text -775 with BC text 1756.
DELETE FROM `creature_ai_texts` WHERE `entry`=-775;

-- Replacing AI text -797 with BC text 9633.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=9633;
DELETE FROM `creature_ai_texts` WHERE `entry`=-797;

-- Replacing AI text -819 with BC text 6220.
UPDATE `broadcast_text` SET `Sound`=5866 WHERE `ID`=6220;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6220;
DELETE FROM `creature_ai_texts` WHERE `entry`=-819;

-- Replacing AI text -822 with BC text 6217.
UPDATE `broadcast_text` SET `Sound`=5862 WHERE `ID`=6217;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6217;
DELETE FROM `creature_ai_texts` WHERE `entry`=-822;

-- Replacing AI text -823 with BC text 6538.
UPDATE `broadcast_text` SET `Sound`=5864 WHERE `ID`=6538;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6538;
DELETE FROM `creature_ai_texts` WHERE `entry`=-823;

-- Replacing AI text -824 with BC text 6219.
UPDATE `broadcast_text` SET `Sound`=5865 WHERE `ID`=6219;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6219;
DELETE FROM `creature_ai_texts` WHERE `entry`=-824;

-- Replacing AI text -825 with BC text 4703.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=4703;
DELETE FROM `creature_ai_texts` WHERE `entry`=-825;

-- Replacing AI text -826 with BC text 8350.
DELETE FROM `creature_ai_texts` WHERE `entry`=-826;

-- Replacing AI text -827 with BC text 8351.
DELETE FROM `creature_ai_texts` WHERE `entry`=-827;

-- Replacing AI text -829 with BC text 1254.
DELETE FROM `creature_ai_texts` WHERE `entry`=-829;

-- Replacing AI text -901 with BC text 2628.
DELETE FROM `creature_ai_texts` WHERE `entry`=-901;

-- Replacing AI text -925 with BC text 615.
DELETE FROM `creature_ai_texts` WHERE `entry`=-925;

-- Replacing AI text -926 with BC text 616.
DELETE FROM `creature_ai_texts` WHERE `entry`=-926;

-- Replacing AI text -927 with BC text 4484.
DELETE FROM `creature_ai_texts` WHERE `entry`=-927;

-- Replacing AI text -928 with BC text 604.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=604;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=604;
DELETE FROM `creature_ai_texts` WHERE `entry`=-928;

-- Replacing AI text -929 with BC text 602.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=602;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=602;
DELETE FROM `creature_ai_texts` WHERE `entry`=-929;

-- Replacing AI text -930 with BC text 603.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=603;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=603;
DELETE FROM `creature_ai_texts` WHERE `entry`=-930;

-- Replacing AI text -932 with BC text 619.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=619;
UPDATE `broadcast_text` SET `EmoteId0`=22 WHERE `ID`=619;
DELETE FROM `creature_ai_texts` WHERE `entry`=-932;

-- Replacing AI text -933 with BC text 621.
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=621;
DELETE FROM `creature_ai_texts` WHERE `entry`=-933;

-- Replacing AI text -935 with BC text 626.
UPDATE `broadcast_text` SET `EmoteId0`=65 WHERE `ID`=626;
DELETE FROM `creature_ai_texts` WHERE `entry`=-935;

-- Replacing AI text -982 with BC text 7273.
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=7273;
DELETE FROM `creature_ai_texts` WHERE `entry`=-982;

-- Replacing AI text -983 with BC text 4495.
DELETE FROM `creature_ai_texts` WHERE `entry`=-983;

-- Replacing AI text -984 with BC text 4502.
DELETE FROM `creature_ai_texts` WHERE `entry`=-984;

-- Replacing AI text -986 with BC text 9673.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9673;
DELETE FROM `creature_ai_texts` WHERE `entry`=-986;

-- Replacing AI text -987 with BC text 9660.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9660;
DELETE FROM `creature_ai_texts` WHERE `entry`=-987;

-- Replacing AI text -988 with BC text 9658.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9658;
DELETE FROM `creature_ai_texts` WHERE `entry`=-988;

-- Replacing AI text -990 with BC text 832.
DELETE FROM `creature_ai_texts` WHERE `entry`=-990;

-- Replacing AI text -1028 with BC text 2628.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1028;

-- Replacing AI text -1031 with BC text 316.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1031;

-- Replacing AI text -1032 with BC text 314.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1032;

-- Replacing AI text -1035 with BC text 6225.
UPDATE `broadcast_text` SET `Sound`=5876 WHERE `ID`=6225;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6225;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1035;

-- Replacing AI text -1036 with BC text 6228.
UPDATE `broadcast_text` SET `Sound`=5878 WHERE `ID`=6228;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6228;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1036;

-- Replacing AI text -1037 with BC text 6227.
UPDATE `broadcast_text` SET `Sound`=5879 WHERE `ID`=6227;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6227;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1037;

-- Replacing AI text -1038 with BC text 6226.
UPDATE `broadcast_text` SET `Sound`=5877 WHERE `ID`=6226;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6226;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1038;

-- Replacing AI text -1039 with BC text 6223.
UPDATE `broadcast_text` SET `Sound`=5874 WHERE `ID`=6223;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6223;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1039;

-- Replacing AI text -1040 with BC text 6224.
UPDATE `broadcast_text` SET `Sound`=5875 WHERE `ID`=6224;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=6224;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1040;

-- Replacing AI text -1041 with BC text 1391.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1041;

-- Replacing AI text -1042 with BC text 1394.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1042;

-- Replacing AI text -1043 with BC text 1395.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1043;

-- Replacing AI text -1044 with BC text 1393.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1044;

-- Replacing AI text -1045 with BC text 1390.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1045;

-- Replacing AI text -1054 with BC text 5772.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1054;

-- Replacing AI text -1055 with BC text 6470.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1055;

-- Replacing AI text -1056 with BC text 3932.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1056;

-- Replacing AI text -1057 with BC text 3931.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1057;

-- Replacing AI text -1139 with BC text 11271.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=11271;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1139;

-- Replacing AI text -1140 with BC text 11269.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=11269;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1140;

-- Replacing AI text -1141 with BC text 11270.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1141;

-- Replacing AI text -1153 with BC text 7570.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1153;

-- Replacing AI text -1206 with BC text 776.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=776;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1206;

-- Replacing AI text -1207 with BC text 764.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=764;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1207;

-- Replacing AI text -1208 with BC text 778.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=778;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1208;

-- Replacing AI text -1209 with BC text 775.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=775;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1209;

-- Replacing AI text -1210 with BC text 774.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=774;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1210;

-- Replacing AI text -1211 with BC text 777.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=777;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1211;

-- Replacing AI text -1212 with BC text 772.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=772;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1212;

-- Replacing AI text -1213 with BC text 773.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=773;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1213;

-- Replacing AI text -1214 with BC text 1521.
UPDATE `broadcast_text` SET `EmoteId0`=14 WHERE `ID`=1521;
DELETE FROM `creature_ai_texts` WHERE `entry`=-1214;

-- Replacing AI text -1215 with BC text 1531.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1215;

-- Replacing AI text -1216 with BC text 1532.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1216;

-- Replacing AI text -1217 with BC text 1536.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1217;

-- Replacing AI text -1218 with BC text 1530.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1218;

-- Replacing AI text -1219 with BC text 1533.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1219;

-- Replacing AI text -1220 with BC text 1535.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1220;

-- Replacing AI text -1226 with BC text 1113.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1226;

-- Replacing AI text -1308 with BC text 2628.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1308;

-- Replacing AI text -1310 with BC text 6426.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1310;

-- Replacing AI text -1327 with BC text 4998.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1327;

-- Replacing AI text -1983 with BC text 47019.
DELETE FROM `creature_ai_texts` WHERE `entry`=-1983;

-- Replacing AI text -4810 with BC text 2406.
DELETE FROM `creature_ai_texts` WHERE `entry`=-4810;

-- Replacing AI text -4811 with BC text 2409.
DELETE FROM `creature_ai_texts` WHERE `entry`=-4811;

-- Replacing AI text -5547 with BC text 5547.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=5547;
DELETE FROM `creature_ai_texts` WHERE `entry`=-5547;

-- Replacing AI text -14720 with BC text 7237.
DELETE FROM `creature_ai_texts` WHERE `entry`=-14720;

-- Replacing AI text -15554 with BC text 11110.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=11110;
DELETE FROM `creature_ai_texts` WHERE `entry`=-15554;

-- Replacing AI text -144541 with BC text 9679.
DELETE FROM `creature_ai_texts` WHERE `entry`=-144541;

-- Replacing AI text -144542 with BC text 9669.
DELETE FROM `creature_ai_texts` WHERE `entry`=-144542;

-- Replacing AI text -144543 with BC text 9668.
DELETE FROM `creature_ai_texts` WHERE `entry`=-144543;

-- Replacing AI text -144571 with BC text 9666.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9666;
DELETE FROM `creature_ai_texts` WHERE `entry`=-144571;

-- Replacing AI text -144572 with BC text 9674.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9674;
DELETE FROM `creature_ai_texts` WHERE `entry`=-144572;

-- Replacing AI text -144573 with BC text 9664.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9664;
DELETE FROM `creature_ai_texts` WHERE `entry`=-144573;

-- Replacing AI text -144611 with BC text 9662.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9662;
DELETE FROM `creature_ai_texts` WHERE `entry`=-144611;

-- Replacing AI text -144612 with BC text 9676.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9676;
DELETE FROM `creature_ai_texts` WHERE `entry`=-144612;

-- Replacing AI text -144613 with BC text 9661.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID`=9661;
DELETE FROM `creature_ai_texts` WHERE `entry`=-144613;

-- Replacing AI text -388701 with BC text 48821.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=48821;
DELETE FROM `creature_ai_texts` WHERE `entry`=-388701;

-- Replacing AI text -388702 with BC text 48823.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=48823;
DELETE FROM `creature_ai_texts` WHERE `entry`=-388702;

-- Replacing AI text -427801 with BC text 48826.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=48826;
DELETE FROM `creature_ai_texts` WHERE `entry`=-427801;

-- Replacing AI text -427802 with BC text 48829.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=48829;
DELETE FROM `creature_ai_texts` WHERE `entry`=-427802;

-- Replacing AI text -500101 with BC text 10755.
DELETE FROM `creature_ai_texts` WHERE `entry`=-500101;

-- Replacing AI text -570212 with BC text 2060.
DELETE FROM `creature_ai_texts` WHERE `entry`=-570212;

-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=21201;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=21201;
-- Replacing -459 with 63.
UPDATE `creature_ai_scripts` SET `action1_param1`=63 WHERE `id`=26301;
-- Replacing -454 with 70.
UPDATE `creature_ai_scripts` SET `action1_param1`=70 WHERE `id`=26901;
-- Replacing -458 with 69.
UPDATE `creature_ai_scripts` SET `action1_param2`=69 WHERE `id`=26901;
-- Replacing -462 with 68.
UPDATE `creature_ai_scripts` SET `action1_param3`=68 WHERE `id`=26901;
-- Replacing -457 with 72.
UPDATE `creature_ai_scripts` SET `action1_param2`=72 WHERE `id`=27101;
-- Replacing -460 with 111.
UPDATE `creature_ai_scripts` SET `action1_param1`=111 WHERE `id`=31403;
-- Replacing -461 with 110.
UPDATE `creature_ai_scripts` SET `action1_param2`=110 WHERE `id`=31403;
-- Replacing -407 with 509.
UPDATE `creature_ai_scripts` SET `action1_param2`=509 WHERE `id`=31501;
-- Replacing -451 with 964.
UPDATE `creature_ai_scripts` SET `action1_param1`=964 WHERE `id`=32501;
-- Replacing -452 with 966.
UPDATE `creature_ai_scripts` SET `action1_param2`=966 WHERE `id`=32501;
-- Replacing -456 with 965.
UPDATE `creature_ai_scripts` SET `action1_param3`=965 WHERE `id`=32501;
-- Replacing -210 with 478.
UPDATE `creature_ai_scripts` SET `action1_param2`=478 WHERE `id`=55001;
-- Replacing -169 with 6061.
UPDATE `creature_ai_scripts` SET `action1_param1`=6061 WHERE `id`=63902;
-- Replacing -171 with 6063.
UPDATE `creature_ai_scripts` SET `action1_param1`=6063 WHERE `id`=63903;
-- Replacing -342 with 1048.
UPDATE `creature_ai_scripts` SET `action1_param1`=1048 WHERE `id`=63904;
-- Replacing -172 with 6064.
UPDATE `creature_ai_scripts` SET `action1_param1`=6064 WHERE `id`=63905;
-- Replacing -173 with 6065.
UPDATE `creature_ai_scripts` SET `action1_param1`=6065 WHERE `id`=63906;
-- Replacing -170 with 6062.
UPDATE `creature_ai_scripts` SET `action1_param1`=6062 WHERE `id`=63907;
-- Replacing -228 with 10435.
UPDATE `creature_ai_scripts` SET `action1_param1`=10435 WHERE `id`=70601;
-- Replacing -229 with 1909.
UPDATE `creature_ai_scripts` SET `action1_param2`=1909 WHERE `id`=70601;
-- Replacing -230 with 10434.
UPDATE `creature_ai_scripts` SET `action1_param3`=10434 WHERE `id`=70601;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=88901;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=88901;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=89102;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=89102;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=89201;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=89201;
-- Replacing -101 with 1937.
UPDATE `creature_ai_scripts` SET `action1_param1`=1937 WHERE `id`=103401;
-- Replacing -101 with 1937.
UPDATE `creature_ai_scripts` SET `action1_param1`=1937 WHERE `id`=103502;
-- Replacing -101 with 1937.
UPDATE `creature_ai_scripts` SET `action1_param1`=1937 WHERE `id`=103602;
-- Replacing -357 with 1936.
UPDATE `creature_ai_scripts` SET `action1_param1`=1936 WHERE `id`=105101;
-- Replacing -406 with 1934.
UPDATE `creature_ai_scripts` SET `action1_param3`=1934 WHERE `id`=105101;
-- Replacing -364 with 638.
UPDATE `creature_ai_scripts` SET `action1_param1`=638 WHERE `id`=105202;
-- Replacing -357 with 1936.
UPDATE `creature_ai_scripts` SET `action1_param1`=1936 WHERE `id`=105302;
-- Replacing -406 with 1934.
UPDATE `creature_ai_scripts` SET `action1_param3`=1934 WHERE `id`=105302;
-- Replacing -357 with 1936.
UPDATE `creature_ai_scripts` SET `action1_param1`=1936 WHERE `id`=105402;
-- Replacing -406 with 1934.
UPDATE `creature_ai_scripts` SET `action1_param3`=1934 WHERE `id`=105402;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=111501;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=111501;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=111501;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=111601;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=111601;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=111601;
-- Replacing -324 with 1917.
UPDATE `creature_ai_scripts` SET `action1_param1`=1917 WHERE `id`=111901;
-- Replacing -228 with 10435.
UPDATE `creature_ai_scripts` SET `action1_param1`=10435 WHERE `id`=112001;
-- Replacing -229 with 1909.
UPDATE `creature_ai_scripts` SET `action1_param2`=1909 WHERE `id`=112001;
-- Replacing -230 with 10434.
UPDATE `creature_ai_scripts` SET `action1_param3`=10434 WHERE `id`=112001;
-- Replacing -228 with 10435.
UPDATE `creature_ai_scripts` SET `action1_param1`=10435 WHERE `id`=112104;
-- Replacing -229 with 1909.
UPDATE `creature_ai_scripts` SET `action1_param2`=1909 WHERE `id`=112104;
-- Replacing -230 with 10434.
UPDATE `creature_ai_scripts` SET `action1_param3`=10434 WHERE `id`=112104;
-- Replacing -228 with 10435.
UPDATE `creature_ai_scripts` SET `action1_param1`=10435 WHERE `id`=112203;
-- Replacing -229 with 1909.
UPDATE `creature_ai_scripts` SET `action1_param2`=1909 WHERE `id`=112203;
-- Replacing -230 with 10434.
UPDATE `creature_ai_scripts` SET `action1_param3`=10434 WHERE `id`=112203;
-- Replacing -228 with 10435.
UPDATE `creature_ai_scripts` SET `action1_param1`=10435 WHERE `id`=112302;
-- Replacing -229 with 1909.
UPDATE `creature_ai_scripts` SET `action1_param2`=1909 WHERE `id`=112302;
-- Replacing -230 with 10434.
UPDATE `creature_ai_scripts` SET `action1_param3`=10434 WHERE `id`=112302;
-- Replacing -229 with 1909.
UPDATE `creature_ai_scripts` SET `action1_param1`=1909 WHERE `id`=112403;
-- Replacing -228 with 10435.
UPDATE `creature_ai_scripts` SET `action1_param2`=10435 WHERE `id`=112403;
-- Replacing -230 with 10434.
UPDATE `creature_ai_scripts` SET `action1_param3`=10434 WHERE `id`=112403;
-- Replacing -103 with 1940.
UPDATE `creature_ai_scripts` SET `action1_param2`=1940 WHERE `id`=115701;
-- Replacing -103 with 1940.
UPDATE `creature_ai_scripts` SET `action1_param2`=1940 WHERE `id`=115801;
-- Replacing -103 with 1940.
UPDATE `creature_ai_scripts` SET `action1_param2`=1940 WHERE `id`=116001;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=116101;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=116101;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=116101;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=116202;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=116202;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=116202;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=116301;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=116301;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=116301;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=116501;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=116501;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=116501;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=116602;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=116602;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=116602;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=116702;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=116702;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=116702;
-- Replacing -357 with 1936.
UPDATE `creature_ai_scripts` SET `action1_param1`=1936 WHERE `id`=116901;
-- Replacing -353 with 1921.
UPDATE `creature_ai_scripts` SET `action1_param1`=1921 WHERE `id`=117201;
-- Replacing -354 with 1920.
UPDATE `creature_ai_scripts` SET `action1_param2`=1920 WHERE `id`=117201;
-- Replacing -353 with 1921.
UPDATE `creature_ai_scripts` SET `action1_param1`=1921 WHERE `id`=117302;
-- Replacing -354 with 1920.
UPDATE `creature_ai_scripts` SET `action1_param2`=1920 WHERE `id`=117302;
-- Replacing -353 with 1921.
UPDATE `creature_ai_scripts` SET `action1_param1`=1921 WHERE `id`=117401;
-- Replacing -354 with 1920.
UPDATE `creature_ai_scripts` SET `action1_param2`=1920 WHERE `id`=117401;
-- Replacing -353 with 1921.
UPDATE `creature_ai_scripts` SET `action1_param1`=1921 WHERE `id`=117502;
-- Replacing -354 with 1920.
UPDATE `creature_ai_scripts` SET `action1_param2`=1920 WHERE `id`=117502;
-- Replacing -353 with 1921.
UPDATE `creature_ai_scripts` SET `action1_param1`=1921 WHERE `id`=117701;
-- Replacing -354 with 1920.
UPDATE `creature_ai_scripts` SET `action1_param2`=1920 WHERE `id`=117701;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=117802;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=117802;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=117901;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=117901;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=118001;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=118001;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=118102;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=118102;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=118302;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=118302;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=119701;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=119701;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=119701;
-- Replacing -353 with 1921.
UPDATE `creature_ai_scripts` SET `action1_param1`=1921 WHERE `id`=120202;
-- Replacing -354 with 1920.
UPDATE `creature_ai_scripts` SET `action1_param2`=1920 WHERE `id`=120202;
-- Replacing -355 with 447.
UPDATE `creature_ai_scripts` SET `action1_param1`=447 WHERE `id`=120501;
-- Replacing -356 with 443.
UPDATE `creature_ai_scripts` SET `action1_param2`=443 WHERE `id`=120501;
-- Replacing -355 with 447.
UPDATE `creature_ai_scripts` SET `action1_param3`=447 WHERE `id`=120501;
-- Replacing -367 with 1931.
UPDATE `creature_ai_scripts` SET `action1_param1`=1931 WHERE `id`=121001;
-- Replacing -368 with 1928.
UPDATE `creature_ai_scripts` SET `action1_param2`=1928 WHERE `id`=121001;
-- Replacing -369 with 1929.
UPDATE `creature_ai_scripts` SET `action1_param3`=1929 WHERE `id`=121001;
-- Replacing -231 with 1912.
UPDATE `creature_ai_scripts` SET `action1_param1`=1912 WHERE `id`=121101;
-- Replacing -362 with 436.
UPDATE `creature_ai_scripts` SET `action1_param1`=436 WHERE `id`=122201;
-- Replacing -373 with 434.
UPDATE `creature_ai_scripts` SET `action1_param3`=434 WHERE `id`=122201;
-- Replacing -364 with 638.
UPDATE `creature_ai_scripts` SET `action1_param1`=638 WHERE `id`=122202;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=125101;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=125101;
-- Replacing -1214 with 1521.
UPDATE `creature_ai_scripts` SET `action1_param1`=1521 WHERE `id`=132807;
-- Replacing -1215 with 1531.
UPDATE `creature_ai_scripts` SET `action1_param1`=1531 WHERE `id`=132808;
-- Replacing -1216 with 1532.
UPDATE `creature_ai_scripts` SET `action1_param2`=1532 WHERE `id`=132808;
-- Replacing -1220 with 1535.
UPDATE `creature_ai_scripts` SET `action1_param3`=1535 WHERE `id`=132808;
-- Replacing -213 with 1913.
UPDATE `creature_ai_scripts` SET `action1_param1`=1913 WHERE `id`=139301;
-- Replacing -214 with 1914.
UPDATE `creature_ai_scripts` SET `action1_param2`=1914 WHERE `id`=139301;
-- Replacing -215 with 1915.
UPDATE `creature_ai_scripts` SET `action1_param3`=1915 WHERE `id`=139301;
-- Replacing -411 with 182.
UPDATE `creature_ai_scripts` SET `action1_param1`=182 WHERE `id`=139502;
-- Replacing -413 with 186.
UPDATE `creature_ai_scripts` SET `action1_param3`=186 WHERE `id`=139502;
-- Replacing -355 with 447.
UPDATE `creature_ai_scripts` SET `action1_param1`=447 WHERE `id`=139801;
-- Replacing -356 with 443.
UPDATE `creature_ai_scripts` SET `action1_param2`=443 WHERE `id`=139801;
-- Replacing -356 with 443.
UPDATE `creature_ai_scripts` SET `action1_param1`=443 WHERE `id`=139902;
-- Replacing -207 with 183.
UPDATE `creature_ai_scripts` SET `action1_param2`=183 WHERE `id`=140202;
-- Replacing -207 with 183.
UPDATE `creature_ai_scripts` SET `action1_param2`=183 WHERE `id`=140502;
-- Replacing -1206 with 776.
UPDATE `creature_ai_scripts` SET `action1_param1`=776 WHERE `id`=149301;
-- Replacing -1207 with 764.
UPDATE `creature_ai_scripts` SET `action1_param2`=764 WHERE `id`=149301;
-- Replacing -1208 with 778.
UPDATE `creature_ai_scripts` SET `action1_param3`=778 WHERE `id`=149301;
-- Replacing -1028 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param1`=2628 WHERE `id`=153601;
-- Replacing -1028 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param2`=2628 WHERE `id`=153701;
-- Replacing -1028 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param2`=2628 WHERE `id`=153802;
-- Replacing -1028 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param2`=2628 WHERE `id`=166001;
-- Replacing -1031 with 316.
UPDATE `creature_ai_scripts` SET `action1_param2`=316 WHERE `id`=166701;
-- Replacing -1032 with 314.
UPDATE `creature_ai_scripts` SET `action1_param3`=314 WHERE `id`=166701;
-- Replacing -451 with 964.
UPDATE `creature_ai_scripts` SET `action1_param1`=964 WHERE `id`=171602;
-- Replacing -1041 with 1391.
UPDATE `creature_ai_scripts` SET `action1_param2`=1391 WHERE `id`=171602;
-- Replacing -1042 with 1394.
UPDATE `creature_ai_scripts` SET `action1_param3`=1394 WHERE `id`=171602;
-- Replacing -414 with 1659.
UPDATE `creature_ai_scripts` SET `action1_param1`=1659 WHERE `id`=171901;
-- Replacing -415 with 1662.
UPDATE `creature_ai_scripts` SET `action1_param2`=1662 WHERE `id`=171901;
-- Replacing -416 with 1661.
UPDATE `creature_ai_scripts` SET `action1_param3`=1661 WHERE `id`=171901;
-- Replacing -408 with 1147.
UPDATE `creature_ai_scripts` SET `action1_param1`=1147 WHERE `id`=176301;
-- Replacing -409 with 1146.
UPDATE `creature_ai_scripts` SET `action1_param2`=1146 WHERE `id`=176301;
-- Replacing -901 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param3`=2628 WHERE `id`=182704;
-- Replacing -901 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param2`=2628 WHERE `id`=183214;
-- Replacing -581 with 3543.
UPDATE `creature_ai_scripts` SET `action1_param1`=3543 WHERE `id`=185402;
-- Replacing -901 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param2`=2628 WHERE `id`=188304;
-- Replacing -1983 with 47019.
UPDATE `creature_ai_scripts` SET `action1_param1`=47019 WHERE `id`=198303;
-- Replacing -200 with 2231.
UPDATE `creature_ai_scripts` SET `action1_param1`=2231 WHERE `id`=201501;
-- Replacing -201 with 2230.
UPDATE `creature_ai_scripts` SET `action1_param2`=2230 WHERE `id`=201501;
-- Replacing -202 with 2229.
UPDATE `creature_ai_scripts` SET `action1_param3`=2229 WHERE `id`=201501;
-- Replacing -200 with 2231.
UPDATE `creature_ai_scripts` SET `action1_param1`=2231 WHERE `id`=201701;
-- Replacing -201 with 2230.
UPDATE `creature_ai_scripts` SET `action1_param2`=2230 WHERE `id`=201701;
-- Replacing -202 with 2229.
UPDATE `creature_ai_scripts` SET `action1_param3`=2229 WHERE `id`=201701;
-- Replacing -200 with 2231.
UPDATE `creature_ai_scripts` SET `action1_param1`=2231 WHERE `id`=201803;
-- Replacing -201 with 2230.
UPDATE `creature_ai_scripts` SET `action1_param2`=2230 WHERE `id`=201803;
-- Replacing -202 with 2229.
UPDATE `creature_ai_scripts` SET `action1_param3`=2229 WHERE `id`=201803;
-- Replacing -200 with 2231.
UPDATE `creature_ai_scripts` SET `action1_param1`=2231 WHERE `id`=201901;
-- Replacing -201 with 2230.
UPDATE `creature_ai_scripts` SET `action1_param2`=2230 WHERE `id`=201901;
-- Replacing -202 with 2229.
UPDATE `creature_ai_scripts` SET `action1_param3`=2229 WHERE `id`=201901;
-- Replacing -200 with 2231.
UPDATE `creature_ai_scripts` SET `action1_param1`=2231 WHERE `id`=202001;
-- Replacing -201 with 2230.
UPDATE `creature_ai_scripts` SET `action1_param2`=2230 WHERE `id`=202001;
-- Replacing -202 with 2229.
UPDATE `creature_ai_scripts` SET `action1_param3`=2229 WHERE `id`=202001;
-- Replacing -101 with 1937.
UPDATE `creature_ai_scripts` SET `action1_param1`=1937 WHERE `id`=209101;
-- Replacing -101 with 1937.
UPDATE `creature_ai_scripts` SET `action1_param1`=1937 WHERE `id`=210201;
-- Replacing -101 with 1937.
UPDATE `creature_ai_scripts` SET `action1_param1`=1937 WHERE `id`=210302;
-- Replacing -101 with 1937.
UPDATE `creature_ai_scripts` SET `action1_param1`=1937 WHERE `id`=210801;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=225201;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=225201;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=225301;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=225301;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=225401;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=225401;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=225502;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=225502;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=228701;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=228701;
-- Replacing -990 with 832.
UPDATE `creature_ai_scripts` SET `action1_param1`=832 WHERE `id`=233804;
-- Replacing -990 with 832.
UPDATE `creature_ai_scripts` SET `action1_param1`=832 WHERE `id`=233905;
-- Replacing -925 with 615.
UPDATE `creature_ai_scripts` SET `action1_param1`=615 WHERE `id`=239601;
-- Replacing -926 with 616.
UPDATE `creature_ai_scripts` SET `action1_param2`=616 WHERE `id`=239601;
-- Replacing -927 with 4484.
UPDATE `creature_ai_scripts` SET `action1_param1`=4484 WHERE `id`=240501;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=241601;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=241601;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=241701;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=241701;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=242002;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=242002;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=242201;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=242201;
-- Replacing -928 with 604.
UPDATE `creature_ai_scripts` SET `action1_param1`=604 WHERE `id`=243301;
-- Replacing -929 with 602.
UPDATE `creature_ai_scripts` SET `action1_param2`=602 WHERE `id`=243301;
-- Replacing -930 with 603.
UPDATE `creature_ai_scripts` SET `action1_param3`=603 WHERE `id`=243301;
-- Replacing -932 with 619.
UPDATE `creature_ai_scripts` SET `action1_param1`=619 WHERE `id`=243501;
-- Replacing -933 with 621.
UPDATE `creature_ai_scripts` SET `action1_param1`=621 WHERE `id`=243502;
-- Replacing -935 with 626.
UPDATE `creature_ai_scripts` SET `action1_param1`=626 WHERE `id`=243504;
-- Replacing -162 with 605.
UPDATE `creature_ai_scripts` SET `action1_param1`=605 WHERE `id`=244001;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=256201;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=256201;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=256401;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=256401;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=256601;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=256601;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=256703;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=256703;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=256901;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=256901;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=257002;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=257002;
-- Replacing -502 with 23460.
UPDATE `creature_ai_scripts` SET `action1_param1`=23460 WHERE `id`=259701;
-- Replacing -503 with 23459.
UPDATE `creature_ai_scripts` SET `action1_param1`=23459 WHERE `id`=259901;
-- Replacing -1226 with 1113.
UPDATE `creature_ai_scripts` SET `action1_param1`=1113 WHERE `id`=262401;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=270101;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=270101;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=271501;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=271501;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=271602;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=271602;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=271702;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=271702;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=271802;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=271802;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=271901;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=271901;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=272002;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=272002;
-- Replacing -529 with 812.
UPDATE `creature_ai_scripts` SET `action1_param1`=812 WHERE `id`=276401;
-- Replacing -531 with 814.
UPDATE `creature_ai_scripts` SET `action1_param2`=814 WHERE `id`=276401;
-- Replacing -529 with 812.
UPDATE `creature_ai_scripts` SET `action1_param2`=812 WHERE `id`=276501;
-- Replacing -530 with 815.
UPDATE `creature_ai_scripts` SET `action1_param3`=815 WHERE `id`=276501;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=279301;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=279301;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=290601;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=290601;
-- Replacing -192 with 903.
UPDATE `creature_ai_scripts` SET `action1_param1`=903 WHERE `id`=292202;
-- Replacing -193 with 904.
UPDATE `creature_ai_scripts` SET `action1_param2`=904 WHERE `id`=292202;
-- Replacing -194 with 902.
UPDATE `creature_ai_scripts` SET `action1_param3`=902 WHERE `id`=292202;
-- Replacing -195 with 899.
UPDATE `creature_ai_scripts` SET `action1_param1`=899 WHERE `id`=292203;
-- Replacing -196 with 905.
UPDATE `creature_ai_scripts` SET `action1_param2`=905 WHERE `id`=292203;
-- Replacing -197 with 901.
UPDATE `creature_ai_scripts` SET `action1_param3`=901 WHERE `id`=292203;
-- Replacing -429 with 1092.
UPDATE `creature_ai_scripts` SET `action1_param1`=1092 WHERE `id`=350401;
-- Replacing -430 with 1099.
UPDATE `creature_ai_scripts` SET `action1_param2`=1099 WHERE `id`=350401;
-- Replacing -432 with 1100.
UPDATE `creature_ai_scripts` SET `action1_param1`=1100 WHERE `id`=350402;
-- Replacing -433 with 1094.
UPDATE `creature_ai_scripts` SET `action1_param2`=1094 WHERE `id`=350402;
-- Replacing -434 with 1097.
UPDATE `creature_ai_scripts` SET `action1_param3`=1097 WHERE `id`=350402;
-- Replacing -167 with 1176.
UPDATE `creature_ai_scripts` SET `action1_param1`=1176 WHERE `id`=356901;
-- Replacing -1214 with 1521.
UPDATE `creature_ai_scripts` SET `action1_param1`=1521 WHERE `id`=362607;
-- Replacing -1215 with 1531.
UPDATE `creature_ai_scripts` SET `action1_param1`=1531 WHERE `id`=362608;
-- Replacing -1216 with 1532.
UPDATE `creature_ai_scripts` SET `action1_param2`=1532 WHERE `id`=362608;
-- Replacing -1217 with 1536.
UPDATE `creature_ai_scripts` SET `action1_param3`=1536 WHERE `id`=362608;
-- Replacing -554 with 1224.
UPDATE `creature_ai_scripts` SET `action1_param1`=1224 WHERE `id`=366702;
-- Replacing -99 with 6094.
UPDATE `creature_ai_scripts` SET `action1_param1`=6094 WHERE `id`=366902;
-- Replacing -388701 with 48821.
UPDATE `creature_ai_scripts` SET `action1_param1`=48821 WHERE `id`=388702;
-- Replacing -388702 with 48823.
UPDATE `creature_ai_scripts` SET `action1_param1`=48823 WHERE `id`=388703;
-- Replacing -528 with 807.
UPDATE `creature_ai_scripts` SET `action1_param2`=807 WHERE `id`=406302;
-- Replacing -530 with 815.
UPDATE `creature_ai_scripts` SET `action1_param3`=815 WHERE `id`=406302;
-- Replacing -427801 with 48826.
UPDATE `creature_ai_scripts` SET `action1_param1`=48826 WHERE `id`=427804;
-- Replacing -427802 with 48829.
UPDATE `creature_ai_scripts` SET `action1_param1`=48829 WHERE `id`=427805;
-- Replacing -185 with 2570.
UPDATE `creature_ai_scripts` SET `action1_param3`=2570 WHERE `id`=429302;
-- Replacing -185 with 2570.
UPDATE `creature_ai_scripts` SET `action1_param3`=2570 WHERE `id`=430602;
-- Replacing -133 with 6179.
UPDATE `creature_ai_scripts` SET `action1_param1`=6179 WHERE `id`=442102;
-- Replacing -135 with 6181.
UPDATE `creature_ai_scripts` SET `action1_param1`=6181 WHERE `id`=442111;
-- Replacing -136 with 6182.
UPDATE `creature_ai_scripts` SET `action1_param1`=6182 WHERE `id`=442112;
-- Replacing -4810 with 2406.
UPDATE `creature_ai_scripts` SET `action1_param2`=2406 WHERE `id`=480904;
-- Replacing -4811 with 2409.
UPDATE `creature_ai_scripts` SET `action1_param3`=2409 WHERE `id`=480904;
-- Replacing -4810 with 2406.
UPDATE `creature_ai_scripts` SET `action1_param2`=2406 WHERE `id`=481003;
-- Replacing -4811 with 2409.
UPDATE `creature_ai_scripts` SET `action1_param3`=2409 WHERE `id`=481003;
-- Replacing -4810 with 2406.
UPDATE `creature_ai_scripts` SET `action1_param2`=2406 WHERE `id`=481113;
-- Replacing -4811 with 2409.
UPDATE `creature_ai_scripts` SET `action1_param3`=2409 WHERE `id`=481113;
-- Replacing -4811 with 2409.
UPDATE `creature_ai_scripts` SET `action1_param3`=2409 WHERE `id`=481204;
-- Replacing -4811 with 2409.
UPDATE `creature_ai_scripts` SET `action1_param3`=2409 WHERE `id`=481314;
-- Replacing -4811 with 2409.
UPDATE `creature_ai_scripts` SET `action1_param3`=2409 WHERE `id`=481406;
-- Replacing -198 with 6169.
UPDATE `creature_ai_scripts` SET `action1_param1`=6169 WHERE `id`=483102;
-- Replacing -578 with 6214.
UPDATE `creature_ai_scripts` SET `action1_param1`=6214 WHERE `id`=485416;
-- Replacing -343 with 1685.
UPDATE `creature_ai_scripts` SET `action1_param1`=1685 WHERE `id`=504201;
-- Replacing -344 with 1679.
UPDATE `creature_ai_scripts` SET `action1_param2`=1679 WHERE `id`=504201;
-- Replacing -345 with 1682.
UPDATE `creature_ai_scripts` SET `action1_param3`=1682 WHERE `id`=504201;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=547201;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=547201;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=547401;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=547401;
-- Replacing -570212 with 2060.
UPDATE `creature_ai_scripts` SET `action1_param1`=2060 WHERE `id`=570212;
-- Replacing -824 with 6219.
UPDATE `creature_ai_scripts` SET `action1_param1`=6219 WHERE `id`=571011;
-- Replacing -819 with 6220.
UPDATE `creature_ai_scripts` SET `action1_param1`=6220 WHERE `id`=572101;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=597401;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=597401;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=597601;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=597601;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=597702;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=597702;
-- Replacing -188 with 2425.
UPDATE `creature_ai_scripts` SET `action1_param1`=2425 WHERE `id`=622203;
-- Replacing -189 with 2424.
UPDATE `creature_ai_scripts` SET `action1_param2`=2424 WHERE `id`=622203;
-- Replacing -190 with 2422.
UPDATE `creature_ai_scripts` SET `action1_param3`=2422 WHERE `id`=622203;
-- Replacing -188 with 2425.
UPDATE `creature_ai_scripts` SET `action1_param1`=2425 WHERE `id`=622403;
-- Replacing -189 with 2424.
UPDATE `creature_ai_scripts` SET `action1_param2`=2424 WHERE `id`=622403;
-- Replacing -191 with 2423.
UPDATE `creature_ai_scripts` SET `action1_param3`=2423 WHERE `id`=622403;
-- Replacing -357 with 1936.
UPDATE `creature_ai_scripts` SET `action1_param1`=1936 WHERE `id`=652302;
-- Replacing -406 with 1934.
UPDATE `creature_ai_scripts` SET `action1_param3`=1934 WHERE `id`=652302;
-- Replacing -232 with 2867.
UPDATE `creature_ai_scripts` SET `action1_param1`=2867 WHERE `id`=684601;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=703301;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=703301;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=703401;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=703401;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=703501;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=703501;
-- Replacing -1035 with 6225.
UPDATE `creature_ai_scripts` SET `action1_param1`=6225 WHERE `id`=726701;
-- Replacing -1038 with 6226.
UPDATE `creature_ai_scripts` SET `action1_param1`=6226 WHERE `id`=726705;
-- Replacing -1036 with 6228.
UPDATE `creature_ai_scripts` SET `action1_param1`=6228 WHERE `id`=726706;
-- Replacing -1037 with 6227.
UPDATE `creature_ai_scripts` SET `action1_param1`=6227 WHERE `id`=726707;
-- Replacing -320 with 6221.
UPDATE `creature_ai_scripts` SET `action1_param1`=6221 WHERE `id`=727102;
-- Replacing -1039 with 6223.
UPDATE `creature_ai_scripts` SET `action1_param1`=6223 WHERE `id`=727401;
-- Replacing -1040 with 6224.
UPDATE `creature_ai_scripts` SET `action1_param1`=6224 WHERE `id`=727405;
-- Replacing -163 with 6184.
UPDATE `creature_ai_scripts` SET `action1_param1`=6184 WHERE `id`=735702;
-- Replacing -164 with 4435.
UPDATE `creature_ai_scripts` SET `action1_param1`=4435 WHERE `id`=735711;
-- Replacing -165 with 4436.
UPDATE `creature_ai_scripts` SET `action1_param2`=4436 WHERE `id`=735711;
-- Replacing -166 with 4437.
UPDATE `creature_ai_scripts` SET `action1_param3`=4437 WHERE `id`=735711;
-- Replacing -188 with 2425.
UPDATE `creature_ai_scripts` SET `action1_param1`=2425 WHERE `id`=760302;
-- Replacing -190 with 2422.
UPDATE `creature_ai_scripts` SET `action1_param2`=2422 WHERE `id`=760302;
-- Replacing -191 with 2423.
UPDATE `creature_ai_scripts` SET `action1_param3`=2423 WHERE `id`=760302;
-- Replacing -713 with 3691.
UPDATE `creature_ai_scripts` SET `action1_param1`=3691 WHERE `id`=766404;
-- Replacing -714 with 3689.
UPDATE `creature_ai_scripts` SET `action1_param1`=3689 WHERE `id`=766405;
-- Replacing -715 with 3692.
UPDATE `creature_ai_scripts` SET `action1_param1`=3692 WHERE `id`=766406;
-- Replacing -716 with 3693.
UPDATE `creature_ai_scripts` SET `action1_param1`=3693 WHERE `id`=766408;
-- Replacing -108 with 6174.
UPDATE `creature_ai_scripts` SET `action1_param1`=6174 WHERE `id`=780004;
-- Replacing -1056 with 3932.
UPDATE `creature_ai_scripts` SET `action1_param1`=3932 WHERE `id`=789901;
-- Replacing -1057 with 3931.
UPDATE `creature_ai_scripts` SET `action1_param2`=3931 WHERE `id`=789901;
-- Replacing -1056 with 3932.
UPDATE `creature_ai_scripts` SET `action1_param1`=3932 WHERE `id`=790101;
-- Replacing -1057 with 3931.
UPDATE `creature_ai_scripts` SET `action1_param2`=3931 WHERE `id`=790101;
-- Replacing -1056 with 3932.
UPDATE `creature_ai_scripts` SET `action1_param1`=3932 WHERE `id`=790201;
-- Replacing -1057 with 3931.
UPDATE `creature_ai_scripts` SET `action1_param2`=3931 WHERE `id`=790201;
-- Replacing -579 with 3541.
UPDATE `creature_ai_scripts` SET `action1_param1`=3541 WHERE `id`=803501;
-- Replacing -580 with 3542.
UPDATE `creature_ai_scripts` SET `action1_param1`=3542 WHERE `id`=803502;
-- Replacing -581 with 3543.
UPDATE `creature_ai_scripts` SET `action1_param1`=3543 WHERE `id`=803503;
-- Replacing -710 with 4166.
UPDATE `creature_ai_scripts` SET `action1_param1`=4166 WHERE `id`=812701;
-- Replacing -711 with 4177.
UPDATE `creature_ai_scripts` SET `action1_param1`=4177 WHERE `id`=812705;
-- Replacing -712 with 4178.
UPDATE `creature_ai_scripts` SET `action1_param1`=4178 WHERE `id`=812706;
-- Replacing -983 with 4495.
UPDATE `creature_ai_scripts` SET `action1_param1`=4495 WHERE `id`=857802;
-- Replacing -984 with 4502.
UPDATE `creature_ai_scripts` SET `action1_param1`=4502 WHERE `id`=858101;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=897701;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=897701;
-- Replacing -137 with 5059.
UPDATE `creature_ai_scripts` SET `action1_param1`=5059 WHERE `id`=902603;
-- Replacing -901 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param2`=2628 WHERE `id`=944704;
-- Replacing -901 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param1`=2628 WHERE `id`=944705;
-- Replacing -901 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param1`=2628 WHERE `id`=944803;
-- Replacing -901 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param3`=2628 WHERE `id`=945007;
-- Replacing -901 with 2628.
UPDATE `creature_ai_scripts` SET `action1_param1`=2628 WHERE `id`=945106;
-- Replacing -1327 with 4998.
UPDATE `creature_ai_scripts` SET `action1_param1`=4998 WHERE `id`=955402;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=960401;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=960401;
-- Replacing -582 with 5542.
UPDATE `creature_ai_scripts` SET `action1_param1`=5542 WHERE `id`=1026201;
-- Replacing -583 with 5539.
UPDATE `creature_ai_scripts` SET `action1_param2`=5539 WHERE `id`=1026201;
-- Replacing -584 with 5540.
UPDATE `creature_ai_scripts` SET `action1_param3`=5540 WHERE `id`=1026201;
-- Replacing -586 with 5543.
UPDATE `creature_ai_scripts` SET `action1_param2`=5543 WHERE `id`=1026202;
-- Replacing -587 with 5545.
UPDATE `creature_ai_scripts` SET `action1_param3`=5545 WHERE `id`=1026202;
-- Replacing -5547 with 5547.
UPDATE `creature_ai_scripts` SET `action1_param1`=5547 WHERE `id`=1026402;
-- Replacing -186 with 5773.
UPDATE `creature_ai_scripts` SET `action1_param1`=5773 WHERE `id`=1041102;
-- Replacing -438 with 6234.
UPDATE `creature_ai_scripts` SET `action1_param1`=6234 WHERE `id`=1043301;
-- Replacing -448 with 5788.
UPDATE `creature_ai_scripts` SET `action1_param1`=5788 WHERE `id`=1050613;
-- Replacing -764 with 6260.
UPDATE `creature_ai_scripts` SET `action1_param1`=6260 WHERE `id`=1094001;
-- Replacing -1310 with 6426.
UPDATE `creature_ai_scripts` SET `action1_param3`=6426 WHERE `id`=1105801;
-- Replacing -1055 with 6470.
UPDATE `creature_ai_scripts` SET `action1_param1`=6470 WHERE `id`=1114201;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=1144001;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=1144001;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=1144101;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=1144101;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=1144202;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=1144202;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=1144302;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=1144302;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=1144402;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=1144402;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=1144804;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=1144804;
-- Replacing -357 with 1936.
UPDATE `creature_ai_scripts` SET `action1_param1`=1936 WHERE `id`=1145402;
-- Replacing -406 with 1934.
UPDATE `creature_ai_scripts` SET `action1_param3`=1934 WHERE `id`=1145402;
-- Replacing -410 with 5954.
UPDATE `creature_ai_scripts` SET `action1_param1`=5954 WHERE `id`=1158201;
-- Replacing -311 with 5952.
UPDATE `creature_ai_scripts` SET `action1_param2`=5952 WHERE `id`=1158201;
-- Replacing -435 with 5950.
UPDATE `creature_ai_scripts` SET `action1_param3`=5950 WHERE `id`=1158201;
-- Replacing -357 with 1936.
UPDATE `creature_ai_scripts` SET `action1_param1`=1936 WHERE `id`=1168002;
-- Replacing -406 with 1934.
UPDATE `creature_ai_scripts` SET `action1_param3`=1934 WHERE `id`=1168002;
-- Replacing -73 with 7272.
UPDATE `creature_ai_scripts` SET `action1_param1`=7272 WHERE `id`=1193601;
-- Replacing -982 with 7273.
UPDATE `creature_ai_scripts` SET `action1_param3`=7273 WHERE `id`=1193601;
-- Replacing -490 with 7597.
UPDATE `creature_ai_scripts` SET `action1_param1`=7597 WHERE `id`=1233701;
-- Replacing -491 with 7599.
UPDATE `creature_ai_scripts` SET `action1_param2`=7599 WHERE `id`=1233701;
-- Replacing -492 with 7596.
UPDATE `creature_ai_scripts` SET `action1_param3`=7596 WHERE `id`=1233701;
-- Replacing -826 with 8350.
UPDATE `creature_ai_scripts` SET `action1_param1`=8350 WHERE `id`=1291801;
-- Replacing -545 with 9091.
UPDATE `creature_ai_scripts` SET `action1_param1`=9091 WHERE `id`=1422401;
-- Replacing -546 with 9093.
UPDATE `creature_ai_scripts` SET `action1_param2`=9093 WHERE `id`=1422401;
-- Replacing -547 with 9092.
UPDATE `creature_ai_scripts` SET `action1_param3`=9092 WHERE `id`=1422401;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=1426701;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=1426701;
-- Replacing -359 with 1925.
UPDATE `creature_ai_scripts` SET `action1_param1`=1925 WHERE `id`=1432218;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action1_param2`=1926 WHERE `id`=1432218;
-- Replacing -144543 with 9668.
UPDATE `creature_ai_scripts` SET `action1_param1`=9668 WHERE `id`=1445401;
-- Replacing -144542 with 9669.
UPDATE `creature_ai_scripts` SET `action1_param1`=9669 WHERE `id`=1445406;
-- Replacing -144541 with 9679.
UPDATE `creature_ai_scripts` SET `action1_param1`=9679 WHERE `id`=1445407;
-- Replacing -144573 with 9664.
UPDATE `creature_ai_scripts` SET `action1_param1`=9664 WHERE `id`=1445701;
-- Replacing -144571 with 9666.
UPDATE `creature_ai_scripts` SET `action1_param1`=9666 WHERE `id`=1445704;
-- Replacing -144572 with 9674.
UPDATE `creature_ai_scripts` SET `action1_param1`=9674 WHERE `id`=1445705;
-- Replacing -144613 with 9661.
UPDATE `creature_ai_scripts` SET `action1_param1`=9661 WHERE `id`=1446101;
-- Replacing -144611 with 9662.
UPDATE `creature_ai_scripts` SET `action1_param1`=9662 WHERE `id`=1446104;
-- Replacing -144612 with 9676.
UPDATE `creature_ai_scripts` SET `action1_param1`=9676 WHERE `id`=1446105;
-- Replacing -987 with 9660.
UPDATE `creature_ai_scripts` SET `action1_param1`=9660 WHERE `id`=1446401;
-- Replacing -988 with 9658.
UPDATE `creature_ai_scripts` SET `action1_param1`=9658 WHERE `id`=1446404;
-- Replacing -986 with 9673.
UPDATE `creature_ai_scripts` SET `action1_param1`=9673 WHERE `id`=1446405;
-- Replacing -797 with 9633.
UPDATE `creature_ai_scripts` SET `action1_param1`=9633 WHERE `id`=1446701;
-- Replacing -14720 with 7237.
UPDATE `creature_ai_scripts` SET `action1_param1`=7237 WHERE `id`=1472005;
-- Replacing -500101 with 10755.
UPDATE `creature_ai_scripts` SET `action1_param1`=10755 WHERE `id`=1523303;
-- Replacing -15554 with 11110.
UPDATE `creature_ai_scripts` SET `action1_param1`=11110 WHERE `id`=1555401;
-- Replacing -1139 with 11271.
UPDATE `creature_ai_scripts` SET `action1_param1`=11271 WHERE `id`=1562501;
-- Replacing -1140 with 11269.
UPDATE `creature_ai_scripts` SET `action1_param1`=11269 WHERE `id`=1562502;
-- Replacing -1141 with 11270.
UPDATE `creature_ai_scripts` SET `action1_param1`=11270 WHERE `id`=1562505;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=43010;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=43202;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=43503;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=43504;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=43612;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=43702;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=44002;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=48503;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=48603;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=58703;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=59701;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=61502;
-- Replacing -341 with 1327.
UPDATE `creature_ai_scripts` SET `action2_param1`=1327 WHERE `id`=63602;
-- Replacing -176 with 1345.
UPDATE `creature_ai_scripts` SET `action2_param1`=1345 WHERE `id`=64606;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=69407;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=69704;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=75101;
-- Replacing -551 with 1064.
UPDATE `creature_ai_scripts` SET `action2_param1`=1064 WHERE `id`=76301;
-- Replacing -100 with 2481.
UPDATE `creature_ai_scripts` SET `action2_param1`=2481 WHERE `id`=102101;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=111801;
-- Replacing -100 with 2481.
UPDATE `creature_ai_scripts` SET `action2_param1`=2481 WHERE `id`=114002;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=127392;
-- Replacing -1218 with 1530.
UPDATE `creature_ai_scripts` SET `action2_param1`=1530 WHERE `id`=132808;
-- Replacing -1219 with 1533.
UPDATE `creature_ai_scripts` SET `action2_param2`=1533 WHERE `id`=132808;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=139302;
-- Replacing -207 with 183.
UPDATE `creature_ai_scripts` SET `action2_param2`=183 WHERE `id`=139502;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=139802;
-- Replacing -411 with 182.
UPDATE `creature_ai_scripts` SET `action2_param1`=182 WHERE `id`=140202;
-- Replacing -413 with 186.
UPDATE `creature_ai_scripts` SET `action2_param3`=186 WHERE `id`=140202;
-- Replacing -411 with 182.
UPDATE `creature_ai_scripts` SET `action2_param1`=182 WHERE `id`=140502;
-- Replacing -413 with 186.
UPDATE `creature_ai_scripts` SET `action2_param3`=186 WHERE `id`=140502;
-- Replacing -1209 with 775.
UPDATE `creature_ai_scripts` SET `action2_param1`=775 WHERE `id`=149301;
-- Replacing -1210 with 774.
UPDATE `creature_ai_scripts` SET `action2_param2`=774 WHERE `id`=149301;
-- Replacing -1213 with 773.
UPDATE `creature_ai_scripts` SET `action2_param3`=773 WHERE `id`=149301;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=169603;
-- Replacing -1043 with 1395.
UPDATE `creature_ai_scripts` SET `action2_param1`=1395 WHERE `id`=171602;
-- Replacing -1044 with 1393.
UPDATE `creature_ai_scripts` SET `action2_param2`=1393 WHERE `id`=171602;
-- Replacing -1045 with 1390.
UPDATE `creature_ai_scripts` SET `action2_param3`=1390 WHERE `id`=171602;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=178201;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=180202;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=184103;
-- Replacing -551 with 1064.
UPDATE `creature_ai_scripts` SET `action2_param1`=1064 WHERE `id`=184403;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=201102;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=201209;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=201301;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=201402;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=224901;
-- Replacing -550 with 1151.
UPDATE `creature_ai_scripts` SET `action2_param1`=1151 WHERE `id`=228702;
-- Replacing -550 with 1151.
UPDATE `creature_ai_scripts` SET `action2_param1`=1151 WHERE `id`=228703;
-- Replacing -346 with 741.
UPDATE `creature_ai_scripts` SET `action2_param1`=741 WHERE `id`=235808;
-- Replacing -346 with 741.
UPDATE `creature_ai_scripts` SET `action2_param1`=741 WHERE `id`=235809;
-- Replacing -471 with 757.
UPDATE `creature_ai_scripts` SET `action2_param1`=757 WHERE `id`=235901;
-- Replacing -472 with 758.
UPDATE `creature_ai_scripts` SET `action2_param1`=758 WHERE `id`=235902;
-- Replacing -473 with 759.
UPDATE `creature_ai_scripts` SET `action2_param1`=759 WHERE `id`=235903;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=246404;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=261902;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=264301;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=265001;
-- Replacing -551 with 1064.
UPDATE `creature_ai_scripts` SET `action2_param1`=1064 WHERE `id`=270601;
-- Replacing -551 with 1064.
UPDATE `creature_ai_scripts` SET `action2_param1`=1064 WHERE `id`=271904;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=279101;
-- Replacing -1218 with 1530.
UPDATE `creature_ai_scripts` SET `action2_param1`=1530 WHERE `id`=362608;
-- Replacing -1219 with 1533.
UPDATE `creature_ai_scripts` SET `action2_param2`=1533 WHERE `id`=362608;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=372701;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=376501;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=376702;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=377001;
-- Replacing -829 with 1254.
UPDATE `creature_ai_scripts` SET `action2_param1`=1254 WHERE `id`=381701;
-- Replacing -829 with 1254.
UPDATE `creature_ai_scripts` SET `action2_param1`=1254 WHERE `id`=381801;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=382501;
-- Replacing -550 with 1151.
UPDATE `creature_ai_scripts` SET `action2_param1`=1151 WHERE `id`=392502;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=393201;
-- Replacing -658 with 1356.
UPDATE `creature_ai_scripts` SET `action2_param1`=1356 WHERE `id`=394602;
-- Replacing -659 with 1357.
UPDATE `creature_ai_scripts` SET `action2_param1`=1357 WHERE `id`=394603;
-- Replacing -660 with 1358.
UPDATE `creature_ai_scripts` SET `action2_param1`=1358 WHERE `id`=394604;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=406407;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=406502;
-- Replacing -551 with 1064.
UPDATE `creature_ai_scripts` SET `action2_param1`=1064 WHERE `id`=426301;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=428601;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=428701;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=428802;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=429201;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=429501;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=429502;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=429801;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=429902;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=430101;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=430201;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=430302;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=430306;
-- Replacing -100 with 2481.
UPDATE `creature_ai_scripts` SET `action2_param1`=2481 WHERE `id`=435201;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=438501;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=446208;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=446312;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=446404;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=451401;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action2_param3`=2628 WHERE `id`=454002;
-- Replacing -551 with 1064.
UPDATE `creature_ai_scripts` SET `action2_param1`=1064 WHERE `id`=463604;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=467002;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=467102;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=467201;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=467301;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=467403;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=467504;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=472602;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=482902;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=485101;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=485502;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=525802;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=526702;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=529501;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=529601;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=534602;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=546501;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=547001;
-- Replacing -825 with 4703.
UPDATE `creature_ai_scripts` SET `action2_param1`=4703 WHERE `id`=570901;
-- Replacing -823 with 6538.
UPDATE `creature_ai_scripts` SET `action2_param1`=6538 WHERE `id`=571003;
-- Replacing -551 with 1064.
UPDATE `creature_ai_scripts` SET `action2_param1`=1064 WHERE `id`=607203;
-- Replacing -74 with 3829.
UPDATE `creature_ai_scripts` SET `action2_param1`=3829 WHERE `id`=622103;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=632905;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=651301;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=715702;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=717502;
-- Replacing -320 with 6221.
UPDATE `creature_ai_scripts` SET `action2_param1`=6221 WHERE `id`=727102;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=732002;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=732701;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=732801;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=732901;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=733208;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=773001;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=780801;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=820102;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=821602;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=829703;
-- Replacing -100 with 2481.
UPDATE `creature_ai_scripts` SET `action2_param1`=2481 WHERE `id`=853802;
-- Replacing -100 with 2481.
UPDATE `creature_ai_scripts` SET `action2_param1`=2481 WHERE `id`=853902;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=859801;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=876101;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=887701;
-- Replacing -47 with 1150.
UPDATE `creature_ai_scripts` SET `action2_param1`=1150 WHERE `id`=889511;
-- Replacing -47 with 1150.
UPDATE `creature_ai_scripts` SET `action2_param1`=1150 WHERE `id`=889804;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=895601;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=895702;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=895802;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=897903;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=904202;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=921602;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=925901;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=926801;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=945402;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=960503;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=971602;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=977901;
-- Replacing -47 with 1150.
UPDATE `creature_ai_scripts` SET `action2_param1`=1150 WHERE `id`=981711;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=991601;
-- Replacing -704 with 5460.
UPDATE `creature_ai_scripts` SET `action2_param1`=5460 WHERE `id`=1011701;
-- Replacing -705 with 4726.
UPDATE `creature_ai_scripts` SET `action2_param2`=4726 WHERE `id`=1011701;
-- Replacing -706 with 5459.
UPDATE `creature_ai_scripts` SET `action2_param3`=5459 WHERE `id`=1011701;
-- Replacing -704 with 5460.
UPDATE `creature_ai_scripts` SET `action2_param1`=5460 WHERE `id`=1011702;
-- Replacing -705 with 4726.
UPDATE `creature_ai_scripts` SET `action2_param2`=4726 WHERE `id`=1011702;
-- Replacing -706 with 5459.
UPDATE `creature_ai_scripts` SET `action2_param3`=5459 WHERE `id`=1011702;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1037303;
-- Replacing -1054 with 5772.
UPDATE `creature_ai_scripts` SET `action2_param1`=5772 WHERE `id`=1038103;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1040504;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1048803;
-- Replacing -47 with 1150.
UPDATE `creature_ai_scripts` SET `action2_param1`=1150 WHERE `id`=1068011;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1080102;
-- Replacing -551 with 1064.
UPDATE `creature_ai_scripts` SET `action2_param1`=1064 WHERE `id`=1082801;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1083603;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1135204;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1139103;
-- Replacing -360 with 1926.
UPDATE `creature_ai_scripts` SET `action2_param1`=1926 WHERE `id`=1144104;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1144203;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1144413;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1145104;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1146903;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1149605;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1174702;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1184002;
-- Replacing -47 with 1150.
UPDATE `creature_ai_scripts` SET `action2_param1`=1150 WHERE `id`=1188105;
-- Replacing -47 with 1150.
UPDATE `creature_ai_scripts` SET `action2_param1`=1150 WHERE `id`=1188308;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1194603;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1204603;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1212101;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1212201;
-- Replacing -1153 with 7570.
UPDATE `creature_ai_scripts` SET `action2_param1`=7570 WHERE `id`=1226502;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1234701;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1237902;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1257902;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1280202;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1280305;
-- Replacing -827 with 8351.
UPDATE `creature_ai_scripts` SET `action2_param1`=8351 WHERE `id`=1291802;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1422501;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1432204;
-- Replacing -649 with 9414.
UPDATE `creature_ai_scripts` SET `action2_param1`=9414 WHERE `id`=1432205;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1432505;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1434401;
-- Replacing -647 with 9489.
UPDATE `creature_ai_scripts` SET `action2_param1`=9489 WHERE `id`=1438601;
-- Replacing -647 with 9489.
UPDATE `creature_ai_scripts` SET `action2_param1`=9489 WHERE `id`=1438602;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1476205;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1476305;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1476405;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1476505;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1477205;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1477305;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1477605;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1477705;
-- Replacing -47 with 1150.
UPDATE `creature_ai_scripts` SET `action2_param1`=1150 WHERE `id`=1521308;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1523302;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1525204;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1527705;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1527713;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1527721;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1527729;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1527737;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1527745;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1527753;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1527761;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1532401;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1538703;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1553703;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1563001;
-- Replacing -106 with 1191.
UPDATE `creature_ai_scripts` SET `action2_param1`=1191 WHERE `id`=1609803;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1624403;
-- Replacing -46 with 7798.
UPDATE `creature_ai_scripts` SET `action2_param1`=7798 WHERE `id`=1644703;
-- Replacing -549 with 4566.
UPDATE `creature_ai_scripts` SET `action3_param1`=4566 WHERE `id`=35201;
-- Replacing -549 with 4566.
UPDATE `creature_ai_scripts` SET `action3_param1`=4566 WHERE `id`=52301;
-- Replacing -549 with 4566.
UPDATE `creature_ai_scripts` SET `action3_param1`=4566 WHERE `id`=93101;
-- Replacing -411 with 182.
UPDATE `creature_ai_scripts` SET `action3_param1`=182 WHERE `id`=139502;
-- Replacing -413 with 186.
UPDATE `creature_ai_scripts` SET `action3_param2`=186 WHERE `id`=139502;
-- Replacing -411 with 182.
UPDATE `creature_ai_scripts` SET `action3_param2`=182 WHERE `id`=140502;
-- Replacing -413 with 186.
UPDATE `creature_ai_scripts` SET `action3_param3`=186 WHERE `id`=140502;
-- Replacing -1211 with 777.
UPDATE `creature_ai_scripts` SET `action3_param1`=777 WHERE `id`=149301;
-- Replacing -1212 with 772.
UPDATE `creature_ai_scripts` SET `action3_param2`=772 WHERE `id`=149301;
-- Replacing -1213 with 773.
UPDATE `creature_ai_scripts` SET `action3_param3`=773 WHERE `id`=149301;
-- Replacing -549 with 4566.
UPDATE `creature_ai_scripts` SET `action3_param1`=4566 WHERE `id`=157101;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=157201;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=157301;
-- Replacing -1041 with 1391.
UPDATE `creature_ai_scripts` SET `action3_param1`=1391 WHERE `id`=171602;
-- Replacing -1042 with 1394.
UPDATE `creature_ai_scripts` SET `action3_param2`=1394 WHERE `id`=171602;
-- Replacing -1043 with 1395.
UPDATE `creature_ai_scripts` SET `action3_param3`=1395 WHERE `id`=171602;
-- Replacing -551 with 1064.
UPDATE `creature_ai_scripts` SET `action3_param1`=1064 WHERE `id`=228703;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=229901;
-- Replacing -365 with 789.
UPDATE `creature_ai_scripts` SET `action3_param1`=789 WHERE `id`=231810;
-- Replacing -549 with 4566.
UPDATE `creature_ai_scripts` SET `action3_param1`=4566 WHERE `id`=240901;
-- Replacing -549 with 4566.
UPDATE `creature_ai_scripts` SET `action3_param1`=4566 WHERE `id`=243201;
-- Replacing -549 with 4566.
UPDATE `creature_ai_scripts` SET `action3_param1`=4566 WHERE `id`=283501;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=285901;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=294101;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=383801;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=384101;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=426701;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=428601;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=428701;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=428802;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=429201;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=429501;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=429801;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=429902;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=430101;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=430201;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=430302;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=431901;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=432101;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=440701;
-- Replacing -1308 with 2628.
UPDATE `creature_ai_scripts` SET `action3_param3`=2628 WHERE `id`=454002;
-- Replacing -775 with 1756.
UPDATE `creature_ai_scripts` SET `action3_param1`=1756 WHERE `id`=508901;
-- Replacing -822 with 6217.
UPDATE `creature_ai_scripts` SET `action3_param1`=6217 WHERE `id`=571001;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=670601;
-- Replacing -694 with 3263.
UPDATE `creature_ai_scripts` SET `action3_param1`=3263 WHERE `id`=702301;
-- Replacing -694 with 3263.
UPDATE `creature_ai_scripts` SET `action3_param1`=3263 WHERE `id`=702302;
-- Replacing -694 with 3263.
UPDATE `creature_ai_scripts` SET `action3_param1`=3263 WHERE `id`=702303;
-- Replacing -694 with 3263.
UPDATE `creature_ai_scripts` SET `action3_param1`=3263 WHERE `id`=702304;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=782301;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=801801;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=801901;
-- Replacing -549 with 4566.
UPDATE `creature_ai_scripts` SET `action3_param1`=4566 WHERE `id`=860901;
-- Replacing -47 with 1150.
UPDATE `creature_ai_scripts` SET `action3_param1`=1150 WHERE `id`=889410;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=1089701;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=1113801;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=1257701;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=1257801;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=1259601;
-- Replacing -549 with 4568.
UPDATE `creature_ai_scripts` SET `action3_param1`=4568 WHERE `id`=1261701;
-- Replacing -549 with 4562.
UPDATE `creature_ai_scripts` SET `action3_param1`=4562 WHERE `id`=1517701;
-- William Kielar should not say anything.
UPDATE `creature_ai_scripts` SET `action3_type`=0, `action3_param1`=0 WHERE `id`=1720901;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
