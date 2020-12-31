DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191127233539');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191127233539');
-- Add your query below.


DELETE FROM `script_texts` WHERE `entry` IN (-1249000, -1249001, -1249002, -1249003, -1249004, -1249005);
UPDATE `broadcast_text` SET `EmoteId0` = 254 WHERE `ID` = 8288;
UPDATE `broadcast_text` SET `EmoteId0` = 293 WHERE `ID` = 8290;
UPDATE `broadcast_text` SET `Type` = 2 WHERE `ID` = 7213;
UPDATE `broadcast_text` SET `Type` = 1 WHERE `ID` IN (8286, 8287, 8288, 8290);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
