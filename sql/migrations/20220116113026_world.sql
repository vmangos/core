DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220116113026');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220116113026');
-- Add your query below.


-- Assign correct spawn spell and initial auras to Ragnaros.
UPDATE `creature_template` SET `unit_flags`=832, `spawn_spell_id`=20480, `auras`='20563 21387' WHERE `entry`=11502;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
