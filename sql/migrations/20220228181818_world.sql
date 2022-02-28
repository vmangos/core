DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220228181818');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220228181818');
-- Add your query below.

-- Makes Curing Shrine usable again after 0.5 seconds (from TC brutforced GameObjects)
UPDATE `gameobject_template` SET `data3`=500 WHERE `entry`=181955;
UPDATE `gameobject_template` SET `data3`=500 WHERE `entry`=181682;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
