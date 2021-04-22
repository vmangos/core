DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210423012712');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210423012712');
-- Add your query below.

UPDATE `quest_template` SET `RequestItemsText` = 'Ah, yes. Another traveler seeking something from the dwarves.$B$B$G Sir:Ma''am;, I''m truly sorry, but I''ve no time to answer meaningless questions right now.' WHERE `entry` = 724;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
