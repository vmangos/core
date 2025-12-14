DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251207124458');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251207124458');
-- Add your query below.


-- Dark Cleric Salem's Chest
UPDATE `gameobject_template` SET `data1`=15360 WHERE `entry`=178464;
-- To prevent startup errors, add the key itself to the chest.
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15360, 17242, 100, 0, 1, 1, 0, 0, 10);

-- Stolen Chest
UPDATE `gameobject_template` SET `data1`=15380 WHERE `entry`=178504;
-- To prevent startup errors, add the key itself to the chest.
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15380, 17262, 100, 0, 1, 1, 0, 0, 10);

-- Drek'Thar's Scrolls
UPDATE `gameobject_template` SET `data1`=15920 WHERE `entry`=179004;

-- Drek'Thar's Scrolls
UPDATE `gameobject_template` SET `data1`=15920 WHERE `entry`=179005;

-- Vanndar's Documents
UPDATE `gameobject_template` SET `data1`=15921 WHERE `entry`=179006;

-- Vanndar's Documents
UPDATE `gameobject_template` SET `data1`=15921 WHERE `entry`=179007;

-- Vanndar's Documents
UPDATE `gameobject_template` SET `data1`=15921 WHERE `entry`=179008;

-- Four Horsemen Chest
UPDATE `gameobject_template` SET `data1`=18036 WHERE `entry`=181366;
UPDATE `gameobject_loot_template` SET `entry`=18036 WHERE `entry`=181366;

-- Arena Spoils
UPDATE `gameobject_template` SET `data1`=17918 WHERE `entry`=181074;
UPDATE `gameobject_loot_template` SET `entry`=17918 WHERE `entry`=181074;

-- Steamsaw
UPDATE `gameobject_template` SET `data1`=15561 WHERE `entry` IN (178664, 178665);
UPDATE `gameobject_loot_template` SET `entry`=15561 WHERE `item`=17411;
DELETE FROM `gameobject_template` WHERE `entry`=300000;
DELETE FROM `gameobject` WHERE `id`=300000;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (407814, 178664, 30, 495.966, -525.183, 67.6816, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 3);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (407815, 178665, 30, -484.905, -397.004, 28.4078, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 3);

-- Hidden Strongbox - Bloodstone Pendant
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1711, 3744, -100, 0, 1, 1, 0, 0, 10);

-- Deepmoss Eggs - Deepmoss Egg
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (3081, 5570, -80, 0, 1, 1, 0, 0, 10);

-- Agamand Weapon Rack - Agamand Family Mace
DELETE FROM `gameobject_loot_template` WHERE `entry`=4766;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4766, 7569, -100, 0, 1, 1, 0, 0, 10);

-- Agamand Weapon Rack - Agamand Family Dagger
DELETE FROM `gameobject_loot_template` WHERE `entry`=4767;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4767, 7568, -100, 0, 1, 1, 0, 0, 10);

-- Drek'Thar's Scrolls - Frostwolf Maps
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15920, 17822, -100, 0, 1, 1, 0, 3, 10);

-- Vanndar's Documents - Stormpike Battle Plans
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (15921, 17823, -100, 0, 1, 1, 0, 3, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
