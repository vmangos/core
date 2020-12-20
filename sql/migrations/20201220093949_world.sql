DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201220093949');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201220093949');
-- Add your query below.


UPDATE `quest_template` SET `RequiredRaces` = 8 WHERE `entry` = 6344;
UPDATE `quest_template` SET `RequiredRaces` = 68 WHERE `entry` = 6387;
UPDATE `quest_template` SET `RequiredRaces` = 16 WHERE `entry` = 6321;
UPDATE `quest_template` SET `RequiredRaces` = 1 WHERE `entry` = 6181;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
