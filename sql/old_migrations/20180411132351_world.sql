DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180411132351');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180411132351');
-- Add your query below.


-- Larimaine Purdue
UPDATE `npc_text` SET `BroadcastTextID0`=8440 WHERE `ID`=5875;
UPDATE `npc_text` SET `BroadcastTextID0`=8441 WHERE `ID`=5876;

-- Milstaff Stormeye
UPDATE `npc_text` SET `BroadcastTextID0`=8445 WHERE `ID`=5877;
UPDATE `npc_text` SET `BroadcastTextID0`=8446 WHERE `ID`=5878;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
