DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230729130435');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230729130435');
-- Add your query below.


-- Add Correct Spawns
UPDATE `creature` SET `movement_type` = 0, `wander_distance` = 0 WHERE `guid` IN (51016, 51089, 51084);
UPDATE `creature` SET `position_x` = -4453.125, `position_y` = 1449.7388, `position_z` = 127.01061, `orientation` = 4.837978363037109375 WHERE `guid` = 51022;
UPDATE `creature` SET `position_x` = -4445.987, `position_y` = 1516.5454, `position_z` = 126.46534, `orientation` = 3.122159719467163085 WHERE `guid` = 51079;
UPDATE `creature` SET `position_x` = -4485.658, `position_y` = 1414.0709, `position_z` = 127.02765, `orientation` = 0.841518938541412353 WHERE `guid` = 51092;
UPDATE `creature` SET `position_x` = -4615.8574, `position_y` = 1351.7311, `position_z` = 102.85461, `orientation` = 0.266002804040908813 WHERE `guid` = 51129;
UPDATE `creature` SET `position_x` = -4360.3965, `position_y` = 1330.485, `position_z` = 159.28914, `orientation` = 1.640096902847290039 WHERE `guid` = 51030;
UPDATE `creature` SET `position_x` = -4348.142, `position_y` = 1373.4885, `position_z` = 157.46828, `orientation` = 1.085126519203186035 WHERE `guid` = 51130;
UPDATE `creature` SET `position_x` = -4348.97, `position_y` = 1291.337, `position_z` = 158.18484, `orientation` = 1.465876102447509765 WHERE `guid` = 51131;
UPDATE `creature` SET `position_x` = -4367.583, `position_y` = 1508.7891, `position_z` = 150.6499, `orientation` = 3.600060939788818359 WHERE `guid` = 51132;
UPDATE `creature` SET `position_x` = -4349.9233, `position_y` = 1457.9415, `position_z` = 150.64963, `orientation` = 2.781168937683105468 WHERE `guid` = 51032;
UPDATE `creature` SET `position_x` = -4471.221, `position_y` = 1622.9948, `position_z` = 150.65579, `orientation` = 3.009937047958374023 WHERE `guid` = 51067;
UPDATE `creature` SET `position_x` = -4451.278, `position_y` = 1601.6882, `position_z` = 150.65485, `orientation` = 3.426462173461914062 WHERE `guid` = 51082;
UPDATE `creature` SET `position_x` = -4475.442, `position_y` = 1685.6525, `position_z` = 150.66737, `orientation` = 1.505134224891662597 WHERE `guid` = 51071;
UPDATE `creature` SET `position_x` = -4479.558, `position_y` = 1650.5725, `position_z` = 150.6599, `orientation` = 4.887346267700195312 WHERE `guid` = 51019;
UPDATE `creature` SET `position_x` = -4444.0767, `position_y` = 1712.7028, `position_z` = 150.665, `orientation` = 0.114011988043785095 WHERE `guid` = 51072;
UPDATE `creature` SET `position_x` = -4352.2847, `position_y` = 1202.9615, `position_z` = 150.64972, `orientation` = 5.669431686401367187 WHERE `guid` = 51035;
UPDATE `creature` SET `position_x` = -4369.346, `position_y` = 1155.6742, `position_z` = 150.65012, `orientation` = 3.623343467712402343 WHERE `guid` = 51021;
UPDATE `creature` SET `position_x` = -4389.2925, `position_y` = 1136.6418, `position_z` = 150.6547, `orientation` = 5.690884113311767578 WHERE `guid` = 51086;
UPDATE `creature` SET `position_x` = -4458.31, `position_y` = 1058.263, `position_z` = 150.65561, `orientation` = 1.381864786148071289 WHERE `guid` = 51015;
UPDATE `creature` SET `position_x` = -4426.1616, `position_y` = 949.4542, `position_z` = 150.6655, `orientation` = 1.524081707000732421 WHERE `guid` = 51091;
UPDATE `creature` SET `position_x` = -4483.385, `position_y` = 1012.6897, `position_z` = 150.65958, `orientation` = 0.84520888328552246 WHERE `guid` = 51088;
UPDATE `creature` SET `position_x` = -4401.3203, `position_y` = 925.32465, `position_z` = 150.66638, `orientation` = 3.033296108245849609 WHERE `guid` = 51014;
UPDATE `creature` SET `position_x` = -4474.427, `position_y` = 974.2574, `position_z` = 150.66719, `orientation` = 2.384093284606933593 WHERE `guid` = 51066;
UPDATE `creature` SET `position_x` = -4182.179, `position_y` = 1302.7013, `position_z` = 161.26115, `orientation` = 4.727330684661865234 WHERE `guid` = 51037;
UPDATE `creature` SET `position_x` = -4182.6235, `position_y` = 1145.8236, `position_z` = 161.26901, `orientation` = 4.180980682373046875 WHERE `guid` = 51110;
UPDATE `creature` SET `position_x` = -4045.1384, `position_y` = 1143.2349, `position_z` = 159.81036, `orientation` = 3.354994535446166992 WHERE `guid` = 51028;
UPDATE `creature` SET `position_x` = -4033.5696, `position_y` = 1120.1909, `position_z` = 159.76436, `orientation` = 3.273650884628295898 WHERE `guid` = 51111;
UPDATE `creature` SET `position_x` = -4034.7322, `position_y` = 1064.8562, `position_z` = 159.76224, `orientation` = 5.280138969421386718 WHERE `guid` = 51059;
UPDATE `creature` SET `position_x` = -4032.0325, `position_y` = 1010.0499, `position_z` = 159.74928, `orientation` = 5.354701995849609375 WHERE `guid` = 51112;
UPDATE `creature` SET `position_x` = -4025.2183, `position_y` = 889.29083, `position_z` = 159.7305, `orientation` = 1.3256760835647583 WHERE `guid` = 51050;
UPDATE `creature` SET `position_x` = -4033.6345, `position_y` = 957.85126, `position_z` = 159.75502, `orientation` = 2.763689517974853515 WHERE `guid` = 51018;
UPDATE `creature` SET `position_x` = -4038.6802, `position_y` = 946.57153, `position_z` = 159.7871, `orientation` = 5.178121089935302734 WHERE `guid` = 51047;
UPDATE `creature` SET `position_x` = -4036.144, `position_y` = 899.5466, `position_z` = 159.77715, `orientation` = 4.225707054138183593 WHERE `guid` = 51087;
UPDATE `creature` SET `position_x` = -4041.7583, `position_y` = 882.6287, `position_z` = 159.79884, `orientation` = 0.738361299037933349 WHERE `guid` = 51098;
UPDATE `creature` SET `position_x` = -4023.6355, `position_y` = 1321.6704, `position_z` = 159.7563, `orientation` = 3.72686004638671875 WHERE `guid` = 51023;
UPDATE `creature` SET `position_x` = -4036.2786, `position_y` = 1330.8223, `position_z` = 159.8088, `orientation` = 0.415911614894866943 WHERE `guid` = 51055;
UPDATE `creature` SET `position_x` = -4034.6853, `position_y` = 1257.5017, `position_z` = 159.77908, `orientation` = 0.387499868869781494 WHERE `guid` = 51078;
UPDATE `creature` SET `position_x` = -4035.6885, `position_y` = 1200.462, `position_z` = 159.77168, `orientation` = 0.420495033264160156 WHERE `guid` = 51115;
UPDATE `creature` SET `position_x` = -3843.2053, `position_y` = 1195.6122, `position_z` = 149.6832, `orientation` = 1.409304499626159667 WHERE `guid` = 51060;
UPDATE `creature` SET `position_x` = -3918.9548, `position_y` = 1193.9281, `position_z` = 149.73822, `orientation` = 4.436206340789794921 WHERE `guid` = 51058;
UPDATE `creature` SET `position_x` = -3867.7432, `position_y` = 1152.0613, `position_z` = 154.83313, `orientation` = 1.76018381118774414 WHERE `guid` = 51061;
UPDATE `creature` SET `position_x` = -3883.8103, `position_y` = 1095.6268, `position_z` = 154.83313, `orientation` = 1.393362760543823242 WHERE `guid` = 51120;
UPDATE `creature` SET `position_x` = -3848.9363, `position_y` = 1131.5297, `position_z` = 154.8334, `orientation` = 1.666965126991271972 WHERE `guid` = 51118;
UPDATE `creature` SET `position_x` = -3927.9268, `position_y` = 1008.3636, `position_z` = 149.02483, `orientation` = 0.319256871938705444 WHERE `guid` = 51048;
UPDATE `creature` SET `position_x` = -3927.971, `position_y` = 1058.0214, `position_z` = 147.71402, `orientation` = 2.545480728149414062 WHERE `guid` = 51090;
UPDATE `creature` SET `position_x` = -3899.88, `position_y` = 987.15515, `position_z` = 148.15858, `orientation` = 0.363297522068023681 WHERE `guid` = 51074;
UPDATE `creature` SET `position_x` = -3839.131, `position_y` = 996.7229, `position_z` = 150.98323, `orientation` = 0.102264203131198883 WHERE `guid` = 51121;
UPDATE `creature` SET `position_x` = -3836.2239, `position_y` = 1054.4117, `position_z` = 154.83353, `orientation` = 2.594856500625610351 WHERE `guid` = 51062;
UPDATE `creature` SET `position_x` = -3870.1975, `position_y` = 1042.199, `position_z` = 154.83311, `orientation` = 2.878004789352416992 WHERE `guid` = 51119;
UPDATE `creature` SET `position_x` = -3733.9329, `position_y` = 979.04266, `position_z` = 150.03871, `orientation` = 1.735468149185180664 WHERE `guid` = 51065;
UPDATE `creature` SET `position_x` = -3712.0166, `position_y` = 1019.5955, `position_z` = 154.83328, `orientation` = 2.171266555786132812 WHERE `guid` = 51124;
UPDATE `creature` SET `position_x` = -3751.99, `position_y` = 1014.1583, `position_z` = 154.82066, `orientation` = 2.229166746139526367 WHERE `guid` = 51123;
UPDATE `creature` SET `position_x` = -3664.816, `position_y` = 997.65137, `position_z` = 147.55994, `orientation` = 0.830614924430847167 WHERE `guid` = 51127;
UPDATE `creature` SET `position_x` = -3789.4788, `position_y` = 1020.5936, `position_z` = 154.83337, `orientation` = 6.164378166198730468 WHERE `guid` = 51122;
UPDATE `creature` SET `position_x` = -3669.0696, `position_y` = 1038.3977, `position_z` = 154.83328, `orientation` = 2.491628646850585937 WHERE `guid` = 51125;
UPDATE `creature` SET `position_x` = -3624.4016, `position_y` = 1054.351, `position_z` = 154.83313, `orientation` = 4.920390605926513671 WHERE `guid` = 51063;
UPDATE `creature` SET `position_x` = -3594.9849, `position_y` = 988.037, `position_z` = 151.20627, `orientation` = 2.597206592559814453 WHERE `guid` = 51049;
UPDATE `creature` SET `position_x` = -3614.944, `position_y` = 1087.9945, `position_z` = 154.83313, `orientation` = 3.18982100486755371 WHERE `guid` = 51096;
UPDATE `creature` SET `position_x` = -3577.622, `position_y` = 1050.787, `position_z` = 148.08627, `orientation` = 6.039739131927490234 WHERE `guid` = 51064;
UPDATE `creature` SET `position_x` = -3633.5742, `position_y` = 1029.5052, `position_z` = 154.83313, `orientation` = 3.18167281150817871 WHERE `guid` = 51126;
UPDATE `creature` SET `position_x` = -3687.6033, `position_y` = 929.0791, `position_z` = 137.8767, `orientation` = 1.672535300254821777 WHERE `guid` = 51010;
UPDATE `creature` SET `position_x` = -3638.135, `position_y` = 1147.7373, `position_z` = 154.83311, `orientation` = 3.227643489837646484 WHERE `guid` = 51095;
UPDATE `creature` SET `position_x` = -3640.478, `position_y` = 1117.3896, `position_z` = 154.83179, `orientation` = 1.83396768569946289 WHERE `guid` = 51100;
UPDATE `creature` SET `position_x` = -3576.8594, `position_y` = 1165.3522, `position_z` = 150.05795, `orientation` = 5.658123016357421875 WHERE `guid` = 51053;
UPDATE `creature` SET `position_x` = -3621.2004, `position_y` = 1200.0653, `position_z` = 151.7106, `orientation` = 3.907045364379882812 WHERE `guid` = 51093;
UPDATE `creature` SET `position_x` = -3587.521, `position_y` = 1192.0405, `position_z` = 152.23831, `orientation` = 2.439187049865722656 WHERE `guid` = 51052;
UPDATE `creature` SET `position_x` = -3668.347, `position_y` = 1151.5942, `position_z` = 154.83319, `orientation` = 2.532033920288085937 WHERE `guid` = 51057;
UPDATE `creature` SET `position_x` = -3719.0156, `position_y` = 1203.6069, `position_z` = 151.83781, `orientation` = 5.263335704803466796 WHERE `guid` = 51051;
UPDATE `creature` SET `position_x` = -3754.1784, `position_y` = 1174.2265, `position_z` = 154.7865, `orientation` = 5.263335704803466756 WHERE `guid` = 51056;
UPDATE `creature` SET `position_x` = -3785.6657, `position_y` = 1171.4470, `position_z` = 154.7886, `orientation` = 5.263335704803466786 WHERE `guid` = 51102;

