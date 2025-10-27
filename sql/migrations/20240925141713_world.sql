DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240925141713');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240925141713');
-- Add your query below.


-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67097) defined for pool id (2254), skipped.
UPDATE `pool_gameobject` SET `pool_entry`=2262 WHERE `guid`=11873;
DELETE FROM `pool_pool` WHERE `pool_id`=2254;
DELETE FROM `pool_template` WHERE `entry`=2254;
DELETE FROM `pool_gameobject` WHERE `pool_entry`=2254;

-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67096) defined for pool id (2261), skipped.
UPDATE `pool_gameobject` SET `pool_entry`=2262 WHERE `guid`=1004;
DELETE FROM `pool_pool` WHERE `pool_id`=2261;
DELETE FROM `pool_template` WHERE `entry`=2261;
DELETE FROM `pool_gameobject` WHERE `pool_entry`=2261;

-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67099) defined for pool id (2255), skipped.
UPDATE `pool_gameobject` SET `pool_entry`=2262 WHERE `guid`=29159;
DELETE FROM `pool_pool` WHERE `pool_id`=2255;
DELETE FROM `pool_template` WHERE `entry`=2255;
DELETE FROM `pool_gameobject` WHERE `pool_entry`=2255;

-- `pool_gameobject` has gameobject guid spawned at map 1 when one or several other spawned at different instanceable map 43 in pool id 1053, skipped.
DELETE FROM `pool_gameobject` WHERE `guid` IN (3035, 2368, 2371, 4032, 4036, 10429, 10441);

-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67098) defined for pool id (2252), skipped.
UPDATE `pool_gameobject` SET `pool_entry`=2262 WHERE  `guid`=68716;
DELETE FROM `pool_pool` WHERE `pool_id`=2252;
DELETE FROM `pool_template` WHERE `entry`=2252;
DELETE FROM `pool_gameobject` WHERE `pool_entry`=2252;

-- `pool_gameobject` has a non existing gameobject spawn (GUID: 67173) defined for pool id (2002), skipped.
DELETE FROM `pool_gameobject` WHERE `guid`=67173;

-- Table `creature` have creature (GUID: 54000 Entry: 14390) with `MovementType`=0 (idle) have `wander_distance`<>0, set to 0.
UPDATE `creature` SET `wander_distance`=0 WHERE `guid`=54000;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
