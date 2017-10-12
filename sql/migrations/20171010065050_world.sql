DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171010065050');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171010065050');
-- Add your query below.


INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (699, 'Dear player,\r\n\r\nPlease accept the item enclosed in this letter. It was removed from your character earlier because it should not have been available in the current patch, but our technicians have concluded that you may now have it back!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
