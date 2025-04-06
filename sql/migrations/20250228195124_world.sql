DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250228195124');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250228195124');
-- Add your query below.


-- Plaguebloom (176587)
DELETE FROM `gameobject` WHERE `guid`=57718;
DELETE FROM `pool_gameobject` WHERE `guid`=57718; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57719;
DELETE FROM `pool_gameobject` WHERE `guid`=57719; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57720;
DELETE FROM `pool_gameobject` WHERE `guid`=57720; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57721;
DELETE FROM `pool_gameobject` WHERE `guid`=57721; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57722;
DELETE FROM `pool_gameobject` WHERE `guid`=57722; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57723;
DELETE FROM `pool_gameobject` WHERE `guid`=57723; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57725;
DELETE FROM `pool_gameobject` WHERE `guid`=57725; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57726;
DELETE FROM `pool_gameobject` WHERE `guid`=57726; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57727;
DELETE FROM `pool_gameobject` WHERE `guid`=57727; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57728;
DELETE FROM `pool_gameobject` WHERE `guid`=57728; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57729;
DELETE FROM `pool_gameobject` WHERE `guid`=57729; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57730;
DELETE FROM `pool_gameobject` WHERE `guid`=57730; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57731;
DELETE FROM `pool_gameobject` WHERE `guid`=57731; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57732;
DELETE FROM `pool_gameobject` WHERE `guid`=57732; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57733;
DELETE FROM `pool_gameobject` WHERE `guid`=57733; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57734;
DELETE FROM `pool_gameobject` WHERE `guid`=57734; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57735;
DELETE FROM `pool_gameobject` WHERE `guid`=57735; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57736;
DELETE FROM `pool_gameobject` WHERE `guid`=57736; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57738;
DELETE FROM `pool_gameobject` WHERE `guid`=57738; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57739;
DELETE FROM `pool_gameobject` WHERE `guid`=57739; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57740;
DELETE FROM `pool_gameobject` WHERE `guid`=57740; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57741;
DELETE FROM `pool_gameobject` WHERE `guid`=57741; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57742;
DELETE FROM `pool_gameobject` WHERE `guid`=57742; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57744;
DELETE FROM `pool_gameobject` WHERE `guid`=57744; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57745;
DELETE FROM `pool_gameobject` WHERE `guid`=57745; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57746;
DELETE FROM `pool_gameobject` WHERE `guid`=57746; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57747;
DELETE FROM `pool_gameobject` WHERE `guid`=57747; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57748;
DELETE FROM `pool_gameobject` WHERE `guid`=57748; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57749;
DELETE FROM `pool_gameobject` WHERE `guid`=57749; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57751;
DELETE FROM `pool_gameobject` WHERE `guid`=57751; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57756;
DELETE FROM `pool_gameobject` WHERE `guid`=57756; -- Pool 1258 - Plaguebloom in Western Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57793;
DELETE FROM `pool_gameobject` WHERE `guid`=57793; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57794;
DELETE FROM `pool_gameobject` WHERE `guid`=57794; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57795;
DELETE FROM `pool_gameobject` WHERE `guid`=57795; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57797;
DELETE FROM `pool_gameobject` WHERE `guid`=57797; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57798;
DELETE FROM `pool_gameobject` WHERE `guid`=57798; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57799;
DELETE FROM `pool_gameobject` WHERE `guid`=57799; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57800;
DELETE FROM `pool_gameobject` WHERE `guid`=57800; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57803;
DELETE FROM `pool_gameobject` WHERE `guid`=57803; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57804;
DELETE FROM `pool_gameobject` WHERE `guid`=57804; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57805;
DELETE FROM `pool_gameobject` WHERE `guid`=57805; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57807;
DELETE FROM `pool_gameobject` WHERE `guid`=57807; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57808;
DELETE FROM `pool_gameobject` WHERE `guid`=57808; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57809;
DELETE FROM `pool_gameobject` WHERE `guid`=57809; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57810;
DELETE FROM `pool_gameobject` WHERE `guid`=57810; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57811;
DELETE FROM `pool_gameobject` WHERE `guid`=57811; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57812;
DELETE FROM `pool_gameobject` WHERE `guid`=57812; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57813;
DELETE FROM `pool_gameobject` WHERE `guid`=57813; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57814;
DELETE FROM `pool_gameobject` WHERE `guid`=57814; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57815;
DELETE FROM `pool_gameobject` WHERE `guid`=57815; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57816;
DELETE FROM `pool_gameobject` WHERE `guid`=57816; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57817;
DELETE FROM `pool_gameobject` WHERE `guid`=57817; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57819;
DELETE FROM `pool_gameobject` WHERE `guid`=57819; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57820;
DELETE FROM `pool_gameobject` WHERE `guid`=57820; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57821;
DELETE FROM `pool_gameobject` WHERE `guid`=57821; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57822;
DELETE FROM `pool_gameobject` WHERE `guid`=57822; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57824;
DELETE FROM `pool_gameobject` WHERE `guid`=57824; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57827;
DELETE FROM `pool_gameobject` WHERE `guid`=57827; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57831;
DELETE FROM `pool_gameobject` WHERE `guid`=57831; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=57833;
DELETE FROM `pool_gameobject` WHERE `guid`=57833; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=66942;
DELETE FROM `pool_gameobject` WHERE `guid`=66942; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=66943;
DELETE FROM `pool_gameobject` WHERE `guid`=66943; -- Pool 1265 - Plaguebloom in Eastern Plaguelands
DELETE FROM `gameobject` WHERE `guid`=66963;
DELETE FROM `pool_gameobject` WHERE `guid`=66963; -- Pool 1258 - Plaguebloom in Western Plaguelands

