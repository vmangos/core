DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260405161744');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260405161744');
-- Add your query below.

SET @PTEMPLATE = 4893;

DELETE FROM `pool_pool` WHERE `pool_id` IN (22918, 22916, 14258, 22914, 22912, 22913);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 1' WHERE `entry` IN (22918, 22916, 14258, 22914, 22912, 22913);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 1' WHERE `pool_entry` IN (22918, 22916, 14258, 22914, 22912, 22913);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22918, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22916, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(14258, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22914, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22912, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22913, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22911, 22917, 22937, 22924, 22933);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 2' WHERE `entry` IN (22911, 22917, 22937, 22924, 22933);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 2' WHERE `pool_entry` IN (22911, 22917, 22937, 22924, 22933);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22911, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22917, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22937, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22924, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22933, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22915, 22919, 22935, 22938, 22939);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 3' WHERE `entry` IN (22915, 22919, 22935, 22938, 22939);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 3' WHERE `pool_entry` IN (22915, 22919, 22935, 22938, 22939);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22915, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22919, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22935, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22938, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22939, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22936, 22934, 22920, 22929, 22922);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 4' WHERE `entry` IN (22936, 22934, 22920, 22929, 22922);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 4' WHERE `pool_entry` IN (22936, 22934, 22920, 22929, 22922);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22936, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22934, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22920, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22929, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22922, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22928, 22925, 22923, 22931, 22932);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 5' WHERE `entry` IN (22928, 22925, 22923, 22931, 22932);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 5' WHERE `pool_entry` IN (22928, 22925, 22923, 22931, 22932);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22928, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22925, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22923, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22931, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22932, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (22921, 22927, 22930, 22926);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 6' WHERE `entry` IN (22921, 22927, 22930, 22926);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 6' WHERE `pool_entry` IN (22921, 22927, 22930, 22926);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(22921, @PTEMPLATE+6, 0, 'Burning Steppes - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22927, @PTEMPLATE+6, 0, 'Burning Steppes - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22930, @PTEMPLATE+6, 0, 'Burning Steppes - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(22926, @PTEMPLATE+6, 0, 'Burning Steppes - Group 6 - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0);

DELETE FROM `pool_template` WHERE  `entry` = 1299;

SET @PTEMPLATE = 4910;

DELETE FROM `pool_pool` WHERE `pool_id` IN (14245, 14230, 14225, 14232, 14251, 14243);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 1' WHERE `entry` IN (14245, 14230, 14225, 14232, 14251, 14243);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 1' WHERE `pool_entry` IN (14245, 14230, 14225, 14232, 14251, 14243);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14245, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14230, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14225, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14232, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14251, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14243, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14226, 14223, 14235, 14229, 14234);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 2' WHERE `entry` IN (14226, 14223, 14235, 14229, 14234);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 2' WHERE `pool_entry` IN (14226, 14223, 14235, 14229, 14234);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14226, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14223, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14235, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14229, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14234, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14250, 14241, 14256, 14254, 14257);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 3' WHERE `entry` IN (14250, 14241, 14256, 14254, 14257);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 3' WHERE `pool_entry` IN (14250, 14241, 14256, 14254, 14257);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14250, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14241, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14256, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14254, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14257, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14231, 14227, 14233, 14224, 17006);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 4' WHERE `entry` IN (14231, 14227, 14233, 14224, 17006);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 4' WHERE `pool_entry` IN (14231, 14227, 14233, 14224, 17006);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14231, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14227, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14233, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14224, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(17006, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14242, 14252, 14253, 22940, 14247);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 5' WHERE `entry` IN (14242, 14252, 14253, 22940, 14247);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 5' WHERE `pool_entry` IN (14242, 14252, 14253, 22940, 14247);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14242, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14252, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14253, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(22940, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14247, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14248, 14244, 14240, 14238);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 6' WHERE `entry` IN (14248, 14244, 14240, 14238);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 6' WHERE `pool_entry` IN (14248, 14244, 14240, 14238);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 6 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14248, @PTEMPLATE+6, 0, 'Burning Steppes - Group 6 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14244, @PTEMPLATE+6, 0, 'Burning Steppes - Group 6 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14240, @PTEMPLATE+6, 0, 'Burning Steppes - Group 6 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14238, @PTEMPLATE+6, 0, 'Burning Steppes - Group 6 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (14246, 14237, 14236, 14239);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 7' WHERE `entry` IN (14246, 14237, 14236, 14239);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 7' WHERE `pool_entry` IN (14246, 14237, 14236, 14239);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes - Group 7 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14246, @PTEMPLATE+7, 0, 'Burning Steppes - Group 7 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14237, @PTEMPLATE+7, 0, 'Burning Steppes - Group 7 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14236, @PTEMPLATE+7, 0, 'Burning Steppes - Group 7 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(14239, @PTEMPLATE+7, 0, 'Burning Steppes - Group 7 - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (1296, 8114, 8113);

SET @PTEMPLATE = 4794;

DELETE FROM `pool_pool` WHERE `pool_id` IN (21427, 21428, 21426, 21418, 21423);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 1' WHERE `entry` IN (21427, 21428, 21426, 21418, 21423);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 1' WHERE `pool_entry` IN (21427, 21428, 21426, 21418, 21423);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21427, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21428, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21426, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21418, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21423, @PTEMPLATE+1, 0, 'Burning Steppes - Group 1 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21417, 21425, 21420, 21419, 21421);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 2' WHERE `entry` IN (21417, 21425, 21420, 21419, 21421);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 2' WHERE `pool_entry` IN (21417, 21425, 21420, 21419, 21421);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21417, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21425, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21420, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21419, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21421, @PTEMPLATE+2, 0, 'Burning Steppes - Group 2 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21439, 21430, 21429, 21431, 21434);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 3' WHERE `entry` IN (21439, 21430, 21429, 21431, 21434);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 3' WHERE `pool_entry` IN (21439, 21430, 21429, 21431, 21434);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21439, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21430, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21429, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21431, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21434, @PTEMPLATE+3, 0, 'Burning Steppes - Group 3 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21440, 21432, 21435, 21433, 21438);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 4' WHERE `entry` IN (21440, 21432, 21435, 21433, 21438);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 4' WHERE `pool_entry` IN (21440, 21432, 21435, 21433, 21438);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21440, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21432, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21435, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21433, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21438, @PTEMPLATE+4, 0, 'Burning Steppes - Group 4 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (21437, 21416, 21441, 21436);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 5' WHERE `entry` IN (21437, 21416, 21441, 21436);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 5' WHERE `pool_entry` IN (21437, 21416, 21441, 21436);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21437, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21416, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21441, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21436, @PTEMPLATE+5, 0, 'Burning Steppes - Group 5 - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_template` WHERE  `entry` IN (3557, 3558, 3555, 3559, 3556);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