-- Remove Custom Patrol
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 15 WHERE `guid` = 51128;
DELETE FROM `creature_movement` WHERE `id` = 51128;
UPDATE `creature` SET `position_x` = -4551.8584, `position_y` = 1332.3763, `position_z` = 114.02061, `orientation` = 4.899235725402832031 WHERE `guid` = 51128;

-- Remove Custom Spawn 
DELETE FROM `creature` WHERE `guid` = 51054;

-- Remove Uneeded Gordok Hyena Patrols
DELETE FROM `creature` WHERE `guid` IN (50413, 50410, 50421, 50412, 50409, 50422, 50419, 50411, 50418, 50417);
DELETE FROM `creature_movement` WHERE `id` IN (50413, 50410, 50421, 50412, 50409, 50422, 50419, 50411, 50418, 50417);

-- Gordok Hyena Pack 1
SET @NPC = 3530;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=-4473.4165,`position_y`=1424.0602,`position_z`=126.91493 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,-4473.4165,1424.0602,126.91493,100,0,0,0),
(@NPC,2,-4461.6626,1438.4277,127.47117,100,0,0,0),
(@NPC,3,-4448.6187,1457.6039,127.4354,100,0,0,0),
(@NPC,4,-4434.653,1476.5903,127.47724,100,0,0,0),
(@NPC,5,-4431.252,1499.1736,128.1352,100,0,0,0),
(@NPC,6,-4450.4224,1520.0326,126.74824,100,0,0,0),
(@NPC,7,-4466.053,1529.2223,127.56599,100,0,0,0),
(@NPC,8,-4469.8613,1535.5299,126.809364,100,0,0,0),
(@NPC,9,-4479.362,1557.5558,126.144325,100,0,0,0),
(@NPC,10,-4484.3823,1567.5636,126.62212,100,0,0,0),
(@NPC,11,-4479.362,1557.5558,126.144325,100,0,0,0),
(@NPC,12,-4469.8613,1535.5299,126.809364,100,0,0,0),
(@NPC,13,-4466.053,1529.2223,127.56599,100,0,0,0),
(@NPC,14,-4450.549,1520.0996,126.7602,100,0,0,0),
(@NPC,15,-4431.252,1499.1736,128.1352,100,0,0,0),
(@NPC,16,-4434.653,1476.5903,127.47724,100,0,0,0),
(@NPC,17,-4448.6187,1457.6039,127.4354,100,0,0,0),
(@NPC,18,-4461.6626,1438.4277,127.47117,100,0,0,0),
(@NPC,19,-4473.4165,1424.0602,126.91493,100,0,0,0),
(@NPC,20,-4474.376,1393.1151,126.35228,100,0,0,0),
(@NPC,21,-4473.0234,1374.3662,125.61595,100,0,0,0),
(@NPC,22,-4471.091,1344.7452,124.321686,100,0,0,0),
(@NPC,23,-4450.591,1332.8683,126.194046,100,0,0,0),
(@NPC,24,-4418.4644,1332.773,133.9039,100,0,0,0),
(@NPC,25,-4398.795,1334.0239,142.97153,100,0,0,0),
(@NPC,26,-4375.746,1329.4534,153.78157,100,0,0,0),
(@NPC,27,-4398.795,1334.0239,142.97153,100,0,0,0),
(@NPC,28,-4418.4644,1332.773,133.9039,100,0,0,0),
(@NPC,29,-4450.591,1332.8683,126.194046,100,0,0,0),
(@NPC,30,-4471.091,1344.7452,124.321686,100,0,0,0),
(@NPC,31,-4473.0234,1374.3662,125.61595,100,0,0,0),
(@NPC,32,-4474.376,1393.1151,126.35228,100,0,0,0);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC+1, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+2, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+3, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
UPDATE `creature` SET `position_x`=-4473.4165,`position_y`=1424.0602,`position_z`=126.91493 WHERE `guid` IN (@NPC+1, @NPC+2, @NPC+3);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(@NPC, @NPC, 0, 6.25244, 11),
(@NPC, @NPC+1, 5, 3.14, 11),
(@NPC, @NPC+2, 7, 3, 11),
(@NPC, @NPC+3, 9, 3.3, 11);

