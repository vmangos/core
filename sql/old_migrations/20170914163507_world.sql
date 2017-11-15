DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20170914163507');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20170914163507');
-- Add your query below.


-- Fix Deathsworn Captain spawning in ShadowfangKeep

-- Pool

DELETE FROM `pool_template` WHERE `entry`=1601;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
	(1601, 1, 'Deathsworn Captain Spawn Pool - Shadowfang Keep');

DELETE FROM `pool_creature` WHERE `pool_entry`=1601;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
	(99291, 1601, 30, 'Deathsworn Captain'),
	(134517, 1601, 70, 'Tormented Officer');

-- Creature

UPDATE `creature_template` SET `AIName`='EventAI', `equipment_id`=149 WHERE `entry`=3872;

DELETE FROM `creature` WHERE `id`=3872;
DELETE FROM `creature` WHERE `id`=3873 AND `guid`=134517;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES
	(99291, 3872, 33, 3224, 0, -192.012, 2124.54, 97.3899, 4.29002, 3600, 0, 0, 2097, 0, 0, 2),
	(134517, 3873, 33, 0, 0, -192.012, 2124.54, 97.3899, 4.29002, 3600, 0, 0, 2097, 0, 0, 0);

-- Movement
DELETE FROM `creature_movement` WHERE `id`=99291;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`)
VALUES
	(99291, 1, -191.946, 2124.68, 97.3899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(99291, 2, -203.288, 2100.47, 97.3899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(99291, 3, -213.781, 2097.97, 97.3899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(99291, 4, -239.866, 2108.05, 97.3899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(99291, 5, -245.81, 2110.46, 100.031, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(99291, 6, -239.837, 2107.84, 97.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(99291, 7, -212.154, 2097.46, 97.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(99291, 8, -202.219, 2102.72, 97.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(99291, 9, -187.112, 2133.9, 97.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(99291, 10, -189.958, 2128.48, 97.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
