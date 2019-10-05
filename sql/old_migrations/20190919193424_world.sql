DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190919193424');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190919193424');
-- Add your query below.


-- Hand of Justice
-- Dropped by General Angerforge before 1.10.
-- Dropped by Emperor Dagran Thaurissan after 1.10.
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30239, 11815, 0, 1, 1, 1, 0, 0, 7);
UPDATE `reference_loot_template` SET `patch_min`=8 WHERE `item`=11815 && `entry`=30553;

-- Force of Will
-- Dropped by Emperor Dagran Thaurissan before 1.10.
-- Dropped by General Angerforge after 1.10.
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30553, 11810, 0, 1, 1, 1, 0, 0, 7);
UPDATE `reference_loot_template` SET `patch_min`=8 WHERE `item`=11810 && `entry`=30239;

-- Secret Safe dropped different items before 1.10.
-- https://web.archive.org/web/20050222124721/http://wow.allakhazam.com/db/object.html?wobject=331
UPDATE `gameobject` SET `patch_min`=0 WHERE `id`=161495;
UPDATE `gameobject_template` SET `patch`=0 WHERE `entry`=161495;
DELETE FROM `gameobject_loot_template` WHERE `entry`=11104;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(11104, 11920, 0, 1, 1, 1, 0, 0, 7),
(11104, 11923, 0, 1, 1, 1, 0, 0, 7),
(11104, 11926, 0, 1, 1, 1, 0, 0, 7),
(11104, 11929, 0, 1, 1, 1, 0, 0, 7),
(11104, 22205, 0, 1, 1, 1, 0, 8, 10),
(11104, 22254, 0, 1, 1, 1, 0, 8, 10),
(11104, 22255, 0, 1, 1, 1, 0, 8, 10),
(11104, 22256, 0, 1, 1, 1, 0, 8, 10);

-- Spritecaster Cape
-- Dropped by High Interrogator Gerstahn before 1.10.
-- Dropped by Houndmaster Grebmar after 1.10.
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30228, 11623, 0, 1, 1, 1, 0, 0, 7);
UPDATE `reference_loot_template` SET `patch_min`=8 WHERE `item`=11623 && `entry`=30249;

-- Blackveil Cape
-- Dropped by Houndmaster Grebmar before 1.10.
-- Dropped by High Interrogator Gerstahn after 1.10.
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30249, 11626, 0, 1, 1, 1, 0, 0, 7);
UPDATE `reference_loot_template` SET `patch_min`=8 WHERE `item`=11626 && `entry`=30228;

-- All Savage Gladiator Set items drop from Gorosh the Dervish before 1.10.
-- https://web.archive.org/web/20050413234315/http://wow.allakhazam.com/db/mob.html?wmob=9027
UPDATE `reference_loot_template` SET `patch_min`=8 WHERE `entry`!=30232 && `item` IN (11728, 11729, 11730, 11731);
DELETE FROM `reference_loot_template` WHERE `entry`=30232;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(30232, 10278, 5, 1, 1, 1, 0, 0, 7),
(30232, 11728, 15, 1, 1, 1, 0, 0, 7),
(30232, 11729, 25, 1, 1, 1, 0, 0, 7),
(30232, 11730, 25, 1, 1, 1, 0, 0, 7),
(30232, 11731, 15, 1, 1, 1, 0, 0, 7),
(30232, 11726, 15, 1, 1, 1, 0, 0, 10),
(30232, 22257, 30, 1, 1, 1, 0, 8, 10),
(30232, 22266, 25, 1, 1, 1, 0, 8, 10),
(30232, 22271, 30, 1, 1, 1, 0, 8, 10);

-- Fix startup errors on old patches.
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry` IN (15559, 15607);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
