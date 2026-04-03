DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260330162226');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260330162226');
-- Add your query below.

SET @PTEMPLATE = 4612;

DELETE FROM `pool_pool` WHERE `pool_id` IN (1748, 1747, 1749);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 1' WHERE `entry` IN (1748, 1747, 1749);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 1' WHERE `pool_entry` IN (1748, 1747, 1749);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1748, @PTEMPLATE+1, 0, 'Badlands - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1747, @PTEMPLATE+1, 0, 'Badlands - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1749, @PTEMPLATE+1, 0, 'Badlands - Group 1 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1740, 1734, 1730, 1732);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 2' WHERE `entry` IN (1740, 1734, 1730, 1732);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 2' WHERE `pool_entry` IN (1740, 1734, 1730, 1732);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1740, @PTEMPLATE+2, 0, 'Badlands - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1734, @PTEMPLATE+2, 0, 'Badlands - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1730, @PTEMPLATE+2, 0, 'Badlands - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1732, @PTEMPLATE+2, 0, 'Badlands - Group 2 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1708, 1707, 1706, 1705);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 3' WHERE `entry` IN (1708, 1707, 1706, 1705);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 3' WHERE `pool_entry` IN (1708, 1707, 1706, 1705);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1708, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1707, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1706, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1705, @PTEMPLATE+3, 0, 'Badlands - Group 3 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1721, 1724, 1716, 1718);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 4' WHERE `entry` IN (1721, 1724, 1716, 1718);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 4' WHERE `pool_entry` IN (1721, 1724, 1716, 1718);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1721, @PTEMPLATE+4, 0, 'Badlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1724, @PTEMPLATE+4, 0, 'Badlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1716, @PTEMPLATE+4, 0, 'Badlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1718, @PTEMPLATE+4, 0, 'Badlands - Group 4 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1726, 1727, 1720, 1722);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 5' WHERE `entry` IN (1726, 1727, 1720, 1722);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 5' WHERE `pool_entry` IN (1726, 1727, 1720, 1722);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1726, @PTEMPLATE+5, 0, 'Badlands - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1727, @PTEMPLATE+5, 0, 'Badlands - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1720, @PTEMPLATE+5, 0, 'Badlands - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1722, @PTEMPLATE+5, 0, 'Badlands - Group 5 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1728, 1736, 1737, 1735);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 6' WHERE `entry` IN (1728, 1736, 1737, 1735);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 6' WHERE `pool_entry` IN (1728, 1736, 1737, 1735);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1728, @PTEMPLATE+6, 0, 'Badlands - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1736, @PTEMPLATE+6, 0, 'Badlands - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1737, @PTEMPLATE+6, 0, 'Badlands - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1735, @PTEMPLATE+6, 0, 'Badlands - Group 6 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1744, 1741, 1738, 1739);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 7' WHERE `entry` IN (1744, 1741, 1738, 1739);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 7' WHERE `pool_entry` IN (1744, 1741, 1738, 1739);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 7 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1744, @PTEMPLATE+7, 0, 'Badlands - Group 7 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1741, @PTEMPLATE+7, 0, 'Badlands - Group 7 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1738, @PTEMPLATE+7, 0, 'Badlands - Group 7 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1739, @PTEMPLATE+7, 0, 'Badlands - Group 7 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1723, 1729, 1733, 1731);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 8' WHERE `entry` IN (1723, 1729, 1733, 1731);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 8' WHERE `pool_entry` IN (1723, 1729, 1733, 1731);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 8 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1723, @PTEMPLATE+8, 0, 'Badlands - Group 8 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1729, @PTEMPLATE+8, 0, 'Badlands - Group 8 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1733, @PTEMPLATE+8, 0, 'Badlands - Group 8 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1731, @PTEMPLATE+8, 0, 'Badlands - Group 8 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1709, 1712, 1715, 1710);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 9' WHERE `entry` IN (1709, 1712, 1715, 1710);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 9' WHERE `pool_entry` IN (1709, 1712, 1715, 1710);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 9 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1709, @PTEMPLATE+9, 0, 'Badlands - Group 9 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1712, @PTEMPLATE+9, 0, 'Badlands - Group 9 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1715, @PTEMPLATE+9, 0, 'Badlands - Group 9 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1710, @PTEMPLATE+9, 0, 'Badlands - Group 9 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1713, 1711, 1714, 1717, 1719, 1725);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 10' WHERE `entry` IN (1713, 1711, 1714, 1717, 1719, 1725);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 10' WHERE `pool_entry` IN (1713, 1711, 1714, 1717, 1719, 1725);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 10 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1713, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1711, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1714, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1717, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1719, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1725, @PTEMPLATE+10, 0, 'Badlands - Group 10 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1745, 1743, 1742, 1746);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 11' WHERE `entry` IN (1745, 1743, 1742, 1746);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 11' WHERE `pool_entry` IN (1745, 1743, 1742, 1746);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 11 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1745, @PTEMPLATE+11, 0, 'Badlands - Group 11 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1743, @PTEMPLATE+11, 0, 'Badlands - Group 11 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1742, @PTEMPLATE+11, 0, 'Badlands - Group 11 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1746, @PTEMPLATE+11, 0, 'Badlands - Group 11 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1750, 1751, 1752, 1753);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 12' WHERE `entry` IN (1750, 1751, 1752, 1753);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 12' WHERE `pool_entry` IN (1750, 1751, 1752, 1753);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+12, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 12 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1750, @PTEMPLATE+12, 0, 'Badlands - Group 12 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1751, @PTEMPLATE+12, 0, 'Badlands - Group 12 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1752, @PTEMPLATE+12, 0, 'Badlands - Group 12 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1753, @PTEMPLATE+12, 0, 'Badlands - Group 12 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1762, 1754, 1755, 1761);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 13' WHERE `entry` IN (1762, 1754, 1755, 1761);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 13' WHERE `pool_entry` IN (1762, 1754, 1755, 1761);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 13 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1762, @PTEMPLATE+13, 0, 'Badlands - Group 13 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1754, @PTEMPLATE+13, 0, 'Badlands - Group 13 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1755, @PTEMPLATE+13, 0, 'Badlands - Group 13 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1761, @PTEMPLATE+13, 0, 'Badlands - Group 13 - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (1760, 1759, 1758, 1757);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 14' WHERE `entry` IN (1760, 1759, 1758, 1757);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 14' WHERE `pool_entry` IN (1760, 1759, 1758, 1757);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+14, 1, 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Group 14 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1760, @PTEMPLATE+14, 0, 'Badlands - Group 14 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1759, @PTEMPLATE+14, 0, 'Badlands - Group 14 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1757, @PTEMPLATE+14, 0, 'Badlands - Group 14 - Silver Vein / Gold Vein / Iron Deposit', 0),
(1758, @PTEMPLATE+14, 0, 'Badlands - Group 14 - Silver Vein / Gold Vein / Iron Deposit', 0);

SET @PTEMPLATE = 325;

DELETE FROM `pool_pool` WHERE `pool_id` IN (5555, 5554, 5556, 5553);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 1' WHERE `entry` IN (5555, 5554, 5556, 5553);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 1' WHERE `pool_entry` IN (5555, 5554, 5556, 5553);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5555, @PTEMPLATE+1, 0, 'Badlands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5554, @PTEMPLATE+1, 0, 'Badlands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5556, @PTEMPLATE+1, 0, 'Badlands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5553, @PTEMPLATE+1, 0, 'Badlands - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (8110, 1287, 8108);
UPDATE `pool_template` SET `max_limit`=1 WHERE  `entry`=8109 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
