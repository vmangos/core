DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190905004807');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190905004807');
-- Add your query below.


-- Ironaya texts
DELETE FROM `script_texts` WHERE `entry` = -1070000;
UPDATE `broadcast_text` SET `sound` = 5851 WHERE `ID` = 3261;

-- Archaedas texts
UPDATE `broadcast_text` SET `sound` = 5855 WHERE `ID` = 3400;
UPDATE `broadcast_text` SET `sound` = 5856 WHERE `ID` = 6536;
UPDATE `broadcast_text` SET `sound` = 5857 WHERE `ID` = 6537;
UPDATE `broadcast_text` SET `sound` = 5858 WHERE `ID` = 6215;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
