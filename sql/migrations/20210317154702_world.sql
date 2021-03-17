DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210317154702');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210317154702');
-- Add your query below.


-- Fix wrong Rain of Fire spell used by the warlock's Doomguard.
UPDATE `creature_template` SET `spell_id1`=19474 WHERE `entry`=11859;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
