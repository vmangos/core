DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250504164525');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250504164525');
-- Add your query below.


-- Dustwallow
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Den of Flame' WHERE `entry` IN (6055, 2774, 2775);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Den of Flame' WHERE `entry` IN (6054, 6056, 6049, 6050);
SET @GGUID = 1536;
SET @PTEMPLATE = 1204;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -3428.623046875, -3691.369384765625, 10.37816238403320312, 0.436331570148468017, 0, 0, 0.216439247131347656, 0.976296067237854003, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -3428.623046875, -3691.369384765625, 10.37816238403320312, 0.436331570148468017, 0, 0, 0.216439247131347656, 0.976296067237854003, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 1, -3428.623046875, -3691.369384765625, 10.37816238403320312, 0.436331570148468017, 0, 0, 0.216439247131347656, 0.976296067237854003, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Hillsbrad
SET @GGUID = 1781;
SET @PTEMPLATE = 1206;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -1412.5064697265625, 552.9534912109375, 80.58060455322265625, 1.274088263511657714, 0, 0, 0.594821929931640625, 0.80385744571685791, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 0, -1412.5064697265625, 552.9534912109375, 80.58060455322265625, 1.274088263511657714, 0, 0, 0.594821929931640625, 0.80385744571685791, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 0, -1412.5064697265625, 552.9534912109375, 80.58060455322265625, 1.274088263511657714, 0, 0, 0.594821929931640625, 0.80385744571685791, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0);

