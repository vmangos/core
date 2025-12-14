DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250411125645');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250411125645');
-- Add your query below.

-- Herzul's bodguards should only spawn together with him:
-- https://www.wowhead.com/classic/quest=852/hezrul-bloodmark#comments:id=3155347
-- https://www.wowhead.com/classic/quest=852/hezrul-bloodmark#comments:id=2752959
UPDATE `creature_linking` SET `flag` = 3203 WHERE `master_guid` = 13990;

-- Raid trash linked to a boss can respawn if the boss hasn't been killed
-- https://old.reddit.com/r/classicwow/comments/k1lucd/naxxramas_which_wing_provides_the_most_trashloot/
-- Noth
UPDATE `creature_linking` SET `flag` = 1024 WHERE `master_guid` = 88100 AND `flag` = 3072;
-- Patchwerk
UPDATE `creature_linking` SET `flag` = 1024 WHERE `master_guid` = 88298 AND `flag` = 3072;
UPDATE `creature_linking` SET `flag` = 1025 WHERE `master_guid` = 88298 AND `flag` = 3073;
-- Grobbulus
UPDATE `creature_linking` SET `flag` = 1025 WHERE `master_guid` = 88303 AND `flag` = 3073;
-- Anub'Rekhan
UPDATE `creature_linking` SET `flag` = 1024 WHERE `master_guid` = 88346 AND `flag` = 3072;
-- Instructor Razuvious
UPDATE `creature_linking` SET `flag` = 1025 WHERE `master_guid` = 88460 AND `flag` = 3073;
-- Gothik the Harvester
UPDATE `creature_linking` SET `flag` = 1024 WHERE `master_guid` = 88479 AND `flag` = 3072;
-- Maexxna
UPDATE `creature_linking` SET `flag` = 1024 WHERE `master_guid` = 88483 AND `flag` = 3072;
-- Grand Widow Faerlina
UPDATE `creature_linking` SET `flag` = 1024 WHERE `master_guid` = 88496 AND `flag` = 3072;
UPDATE `creature_linking` SET `flag` = 1025 WHERE `master_guid` = 88496 AND `flag` = 3073;

-- Make Naxxramas Follower and Naxxramas Worshipper creatures in db
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(88497, 16505, 0, 0, 0, 0, 533, 3359.75, -3621.77, 261.18, 4.54, 7200, 7200, 0, 100, 100, 0, 0, 0, 9, 10),
(88498, 16505, 0, 0, 0, 0, 533, 3346.29, -3619.32, 261.18, 4.61, 7200, 7200, 0, 100, 100, 0, 0, 0, 9, 10),
(88499, 16506, 0, 0, 0, 0, 533, 3350.61, -3619.74, 261.18, 4.65, 7200, 7200, 0, 100, 100, 0, 0, 0, 9, 10),
(88500, 16506, 0, 0, 0, 0, 533, 3341.36, -3619.35, 261.18, 4.68, 7200, 7200, 0, 100, 100, 0, 0, 0, 9, 10),
(88501, 16506, 0, 0, 0, 0, 533, 3356.69, -3621.17, 261.18, 4.38, 7200, 7200, 0, 100, 100, 0, 0, 0, 9, 10),
(88502, 16506, 0, 0, 0, 0, 533, 3364.08, -3622.85, 261.18, 4.35, 7200, 7200, 0, 100, 100, 0, 0, 0, 9, 10);

-- Link Grand Widow Faerlina, to Naxxramas Follower, Naxxramas Worshipper
INSERT INTO `creature_linking` (`guid`,`master_guid`,`flag`) VALUES 
(88497, 88496, 19463),
(88498, 88496, 19463),
(88499, 88496, 19463),
(88500, 88496, 19463),
(88501, 88496, 19463),
(88502, 88496, 19463);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
