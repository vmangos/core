DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200326152745');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200326152745');
-- Add your query below.


-- Quest 5663 should be started by Miles Welsh.
UPDATE `creature_questrelation` SET `id`=3044 WHERE `id`=2129 && `quest`=5663;

-- Quest 5661 should not by started by anyone. It's unobtainable.
DELETE FROM `creature_questrelation` WHERE `id`=3044 && `quest`=5661;

-- <NYI> Touch of Weakness should not be a prerequisite of 5658.
UPDATE `quest_template` SET `NextQuestInChain`=0, `RewMoneyMaxLevel`=120, `RewSpell`=19318 WHERE `entry`=5659;

-- Quest 5644 should be started by Miles Welsh.
UPDATE `creature_questrelation` SET `id`=3044 WHERE `id`=5994 && `quest`=5644;

-- Quest 5646 should be started by Ur'kyo.
UPDATE `creature_questrelation` SET `id`=6018 WHERE `id`=3046 && `quest`=5646;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
