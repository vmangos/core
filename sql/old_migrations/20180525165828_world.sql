DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180525165828');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180525165828');
-- Add your query below.


-- Arcane Feedback (5676) should be started by Priestess Alathea.
UPDATE `creature_questrelation` SET `id`=11401 WHERE `quest`=5676;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
