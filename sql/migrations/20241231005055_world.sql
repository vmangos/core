DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241231005055');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241231005055');
-- Add your query below.


-- Remove loot from equipment of creatures. (handled by static flag)
DELETE FROM `creature_equip_template` WHERE `entry`=2344;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (2344, 1, 12934, 1985, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=2345;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (2345, 1, 1901, 0, 2552, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=2346;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (2346, 1, 2809, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=3727;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (3727, 1, 5289, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=4809;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (4809, 1, 2176, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=4810;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (4810, 1, 4991, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=4811;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4811;
DELETE FROM `creature_equip_template` WHERE `entry`=4812;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (4812, 1, 1907, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=4813;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (4813, 1, 2559, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=4814;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (4814, 1, 2177, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=4832;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (4832, 1, 5303, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=5860;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (5860, 1, 5277, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=5861;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (5861, 1, 3361, 1984, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=5862;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (5862, 1, 5303, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=5998;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (5998, 1, 2182, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=5999;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (5999, 1, 2178, 1984, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=6000;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (6000, 1, 2176, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=6002;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (6002, 1, 2177, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=6003;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (6003, 1, 5305, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=6004;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (6004, 1, 5280, 0, 6886, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=6005;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=6005;
DELETE FROM `creature_equip_template` WHERE `entry`=6006;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (6006, 1, 1907, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=6007;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (6007, 1, 6224, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=6008;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (6008, 1, 2559, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=6009;
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=6009;
DELETE FROM `creature_equip_template` WHERE `entry`=7360;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (7360, 1, 2695, 1985, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=7851;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (7851, 1, 4991, 0, 0, 0, 10);
DELETE FROM `creature_equip_template` WHERE `entry`=8282;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`, `patch_min`, `patch_max`) VALUES (8282, 1, 2177, 0, 0, 0, 10);

-- Remove empty item row.
DELETE FROM `item_template` WHERE `entry`=0;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