-- Gordok Hyena Pack 2
SET @NPC = 3534;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=-4493.14,`position_y`=1278.2858,`position_z`=128.05365 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,-4493.14,1278.2858,128.05365,100,0,0,0),
(@NPC,2,-4478.269,1272.2859,127.32075,100,0,0,0),
(@NPC,3,-4473.8633,1253.4996,127.66678,100,0,0,0),
(@NPC,4,-4473.5205,1239.3378,127.13138,100,0,0,0),
(@NPC,5,-4459.0894,1224.492,126.96106,100,0,0,0),
(@NPC,6,-4445.384,1208.6725,126.19092,100,0,0,0),
(@NPC,7,-4436.603,1189.6877,125.96265,100,0,0,0),
(@NPC,8,-4441.0615,1174.7817,126.2229,100,0,0,0),
(@NPC,9,-4436.466,1163.1088,126.848145,100,0,0,0),
(@NPC,10,-4437.2637,1146.8473,127.11926,100,0,0,0),
(@NPC,11,-4447.346,1120.6438,126.17297,100,0,0,0),
(@NPC,12,-4461.2437,1103.9635,126.58765,100,0,0,0),
(@NPC,13,-4447.346,1120.6438,126.17297,100,0,0,0),
(@NPC,14,-4437.283,1146.7842,127.08765,100,0,0,0),
(@NPC,15,-4436.466,1163.1088,126.848145,100,0,0,0),
(@NPC,16,-4441.0615,1174.7817,126.2229,100,0,0,0),
(@NPC,17,-4436.603,1189.6877,125.96265,100,0,0,0),
(@NPC,18,-4445.384,1208.6725,126.19092,100,0,0,0),
(@NPC,19,-4459.0894,1224.492,126.96106,100,0,0,0),
(@NPC,20,-4473.5205,1239.3378,127.13138,100,0,0,0),
(@NPC,21,-4473.8633,1253.4996,127.66678,100,0,0,0),
(@NPC,22,-4478.269,1272.2859,127.32075,100,0,0,0),
(@NPC,23,-4493.14,1278.2858,128.05365,100,0,0,0),
(@NPC,24,-4509.82,1288.0223,127.41528,100,0,0,0),
(@NPC,25,-4516.506,1303.0729,126.112465,100,0,0,0),
(@NPC,26,-4515.492,1316.9537,120.58097,100,0,0,0),
(@NPC,27,-4515.936,1333.0367,118.568886,100,0,0,0),
(@NPC,28,-4515.2046,1358.3607,124.37174,100,0,0,0),
(@NPC,29,-4515.936,1333.0367,118.568886,100,0,0,0),
(@NPC,30,-4515.498,1317.0371,120.54374,100,0,0,0),
(@NPC,31,-4516.506,1303.0729,126.112465,100,0,0,0),
(@NPC,32,-4509.82,1288.0223,127.41528,100,0,0,0);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC+1, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+2, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
UPDATE `creature` SET `position_x`=-4493.14,`position_y`=1278.2858,`position_z`=128.05365 WHERE `guid` IN (@NPC+1, @NPC+2);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(@NPC, @NPC, 0, 6.25244, 11),
(@NPC, @NPC+1, 4, 3.14, 11),
(@NPC, @NPC+2, 3, 2.6, 11);

