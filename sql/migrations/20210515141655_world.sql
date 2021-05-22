DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210515141655');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210515141655');
-- Add your query below.


-- Poison Water quest chain is Tauren only.
UPDATE `quest_template` SET `RequiredRaces`=32 WHERE `entry` IN (748, 754, 756, 758, 759, 760);

-- A Bundle of Hides quest chain is Tauren only.
UPDATE `quest_template` SET `RequiredRaces`=32 WHERE `entry` IN (6361, 6362, 6363, 6364);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
