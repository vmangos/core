DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260408124641');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260408124641');
-- Add your query below.

SET @PTEMPLATE = 1262;

DELETE FROM `pool_pool` WHERE `pool_id` IN (2884, 5677, 5675, 2883, 5673, 2882);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Stranglethorn Vale - Group 1' WHERE `entry` IN (2884, 5677, 5675, 2883, 5673, 2882);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Stranglethorn Vale - Group 1' WHERE `pool_entry` IN (2884, 5677, 5675, 2883, 5673, 2882);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Stranglethorn Vale - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2884, @PTEMPLATE+1, 0, 'Stranglethorn Vale - Group 1 - Tin Vein / Silver Vein', 0),
(5677, @PTEMPLATE+1, 0, 'Stranglethorn Vale - Group 1 - Tin Vein / Silver Vein', 0),
(5675, @PTEMPLATE+1, 0, 'Stranglethorn Vale - Group 1 - Tin Vein / Silver Vein', 0),
(2883, @PTEMPLATE+1, 0, 'Stranglethorn Vale - Group 1 - Tin Vein / Silver Vein', 0),
(5673, @PTEMPLATE+1, 0, 'Stranglethorn Vale - Group 1 - Tin Vein / Silver Vein', 0),
(2882, @PTEMPLATE+1, 0, 'Stranglethorn Vale - Group 1 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (5672, 2881, 2880, 5674, 23027, 5676);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Stranglethorn Vale - Group 2' WHERE `entry` IN (5672, 2881, 2880, 5674, 23027, 5676);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Stranglethorn Vale - Group 2' WHERE `pool_entry` IN (5672, 2881, 2880, 5674, 23027, 5676);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Stranglethorn Vale - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5672, @PTEMPLATE+2, 0, 'Stranglethorn Vale - Group 2 - Tin Vein / Silver Vein', 0),
(2881, @PTEMPLATE+2, 0, 'Stranglethorn Vale - Group 2 - Tin Vein / Silver Vein', 0),
(2880, @PTEMPLATE+2, 0, 'Stranglethorn Vale - Group 2 - Tin Vein / Silver Vein', 0),
(5674, @PTEMPLATE+2, 0, 'Stranglethorn Vale - Group 2 - Tin Vein / Silver Vein', 0),
(23027, @PTEMPLATE+2, 0, 'Stranglethorn Vale - Group 2 - Tin Vein / Silver Vein', 0),
(5676, @PTEMPLATE+2, 0, 'Stranglethorn Vale - Group 2 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` = 9912;

SET @PTEMPLATE = 4924;

DELETE FROM `pool_pool` WHERE `pool_id` IN (1447, 7014, 1464, 1446, 7013, 1462);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 1' WHERE `entry` IN (1447, 7014, 1464, 1446, 7013, 1462);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 1' WHERE `pool_entry` IN (1447, 7014, 1464, 1446, 7013, 1462);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Westfall - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1447, @PTEMPLATE+1, 0, 'Westfall - Group 1 - Tin Vein / Silver Vein', 0),
(7014, @PTEMPLATE+1, 0, 'Westfall - Group 1 - Tin Vein / Silver Vein', 0),
(1464, @PTEMPLATE+1, 0, 'Westfall - Group 1 - Tin Vein / Silver Vein', 0),
(1446, @PTEMPLATE+1, 0, 'Westfall - Group 1 - Tin Vein / Silver Vein', 0),
(7013, @PTEMPLATE+1, 0, 'Westfall - Group 1 - Tin Vein / Silver Vein', 0),
(1462, @PTEMPLATE+1, 0, 'Westfall - Group 1 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1461, 1460, 1459, 7012, 10011, 1457);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 2' WHERE `entry` IN (1461, 1460, 1459, 7012, 10011, 1457);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 2' WHERE `pool_entry` IN (1461, 1460, 1459, 7012, 10011, 1457);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Westfall - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1461, @PTEMPLATE+2, 0, 'Westfall - Group 2 - Tin Vein / Silver Vein', 0),
(1460, @PTEMPLATE+2, 0, 'Westfall - Group 2 - Tin Vein / Silver Vein', 0),
(1459, @PTEMPLATE+2, 0, 'Westfall - Group 2 - Tin Vein / Silver Vein', 0),
(7012, @PTEMPLATE+2, 0, 'Westfall - Group 2 - Tin Vein / Silver Vein', 0),
(10011, @PTEMPLATE+2, 0, 'Westfall - Group 2 - Tin Vein / Silver Vein', 0),
(1457, @PTEMPLATE+2, 0, 'Westfall - Group 2 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1458, 1456, 10014, 7010, 1455, 1445);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 3' WHERE `entry` IN (1458, 1456, 10014, 7010, 1455, 1445);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 3' WHERE `pool_entry` IN (1458, 1456, 10014, 7010, 1455, 1445);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Westfall - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1458, @PTEMPLATE+3, 0, 'Westfall - Group 3 - Tin Vein / Silver Vein', 0),
(1456, @PTEMPLATE+3, 0, 'Westfall - Group 3 - Tin Vein / Silver Vein', 0),
(10014, @PTEMPLATE+3, 0, 'Westfall - Group 3 - Tin Vein / Silver Vein', 0),
(7010, @PTEMPLATE+3, 0, 'Westfall - Group 3 - Tin Vein / Silver Vein', 0),
(1455, @PTEMPLATE+3, 0, 'Westfall - Group 3 - Tin Vein / Silver Vein', 0),
(1445, @PTEMPLATE+3, 0, 'Westfall - Group 3 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (10015, 10016, 7011, 10017, 10018, 1444);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 4' WHERE `entry` IN (10015, 10016, 7011, 10017, 10018, 1444);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 4' WHERE `pool_entry` IN (10015, 10016, 7011, 10017, 10018, 1444);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Westfall - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(10015, @PTEMPLATE+4, 0, 'Westfall - Group 4 - Tin Vein / Silver Vein', 0),
(10016, @PTEMPLATE+4, 0, 'Westfall - Group 4 - Tin Vein / Silver Vein', 0),
(7011, @PTEMPLATE+4, 0, 'Westfall - Group 4 - Tin Vein / Silver Vein', 0),
(10017, @PTEMPLATE+4, 0, 'Westfall - Group 4 - Tin Vein / Silver Vein', 0),
(10018, @PTEMPLATE+4, 0, 'Westfall - Group 4 - Tin Vein / Silver Vein', 0),
(1444, @PTEMPLATE+4, 0, 'Westfall - Group 4 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1454, 10012, 1453, 1448, 7008, 1437);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 5' WHERE `entry` IN (1454, 10012, 1453, 1448, 7008, 1437);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 5' WHERE `pool_entry` IN (1454, 10012, 1453, 1448, 7008, 1437);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Westfall - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1454, @PTEMPLATE+5, 0, 'Westfall - Group 5 - Tin Vein / Silver Vein', 0),
(10012, @PTEMPLATE+5, 0, 'Westfall - Group 5 - Tin Vein / Silver Vein', 0),
(1453, @PTEMPLATE+5, 0, 'Westfall - Group 5 - Tin Vein / Silver Vein', 0),
(1448, @PTEMPLATE+5, 0, 'Westfall - Group 5 - Tin Vein / Silver Vein', 0),
(7008, @PTEMPLATE+5, 0, 'Westfall - Group 5 - Tin Vein / Silver Vein', 0),
(1437, @PTEMPLATE+5, 0, 'Westfall - Group 5 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (23016, 1452, 17026, 7009, 10013, 1443);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 6' WHERE `entry` IN (23016, 1452, 17026, 7009, 10013, 1443);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Westfall - Group 6' WHERE `pool_entry` IN (23016, 1452, 17026, 7009, 10013, 1443);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Westfall - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(23016, @PTEMPLATE+6, 0, 'Westfall - Group 6 - Tin Vein / Silver Vein', 0),
(1452, @PTEMPLATE+6, 0, 'Westfall - Group 6 - Tin Vein / Silver Vein', 0),
(17026, @PTEMPLATE+6, 0, 'Westfall - Group 6 - Tin Vein / Silver Vein', 0),
(7009, @PTEMPLATE+6, 0, 'Westfall - Group 6 - Tin Vein / Silver Vein', 0),
(10013, @PTEMPLATE+6, 0, 'Westfall - Group 6 - Tin Vein / Silver Vein', 0),
(1443, @PTEMPLATE+6, 0, 'Westfall - Group 6 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1112;

UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=8020;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=8036;

SET @PTEMPLATE = 4930;

DELETE FROM `pool_pool` WHERE `pool_id` IN (10031, 2551, 10032, 7026, 10033, 2554);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 1' WHERE `entry` IN (10031, 2551, 10032, 7026, 10033, 2554);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 1' WHERE `pool_entry` IN (10031, 2551, 10032, 7026, 10033, 2554);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(10031, @PTEMPLATE+1, 0, 'Loch Modan - Group 1 - Tin Vein / Silver Vein', 0),
(2551, @PTEMPLATE+1, 0, 'Loch Modan - Group 1 - Tin Vein / Silver Vein', 0),
(10032, @PTEMPLATE+1, 0, 'Loch Modan - Group 1 - Tin Vein / Silver Vein', 0),
(7026, @PTEMPLATE+1, 0, 'Loch Modan - Group 1 - Tin Vein / Silver Vein', 0),
(10033, @PTEMPLATE+1, 0, 'Loch Modan - Group 1 - Tin Vein / Silver Vein', 0),
(2554, @PTEMPLATE+1, 0, 'Loch Modan - Group 1 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (10034, 10035, 10036, 2548, 2547, 10037);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 2' WHERE `entry` IN (10034, 10035, 10036, 2548, 2547, 10037);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 2' WHERE `pool_entry` IN (10034, 10035, 10036, 2548, 2547, 10037);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(10034, @PTEMPLATE+2, 0, 'Loch Modan - Group 2 - Tin Vein / Silver Vein', 0),
(10035, @PTEMPLATE+2, 0, 'Loch Modan - Group 2 - Tin Vein / Silver Vein', 0),
(10036, @PTEMPLATE+2, 0, 'Loch Modan - Group 2 - Tin Vein / Silver Vein', 0),
(2548, @PTEMPLATE+2, 0, 'Loch Modan - Group 2 - Tin Vein / Silver Vein', 0),
(2547, @PTEMPLATE+2, 0, 'Loch Modan - Group 2 - Tin Vein / Silver Vein', 0),
(10037, @PTEMPLATE+2, 0, 'Loch Modan - Group 2 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2543, 23018, 7028, 10020, 2545, 10021);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 3' WHERE `entry` IN (2543, 23018, 7028, 10020, 2545, 10021);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 3' WHERE `pool_entry` IN (2543, 23018, 7028, 10020, 2545, 10021);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2543, @PTEMPLATE+3, 0, 'Loch Modan - Group 3 - Tin Vein / Silver Vein', 0),
(23018, @PTEMPLATE+3, 0, 'Loch Modan - Group 3 - Tin Vein / Silver Vein', 0),
(7028, @PTEMPLATE+3, 0, 'Loch Modan - Group 3 - Tin Vein / Silver Vein', 0),
(10020, @PTEMPLATE+3, 0, 'Loch Modan - Group 3 - Tin Vein / Silver Vein', 0),
(2545, @PTEMPLATE+3, 0, 'Loch Modan - Group 3 - Tin Vein / Silver Vein', 0),
(10021, @PTEMPLATE+3, 0, 'Loch Modan - Group 3 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (10022, 10023, 10024, 7024, 2546, 17030);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 4' WHERE `entry` IN (10022, 10023, 10024, 7024, 2546, 17030);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 4' WHERE `pool_entry` IN (10022, 10023, 10024, 7024, 2546, 17030);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(10022, @PTEMPLATE+4, 0, 'Loch Modan - Group 4 - Tin Vein / Silver Vein', 0),
(10023, @PTEMPLATE+4, 0, 'Loch Modan - Group 4 - Tin Vein / Silver Vein', 0),
(10024, @PTEMPLATE+4, 0, 'Loch Modan - Group 4 - Tin Vein / Silver Vein', 0),
(7024, @PTEMPLATE+4, 0, 'Loch Modan - Group 4 - Tin Vein / Silver Vein', 0),
(2546, @PTEMPLATE+4, 0, 'Loch Modan - Group 4 - Tin Vein / Silver Vein', 0),
(17030, @PTEMPLATE+4, 0, 'Loch Modan - Group 4 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (10025, 2536, 2535, 2534, 2537, 10026);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 5' WHERE `entry` IN (10025, 2536, 2535, 2534, 2537, 10026);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 5' WHERE `pool_entry` IN (10025, 2536, 2535, 2534, 2537, 10026);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(10025, @PTEMPLATE+5, 0, 'Loch Modan - Group 5 - Tin Vein / Silver Vein', 0),
(2536, @PTEMPLATE+5, 0, 'Loch Modan - Group 5 - Tin Vein / Silver Vein', 0),
(2535, @PTEMPLATE+5, 0, 'Loch Modan - Group 5 - Tin Vein / Silver Vein', 0),
(2534, @PTEMPLATE+5, 0, 'Loch Modan - Group 5 - Tin Vein / Silver Vein', 0),
(2537, @PTEMPLATE+5, 0, 'Loch Modan - Group 5 - Tin Vein / Silver Vein', 0),
(10026, @PTEMPLATE+5, 0, 'Loch Modan - Group 5 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (23017, 2539, 2542, 10027, 10028, 2541);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 6' WHERE `entry` IN (23017, 2539, 2542, 10027, 10028, 2541);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 6' WHERE `pool_entry` IN (23017, 2539, 2542, 10027, 10028, 2541);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(23017, @PTEMPLATE+6, 0, 'Loch Modan - Group 6 - Tin Vein / Silver Vein', 0),
(2539, @PTEMPLATE+6, 0, 'Loch Modan - Group 6 - Tin Vein / Silver Vein', 0),
(2542, @PTEMPLATE+6, 0, 'Loch Modan - Group 6 - Tin Vein / Silver Vein', 0),
(10027, @PTEMPLATE+6, 0, 'Loch Modan - Group 6 - Tin Vein / Silver Vein', 0),
(10028, @PTEMPLATE+6, 0, 'Loch Modan - Group 6 - Tin Vein / Silver Vein', 0),
(2541, @PTEMPLATE+6, 0, 'Loch Modan - Group 6 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (7021, 10039, 10040, 10041, 7020, 10042);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 7' WHERE `entry` IN (7021, 10039, 10040, 10041, 7020, 10042);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 7' WHERE `pool_entry` IN (7021, 10039, 10040, 10041, 7020, 10042);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 7 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(7021, @PTEMPLATE+7, 0, 'Loch Modan - Group 7 - Tin Vein / Silver Vein', 0),
(10039, @PTEMPLATE+7, 0, 'Loch Modan - Group 7 - Tin Vein / Silver Vein', 0),
(10040, @PTEMPLATE+7, 0, 'Loch Modan - Group 7 - Tin Vein / Silver Vein', 0),
(10041, @PTEMPLATE+7, 0, 'Loch Modan - Group 7 - Tin Vein / Silver Vein', 0),
(7020, @PTEMPLATE+7, 0, 'Loch Modan - Group 7 - Tin Vein / Silver Vein', 0),
(10042, @PTEMPLATE+7, 0, 'Loch Modan - Group 7 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (7025, 2532, 2531, 10029, 2529);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 8' WHERE `entry` IN (7025, 2532, 2531, 10029, 2529);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 8' WHERE `pool_entry` IN (7025, 2532, 2531, 10029, 2529);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 8 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(7025, @PTEMPLATE+8, 0, 'Loch Modan - Group 8 - Tin Vein / Silver Vein', 0),
(2532, @PTEMPLATE+8, 0, 'Loch Modan - Group 8 - Tin Vein / Silver Vein', 0),
(2531, @PTEMPLATE+8, 0, 'Loch Modan - Group 8 - Tin Vein / Silver Vein', 0),
(10029, @PTEMPLATE+8, 0, 'Loch Modan - Group 8 - Tin Vein / Silver Vein', 0),
(2529, @PTEMPLATE+8, 0, 'Loch Modan - Group 8 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (7022, 7023, 10043, 10030, 2527);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 9' WHERE `entry` IN (7022, 7023, 10043, 10030, 2527);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 9' WHERE `pool_entry` IN (7022, 7023, 10043, 10030, 2527);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 9 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(7022, @PTEMPLATE+9, 0, 'Loch Modan - Group 9 - Tin Vein / Silver Vein', 0),
(7023, @PTEMPLATE+9, 0, 'Loch Modan - Group 9 - Tin Vein / Silver Vein', 0),
(10043, @PTEMPLATE+9, 0, 'Loch Modan - Group 9 - Tin Vein / Silver Vein', 0),
(10030, @PTEMPLATE+9, 0, 'Loch Modan - Group 9 - Tin Vein / Silver Vein', 0),
(2527, @PTEMPLATE+9, 0, 'Loch Modan - Group 9 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2550, 2552, 7027, 10038);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 10' WHERE `entry` IN (2550, 2552, 7027, 10038);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 10' WHERE `pool_entry` IN (2550, 2552, 7027, 10038);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 10 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2550, @PTEMPLATE+10, 0, 'Loch Modan - Group 10 - Tin Vein / Silver Vein', 0),
(2552, @PTEMPLATE+10, 0, 'Loch Modan - Group 10 - Tin Vein / Silver Vein', 0),
(7027, @PTEMPLATE+10, 0, 'Loch Modan - Group 10 - Tin Vein / Silver Vein', 0),
(10038, @PTEMPLATE+10, 0, 'Loch Modan - Group 10 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (2538, 2544, 2540, 2553);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 11' WHERE `entry` IN (2538, 2544, 2540, 2553);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Group 11' WHERE `pool_entry` IN (2538, 2544, 2540, 2553);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+11, 1, 'Tin Vein / Silver Vein - Loch Modan - Group 11 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2538, @PTEMPLATE+11, 0, 'Loch Modan - Group 11 - Tin Vein / Silver Vein', 0),
(2544, @PTEMPLATE+11, 0, 'Loch Modan - Group 11 - Tin Vein / Silver Vein', 0),
(2540, @PTEMPLATE+11, 0, 'Loch Modan - Group 11 - Tin Vein / Silver Vein', 0),
(2553, @PTEMPLATE+11, 0, 'Loch Modan - Group 11 - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_template` WHERE `entry` IN (1186, 2533, 8074);
DELETE FROM `pool_pool` WHERE `pool_id`= 2533;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 2533;
DELETE FROM `gameobject` WHERE `guid` IN (23214, 23242);

UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=8072 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=8073 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
