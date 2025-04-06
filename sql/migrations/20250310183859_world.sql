DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250310183859');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250310183859');
-- Add your query below.

-- Update broadcast_text emotes and sounds
UPDATE `broadcast_text` SET `entry`=9667, `sound_id`=8286, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9667;
UPDATE `broadcast_text` SET `entry`=9668, `sound_id`=8287, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9668;
UPDATE `broadcast_text` SET `entry`=9961, `sound_id`=8275, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9961;
UPDATE `broadcast_text` SET `entry`=9962, `sound_id`=8276, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9962;
UPDATE `broadcast_text` SET `entry`=9963, `sound_id`=8277, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9963;
UPDATE `broadcast_text` SET `entry`=9886, `sound_id`=8281, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9886;
UPDATE `broadcast_text` SET `entry`=9887, `sound_id`=8282, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9887;
UPDATE `broadcast_text` SET `entry`=9888, `sound_id`=8283, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9888;
UPDATE `broadcast_text` SET `entry`=9965, `sound_id`=8285, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9965;
UPDATE `broadcast_text` SET `entry`=9964, `sound_id`=8284, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9964;
UPDATE `broadcast_text` SET `entry`=9794, `sound_id`=8279, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9794;
UPDATE `broadcast_text` SET `entry`=4903, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4903;
UPDATE `broadcast_text` SET `entry`=4904, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4904;
UPDATE `broadcast_text` SET `entry`=4905, `sound_id`=0, `emote_id1`=5, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4905;
UPDATE `broadcast_text` SET `entry`=4906, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4906;
UPDATE `broadcast_text` SET `entry`=4907, `sound_id`=0, `emote_id1`=5, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4907;
UPDATE `broadcast_text` SET `entry`=4908, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4908;
UPDATE `broadcast_text` SET `entry`=4909, `sound_id`=0, `emote_id1`=5, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4909;
UPDATE `broadcast_text` SET `entry`=4911, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4911;
UPDATE `broadcast_text` SET `entry`=4912, `sound_id`=0, `emote_id1`=11, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4912;
UPDATE `broadcast_text` SET `entry`=4928, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4928;
UPDATE `broadcast_text` SET `entry`=4929, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4929;
UPDATE `broadcast_text` SET `entry`=4930, `sound_id`=0, `emote_id1`=27, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4930;
UPDATE `broadcast_text` SET `entry`=4927, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=4927;
UPDATE `broadcast_text` SET `entry`=7612, `sound_id`=8035, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7612;
UPDATE `broadcast_text` SET `entry`=7566, `sound_id`=8039, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7566;
UPDATE `broadcast_text` SET `entry`=9425, `sound_id`=0, `emote_id1`=8037, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9425;
UPDATE `broadcast_text` SET `entry`=7561, `sound_id`=8038, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7561;
UPDATE `broadcast_text` SET `entry`=7657, `sound_id`=8040, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7657;
UPDATE `broadcast_text` SET `entry`=7636, `sound_id`=8043, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7636;
UPDATE `broadcast_text` SET `entry`=7661, `sound_id`=8041, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7661;
UPDATE `broadcast_text` SET `entry`=7662, `sound_id`=8044, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7662;
UPDATE `broadcast_text` SET `entry`=8572, `sound_id`=8049, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=8572;
UPDATE `broadcast_text` SET `entry`=8573, `sound_id`=8050, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=8573;
UPDATE `broadcast_text` SET `entry`=9427, `sound_id`=8047, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=9427;
UPDATE `broadcast_text` SET `entry`=7626, `sound_id`=8051, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7626;
UPDATE `broadcast_text` SET `entry`=7685, `sound_id`=8045, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7685;
UPDATE `broadcast_text` SET `entry`=10447, `sound_id`=8414, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10447;
UPDATE `broadcast_text` SET `entry`=10027, `sound_id`=8417, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10027;
UPDATE `broadcast_text` SET `entry`=10452, `sound_id`=8422, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10452;
UPDATE `broadcast_text` SET `entry`=10446, `sound_id`=8413, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10446;
UPDATE `broadcast_text` SET `entry`=10459, `sound_id`=8423, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10459;
UPDATE `broadcast_text` SET `entry`=10026, `sound_id`=8421, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10026;
UPDATE `broadcast_text` SET `entry`=7550, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7550;
UPDATE `broadcast_text` SET `entry`=7551, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7551;
UPDATE `broadcast_text` SET `entry`=7552, `sound_id`=0, `emote_id1`=3, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=7552;
UPDATE `broadcast_text` SET `entry`=6433, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=6433;
UPDATE `broadcast_text` SET `entry`=6456, `sound_id`=0, `emote_id1`=18, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=6456;
UPDATE `broadcast_text` SET `entry`=6457, `sound_id`=0, `emote_id1`=25, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=6457;
UPDATE `broadcast_text` SET `entry`=6461, `sound_id`=0, `emote_id1`=4, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=6461;
UPDATE `broadcast_text` SET `entry`=6463, `sound_id`=0, `emote_id1`=22, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=6463;
UPDATE `broadcast_text` SET `entry`=6468, `sound_id`=0, `emote_id1`=18, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=6468;
UPDATE `broadcast_text` SET `entry`=3921, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=3921;
UPDATE `broadcast_text` SET `entry`=3917, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=3917;
UPDATE `broadcast_text` SET `entry`=3922, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=3922;
UPDATE `broadcast_text` SET `entry`=10909, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10909;
UPDATE `broadcast_text` SET `entry`=10911, `sound_id`=0, `emote_id1`=22, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10911;
UPDATE `broadcast_text` SET `entry`=10914, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10914;
UPDATE `broadcast_text` SET `entry`=10908, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10908;
UPDATE `broadcast_text` SET `entry`=10903, `sound_id`=0, `emote_id1`=22, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10903;
UPDATE `broadcast_text` SET `entry`=10904, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10904;
UPDATE `broadcast_text` SET `entry`=10901, `sound_id`=0, `emote_id1`=22, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10901;
UPDATE `broadcast_text` SET `entry`=10907, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10907;
UPDATE `broadcast_text` SET `entry`=10902, `sound_id`=0, `emote_id1`=22, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10902;
UPDATE `broadcast_text` SET `entry`=10915, `sound_id`=0, `emote_id1`=22, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10915;
UPDATE `broadcast_text` SET `entry`=10916, `sound_id`=0, `emote_id1`=25, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10916;
UPDATE `broadcast_text` SET `entry`=10923, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10923;
UPDATE `broadcast_text` SET `entry`=10924, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10924;
UPDATE `broadcast_text` SET `entry`=10925, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10925;
UPDATE `broadcast_text` SET `entry`=10927, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10927;
UPDATE `broadcast_text` SET `entry`=10928, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10928;
UPDATE `broadcast_text` SET `entry`=10931, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10931;
UPDATE `broadcast_text` SET `entry`=10932, `sound_id`=0, `emote_id1`=1, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10932;
UPDATE `broadcast_text` SET `entry`=10933, `sound_id`=0, `emote_id1`=25, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=10933;
UPDATE `broadcast_text` SET `entry`=11442, `sound_id`=8646, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11442;
UPDATE `broadcast_text` SET `entry`=11443, `sound_id`=8647, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11443;
UPDATE `broadcast_text` SET `entry`=11444, `sound_id`=8648, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11444;
UPDATE `broadcast_text` SET `entry`=11452, `sound_id`=8625, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11452;
UPDATE `broadcast_text` SET `entry`=11454, `sound_id`=8636, `emote_id1`=0, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11454;
UPDATE `broadcast_text` SET `entry`=11612, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11612;
UPDATE `broadcast_text` SET `entry`=11622, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11622;
UPDATE `broadcast_text` SET `entry`=11624, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11624;
UPDATE `broadcast_text` SET `entry`=11625, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11625;
UPDATE `broadcast_text` SET `entry`=11626, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11626;
UPDATE `broadcast_text` SET `entry`=11627, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11627;
UPDATE `broadcast_text` SET `entry`=11628, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11628;
UPDATE `broadcast_text` SET `entry`=11629, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11629;
UPDATE `broadcast_text` SET `entry`=11630, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11630;
UPDATE `broadcast_text` SET `entry`=11631, `sound_id`=0, `emote_id1`=93, `emote_id2`=0, `emote_id3`=0 WHERE `entry`=11631;