-- Stranglekelp (2045)
DELETE FROM `gameobject` WHERE `guid`=50595;
DELETE FROM `pool_gameobject` WHERE `guid`=50595; -- Pool 1171 - Stranglekelp in Stranglethorn Vale
DELETE FROM `gameobject` WHERE `guid`=50600;
DELETE FROM `pool_gameobject` WHERE `guid`=50600; -- Pool 1171 - Stranglekelp in Stranglethorn Vale
DELETE FROM `gameobject` WHERE `guid`=50601;
DELETE FROM `pool_gameobject` WHERE `guid`=50601; -- Pool 1171 - Stranglekelp in Stranglethorn Vale
DELETE FROM `gameobject` WHERE `guid`=50662;
DELETE FROM `pool_gameobject` WHERE `guid`=50662; -- Pool 1322 - Stranglekelp in Darkshore
DELETE FROM `gameobject` WHERE `guid`=50656;
DELETE FROM `pool_gameobject` WHERE `guid`=50656; -- Pool 1322 - Stranglekelp in Darkshore

-- Gromsblood (142145)
DELETE FROM `gameobject` WHERE `guid`=42126;
DELETE FROM `pool_gameobject` WHERE `guid`=42126; -- Pool 1275 - Gromsblood in Blasted Lands

-- Ghost Mushroom (142144)
DELETE FROM `gameobject` WHERE `guid` = 16430;
DELETE FROM `pool_gameobject` WHERE `guid` = 16430;

-- Small Thorium Vein (324)
DELETE FROM `gameobject` WHERE `guid`=25457;

-- Dark Iron Deposit (165658)
DELETE FROM `gameobject` WHERE `guid`=43745;
DELETE FROM `pool_gameobject` WHERE `guid`=43745;

-- Remove Dublicate Blood of Heroes
DELETE FROM `gameobject` WHERE `guid` = 25391;

