DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250213165227');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250213165227');
-- Add your query below.


-- Deadmines
UPDATE `pool_gameobject` SET `description` = 'Deadmines - Copper Vein' WHERE `guid` = 50322;
DELETE FROM `gameobject` WHERE `guid` = 50321;
SET @OGUID = 100500;
SET @PTEMPLATE = 10005;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 36, -140.056915283203125, -602.209106445312500, 17.77572059631347656, 4.904376029968261718, 0, 0, -0.63607788085937500, 0.771624863147735595, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 36, -134.418029785156250, -640.135742187500000, 16.60317230224609375, 1.308995485305786132, 0, 0, 0.608760833740234375, 0.793353796005249023, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 36, -174.634109497070312, -497.941314697265625, 55.84768676757812500, 3.787367343902587890, 0, 0, -0.94832324981689453, 0.317305892705917358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 36, -106.249397277832031, -611.118286132812500, 16.69453239440917968, 2.251473426818847656, 0, 0, 0.902585029602050781, 0.430511653423309326, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 36, -140.056915283203125, -602.209106445312500, 17.77572059631347656, 4.904376029968261718, 0, 0, -0.63607788085937500, 0.771624863147735595, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 36, -134.418029785156250, -640.135742187500000, 16.60317230224609375, 1.308995485305786132, 0, 0, 0.608760833740234375, 0.793353796005249023, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 36, -174.634109497070312, -497.941314697265625, 55.84768676757812500, 3.787367343902587890, 0, 0, -0.94832324981689453, 0.317305892705917358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 36, -106.249397277832031, -611.118286132812500, 16.69453239440917968, 2.251473426818847656, 0, 0, 0.902585029602050781, 0.430511653423309326, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Deadmines', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Deadmines', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Deadmines', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Deadmines', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Deadmines', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Deadmines', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Deadmines', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Deadmines', 10),
(@OGUID+5, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Deadmines', 10),
(@OGUID+6, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Deadmines', 10),
(@OGUID+7, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Deadmines', 10),
(@OGUID+8, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Deadmines', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 4485, 0, 'Deadmines - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 4485, 0, 'Deadmines - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 4485, 0, 'Deadmines - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 4485, 0, 'Deadmines - Tin Vein / Silver Vein', 0);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+9, 1731, 36, -130.780868530273437, -386.426818847656250, 60.46846389770507812, 3.874631166458129882, 0, 0, -0.93358039855957031, 0.358368009328842163, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+9, 4486, 'Deadmines - Copper Vein', 10);

-- Arathi Highlands
SET @OGUID = 100509;
SET @PTEMPLATE = 10009;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -1709.3974609375000, -2137.953613281250, 43.65903472900390625, 3.752462387084960937, 0, 0, -0.95371627807617187, 0.300707906484603881, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -1709.3974609375000, -2137.953613281250, 43.65903472900390625, 3.752462387084960937, 0, 0, -0.95371627807617187, 0.300707906484603881, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 406, 0, 'Arathi Highlands - Tin Vein / Silver Vein', 0);

-- Westfall
-- Zone
SET @OGUID = 100511;
SET @PTEMPLATE = 10010;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -10375.5185546875, 1669.80615234375, 37.29671096801757812, 0.436331570148468017, 0, 0, 0.216439247131347656, 0.976296067237854003, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -10995.0419921875, 1979.6470947265625, 34.95955657958984375, 0.314158439636230468, 0, 0, 0.156434059143066406, 0.987688362598419189, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -11249.4921875, 786.6065673828125, 49.33131790161132812, 4.206246376037597656, 0, 0, -0.86162853240966796, 0.50753939151763916, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -10375.5185546875, 1669.80615234375, 37.29671096801757812, 0.436331570148468017, 0, 0, 0.216439247131347656, 0.976296067237854003, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -10995.0419921875, 1979.6470947265625, 34.95955657958984375, 0.314158439636230468, 0, 0, 0.156434059143066406, 0.987688362598419189, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -11249.4921875, 786.6065673828125, 49.33131790161132812, 4.206246376037597656, 0, 0, -0.86162853240966796, 0.50753939151763916, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Westfall', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Westfall', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Westfall', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+4, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+5, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+6, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Westfall', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0);

