DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210721202512');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210721202512');
-- Add your query below.


-- Delete custom AV creatures.
DELETE FROM `creature` WHERE `id` IN (20110, 20111, 20112);
DELETE FROM `creature_template` WHERE `entry` IN (20110, 20111, 20112);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
