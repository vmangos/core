DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230102120931');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230102120931');
-- Add your query below.


-- Mini Pets.
UPDATE `creature_template` SET `auras`=19230 WHERE `entry`=11325;
UPDATE `creature_template` SET `auras`=18873 WHERE `entry`=11326;
UPDATE `creature_template` SET `auras`=19226 WHERE `entry`=11327;
UPDATE `creature_template` SET `auras`=24983 WHERE `entry` IN (15186, 15361, 16069, 16445);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
