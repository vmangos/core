DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180318191903');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180318191903');
-- Add your query below.


-- Fix alliance AQ collection quests prequest.
UPDATE `creature_questrelation` SET `quest`=8795 WHERE`quest` IN (8796, 8797);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
