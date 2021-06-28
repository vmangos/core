DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210505024627');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210505024627');
-- Add your query below.

-- Jer'kai Moonweaver is only a quest giver.
UPDATE `creature_template` SET `npc_flags` = 2 WHERE `entry` = 7957;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
