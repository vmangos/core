DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180105044105');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180105044105');
-- Add your query below.

-- Various fixes targeting Maraudon.

-- Fix a Theradrim Guardian cast. Change the comment to "on death" and set the triggered flag.
UPDATE `creature_ai_scripts` SET `action1_param3`='3', `comment`='Theradrim Guardian - Summon Theradrim Shardling on Death' WHERE `id`='1178401';

-- Remove current Spewed Larva spawns.
DELETE FROM `creature` WHERE `guid`='55097';
DELETE FROM `creature` WHERE `guid`='54130';
DELETE FROM `creature` WHERE `guid`='55071';

-- Remove Barbed Lasher from the Larva Spewer room.
DELETE FROM `creature` WHERE `guid`='54127';

-- Add a pack of 3 Constrictor Vine instead.
INSERT INTO `creature` VALUES 
('55097', '12220', '349', '12348', '0', '915.77', '-335.57', '-49.19', '5.53228', '7200', '7200', '1', '0', '5937', '0', '0', '1', '0', '0', '0', '10'),
('54130', '12220', '349', '12348', '0', '921.98', '-335.18', '-49.38', '4.6389', '7200', '7200', '1', '0', '5937', '0', '0', '1', '0', '0', '0', '10'),
('55071', '12220', '349', '12348', '0', '915.16', '-341.19', '-49.53', '2.38871', '7200', '7200', '1', '0', '5937', '0', '0', '1', '0', '0', '0', '10');

-- Add a spawn of Spewed Larva in front of the Larva Spewer.
INSERT INTO `creature` VALUES 
('54127', '13533', '349', '13609', '0', '933.77', '-375.64', '-50.38', '2.532429', '7200', '7200', '3', '0', '5682', '0', '0', '2', '1', '0', '0', '10');

-- Spewed Larva set instance data TYPE_LARVA_SPEWER=0 to IN_PROGRESS=1 on death.
INSERT INTO `creature_ai_scripts` VALUES
('1353302', '13533', '6', '0', '100', '2', '0', '0', '0', '0', '34', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Spewed Larva - Set Instance Data on Death');

-- Set a "on use" script for the Larva Spewer, remove faction.
UPDATE `gameobject_template` SET `faction`='0', `ScriptName`='go_larva_spewer' WHERE `entry`='178559';

-- Spewed Larva Waypoints, from the Larva Spewer to Noxxion.
INSERT INTO `creature_movement` VALUES
('54127', '1', '918.643982', '-355.717133', '-50.476387', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '2', '923.817139', '-340.849579', '-49.649231', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '3', '938.651978', '-343.820343', '-50.152737', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '4', '961.753967', '-373.466980', '-49.837502', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '5', '983.542175', '-369.704773', '-50.183945', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '6', '992.535095', '-328.957001', '-64.551476', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '7', '1029.910034', '-299.535645', '-71.982269', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '8', '1059.737305', '-319.574585', '-72.562012', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '9', '1084.203491', '-256.273071', '-73.002502', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '10', '1104.225952', '-242.716293', '-76.274918', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('54127', '11', '1125.183105', '-201.776428', '-80.084602', '0', '54127', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- Spewed Larva  set instance data TYPE_LARVA_SPEWER=0 to IN_PROGRESS=1 at the last waypoint.
INSERT INTO `creature_movement_scripts` VALUES
('54127', '0', '37', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Spewed Larva set instance data');

-- Spewed Larva drops nothing, nor is skinnable, nor gives experience point.
UPDATE `creature_template` SET `lootid`='0', `skinloot`='0', `flags_extra`='64' WHERE `entry`='13533';
DELETE FROM `creature_loot_template` WHERE `entry`=13533;

-- Remove warnings at instance creation, mobs set to have waypoints but don't.'
-- 2x Putridus Trickster
UPDATE `creature` SET `MovementType`='0' WHERE `guid`='54631';
UPDATE `creature` SET `MovementType`='0' WHERE `guid`='54636';
-- Tinkerer Gizlock 
UPDATE `creature` SET `MovementType`='0' WHERE `guid`='56538';
-- Creeping Sludge
UPDATE `creature` SET `MovementType`='0' WHERE `guid`='54588';
UPDATE `creature` SET `spawndist`=0 WHERE `guid`=54588;

-- Rotgrip can walk like any croc and he's very fast.
UPDATE `creature_template` SET `InhabitType`='3', `speed_run`='2.42857' WHERE `entry`='13596';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
