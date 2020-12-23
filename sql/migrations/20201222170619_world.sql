DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201222170619');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201222170619');
-- Add your query below.


-- correct flags for mining trainers
UPDATE `creature_template` SET `npc_flags` = 18 WHERE `entry` IN (8128, 3175, 3555);

-- correct flags for herbalism trainers
UPDATE `creature_template` SET `npc_flags` = 18 WHERE `entry` IN (4204, 12025, 3965, 3185, 2390, 2114);

-- correct flags for skinning trainers
UPDATE `creature_template` SET `npc_flags` = 18 WHERE `entry` IN (12030, 8144, 7089, 7088, 7087, 6387, 6295, 6292, 6290, 6288, 6287);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
