DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191128184531');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191128184531');
-- Add your query below.


-- Change faction of following gameobjects to friendly.
-- Cleansed Night Dragon, Cleansed Songflower, Cleansed Whipper Root, Cleansed Windblossom
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry` IN (164881, 164882, 164883, 164884, 171940, 171943, 173325, 173326, 174609, 174610, 174612, 174613, 174614, 174615, 174616, 174617, 174618, 174619, 174620, 174621, 174622, 174623, 174624, 174625, 174685, 174687, 174710, 174711, 174714, 174715);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