-- Gold Coast Quarry
SET @OGUID = 100517;
SET @PTEMPLATE = 10013;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -10485.623046875, 1978.790771484375, 8.974497795104980468, 5.567600727081298828, 0, 0, -0.35020732879638671, 0.936672210693359375, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -10463.189453125, 1942.876708984375, 12.77523517608642578, 5.654868602752685546, 0, 0, -0.30901622772216796, 0.95105677843093872, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -10452.8466796875, 1954.3765869140625, 10.03973388671875, 0.104719325900077819, 0, 0, 0.052335739135742187, 0.998629570007324218, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -10501.53125, 1959.4110107421875, 9.712842941284179687, 5.70722818374633789, 0, 0, -0.28401470184326171, 0.958819925785064697, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 0, -10528.4287109375, 2002.693115234375, -8.60176277160644531, 0.261798173189163208, 0, 0, 0.130525588989257812, 0.991444945335388183, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -10485.623046875, 1978.790771484375, 8.974497795104980468, 5.567600727081298828, 0, 0, -0.35020732879638671, 0.936672210693359375, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 0, -10463.189453125, 1942.876708984375, 12.77523517608642578, 5.654868602752685546, 0, 0, -0.30901622772216796, 0.95105677843093872, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 0, -10452.8466796875, 1954.3765869140625, 10.03973388671875, 0.104719325900077819, 0, 0, 0.052335739135742187, 0.998629570007324218, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, -10501.53125, 1959.4110107421875, 9.712842941284179687, 5.70722818374633789, 0, 0, -0.28401470184326171, 0.958819925785064697, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -10528.4287109375, 2002.693115234375, -8.60176277160644531, 0.261798173189163208, 0, 0, 0.130525588989257812, 0.991444945335388183, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@OGUID+6, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@OGUID+7, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@OGUID+8, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@OGUID+9, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10),
(@OGUID+10, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8036, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 8036, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 8036, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 8036, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 8036, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0);

-- Dustwallow Marsh
SET @OGUID = 100527;
SET @PTEMPLATE = 10018;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 1, -3814.187011718750, -3819.936279296875, 56.22981262207031250, 2.844882726669311523, 0, 0, 0.989015579223632812, 0.147811368107795715, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, -3814.187011718750, -3819.936279296875, 56.22981262207031250, 2.844882726669311523, 0, 0, 0.989015579223632812, 0.147811368107795715, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein -  Dustwallow Marsh', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein -  Dustwallow Marsh', 10),
(@OGUID+2, @PTEMPLATE+1, 'Tin Vein / Silver Vein -  Dustwallow Marsh', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 9905, 0, ' Dustwallow Marsh - Tin Vein / Silver Vein', 0);