-- Gordok Hyena Pack 3
SET @NPC := 3537;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=-4144.677,`position_y`=1132.4553,`position_z`=161.32524 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,-4144.677,1132.4553,161.32524,100,0,0,0),
(@NPC,2,-4172.4824,1135.0138,161.37204,100,0,0,0),
(@NPC,3,-4180.79,1158.6846,161.41153,100,0,0,0),
(@NPC,4,-4180.9863,1191.6404,161.32523,100,0,0,0),
(@NPC,5,-4180.8823,1226.1372,161.32524,100,0,0,0),
(@NPC,6,-4181.1797,1249.9987,161.32524,100,0,0,0),
(@NPC,7,-4173.3633,1283.2123,161.32523,100,0,0,0),
(@NPC,8,-4189.9077,1299.2076,161.32524,100,0,0,0),
(@NPC,9,-4189.236,1322.2933,161.32524,100,0,0,0),
(@NPC,10,-4204.546,1330.0702,161.32524,100,0,0,0),
(@NPC,11,-4250.3696,1329.897,161.32523,100,0,0,0),
(@NPC,12,-4278.9473,1331.1113,161.35535,100,0,0,0),
(@NPC,13,-4250.3696,1329.897,161.32523,100,0,0,0),
(@NPC,14,-4204.546,1330.0702,161.32524,100,0,0,0),
(@NPC,15,-4189.236,1322.2933,161.32524,100,0,0,0),
(@NPC,16,-4189.9077,1299.2076,161.32524,100,0,0,0),
(@NPC,17,-4173.3633,1283.2123,161.32523,100,0,0,0),
(@NPC,18,-4181.1797,1249.9987,161.32524,100,0,0,0),
(@NPC,19,-4180.8823,1226.1372,161.32524,100,0,0,0),
(@NPC,20,-4180.9863,1191.6404,161.32523,100,0,0,0),
(@NPC,21,-4180.79,1158.6846,161.41153,100,0,0,0),
(@NPC,22,-4172.4824,1135.0138,161.37204,100,0,0,0),
(@NPC,23,-4144.677,1132.4553,161.32524,100,0,0,0),
(@NPC,24,-4114.9116,1135.7633,161.32524,100,0,0,0),
(@NPC,25,-4086.6575,1134.458,161.32524,100,0,0,0),
(@NPC,26,-4114.9116,1135.7633,161.32524,100,0,0,0);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC+1, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+2, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
UPDATE `creature` SET `position_x`=-4144.677,`position_y`=1132.4553,`position_z`=161.32524 WHERE `guid` IN (@NPC+1, @NPC+2);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(@NPC, @NPC, 0, 6.25244, 11),
(@NPC, @NPC+1, 5, 3.12, 11),
(@NPC, @NPC+2, 9, 3.12, 11);

