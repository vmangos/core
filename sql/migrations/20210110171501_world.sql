DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210110171501');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210110171501');
-- Add your query below.


-- disable quests 2998, 3681 if quest 1641 is completed or in progress
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (164101, 8, 1641, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (164102, 9, 1641, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (164103, -2, 164101, 164102, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (164104, -3, 164103, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition`= 164104 WHERE  `entry` IN (2998, 3681);

-- disable quests 2997, 2999, 3000 if quest 1645 is completed or in progress
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (164501, 8, 1645, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (164502, 9, 1645, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (164503, -2, 164501, 164502, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (164504, -3, 164503, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition`= 164504 WHERE  `entry` IN (2997, 2999, 3000);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
