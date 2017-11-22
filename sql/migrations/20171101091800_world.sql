DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171101091800');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171101091800');
-- Add your query below.

-- Small Shield
DELETE FROM `creature_loot_template` WHERE `item` = '17184';

-- Large Round Shield
DELETE FROM `creature_loot_template` WHERE `item` = '2129';

-- Dust Bowl
DELETE FROM `reference_loot_template` WHERE `item` = '4290';

INSERT INTO `creature_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES
(832, 4290, 2, 0, 1, 1, 0);

-- Green Carapace Shield
DELETE FROM `reference_loot_template` WHERE `item` = '2021';

INSERT INTO `creature_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`)
VALUES
(569, 2021, '1.5', 0, 1, 1, 0);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