-- Gordok Hyena Pack 4
SET @NPC := 3540;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=-4038.1926,`position_y`=1102.3224,`position_z`=159.89561 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,-4038.1926,1102.3224,159.89561,100,0,0,0),
(@NPC,2,-4036.2354,1056.2366,159.90698,100,0,0,0),
(@NPC,3,-4037.0764,1028.9843,159.85197,100,0,0,0),
(@NPC,4,-4036.5344,947.6264,159.85197,100,0,0,0),
(@NPC,5,-4037.0637,915.67786,159.9768,100,0,0,0),
(@NPC,6,-4036.5344,947.6264,159.85197,100,0,0,0),
(@NPC,7,-4036.9028,988.73267,159.9015,100,0,0,0),
(@NPC,8,-4037.0764,1028.9843,159.85197,100,0,0,0),
(@NPC,9,-4036.2354,1056.2366,159.90698,100,0,0,0),
(@NPC,10,-4038.1926,1102.3224,159.89561,100,0,0,0),
(@NPC,11,-4036.5051,1136.2891,159.79637,100,0,0,0),
(@NPC,12,-4035.6423,1166.3257,159.79233,100,0,0,0),
(@NPC,13,-4034.6455,1201.4677,159.80653,100,0,0,0),
(@NPC,14,-4033.7002,1230.9417,159.77034,100,0,0,0),
(@NPC,15,-4032.737,1271.0085,159.9062,100,0,0,0),
(@NPC,16,-4034.9792,1303.0753,159.84329,100,0,0,0),
(@NPC,17,-4032.737,1271.0085,159.9062,100,0,0,0),
(@NPC,18,-4033.7002,1230.9417,159.77034,100,0,0,0),
(@NPC,19,-4034.6455,1201.4677,159.80653,100,0,0,0),
(@NPC,20,-4035.6423,1166.3257,159.79233,100,0,0,0),
(@NPC,21,-4036.5051,1136.2891,159.79637,100,0,0,0);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC+1, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+2, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+3, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
UPDATE `creature` SET `position_x`=-4038.1926,`position_y`=1102.3224,`position_z`=159.89561 WHERE `guid` IN (@NPC+1, @NPC+2, @NPC+3);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(@NPC, @NPC, 0, 6.25244, 11),
(@NPC, @NPC+1, 5, 3.14, 11),
(@NPC, @NPC+2, 7, 3, 11),
(@NPC, @NPC+3, 9, 3.3, 11);

