DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221101120333');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221101120333');
-- Add your query below.

-- 769 (Kodo Hide Bag) should require a Leatherworking skill of 10 (currently requires 1)
UPDATE `quest_template` SET `RequiredSkillValue` = 10 WHERE `entry` = 769;

-- 866 (Root Samples) should require a Herbalism skill of 40 (currently requires 1)
UPDATE `quest_template` SET `RequiredSkillValue` = 40 WHERE `entry` = 866;

-- 1618 (Gearing Redridge) should require a Blacksmithing skill of 60 (currently requires 70)
UPDATE `quest_template` SET `RequiredSkillValue` = 60 WHERE `entry` = 1618;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
