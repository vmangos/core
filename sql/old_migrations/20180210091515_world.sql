DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180210091515');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180210091515');
-- Add your query below.

-- Horde Field Duty turn in auto-complete (for the papers)
UPDATE `quest_template` SET `Method` = 0 WHERE `entry` = 8732;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
