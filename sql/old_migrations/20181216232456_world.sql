DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181216232456');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181216232456');
-- Add your query below.


-- Haren Swifthoof, Gradok & Thragomm group
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0 WHERE `guid` IN (9204, 9205);
DELETE FROM `creature_movement` WHERE `id` IN (9204, 9205);
DELETE FROM `creature_groups` WHERE `leader_guid` = 9203;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES 
(9203, 9203, 0, 0, 1),
(9203, 9204, 4, 135, 1),
(9203, 9205, 4, 360, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
