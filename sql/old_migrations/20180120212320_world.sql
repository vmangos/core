DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180120212320');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180120212320');
-- Add your query below.

UPDATE quest_template SET MinLevel = 24, QuestLevel = 60 WHERE entry = 6701;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
