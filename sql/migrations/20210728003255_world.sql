DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210728003255');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210728003255');
-- Add your query below.

-- The "Black Tabby" cat was called "Maine Coon" before Patch 1.6: https://imgur.com/a/sUv6yLr

UPDATE `item_template` SET `patch` = 4 WHERE `entry` = 8491;
UPDATE `creature_template` SET `patch` = 4 WHERE `entry` = 7383;

INSERT INTO `item_template` VALUES (8491,0,15,0,'Cat Carrier (Maine Coon)','',20629,1,0,1,6000,1500,0,-1,-1,20,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10675,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1);
INSERT INTO `creature_template` VALUES (7383,0,5448,0,0,0,0,0,0,0,1,0,0,0,1,0,'Maine Coon',NULL,0,1,1,64,64,0,0,20,35,0,1,1.14286,18,5,0,0,1,10,11,0,44,1,2000,2000,1,0,0,0,0,0,0,0,1.76,2.42,100,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,1,'',0,3,0,0,3,0,0,0,0,0,2,'');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
