DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171101154401');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171101154401');
-- Add your query below.

-- Dalaran summoner: remove summmon spells from player pet-bar when MCing.
UPDATE `creature_template` SET `spell2`=16, `spell3`=1645 WHERE `entry`=2358;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
