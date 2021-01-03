DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102160021');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102160021');
-- Add your query below.


-- Terrordale Haunting Spirit (179747) gameobject should despawn when Exorcism Censer (18752) is used
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES
(23208,0,179747,0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