-- STV
SET @GGUID = 2225;
SET @PTEMPLATE = 1335;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -12995.3828125, -435.99847412109375, 51.09584808349609375, 4.084071159362792968, 0, 0, -0.8910064697265625, 0.453990638256072998, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -13790.8564453125, -3.17502188682556152, 37.55869674682617187, 2.460912704467773437, 0, 0, 0.942641258239746093, 0.333807557821273803, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 0, -12995.3828125, -435.99847412109375, 51.09584808349609375, 4.084071159362792968, 0, 0, -0.8910064697265625, 0.453990638256072998, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 0, -13790.8564453125, -3.17502188682556152, 37.55869674682617187, 2.460912704467773437, 0, 0, 0.942641258239746093, 0.333807557821273803, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1735, 0, -12995.3828125, -435.99847412109375, 51.09584808349609375, 4.084071159362792968, 0, 0, -0.8910064697265625, 0.453990638256072998, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1735, 0, -13790.8564453125, -3.17502188682556152, 37.55869674682617187, 2.460912704467773437, 0, 0, 0.942641258239746093, 0.333807557821273803, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Roguefeather Den
SET @GGUID = 2310;
SET @PTEMPLATE = 1403;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -5477.7587890625, -1635.4239501953125, 28.37878799438476562, 0.034906249493360519, 0, 0, 0.017452239990234375, 0.999847710132598876, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -5530.142578125, -1608.27490234375, 29.11857795715332031, 4.45059061050415039, 0, 0, -0.79335308074951171, 0.608761727809906005, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1734, 1, -5477.7587890625, -1635.4239501953125, 28.37878799438476562, 0.034906249493360519, 0, 0, 0.017452239990234375, 0.999847710132598876, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 1, -5530.142578125, -1608.27490234375, 29.11857795715332031, 4.45059061050415039, 0, 0, -0.79335308074951171, 0.608761727809906005, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1735, 1, -5477.7587890625, -1635.4239501953125, 28.37878799438476562, 0.034906249493360519, 0, 0, 0.017452239990234375, 0.999847710132598876, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1735, 1, -5530.142578125, -1608.27490234375, 29.11857795715332031, 4.45059061050415039, 0, 0, -0.79335308074951171, 0.608761727809906005, 600, 2700, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles - Roguefeather Den', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 396, 0, 'Thousand Needles - Roguefeather Den - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 396, 0, 'Thousand Needles - Roguefeather Den - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Thousand Needles
SET @GGUID = 2556;
SET @PTEMPLATE = 1563;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -4929.20751953125, -878.92852783203125, -1.5031980276107788, 1.919861555099487304, 0, 0, 0.819151878356933593, 0.573576688766479492, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -5031.94580078125, -887.55242919921875, -3.02711701393127441, 2.949595451354980468, 0, 0, 0.995395660400390625, 0.095851235091686248, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, -5761.67236328125, -3943.384521484375, -71.7347030639648437, 6.178466320037841796, 0, 0, -0.05233573913574218, 0.998629570007324218, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1734, 1, -4929.20751953125, -878.92852783203125, -1.5031980276107788, 1.919861555099487304, 0, 0, 0.819151878356933593, 0.573576688766479492, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 1, -5031.94580078125, -887.55242919921875, -3.02711701393127441, 2.949595451354980468, 0, 0, 0.995395660400390625, 0.095851235091686248, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 1, -5761.67236328125, -3943.384521484375, -71.7347030639648437, 6.178466320037841796, 0, 0, -0.05233573913574218, 0.998629570007324218, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1735, 1, -4929.20751953125, -878.92852783203125, -1.5031980276107788, 1.919861555099487304, 0, 0, 0.819151878356933593, 0.573576688766479492, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1735, 1, -5031.94580078125, -887.55242919921875, -3.02711701393127441, 2.949595451354980468, 0, 0, 0.995395660400390625, 0.095851235091686248, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1735, 1, -5761.67236328125, -3943.384521484375, -71.7347030639648437, 6.178466320037841796, 0, 0, -0.05233573913574218, 0.998629570007324218, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Desolace
SET @GGUID = 3227;
SET @PTEMPLATE = 1588;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 1, -428.721527099609375, 2051.48486328125, 104.1444015502929687, 1.623155713081359863, 0, 0, 0.725374221801757812, 0.688354730606079101, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -1405.908935546875, 2174.40673828125, 74.48441314697265625, 4.188792228698730468, 0, 0, -0.86602497100830078, 0.50000077486038208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, -517.069580078125, 775.36956787109375, 101.5479583740234375, 1.012289404869079589, 0, 0, 0.484808921813964843, 0.87462007999420166, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, 137.8859100341796875, 2674.8408203125, -63.8239288330078125, 1.884953022003173828, 0, 0, 0.809016227722167968, 0.587786316871643066, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1734, 1, -428.721527099609375, 2051.48486328125, 104.1444015502929687, 1.623155713081359863, 0, 0, 0.725374221801757812, 0.688354730606079101, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1734, 1, -1405.908935546875, 2174.40673828125, 74.48441314697265625, 4.188792228698730468, 0, 0, -0.86602497100830078, 0.50000077486038208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1734, 1, -517.069580078125, 775.36956787109375, 101.5479583740234375, 1.012289404869079589, 0, 0, 0.484808921813964843, 0.87462007999420166, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1734, 1, 137.8859100341796875, 2674.8408203125, -63.8239288330078125, 1.884953022003173828, 0, 0, 0.809016227722167968, 0.587786316871643066, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1735, 1, -428.721527099609375, 2051.48486328125, 104.1444015502929687, 1.623155713081359863, 0, 0, 0.725374221801757812, 0.688354730606079101, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1735, 1, -1405.908935546875, 2174.40673828125, 74.48441314697265625, 4.188792228698730468, 0, 0, -0.86602497100830078, 0.50000077486038208, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1735, 1, -517.069580078125, 775.36956787109375, 101.5479583740234375, 1.012289404869079589, 0, 0, 0.484808921813964843, 0.87462007999420166, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1735, 1, 137.8859100341796875, 2674.8408203125, -63.8239288330078125, 1.884953022003173828, 0, 0, 0.809016227722167968, 0.587786316871643066, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+1, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+2, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+3, 90, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Thousand (should be silver/gold/iron)
SET @GGUID = 997;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE  `entry`=1830;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE  `guid`=3996197;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE  `guid`=3996247;
UPDATE `pool_gameobject` SET `chance`=90 WHERE  `guid`=3996197;
UPDATE `pool_pool` SET `mother_pool`=329 WHERE  `pool_id`=1830;
UPDATE `pool_pool` SET `description`='Thousand Needles - Silver Vein / Gold Vein / Iron Deposit' WHERE  `pool_id`=1830;
UPDATE `gameobject` SET `id`=1735 WHERE  `guid`=3996197;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -5174.91, -892.039, 0.120843, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1830, 5, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 0, 0, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
