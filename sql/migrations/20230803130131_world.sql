DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230803130131');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230803130131');
-- Add your query below.

-- Create creature group for patrol in ubrs/lbrs entrance
INSERT INTO `creature_groups` (`leader_guid`,`member_guid`,`dist`,`angle`,`flags`) VALUES (300427,300428,3,270,3);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
