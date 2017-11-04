DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171019232938');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171019232938');
-- Add your query below.

-- Small pack loot
-- https://github.com/elysium-project/server/issues/1278
DELETE FROM `item_loot_template` WHERE `entry`=11107 AND `item`=11569;
DELETE FROM `item_loot_template` WHERE `entry`=11107 AND `item`=11570;
DELETE FROM `item_loot_template` WHERE `entry`=11107 AND `item`=3108;
DELETE FROM `item_loot_template` WHERE `entry`=10569 AND `item`=11569;
DELETE FROM `item_loot_template` WHERE `entry`=10569 AND `item`=11570;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry`=11107 AND `item`=11108;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
