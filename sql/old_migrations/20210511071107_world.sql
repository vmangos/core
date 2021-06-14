DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210511071107');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210511071107');
-- Add your query below.


-- Fix wrong quest id for A Donation of Wool.
UPDATE `creature_questrelation` SET `quest`=7792 WHERE `quest`=7797;
UPDATE `creature_involvedrelation` SET `quest`=7792 WHERE `quest`=7797;
UPDATE `quest_template` SET `PrevQuestId`=7792 WHERE `PrevQuestId`=7797;
UPDATE `quest_template` SET `NextQuestId`=7792 WHERE `NextQuestId`=7797;
UPDATE `quest_template` SET `NextQuestInChain`=7792 WHERE `NextQuestInChain`=7797;
UPDATE `quest_template` SET `ExclusiveGroup`=-7792 WHERE `ExclusiveGroup`=-7797;
UPDATE `quest_template` SET `entry`=7792 WHERE `entry`=7797;
UPDATE `quest_template` SET `RewXP`=660, `RewMoneyMaxLevel`=3900 WHERE `entry`=7792 && `patch`=7;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
