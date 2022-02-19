DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210930152846');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210930152846');
-- Add your query below.

-- Remove gossip npc_flag from Nijel's Point Guard.
UPDATE `creature_template` SET `npc_flags` = 0 WHERE `entry` = 8151;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
