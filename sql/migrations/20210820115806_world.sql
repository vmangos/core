DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210820115806');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210820115806');
-- Add your query below.


-- Dwarfs should be able to do Attunement to the Core, as long as they are not Priests.
-- They don't actually need it in order to zone in to Molten Core before 1.5 though.
UPDATE `quest_template` SET `RequiredRaces`=0, `RequiredCondition`=1342 WHERE `entry`=7487;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1342, 14, 4, 16, 0, 0, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