-- Gordok Hyena Pack 5
SET @NPC := 8071;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=-4385.1353,`position_y`=1529.6548,`position_z`=150.75537 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,-4385.1353,1529.6548,150.75537,100,0,0,0),
(@NPC,2,-4373.5386,1499.5323,150.80077,100,0,0,0),
(@NPC,3,-4362.7373,1476.5573,150.75537,100,0,0,0),
(@NPC,4,-4354.7446,1442.4744,150.75537,100,0,0,0),
(@NPC,5,-4351.7114,1421.1202,150.75536,100,0,0,0),
(@NPC,6,-4350.647,1387.7485,152.92055,100,0,0,0),
(@NPC,7,-4350.5293,1370.4497,158.61177,100,0,0,0),
(@NPC,8,-4354.607,1332.9551,159.35538,100,0,0,0),
(@NPC,9,-4329.3027,1306.5382,161.33012,100,0,0,0),
(@NPC,10,-4354.607,1332.9551,159.35538,100,0,0,0),
(@NPC,11,-4350.5293,1370.4497,158.61177,100,0,0,0),
(@NPC,12,-4350.647,1387.7485,152.92055,100,0,0,0),
(@NPC,13,-4351.7114,1421.1202,150.75536,100,0,0,0),
(@NPC,14,-4354.7446,1442.4744,150.75537,100,0,0,0),
(@NPC,15,-4362.7373,1476.5573,150.75537,100,0,0,0),
(@NPC,16,-4373.5386,1499.5323,150.80077,100,0,0,0),
(@NPC,17,-4385.12,1529.6337,150.75537,100,0,0,0),
(@NPC,18,-4404.8423,1556.9662,150.75537,100,0,0,0),
(@NPC,19,-4423.9175,1578.5505,150.75449,100,0,0,0),
(@NPC,20,-4440.604,1596.2639,150.7554,100,0,0,0),
(@NPC,21,-4460.3657,1622.4169,150.61508,100,0,0,0),
(@NPC,22,-4468.565,1647.9095,151.38011,100,0,0,0),
(@NPC,23,-4485.386,1664.781,150.93875,100,0,0,0),
(@NPC,24,-4477.906,1682.5796,150.8151,100,0,0,0),
(@NPC,25,-4458.565,1696.3735,150.8151,100,0,0,0),
(@NPC,26,-4477.906,1682.5796,150.8151,100,0,0,0),
(@NPC,27,-4485.386,1664.781,150.93875,100,0,0,0),
(@NPC,28,-4468.565,1647.9095,151.38011,100,0,0,0),
(@NPC,29,-4460.3657,1622.4169,150.61508,100,0,0,0),
(@NPC,30,-4440.604,1596.2639,150.7554,100,0,0,0),
(@NPC,31,-4423.9175,1578.5505,150.75449,100,0,0,0),
(@NPC,32,-4404.8423,1556.9662,150.75537,100,0,0,0);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC+1, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+2, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
UPDATE `creature` SET `position_x`=-4385.1353,`position_y`=1529.6548,`position_z`=150.75537 WHERE `guid` IN (@NPC+1, @NPC+2);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(@NPC, @NPC, 0, 6.25244, 11),
(@NPC, @NPC+1, 4, 3.14, 11),
(@NPC, @NPC+2, 3, 2.6, 11);

-- Gordok Hyena Pack 6
SET @NPC := 8074;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=-4363.678,`position_y`=1188.2168,`position_z`=150.75537 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,-4363.678,1188.2168,150.75537,100,0,0,0),
(@NPC,2,-4357.2056,1223.9696,150.75536,100,0,0,0),
(@NPC,3,-4350.0728,1258.8488,150.78635,100,0,0,0),
(@NPC,4,-4351.0654,1286.3151,156.60811,100,0,0,0),
(@NPC,5,-4340.919,1319.5724,159.35538,100,0,0,0),
(@NPC,6,-4329.9956,1353.3462,161.35535,100,0,0,0),
(@NPC,7,-4340.919,1319.5724,159.35538,100,0,0,0),
(@NPC,8,-4351.0654,1286.3151,156.60811,100,0,0,0),
(@NPC,9,-4350.0728,1258.8488,150.78635,100,0,0,0),
(@NPC,10,-4357.2056,1223.9696,150.75536,100,0,0,0),
(@NPC,11,-4363.678,1188.2168,150.75537,100,0,0,0),
(@NPC,12,-4376.261,1154.545,150.85655,100,0,0,0),
(@NPC,13,-4391.5073,1130.5735,150.75537,100,0,0,0),
(@NPC,14,-4407.237,1106.8875,150.75537,100,0,0,0),
(@NPC,15,-4428.0854,1082.863,150.75537,100,0,0,0),
(@NPC,16,-4448.125,1068.4376,150.75537,100,0,0,0),
(@NPC,17,-4469.615,1052.818,150.73135,100,0,0,0),
(@NPC,18,-4467.528,1036.2064,150.73134,100,0,0,0),
(@NPC,19,-4463.461,1017.0369,152.13133,100,0,0,0),
(@NPC,20,-4466.8823,1002.7987,152.13135,100,0,0,0),
(@NPC,21,-4473.622,990.1126,150.73135,100,0,0,0),
(@NPC,22,-4473.2983,972.7656,150.73132,100,0,0,0),
(@NPC,23,-4450.488,955.0374,150.73134,100,0,0,0),
(@NPC,24,-4473.2983,972.7656,150.73132,100,0,0,0),
(@NPC,25,-4473.622,990.1126,150.73135,100,0,0,0),
(@NPC,26,-4466.8823,1002.7987,152.13135,100,0,0,0),
(@NPC,27,-4463.461,1017.0369,152.13133,100,0,0,0),
(@NPC,28,-4467.528,1036.2064,150.73134,100,0,0,0),
(@NPC,29,-4469.615,1052.818,150.73135,100,0,0,0),
(@NPC,30,-4448.125,1068.4376,150.75537,100,0,0,0),
(@NPC,31,-4428.0854,1082.863,150.75537,100,0,0,0),
(@NPC,32,-4407.237,1106.8875,150.75537,100,0,0,0),
(@NPC,33,-4391.586,1130.4502,150.75537,100,0,0,0),
(@NPC,34,-4376.261,1154.545,150.85655,100,0,0,0);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC+1, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+2, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
UPDATE `creature` SET `position_x`=-4363.678,`position_y`=1188.2168,`position_z`=150.75537 WHERE `guid` IN (@NPC+1, @NPC+2);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(@NPC, @NPC, 0, 6.25244, 11),
(@NPC, @NPC+1, 5, 3.12, 11),
(@NPC, @NPC+2, 9, 3.12, 11);

