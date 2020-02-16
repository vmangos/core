DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200216130600');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200216130600');
-- Add your query below.

delete from `fishing_loot_template` where (entry=284 AND item=21153);
delete from `fishing_loot_template` where (entry=1681 AND item=21153);
delete from `fishing_loot_template` where (entry=1682 AND item=21153);
delete from `fishing_loot_template` where (entry=1681 AND item=21150);
delete from `fishing_loot_template` where (entry=1682 AND item=21150);
delete from `fishing_loot_template` where (entry=327 AND item=6326);
delete from `fishing_loot_template` where (entry=45 AND item=6326);
delete from `fishing_loot_template` where (entry=172 AND item=6358);
delete from `fishing_loot_template` where (entry=237 AND item=6358);
delete from `fishing_loot_template` where (entry=1338 AND item=6358);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
