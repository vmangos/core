DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230811094541');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230811094541');
-- Add your query below.


-- Correct formation of Winterfall Runners.
DELETE FROM `creature_groups` WHERE `leader_guid`=42250;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (42250, 42250, 0, 0, 11);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (42250, 42251, 5, 0, 11);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (42250, 42252, 6, 0.7, 11);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
