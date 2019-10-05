DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190706142614');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190706142614');
-- Add your query below.


-- Remove no longer needed text entries.
DELETE FROM `script_texts` WHERE `entry` IN (-1000264, -1000265, -1000266, -1000267, -1000268, -1000269, -1000270, -1000271, -1000272, -1000273, -1000948, -1000949, -1000950, -1000951, -1000952, -1000953, -1000954, -1000955, -1000956, -1000957);

-- -1000264
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=845;
-- -1000265
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=846;
-- -1000266
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=847;
-- -1000269
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=849;
-- -1000270
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=850;
-- -1000271
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=851;
-- -1000273
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=890;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