-- Loch Modan
-- Zone
SET @OGUID = 100529;
SET @PTEMPLATE = 10019;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -5056.19482421875, -3839.68408203125, 314.213775634765625, 4.468043327331542968, 0, 0, -0.7880105972290039, 0.615661680698394775, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -4842.521484375, -3797.55419921875, 305.350250244140625, 5.654868602752685546, 0, 0, -0.30901622772216796, 0.95105677843093872, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -5672.865234375, -4061.725341796875, 369.323486328125, 3.52557229995727539, 0, 0, -0.98162651062011718, 0.190812408924102783, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -5859.111328125, -4164.470703125, 392.564666748046875, 3.9793548583984375, 0, 0, -0.9135446548461914, 0.406738430261611938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 0, -5900.90087890625, -3932.23876953125, 359.912506103515625, 6.161012649536132812, 0, 0, -0.06104850769042968, 0.998134791851043701, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 0, -5661.685546875, -3968.294189453125, 322.298187255859375, 6.03883981704711914, 0, 0, -0.12186908721923828, 0.9925462007522583, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 0, -5751.90087890625, -4007.233642578125, 333.006103515625, 4.939284324645996093, 0, 0, -0.6225137710571289, 0.78260880708694458, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1732, 0, -5406.255859375, -3968.807373046875, 341.18524169921875, 0.733038187026977539, 0, 0, 0.358367919921875, 0.933580458164215087, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1732, 0, -5305.4453125, -3973.587646484375, 340.166656494140625, 2.530723094940185546, 0, 0, 0.953716278076171875, 0.300707906484603881, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1732, 0, -5732.50537109375, -4130.451171875, 391.865234375, 2.042035102844238281, 0, 0, 0.852640151977539062, 0.522498607635498046, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1732, 0, -5819.97900390625, -2801.674560546875, 381.22271728515625, 1.832594871520996093, 0, 0, 0.793353080749511718, 0.608761727809903005, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 0, -5056.19482421875, -3839.68408203125, 314.213775634765625, 4.468043327331542968, 0, 0, -0.7880105972290039, 0.615661680698394775, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 0, -4842.521484375, -3797.55419921875, 305.350250244140625, 5.654868602752685546, 0, 0, -0.30901622772216796, 0.95105677843093872, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 0, -5672.865234375, -4061.725341796875, 369.323486328125, 3.52557229995727539, 0, 0, -0.98162651062011718, 0.190812408924102783, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 0, -5859.111328125, -4164.470703125, 392.564666748046875, 3.9793548583984375, 0, 0, -0.9135446548461914, 0.406738430261611938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 0, -5900.90087890625, -3932.23876953125, 359.912506103515625, 6.161012649536132812, 0, 0, -0.06104850769042968, 0.998134791851043701, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1733, 0, -5661.685546875, -3968.294189453125, 322.298187255859375, 6.03883981704711914, 0, 0, -0.12186908721923828, 0.9925462007522583, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1733, 0, -5751.90087890625, -4007.233642578125, 333.006103515625, 4.939284324645996093, 0, 0, -0.6225137710571289, 0.78260880708694458, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1733, 0, -5406.255859375, -3968.807373046875, 341.18524169921875, 0.733038187026977539, 0, 0, 0.358367919921875, 0.933580458164215087, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1733, 0, -5305.4453125, -3973.587646484375, 340.166656494140625, 2.530723094940185546, 0, 0, 0.953716278076171875, 0.300707906484603881, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1733, 0, -5732.50537109375, -4130.451171875, 391.865234375, 2.042035102844238281, 0, 0, 0.852640151977539062, 0.522498607635498046, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1733, 0, -5819.97900390625, -2801.674560546875, 381.22271728515625, 1.832594871520996093, 0, 0, 0.793353080749511718, 0.608761727809903005, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+8, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+9, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+10, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+11, 1, 'Tin Vein / Silver Vein - Loch Modan', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+8, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+9, @PTEMPLATE+9, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+10, @PTEMPLATE+10, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+11, @PTEMPLATE+11, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+12, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+13, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+14, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+15, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+16, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+17, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+18, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+19, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+20, @PTEMPLATE+9, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+21, @PTEMPLATE+10, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+22, @PTEMPLATE+11, 'Tin Vein / Silver Vein - Loch Modan', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+8, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+9, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+10, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+11, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0);

