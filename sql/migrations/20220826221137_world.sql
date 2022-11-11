DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220826221137');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220826221137');
-- Add your query below.


-- Winterveil Patch 1.8 spawns in Stormwind.
UPDATE `gameobject` SET `patch_min`=6 WHERE `guid` IN (40901, 40903, 40904, 41657, 41658, 41659, 41661);

-- Winterveil Patch 1.8 spawns in Ironforge.
UPDATE `gameobject` SET `patch_min`=6 WHERE `guid` IN (40993, 40995, 40996, 41669, 41670, 41671, 41672);

-- Winterveil Patch 1.8 spawns in Booty Bay.
UPDATE `gameobject` SET `patch_min`=6 WHERE `guid` IN (41190, 41192, 41193, 41687, 41688, 41689, 41690);

-- Winterveil Patch 1.8 spawns in Durotar.
UPDATE `gameobject` SET `patch_min`=6 WHERE `guid` IN (41330, 41331, 41332, 41704, 41705, 41706, 41707);

-- Winterveil Patch 1.8 spawns in Tirisfal.
UPDATE `gameobject` SET `patch_min`=6 WHERE `guid` IN (41334, 41336, 41337, 41708, 41709, 41710, 41711);

-- Winterveil Patch 1.8 spawns in Menethil.
UPDATE `gameobject` SET `patch_min`=6 WHERE `guid` IN (41950, 41951, 41952, 41954, 41955, 41956, 41957);

-- Winterveil Patch 1.8 spawns in Tanaris.
UPDATE `gameobject` SET `patch_min`=6 WHERE `guid` IN (41958, 41959, 41960, 41962, 41963, 41964, 41965);

-- Custom spawns on test map.
DELETE FROM `gameobject` WHERE `map`=13;

-- These objects are added in patch 1.7.
UPDATE `gameobject` SET `patch_min`=5 WHERE `patch_min` < 5 && `id` IN (180365, 180391, 180404, 180430);
UPDATE `gameobject_template` SET `patch`=5 WHERE `entry` IN (180365, 180391, 180404, 180430);

-- These objects are added in patch 1.8.
UPDATE `gameobject` SET `patch_min`=6 WHERE `patch_min` < 6 && `id` IN (180417, 180438, 180439, 180440, 180441, 180442, 180443, 180444, 180449, 180450, 180473, 180474, 180475, 180476, 180477, 180478, 180479, 180480, 180503, 180570, 180583, 180743, 180746, 180747, 180748, 180793, 180796, 180797, 180798, 180799);
UPDATE `gameobject_template` SET `patch`=6 WHERE `entry` IN (180417, 180438, 180439, 180440, 180441, 180442, 180443, 180444, 180449, 180450, 180473, 180474, 180475, 180476, 180477, 180478, 180479, 180480, 180503, 180570, 180583, 180743, 180746, 180747, 180748, 180793, 180796, 180797, 180798, 180799);

-- These objects are added in patch 1.9.
DELETE FROM `gameobject` WHERE `id`=180794; -- Spawned by spell in script.
DELETE FROM `gameobject` WHERE `guid`=3997044; -- Wrongly spawned.
UPDATE `gameobject` SET `patch_min`=7 WHERE `id` IN (180606, 180607, 180608, 180620, 180642, 180652, 180659, 180660, 180713, 180717, 180718, 180744, 180788, 180811, 180866, 180875, 180876, 180877, 180883, 180885, 180910);
UPDATE `gameobject_template` SET `patch`=7 WHERE `entry` IN (180606, 180607, 180608, 180620, 180642, 180652, 180659, 180660, 180713, 180717, 180718, 180744, 180788, 180794, 180811, 180866, 180875, 180876, 180877, 180883, 180885, 180910);

-- These objects are added in patch 1.10.
UPDATE `gameobject` SET `patch_min`=8 WHERE `id` IN (180525, 181057, 181065, 181067);
UPDATE `gameobject_template` SET `patch`=8 WHERE `entry` IN (180525, 181057, 181065, 181067);

-- Remove TBC version of Syndicate Documents.
DELETE FROM `gameobject` WHERE `id` IN (186420, 187254);
DELETE FROM `gameobject_questrelation` WHERE `id` IN (186420, 187254);
DELETE FROM `gameobject_template` WHERE `entry` IN (186420, 187254);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
