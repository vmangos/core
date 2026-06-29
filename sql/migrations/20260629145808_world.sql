DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260629145808');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260629145808');
-- Add your query below.


-- 1600: Stored Value In Index 15 From Instance Script Is Equal Or Greater Than 6
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1600, 34, 15, 6, 1, 0, 0);
-- 1601: Stored Value In Index 15 From Instance Script Is Equal Or Greater Than 5
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1601, 34, 15, 5, 1, 0, 0);
-- 1602: Stored Value In Index 15 From Instance Script Is Equal Or Greater Than 4
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1602, 34, 15, 4, 1, 0, 0);
-- 1603: Stored Value In Index 15 From Instance Script Is Equal Or Greater Than 3
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1603, 34, 15, 3, 1, 0, 0);
-- 1604: Stored Value In Index 15 From Instance Script Is Equal Or Greater Than 2
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1604, 34, 15, 2, 1, 0, 0);
-- 1605: Stored Value In Index 15 From Instance Script Is Equal To 1
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1605, 34, 15, 1, 0, 0, 0);

-- Remove custom copies of Gordok Tribute.
DELETE FROM `gameobject_loot_template` WHERE `entry`=16577;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16577, 8766, 100, 0, 15, 20, 0, 1, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16577, 8952, 100, 0, 15, 20, 0, 1, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16577, 12008, 100, 0, -12008, 1, 1604, 1, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16577, 12009, 100, 0, -12008, 1, 1603, 1, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16577, 12015, 100, 0, -12015, 1, 1602, 1, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16577, 12016, 100, 0, -12016, 1, 1601, 1, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16577, 12017, 100, 0, -12017, 1, 1600, 1, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16577, 13444, 100, 0, 2, 5, 1605, 1, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16577, 13446, 100, 0, 2, 5, 1605, 1, 10);
DELETE FROM `gameobject` WHERE `id` IN (300400, 300401, 300402, 300403, 300404, 300405);
DELETE FROM `gameobject_template` WHERE `entry` IN (300400, 300401, 300402, 300403, 300404, 300405);
DELETE FROM `locales_gameobject` WHERE `entry` IN (300400, 300401, 300402, 300403, 300404, 300405);
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (42901, 42902, 42903, 42904, 42905, 42906);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
