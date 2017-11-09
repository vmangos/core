DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171024141042');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171024141042');
-- Add your query below.


-- Hazza'rah
DELETE FROM `reference_loot_template` WHERE `item`=19942;
REPLACE INTO `creature_loot_template` VALUES (15083, 19942, 100, 0, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15083, 19942, 20, 2, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15083, 19942, 20, 3, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15083, 328717, 100, 1, -328717, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (328717, 19967, 45, 1, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (328717, 19968, 40, 1, 1, 1, 0);

-- Renataki
DELETE FROM `reference_loot_template` WHERE `item`=19940;
REPLACE INTO `creature_loot_template` VALUES (15084, 19940, 100, 0, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15084, 19940, 20, 2, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15084, 19940, 20, 3, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15084, 328718, 100, 1, -328718, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (328718, 19963, 45, 1, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (328718, 19964, 40, 1, 1, 1, 0);

-- Gri'lek
DELETE FROM `reference_loot_template` WHERE `item`=19939;
REPLACE INTO `creature_loot_template` VALUES (15082, 19939, 100, 0, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15082, 19939, 20, 2, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15082, 19939, 20, 3, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15082, 328716, 100, 1, -328716, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (328716, 19961, 43, 1, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (328716, 19962, 43, 1, 1, 1, 0);

-- Wushoolay
DELETE FROM `reference_loot_template` WHERE `item`=19941;
REPLACE INTO `creature_loot_template` VALUES (15085, 19941, 100, 0, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15085, 19941, 20, 2, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15085, 19941, 20, 3, 1, 1, 0);
REPLACE INTO `creature_loot_template` VALUES (15085, 328719, 100, 1, -328719, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (328719, 19965, 45, 1, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (328719, 19993, 40, 1, 1, 1, 0);
UPDATE `creature_template` SET `mingold`=6361, `maxgold`=31807 WHERE `entry`=15085;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
