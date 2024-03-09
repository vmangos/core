DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240106115249');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240106115249');
-- Add your query below.


-- Pet summoning spells should not appear on Bleakheart Hellcaller's pet bar when charmed.
UPDATE `creature_template` SET `spell_id1`=0, `spell_id2`=0 WHERE `entry`=3771;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
