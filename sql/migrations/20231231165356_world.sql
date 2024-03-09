DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231231165356');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231231165356');
-- Add your query below.


-- Move increased guard call for help range to db.
UPDATE `creature_template` SET `call_for_help_range`=30 WHERE (`flags_extra` & 1024);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