-- Delete script texts
DELETE FROM script_texts where entry in (
-1780196,
-1780197,
-1780198,
-1780199,
-1780200,
-1900048,
-1900049,
-1900050,
-1900051,
-1230041,
-1230071,
-1230072,
-1230073,
-1230074,
-1230060,
-1230061,
-1230062,
-1230063,
-1230064,
-1230043,
-1230065,
-1230066,
-1230067,
-1230068,
-1230054,
-1230055,
-1230056,
-1230057,
-1230058,
-1230059,
-1230010,
-1230011,
-1230012,
-1230013,
-1230014,
-1230015,
-1230016,
-1230017,
-1230018,
-1230019,
-1230020,
-1230021,
-1230022,
-1230023,
-1230040,
-1230024,
-1230025,
-1230026,
-1230037,
-1230027,
-1230028,
-1230029,
-1230030,
-1230031,
-1230032,
-1230033,
-1230034,
-1230039,
-1230035,
-1230036,
-1230038,
-1230042,
-1230040,
-1230044,
-1230045,
-1230046,
-1230047,
-1230052,
-1230048,
-1230049,
-1230050,
-1230051,
-1230001,
-1230002,
-1229020,
-1469000,
-1469001,
-1469003,
-1469022,
-1469023,
-1469024,
-1469025,
-1469035,
-1469026,
-1469027,
-1469028,
-1469029,
-1469030,
-1469006,
-1469037,
-1469034,
-1000873,
-1000874,
-1000875,
-1000876,
-1000877,
-1000878,
-1000879,
-1000880,
-1000881,
-1000882,
-1000883,
-1000884,
-1000885,
-1000886,
-1000887,
-1000888,
-1000889,
-1000890,
-1409001,
-1409003,
-1409004,
-1409005,
-1409006,
-1409007,
-1409020,
-1409019,
-1409008,
-1409009,
-1409010,
-1409011,
-1409013,
-1409014,
-1409015,
-1409016,
-1409017,
-1409012,
-1533106,
-1000020,
-1000021,
-1000022,
-1000023,
-1000024,
-1000025,
-1000026,
-1000027,
-1000028,
-1000029,
-1000030,
-1309011,
-1309012,
-1309013,
-1309020,
-1309021,
-1309022,
-1309023,
-1309002,
-1309003,
-1309004,
-1309025,
-1309026,
-1309015,
-1309016,
-1309017,
-1309018,
-1309019,
-1309024,
-1309005,
-1309006,
-1309007,
-1309008,
-1309000,
-1309001,
-1109000,
-1109001,
-1109002,
-1109003,
-1109004,
-1036000,
-1036001,
-1000784,
-1000785,
-1000786,
-1000787,
-1000788,
-1000600,
-1000601,
-1999914,
-1531011,
-1001148,
-1001149,
-1001150,
-1001151,
-1001152,
-1001153,
-1001154,
-1001155,
-1001156,
-1001157,
-1001158,
-1001159,
-1001160,
-1001161,
-1001162,
-1001163,
-1001164,
-1001165,
-1001166,
-1001167,
-1900045,
-1900168,
-1780201,
-1780202,
-1780203,
-1900012,
-1900013,
-1900040,
-1900039,
-1900038,
-1900037,
-1900046,
-1900047,
-1001106,
-1001107,
-1001108,
-1001109,
-1001110,
-1001111,
-1001112,
-1001113,
-1001114,
-1001115,
-1001116,
-1000650,
-1000753,
-1000754,
-1000755,
-1000756,
-1000757,
-1000758,
-1000759,
-1000760,
-1000761,
-1000762,
-1000763,
-1000764,
-1000765,
-1000766,
-1000767,
-1000768,
-1000769,
-1000770,
-1000771,
-1000772,
-1000773,
-1000774,
-1000775,
-1000776,
-1000777,
-1000778,
-1000779,
-1000780,
-1000781,
-1000782,
-1000783,
-1000007,
-1388004,
-1531011,
-1531008,
-1531009,
-1531010,
-1531024,
-1531031,
-1531012,
-1531013,
-1531014,
-1531015,
-1531016,
-1531017,
-1531018,
-1000365,
-1000366,
-1000367,
-1000368,
-1000369,
-1000362,
-1000363,
-1000364,
-1000446,
-1000447,
-1000448,
-1000449,
-1000450,
-1000451,
-1000416,
-1000417,
-1000418,
-1000419,
-1000420,
-1000421,
-1000422,
-1000423,
-1000424,
-1000425,
-1000426,
-1000427,
-1000428,
-1000429,
-1000430,
-1000431,
-1000432,
-1000433,
-1000652,
-1000651,
-1000401,
-1000402,
-1000590,
-1000591,
-1000399,
-1000400,
-1000360,
-1000361,
-1000204,
-1000205,
-1000206,
-1000201,
-1000202,
-1000203,
-1289010,
-1780300,
-1780301,
-1780302,
-1780303,
-1780304,
-1780305,
-1780306,
-1780307,
-1780308,
-1780309,
-1780310,
-1780311
);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