-- Mogrosh Stronghold
SET @OGUID = 100551;
SET @PTEMPLATE = 10030;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -4806.09033203125, -4137.70556640625, 306.06689453125, 0.907570242881774902, 0, 0, 0.438370704650878906, 0.898794233798980712, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -4791.37548828125, -4110.3271484375, 307.63861083984375, 3.473210096359252929, 0, 0, -0.98628520965576171, 0.165049895644187927, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -4860.9921875, -4050.5283203125, 317.46038818359375, 3.22885894775390625, 0, 0, -0.99904823303222656, 0.043619260191917419, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -4954.1376953125, -4064.987060546875, 300.585601806640625, 3.595378875732421875, 0, 0, -0.97437000274658203, 0.224951311945915222, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 0, -4827.74755859375, -3883.1640625, 302.775390625, 2.373644113540649414, 0, 0, 0.927183151245117187, 0.37460830807685852, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 0, -4867.189453125, -3913.9296875, 303.010162353515625, 2.932138919830322265, 0, 0, 0.994521141052246093, 0.104535527527332305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 0, -4869.755859375, -3883.53466796875, 304.3072509765625, 0.418878614902496337, 0, 0, 0.207911491394042968, 0.978147625923156738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1732, 0, -4837.57958984375, -4144.1103515625, 307.81121826171875, 4.834563255310058593, 0, 0, -0.66261959075927734, 0.748956084251403808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, -4806.09033203125, -4137.70556640625, 306.06689453125, 0.907570242881774902, 0, 0, 0.438370704650878906, 0.898794233798980712, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -4791.37548828125, -4110.3271484375, 307.63861083984375, 3.473210096359252929, 0, 0, -0.98628520965576171, 0.165049895644187927, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 0, -4860.9921875, -4050.5283203125, 317.46038818359375, 3.22885894775390625, 0, 0, -0.99904823303222656, 0.043619260191917419, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 0, -4954.1376953125, -4064.987060546875, 300.585601806640625, 3.595378875732421875, 0, 0, -0.97437000274658203, 0.224951311945915222, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 0, -4827.74755859375, -3883.1640625, 302.775390625, 2.373644113540649414, 0, 0, 0.927183151245117187, 0.37460830807685852, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 0, -4867.189453125, -3913.9296875, 303.010162353515625, 2.932138919830322265, 0, 0, 0.994521141052246093, 0.104535527527332305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 0, -4869.755859375, -3883.53466796875, 304.3072509765625, 0.418878614902496337, 0, 0, 0.207911491394042968, 0.978147625923156738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 0, -4837.57958984375, -4144.1103515625, 307.81121826171875, 4.834563255310058593, 0, 0, -0.66261959075927734, 0.748956084251403808, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@PTEMPLATE+8, 1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+8, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+9, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+10, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+11, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+12, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+13, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+14, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+15, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10),
(@OGUID+16, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8074, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 8074, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 8074, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 8074, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 8074, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 8074, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 8074, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+8, 8074, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0);

-- Stonesplinter Valley
SET @OGUID = 100567;
SET @PTEMPLATE = 10038;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -6198.26220703125, -2975.941650390625, 393.076324462890625, 5.113816738128662109, 0, 0, -0.55193614959716796, 0.833886384963989257, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -6194.20751953125, -2996.444091796875, 387.532867431640625, 6.230826377868652343, 0, 0, -0.02617645263671875, 0.999657332897186279, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -6218.80322265625, -2951.59326171875, 403.943328857421875, 5.305802345275878906, 0, 0, -0.46947097778320312, 0.882947921752929687, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -6200.5322265625, -3028.9921875, 388.521514892578125, 0.139624491333961486, 0, 0, 0.06975555419921875, 0.997564136981964111, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 0, -6057.48974609375, -2975.40478515625, 406.014862060546875, 3.560472726821899414, 0, 0, -0.97814750671386718, 0.207912087440490722, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -6198.26220703125, -2975.941650390625, 393.076324462890625, 5.113816738128662109, 0, 0, -0.55193614959716796, 0.833886384963989257, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 0, -6194.20751953125, -2996.444091796875, 387.532867431640625, 6.230826377868652343, 0, 0, -0.02617645263671875, 0.999657332897186279, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 0, -6218.80322265625, -2951.59326171875, 403.943328857421875, 5.305802345275878906, 0, 0, -0.46947097778320312, 0.882947921752929687, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, -6200.5322265625, -3028.9921875, 388.521514892578125, 0.139624491333961486, 0, 0, 0.06975555419921875, 0.997564136981964111, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -6057.48974609375, -2975.40478515625, 406.014862060546875, 3.560472726821899414, 0, 0, -0.97814750671386718, 0.207912087440490722, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@OGUID+6, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@OGUID+7, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@OGUID+8, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@OGUID+9, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10),
(@OGUID+10, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8072, 0, 'Loch Modan - Stonesplinter Valley - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 8072, 0, 'Loch Modan - Stonesplinter Valley - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 8072, 0, 'Loch Modan - Stonesplinter Valley - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 8072, 0, 'Loch Modan - Stonesplinter Valley - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 8072, 0, 'Loch Modan - Stonesplinter Valley - Tin Vein / Silver Vein', 0);

-- Wetlands
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+11, 1731, 0, -2899.94873046875, -1715.6312255859375, 2.100207090377807617, 4.642575740814208984, 0, 0, -0.731353759765625, 0.681998312473297119, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+11, 1156, 'Wetlands - Copper Vein', 10);

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Deadmines" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Deadmines" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Westfall - Gold Coast Quarry" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Westfall - Gold Coast Quarry" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein -  Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein -  Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
