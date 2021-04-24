DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200216130600');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200216130600');
-- Add your query below.

DELETE FROM `fishing_loot_template` WHERE (`entry`=284 AND `item`=21153);
DELETE FROM `fishing_loot_template` WHERE (`entry`=1681 AND `item`=21153);
DELETE FROM `fishing_loot_template` WHERE (`entry`=1682 AND `item`=21153);
DELETE FROM `fishing_loot_template` WHERE (`entry`=1681 AND `item`=21150);
DELETE FROM `fishing_loot_template` WHERE (`entry`=1682 AND `item`=21150);
DELETE FROM `fishing_loot_template` WHERE (`entry`=327 AND `item`=6326);
DELETE FROM `fishing_loot_template` WHERE (`entry`=45 AND `item`=6326);
DELETE FROM `fishing_loot_template` WHERE (`entry`=172 AND `item`=6358);
DELETE FROM `fishing_loot_template` WHERE (`entry`=237 AND `item`=6358);
DELETE FROM `fishing_loot_template` WHERE (`entry`=1338 AND `item`=6358);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
