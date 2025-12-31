DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251214133816');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251214133816');
-- Add your query below.


-- Add no unreachable evade flag to Razorgore. He summons players instead.
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00000008) WHERE `entry`=12435;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