-- Gordok Hyena Pack 7
SET @NPC := 8077;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=-3854.757,`position_y`=1055.2886,`position_z`=154.85199 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,-3854.757,1055.2886,154.85199,100,0,0,0),
(@NPC,2,-3838.9792,1038.8668,154.79144,100,0,0,0),
(@NPC,3,-3808.2756,1036.1785,154.85197,100,0,0,0),
(@NPC,4,-3788.809,1023.2459,154.87454,100,0,0,0),
(@NPC,5,-3761.4788,1011.7324,154.88667,100,0,0,0),
(@NPC,6,-3730.2996,1013.7999,154.93872,100,0,0,0),
(@NPC,7,-3705.808,1031.8496,154.96916,100,0,0,0),
(@NPC,8,-3681.9849,1042.3816,154.93872,100,0,0,0),
(@NPC,9,-3653.636,1050.5006,154.9387,100,0,0,0),
(@NPC,10,-3640.0898,1041.0651,154.9387,100,0,0,0),
(@NPC,11,-3638.81,1065.2158,154.9387,100,0,0,0),
(@NPC,12,-3632.4846,1085.2767,154.97789,100,0,0,0),
(@NPC,13,-3623.5986,1094.6659,154.97789,100,0,0,0),
(@NPC,14,-3630.5989,1112.7216,154.97787,100,0,0,0),
(@NPC,15,-3644.803,1134.8741,154.97787,100,0,0,0),
(@NPC,16,-3664.6028,1146.6139,154.97789,100,0,0,0),
(@NPC,17,-3689.0479,1147.8257,154.97789,100,0,0,0),
(@NPC,18,-3717.072,1159.2408,154.97786,100,0,0,0),
(@NPC,19,-3734.3074,1174.2196,154.92525,100,0,0,0),
(@NPC,20,-3768.7075,1172.8936,154.92522,100,0,0,0),
(@NPC,21,-3792.5256,1161.4977,154.92525,100,0,0,0),
(@NPC,22,-3803.356,1152.3892,154.92525,100,0,0,0),
(@NPC,23,-3828.7427,1147.1897,154.90793,100,0,0,0),
(@NPC,24,-3859.2478,1137.666,154.98383,100,0,0,0),
(@NPC,25,-3872.4622,1105.3127,154.92525,100,0,0,0),
(@NPC,26,-3869.2861,1078.4419,154.92525,100,0,0,0);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC+1, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+2, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+3, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
UPDATE `creature` SET `position_x`=-3854.757,`position_y`=1055.2886,`position_z`=154.85199 WHERE `guid` IN (@NPC+1, @NPC+2, @NPC+3);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(@NPC, @NPC, 0, 6.25244, 11),
(@NPC, @NPC+1, 5, 3.14, 11),
(@NPC, @NPC+2, 7, 3, 11),
(@NPC, @NPC+3, 9, 3.3, 11);