-- Convert to Iron Spawn
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(550, 1734, 1, -4878.58, -1117.62, -54.8926, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(550, 1836, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles');
UPDATE `gameobject` SET `id` = 1735 WHERE `guid` = 3996203;
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `guid` = 3996203;
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE `entry` = 1836;
UPDATE `pool_pool` SET `mother_pool`=329, `description` = 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit' WHERE `pool_id` = 1836;
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE `guid` = 3996203;
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE `guid` = 3996253;

-- Pool Rich Thorium in Un\'Goro Crater
DELETE FROM `pool_template` WHERE `entry` = 1217;
-- Fire Plume Ridge
SET @PTEMPLATE = 1140;
DELETE FROM `pool_pool` WHERE `pool_id` IN (1488, 1491, 1487, 1489, 14441);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Fire Plume Ridge' WHERE `entry` IN (1488, 1218, 1487, 1489, 14441);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Fire Plume Ridge' WHERE `pool_entry` IN (1488, 1218, 1487, 1489, 14441);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Un\'Goro Crater - Fire Plume Ridge - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1488, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fire Plume Ridge - Truesilver Deposit / Rich Thorium Vein', 0),
(1491, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fire Plume Ridge - Truesilver Deposit / Rich Thorium Vein', 0),
(1487, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fire Plume Ridge - Truesilver Deposit / Rich Thorium Vein', 0),
(1489, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fire Plume Ridge - Truesilver Deposit / Rich Thorium Vein', 0),
(14441, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fire Plume Ridge - Truesilver Deposit / Rich Thorium Vein', 0);
-- Golakka Hot Springs
SET @PTEMPLATE = 1145;
DELETE FROM `pool_pool` WHERE `pool_id` IN (1493, 1486, 1483, 1492, 14439);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Golakka Hot Springs' WHERE `entry` IN (1493, 1486, 1483, 1492, 14439);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Golakka Hot Springs' WHERE `pool_entry` IN (1493, 1486, 1483, 1492, 14439);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Un\'Goro Crater - Golakka Hot Springs - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1493, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Golakka Hot Springs - Truesilver Deposit / Rich Thorium Vein', 0),
(1486, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Golakka Hot Springs - Truesilver Deposit / Rich Thorium Vein', 0),
(1483, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Golakka Hot Springs - Truesilver Deposit / Rich Thorium Vein', 0),
(1492, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Golakka Hot Springs - Truesilver Deposit / Rich Thorium Vein', 0),
(14439, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Golakka Hot Springs - Truesilver Deposit / Rich Thorium Vein', 0);
-- Terror Run
SET @PTEMPLATE = 1146;
DELETE FROM `pool_pool` WHERE `pool_id` IN (14440, 17199, 1485, 1484, 1490);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Terror Run' WHERE `entry` IN (14440, 17199, 1485, 1484, 1490);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Terror Run' WHERE `pool_entry` IN (14440, 17199, 1485, 1484, 1490);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Un\'Goro Crater - Terror Run - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14440, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Terror Run - Truesilver Deposit / Rich Thorium Vein', 0),
(17199, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Terror Run - Truesilver Deposit / Rich Thorium Vein', 0),
(1485, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Terror Run - Truesilver Deposit / Rich Thorium Vein', 0),
(1484, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Terror Run - Truesilver Deposit / Rich Thorium Vein', 0),
(1490, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Terror Run - Truesilver Deposit / Rich Thorium Vein', 0);

-- Correct Respawn Time
UPDATE `gameobject` SET `spawntimesecsmax` = 900 WHERE `guid` IN (100518, 100523, 100519, 100524, 100520, 100525, 100521, 100526, 100522, 100527, 100568, 100573, 100569, 100574, 100570, 100575, 100571, 100576, 100572, 100577, 100552, 100560, 100553, 100561, 100554, 100562, 100555, 100563, 100556, 100564, 100557, 100565, 100558, 100566, 100559, 100567);
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax`=2700 WHERE `guid` IN (22767, 22675, 22722, 22769, 427491, 427501, 427511, 22676, 22723, 22770, 22674, 22721, 22768, 22673, 22720, 69132, 69133, 69134, 69136, 69135, 69137);

-- Add Missing Ghost Mushroom (credit cmangos)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(551, 142144, 0, -716.00372314453125, -3700.158935546875, 233.596466064453125, 0.24434557557106018, 0, 0, 0.121869087219238281, 0.9925462007522583, 300, 300, 100, 1, 0, 10),
(552, 142144, 0, -672.776611328125, -3734.37890625, 220.60888671875, 1.954769015312194824, 0, 0, 0.829037666320800781, 0.559192776679992675, 300, 300, 100, 1, 0, 10),
(553, 142144, 0, -681.27178955078125, -3785.1962890625, 221.79638671875, 1.32644820213317871, 0, 0, 0.615660667419433593, 0.788011372089385986, 300, 300, 100, 1, 0, 10),
(554, 142144, 0, -605.3634033203125, -3802.1494140625, 236.636962890625, 3.665196180343627929, 0, 0, -0.96592521667480468, 0.258821308612823486, 300, 300, 100, 1, 0, 10),
(559, 142144, 0, -291.556640625, -3750.53466796875, 237.9535675048828125, 4.45059061050415039, 0, 0, -0.79335308074951171, 0.608761727809906005, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(551, 1247, 'Ghost Mushroom', 0, 10),
(552, 1247, 'Ghost Mushroom', 0, 10),
(553, 1247, 'Ghost Mushroom', 0, 10),
(554, 1247, 'Ghost Mushroom', 0, 10),
(559, 1247, 'Ghost Mushroom', 0, 10);

-- Add Missing Stranglekelp (credit cmangos)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(561, 2045, 0, 428.3892211914062500, -4857.90527343750, -12.8202562332153320, 1.623155713081359863, 0, 0, 0.725374221801757812, 0.688354730606079101, 300, 300, 100, 1, 0, 10),
(562, 2045, 0, -52.3074226379394531, -4766.53125000000, -2.46611809730529785, 5.707228183746337890, 0, 0, -0.28401470184326171, 0.958819925785064697, 300, 300, 100, 1, 0, 10),
(566, 2045, 0, -817.245666503906250, -4744.45214843750, -34.6731758117675781, 3.769911527633666992, 0, 0, -0.95105648040771484, 0.309017121791839599, 300, 300, 100, 1, 0, 10),
(578, 2045, 0, -767.499023437500000, -4750.79150390625, -26.6320171356201171, 3.054326534271240234, 0, 0, 0.999048233032226562, 0.043619260191917419, 300, 300, 100, 1, 0, 10),
(579, 2045, 0, -833.712646484375000, -4680.06103515625, -42.3456916809082031, 0.418878614902496337, 0, 0, 0.207911491394042968, 0.978147625923156738, 300, 300, 100, 1, 0, 10),
(581, 2045, 0, -833.938293457031250, -4549.03613281250, -40.7903213500976562, 3.438302755355834960, 0, 0, -0.98901557922363281, 0.147811368107795715, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(561, 1000, 'Stranglekelp', 0, 10),
(562, 1000, 'Stranglekelp', 0, 10),
(566, 1000, 'Stranglekelp', 0, 10),
(578, 1000, 'Stranglekelp', 0, 10),
(579, 1000, 'Stranglekelp', 0, 10),
(581, 1000, 'Stranglekelp', 0, 10);

-- Add Missing Gromsblood (credit cmangos)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(589, 142145, 0, -11245.8701171875, -2590.921386718750, 91.34803771972656250, 0.226892471313476562, 0, 0, 0.113203048706054687, 0.993571877479553222, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(589, 1275, 'Gromsblood', 0, 10);

-- Add Missing Golden Sansam (credit cmangos)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(591, 176583, 1,-7984.01806640625, 425.685455322265625, -31.4104003906250000, 5.131268978118896484, 0, 0, -0.54463863372802734, 0.838670849800109863, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(591, 1224, 'Golden Sansam', 0, 10);

-- Add Missing Mountain Silversage (credit cmangos)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(593, 176586, 0, 2575.6420898437500, -1595.9572753906250, 94.52051544189453125, 2.338739633560180664, 0, 0, 0.920504570007324218, 0.390731811523437500, 300, 300, 100, 1, 0, 10),
(597, 176586, 0, 1613.9862060546875, -2440.5991210937500, 89.55572509765625000, 5.113816738128662109, 0, 0, -0.55193614959716796, 0.833886384963989257, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(593, 402, 'Mountain Silversage', 0, 10),
(597, 402, 'Mountain Silversage', 0, 10);

-- Add Missing Sungrass (credit cmangos)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(598, 142142, 1, -7305.14599609375, 765.5573120117187500, 4.937922954559326171, 4.014260292053222656, 0, 0, -0.90630722045898437, 0.422619491815567016, 300, 300, 100, 1, 0, 10),
(599, 142142, 1, -6385.41796875000, 219.8589477539062500, 3.238394975662231445, 4.118979454040527343, 0, 0, -0.88294696807861328, 0.469472706317901611, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(598, 1223, 'Sungrass', 0, 10),
(599, 1223, 'Sungrass', 0, 10);

-- Add Missing Mountain Silversage (credit cmangos)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(602, 176586, 1, -7085.11376953125, 126.3131484985351562, 26.79660987854003906, 6.161012649536132812, 0, 0, -0.06104850769042968, 0.998134791851043701, 300, 300, 100, 1, 0, 10),
(604, 176586, 1, -7480.68310546875, 235.32769775390625, 39.56315994262695312, 0.034906249493360519, 0, 0, 0.017452239990234375, 0.999847710132598876, 300, 300, 100, 1, 0, 10),
(605, 176586, 1, -8079.23876953125, 965.01739501953125, 48.04169845581054687, 3.194002151489257812, 0, 0, -0.99965667724609375, 0.026201646775007247, 300, 300, 100, 1, 0, 10),
(606, 176586, 1, -8068.99560546875, 1930.4774169921875, 31.66217041015625, 3.543023586273193359, 0, 0, -0.97992420196533203, 0.199370384216308593, 300, 300, 100, 1, 0, 10),
(609, 176586, 1, -6867.8251953125, 1851.353759765625, 23.77496147155761718, 5.235987663269042968, 0, 0, -0.5, 0.866025388240814208, 300, 300, 100, 1, 0, 10),
(616, 176586, 1, -6197.17724609375, 392.104156494140625, 59.89238739013671875, 4.660029888153076171, 0, 0, -0.72537422180175781, 0.688354730606079101, 300, 300, 100, 1, 0, 10),
(618, 176586, 1, -6286.80322265625, 1128.095703125, 44.24938201904296875, 4.817109584808349609, 0, 0, -0.66913032531738281, 0.74314504861831665, 300, 300, 100, 1, 0, 10),
(620, 176586, 1, -6367.2314453125, 1673.6636962890625, 48.190948486328125, 1.762782454490661621, 0, 0, 0.771624565124511718, 0.636078238487243652, 300, 300, 100, 1, 0, 10),
(622, 176586, 1, -6352.27978515625, 1914.8060302734375, 36.44207000732421875, 0.017452461645007133, 0, 0, 0.008726119995117187, 0.999961912631988525, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(602, 1222, 'Mountain Silversage', 0, 10),
(604, 1222, 'Mountain Silversage', 0, 10),
(605, 1222, 'Mountain Silversage', 0, 10),
(606, 1222, 'Mountain Silversage', 0, 10),
(609, 1222, 'Mountain Silversage', 0, 10),
(616, 1222, 'Mountain Silversage', 0, 10),
(618, 1222, 'Mountain Silversage', 0, 10),
(620, 1222, 'Mountain Silversage', 0, 10),
(622, 1222, 'Mountain Silversage', 0, 10);

-- Add Missing Plaguebloom (credit cmangos)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(623, 176641, 1, 3819.16845703125, -781.18402099609375, 309.959747314453125, 5.95157480239868164, 0, 0, -0.16504669189453125, 0.986285746097564697, 300, 300, 100, 1, 0, 10),
(624, 176641, 1, 5414.119140625, -917.21368408203125, 369.42864990234375, 4.729844093322753906, 0, 0, -0.70090866088867187, 0.713251054286956787, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(623, 1227, 'Plaguebloom', 0, 10),
(624, 1227, 'Plaguebloom', 0, 10);

-- Add Missing Gromsblood (credit cmangos)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(625, 142145, 1, 1520.9664306640625, -2832.178466796875, 182.4700927734375, 1.884953022003173828, 0, 0, 0.809016227722167968, 0.587786316871643066, 300, 300, 100, 1, 0, 10),
(630, 142145, 1, 1595.373046875, -2869.7041015625, 181.057525634765625, 1.413715124130249023, 0, 0, 0.649447441101074218, 0.760406434535980224, 300, 300, 100, 1, 0, 10),
(631, 142145, 1, 1590.8587646484375, -2976.03125, 182.2991943359375, 2.007128477096557617, 0, 0, 0.84339141845703125, 0.537299633026123046, 300, 300, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES
(625, 1275, 'Gromsblood', 0, 10),
(630, 1275, 'Gromsblood', 0, 10),
(631, 1275, 'Gromsblood', 0, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
