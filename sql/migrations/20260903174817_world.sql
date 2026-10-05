DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260903174817');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260903174817');
-- Add your query below.


-- This object is summoned by a spell used by Chambermaid Pillaclencher, who is not spawned on vanilla, but all the templates exist nevertheless.
-- https://www.wowhead.com/classic/quest=7704/look-at-the-size-of-it
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (179832, 3, 3, 5914, 'Pillaclencher\'s Ornate Pillow', '', 0, 0, 2, 43, 16841, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26365, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16841, 18950, 100, 0, 1, 1, 0, 3, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
