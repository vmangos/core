DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210108174134');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210108174134');
-- Add your query below.


INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (108001, 8, 1074, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (108002, 8, 1077, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (108003, -1, 108001, 108002, 0, 0, 0);

UPDATE `quest_template` SET `PrevQuestId`= 0, `RequiredCondition`= 108003 WHERE `entry`=1080;
UPDATE `quest_template` SET `NextQuestInChain` = 0, `ExclusiveGroup` = -1079, `NextQuestId` = 1091 WHERE `entry` IN (1079, 1080);
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestInChain` = 0 WHERE `entry` = 1091;
UPDATE `quest_template` SET `PrevQuestId` = 1091, `NextQuestInChain` = 0, `ExclusiveGroup` = -1083, `NextQuestId` = 1082 WHERE `entry` IN (1083, 1084);
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1082;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
