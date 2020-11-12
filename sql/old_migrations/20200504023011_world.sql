DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200504023011');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200504023011');
-- Add your query below.

-- Delete Gadgetzan Bruiser from Un'goro
DELETE FROM `creature` WHERE  `guid`=24665;
DELETE FROM `creature` WHERE  `guid`=24664;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
