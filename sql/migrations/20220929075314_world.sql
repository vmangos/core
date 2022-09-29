DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220929075314');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220929075314');
-- Add your query below.

-- Quest 823 (Report to Orgnil) is a follow-up to Quest 805 (Report to Sen'jin Village)
UPDATE `quest_template` SET `PrevQuestId` = 805 WHERE `entry` = 823;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
