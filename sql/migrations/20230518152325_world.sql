DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230518152325');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230518152325');
-- Add your query below.

-- to enable interrupts on Slime Bolt
UPDATE `spell_template` SET `interruptFlags`=15 WHERE `entry`=28311

-- to enable stuns, silences, and bleeds on Stitched Spewer
UPDATE `creature_template` SET `mechanic_immune_mask`=1022047986 WHERE `entry`=16025

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
