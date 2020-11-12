DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200508212410');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200508212410');
-- Add your query below.


-- Hex of Weakness (5657) is started by Aelthalyste.
-- https://classic.wowhead.com/quest=5657/hex-of-weakness
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (4606, 5657, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
