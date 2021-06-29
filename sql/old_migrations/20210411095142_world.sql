DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210411095142');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210411095142');
-- Add your query below.


-- Prevent triggers in ZG from aggroing players.
UPDATE `creature_template` SET `ai_name`='NullAI', `flags_extra`=133122 WHERE `entry` IN (14758, 15091);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (24211, 1, 15101, 0, 0, 4695, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
