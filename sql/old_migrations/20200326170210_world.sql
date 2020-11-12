DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200326170210');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200326170210');
-- Add your query below.


-- Quest 5643 should be started by Aelthalyste.
UPDATE `creature_questrelation` SET `id`=4606 WHERE `id`=4607 && `quest`=5643;

-- Add missing relations for quest 5654.
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (3706, 5654, 0, 10);
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (6018, 5654, 0, 10);

-- Quests 5657, 5656, 5655 are unobtainable.
DELETE FROM `creature_questrelation` WHERE `quest` IN (5657, 5656, 5655);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
