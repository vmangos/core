DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210727201033');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210727201033');
-- Add your query below.


UPDATE `gameobject_template` SET `entry`=180891, `displayId`=327, `name`='Greater Moonlight Spell Focus', `data1`=4, `data3`=1 WHERE `entry`=300058;
UPDATE `spell_script_target` SET `targetEntry`=180891, `build_min`=5086, WHERE `entry`=26373 AND `targetEntry`=300058;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26373, 1, 15892, 0, 0, 5086, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
