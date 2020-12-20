DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201220093949');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201220093949');
-- Add your query below.


UPDATE `quest_template` SET `RequiredRaces` = 8 WHERE `entry` IN (6344, 6341, 6342, 6343);
UPDATE `quest_template` SET `RequiredRaces` = 68 WHERE `entry` IN (6387, 6391, 6388, 6392);
UPDATE `quest_template` SET `RequiredRaces` = 16 WHERE `entry` IN (6321, 6323, 6322, 6324);
UPDATE `quest_template` SET `RequiredRaces` = 1 WHERE `entry` IN (6181, 6281, 6261, 6285);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
