DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260406074746');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260406074746');
-- Add your query below.

SET @PTEMPLATE = 4917;

DELETE FROM `pool_pool` WHERE `pool_id` IN (1783, 1784, 1799, 1805, 1782, 1778);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 1' WHERE `entry` IN (1783, 1784, 1799, 1805, 1782, 1778);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 1' WHERE `pool_entry` IN (1783, 1784, 1799, 1805, 1782, 1778);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1783, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(1784, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(1799, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(1805, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(1782, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Small Thorium Vein', 0),
(1778, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1797, 1776, 1773, 1775, 14413, 1774);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 2' WHERE `entry` IN (1797, 1776, 1773, 1775, 14413, 1774);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 2' WHERE `pool_entry` IN (1797, 1776, 1773, 1775, 14413, 1774);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1797, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(1776, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(1773, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(1775, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(14413, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Small Thorium Vein', 0),
(1774, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1777, 1798, 1779, 1781, 14414, 1780);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 3' WHERE `entry` IN (1777, 1798, 1779, 1781, 14414, 1780);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 3' WHERE `pool_entry` IN (1777, 1798, 1779, 1781, 14414, 1780);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1777, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(1798, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(1779, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(1781, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(14414, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Small Thorium Vein', 0),
(1780, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1802, 1794, 1803, 1801, 14416, 1791);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 4' WHERE `entry` IN (1802, 1794, 1803, 1801, 14416, 1791);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 4' WHERE `pool_entry` IN (1802, 1794, 1803, 1801, 14416, 1791);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1802, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(1794, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(1803, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(1801, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(14416, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Truesilver Deposit / Small Thorium Vein', 0),
(1791, @PTEMPLATE+4, 0, 'Un\'Goro Crater - Group 4 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14417, 1795, 1796, 1789, 14415);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 5' WHERE `entry` IN (14417, 1795, 1796, 1789, 14415);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 5' WHERE `pool_entry` IN (14417, 1795, 1796, 1789, 14415);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14417, @PTEMPLATE+5, 0, 'Un\'Goro Crater - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(1795, @PTEMPLATE+5, 0, 'Un\'Goro Crater - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(1796, @PTEMPLATE+5, 0, 'Un\'Goro Crater - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(1789, @PTEMPLATE+5, 0, 'Un\'Goro Crater - Group 5 - Truesilver Deposit / Small Thorium Vein', 0),
(14415, @PTEMPLATE+5, 0, 'Un\'Goro Crater - Group 5 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1785, 1800, 1788, 1786, 1787);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 6' WHERE `entry` IN (1785, 1800, 1788, 1786, 1787);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 6' WHERE `pool_entry` IN (1785, 1800, 1788, 1786, 1787);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1785, @PTEMPLATE+6, 0, 'Un\'Goro Crater - Group 6 - Truesilver Deposit / Small Thorium Vein', 0),
(1800, @PTEMPLATE+6, 0, 'Un\'Goro Crater - Group 6 - Truesilver Deposit / Small Thorium Vein', 0),
(1788, @PTEMPLATE+6, 0, 'Un\'Goro Crater - Group 6 - Truesilver Deposit / Small Thorium Vein', 0),
(1786, @PTEMPLATE+6, 0, 'Un\'Goro Crater - Group 6 - Truesilver Deposit / Small Thorium Vein', 0),
(1787, @PTEMPLATE+6, 0, 'Un\'Goro Crater - Group 6 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1804, 1793, 1792, 1400, 1790);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 7' WHERE `entry` IN (1804, 1793, 1792, 1400, 1790);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 7' WHERE `pool_entry` IN (1804, 1793, 1792, 1400, 1790);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Group 7 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1804, @PTEMPLATE+7, 0, 'Un\'Goro Crater - Group 7 - Truesilver Deposit / Small Thorium Vein', 0),
(1793, @PTEMPLATE+7, 0, 'Un\'Goro Crater - Group 7 - Truesilver Deposit / Small Thorium Vein', 0),
(1792, @PTEMPLATE+7, 0, 'Un\'Goro Crater - Group 7 - Truesilver Deposit / Small Thorium Vein', 0),
(1400, @PTEMPLATE+7, 0, 'Un\'Goro Crater - Group 7 - Truesilver Deposit / Small Thorium Vein', 0),
(1790, @PTEMPLATE+7, 0, 'Un\'Goro Crater - Group 7 - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (1211, 8118);

SET @PTEMPLATE = 3553;

DELETE FROM `pool_pool` WHERE `pool_id` IN (1488, 1491, 14441, 1487, 1489);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Group 1' WHERE `entry` IN (1488, 1491, 14441, 1487, 1489);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Group 1' WHERE `pool_entry` IN (1488, 1491, 14441, 1487, 1489);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1488, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Rich Thorium Vein', 0),
(1491, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Rich Thorium Vein', 0),
(14441, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Rich Thorium Vein', 0),
(1487, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Rich Thorium Vein', 0),
(1489, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Group 1 - Truesilver Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1493, 1486, 1483, 14439, 1492);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Group 2' WHERE `entry` IN (1493, 1486, 1483, 14439, 1492);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Group 2' WHERE `pool_entry` IN (1493, 1486, 1483, 14439, 1492);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1493, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Rich Thorium Vein', 0),
(1486, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Rich Thorium Vein', 0),
(1483, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Rich Thorium Vein', 0),
(14439, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Rich Thorium Vein', 0),
(1492, @PTEMPLATE+2, 0, 'Un\'Goro Crater - Group 2 - Truesilver Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14440, 17199, 1485, 1484, 1490);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Group 3' WHERE `entry` IN (14440, 17199, 1485, 1484, 1490);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Group 3' WHERE `pool_entry` IN (14440, 17199, 1485, 1484, 1490);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14440, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Rich Thorium Vein', 0),
(17199, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Rich Thorium Vein', 0),
(1485, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Rich Thorium Vein', 0),
(1484, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Rich Thorium Vein', 0),
(1490, @PTEMPLATE+3, 0, 'Un\'Goro Crater - Group 3 - Truesilver Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (1147, 1146, 1141);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