-- Gordok Hyena Pack 8
SET @NPC := 8081;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=-3881.3862,`position_y`=999.5604,`position_z`=148.6356 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,-3881.3862,999.5604,148.6356,100,0,0,0),
(@NPC,2,-3843.207,996.24945,151.20163,100,0,0,0),
(@NPC,3,-3818.408,988.13544,149.97023,100,0,0,0),
(@NPC,4,-3798.7417,989.5629,149.65198,100,0,0,0),
(@NPC,5,-3756.467,987.6762,148.88925,100,0,0,0),
(@NPC,6,-3733.8547,977.47784,150.26524,100,0,0,0),
(@NPC,7,-3700.5408,986.18805,149.47476,100,0,0,0),
(@NPC,8,-3671.3164,991.7395,146.73665,100,0,0,0),
(@NPC,9,-3637.387,992.26184,149.8261,100,0,0,0),
(@NPC,10,-3596.0618,991.4527,151.55872,100,0,0,0),
(@NPC,11,-3584.2468,1014.3939,151.7474,100,0,0,0),
(@NPC,12,-3588.667,1047.005,148.5866,100,0,0,0),
(@NPC,13,-3579.9,1086.7368,149.17354,100,0,0,0),
(@NPC,14,-3582.006,1126.3955,148.07864,100,0,0,0),
(@NPC,15,-3584.4,1172.2588,150.91505,100,0,0,0),
(@NPC,16,-3600.1836,1189.1289,152.4143,100,0,0,0),
(@NPC,17,-3649.0933,1196.5315,149.76454,100,0,0,0),
(@NPC,18,-3687.391,1193.4586,150.6299,100,0,0,0),
(@NPC,19,-3720.2495,1199.6938,151.16347,100,0,0,0),
(@NPC,20,-3758.4448,1199.5457,149.7253,100,0,0,0),
(@NPC,21,-3791.4524,1195.7223,149.72525,100,0,0,0),
(@NPC,22,-3828.2354,1197.1246,149.8218,100,0,0,0),
(@NPC,23,-3862.4497,1196.2867,149.72525,100,0,0,0),
(@NPC,24,-3898.2808,1192.2937,151.30144,100,0,0,0),
(@NPC,25,-3921.4124,1187.3982,150.12813,100,0,0,0),
(@NPC,26,-3924.5713,1164.501,150.66974,100,0,0,0),
(@NPC,27,-3917.4805,1139.8783,148.94948,100,0,0,0),
(@NPC,28,-3928.0786,1100.5227,148.73526,100,0,0,0),
(@NPC,29,-3925.9424,1056.8346,147.65553,100,0,0,0),
(@NPC,30,-3928.1814,1017.8178,148.55779,100,0,0,0),
(@NPC,31,-3915.9094,994.5428,150.31097,100,0,0,0);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC+1, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+2, 12418, 0, 0, 0, 0, 1, -4446.51, 1122.8, 126.278, 1.20334, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);
UPDATE `creature` SET `position_x`=-3881.3862,`position_y`=999.5604,`position_z`=148.6356 WHERE `guid` IN (@NPC+1, @NPC+2);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(@NPC, @NPC, 0, 6.25244, 11),
(@NPC, @NPC+1, 4, 3.14, 11),
(@NPC, @NPC+2, 3, 2.6, 11);

-- Add Missing Selleping Gordok Hyenas
SET @NPC := 4804;
DELETE FROM `creature` WHERE `guid` IN (50415, 50414, 50416);
DELETE FROM `creature_addon` WHERE `guid` IN (50415, 50414, 50416);

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@NPC+1, 12418, 0, 0, 0, 0, 1, -3784.26, 1193.9, 127.213, 1.32645, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+2, 12418, 0, 0, 0, 0, 1, -3783.88, 1205.62, 127.213, 1.97222, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+3, 12418, 0, 0, 0, 0, 1, -3783.85, 1171.2, 127.203, 5.18363, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+4, 12418, 0, 0, 0, 0, 1, -3783.54, 1163.41, 127.203, 0.820305, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+5, 12418, 0, 0, 0, 0, 1, -3783.24, 1167.47, 127.213, 5.63741, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+6, 12418, 0, 0, 0, 0, 1, -3782.28, 1160.62, 127.213, 1.37881, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+7, 12418, 0, 0, 0, 0, 1, -3782.13, 1196.91, 127.213, 2.58309, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+8, 12418, 0, 0, 0, 0, 1, -3781.93, 1201.75, 127.213, 4.67748, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+9, 12418, 0, 0, 0, 0, 1, -3739.6, 1185.84, 127.213, 2.00713, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+10, 12418, 0, 0, 0, 0, 1, -3739.02, 1181.37, 127.213, 4.62512, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+11, 12418, 0, 0, 0, 0, 1, -3738.2, 1177.24, 127.213, 0.0698132, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(@NPC+12, 12418, 0, 0, 0, 0, 1, -3737.05, 1189.64, 127.213, 3.29867, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);

INSERT INTO `creature_addon` (`guid`, `patch`, `display_id`, `mount_display_id`, `equipment_id`, `stand_state`, `sheath_state`, `emote_state`, `auras`) VALUES
(@NPC+1, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+2, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+3, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+4, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+5, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+6, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+7, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+8, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+9, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+10, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+11, 0, 0, 0, -1, 7, 1, 0, '16093'),
(@NPC+12, 0, 0, 0, -1, 7, 1, 0, '16093');

-- Add Missing Gordok Hyenas
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(302710, 12418, 0, 0, 0, 0, 1, -4352.57, 1430.03, 150.608, 4.84256, 300, 300, 10, 100, 100, 1, 0, 0, 0, 10),
(302711, 12418, 0, 0, 0, 0, 1, -4353.58, 1436.75, 150.608, 1.7206, 300, 300, 10, 100, 100, 1, 0, 0, 0, 10),
(302712, 12418, 0, 0, 0, 0, 1, -4348.6, 1433.91, 150.608, 5.7654, 300, 300, 10, 100, 100, 1, 0, 0, 0, 10),
(302713, 12418, 0, 0, 0, 0, 1, -4358.11, 1432.41, 150.608, 3.25213, 300, 300, 10, 100, 100, 1, 0, 0, 0, 10),
(302714, 12418, 0, 0, 0, 0, 1, -4367.24, 1184.19, 150.61, 1.09853, 300, 300, 10, 100, 100, 1, 0, 0, 0, 10),
(302715, 12418, 0, 0, 0, 0, 1, -4369.32, 1178.43, 150.61, 4.36579, 300, 300, 10, 100, 100, 1, 0, 0, 0, 10),
(302716, 12418, 0, 0, 0, 0, 1, -4372.09, 1182.48, 150.61, 1.93105, 300, 300, 10, 100, 100, 1, 0, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
