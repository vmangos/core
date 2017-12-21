DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171128192146');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171128192146');
-- Add your query below.

REPLACE INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (6984, 9573, 1);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
