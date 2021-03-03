DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210303085717');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210303085717');
-- Add your query below.


-- remove duplicate serpentbloom gameobject
DELETE FROM `gameobject` WHERE `id` = 19535;
DELETE FROM `gameobject_template` WHERE `entry` = 19535;

-- dropchance should be 100%
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= -100 WHERE `entry` = 2772 AND `item` = 5339;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
