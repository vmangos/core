DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210311124530');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210311124530');
-- Add your query below.


-- You have been sentenced to death for crimes against the Dark Iron nation!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 5441;
-- The Sons of Thaurissan shall watch you perish in the Ring of the Law!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 5442;
-- Unleash the fury and let it be done!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` = 5443;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
