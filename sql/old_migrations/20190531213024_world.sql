DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190531213024');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190531213024');
-- Add your query below.


-- Remove not needed patch 1.9 event.
DELETE FROM `game_event` WHERE `entry`=166;
DELETE FROM `game_event_creature` WHERE `event`=166;
DELETE FROM `game_event_gameobject` WHERE `event`=166;
DELETE FROM `game_event_quest` WHERE `event`=166;
UPDATE `gameobject` SET `patch_min`=7 WHERE `id`=180633;
UPDATE `gameobject_template` SET `patch`=7 WHERE `entry`=180633;

-- Remove not needed patch 1.8 event.
DELETE FROM `game_event` WHERE `entry`=165;
DELETE FROM `game_event` WHERE `entry`=154;
DELETE FROM `game_event_creature` WHERE `event`=154;
DELETE FROM `game_event_gameobject` WHERE `event`=154;
DELETE FROM `game_event_quest` WHERE `event`=154;
UPDATE `gameobject_template` SET `patch`=6 WHERE `entry` IN (180456, 180461, 180466, 180502, 180518, 180529, 180534, 180539, 180544, 180549, 180554, 180559, 180564);
UPDATE `gameobject` SET `patch_min`=6 WHERE `id` IN (180456, 180461, 180466, 180502, 180518, 180529, 180534, 180539, 180544, 180549, 180554, 180559, 180564);
UPDATE `creature_loot_template` SET `patch_min`=6, `condition_id`=0 WHERE `condition_id`=71;
DELETE FROM `conditions` WHERE `condition_entry`=71;

-- Remove not needed patch 1.7 event.
DELETE FROM `game_event` WHERE `entry`=164;

-- Remove not needed patch 1.6 event.
DELETE FROM `game_event` WHERE `entry`=163;

-- Remove not needed patch 1.4/1.5 event.
DELETE FROM `game_event` WHERE `entry`=162;
DELETE FROM `game_event_gameobject` WHERE `event`=162;

-- Remove not needed patch 1.3 event.
DELETE FROM `game_event` WHERE `entry`=161;
DELETE FROM `game_event_gameobject` WHERE `event`=161;
UPDATE `gameobject` SET `patch_min`=1 WHERE `guid` IN (7040, 7052, 7053, 7054, 7055, 7056, 7057, 7058, 9928, 9951, 9960, 9970, 9976, 11454, 11470, 11471, 11472, 11474, 11475, 11496, 11497, 11498, 11499, 14572, 14649, 14650, 14855, 14893, 14909, 14910, 14911, 14912, 14913, 14963, 17274, 17275, 17276, 17277, 17278, 17279, 17280, 17281, 18897, 20483, 20484, 20485, 20486, 20487, 20488, 20489, 20807, 20880, 20969, 21235, 21239, 21265, 21266, 21267, 30005, 30006, 30007, 30008, 30012, 30152, 30153, 30155, 30156, 30157, 30158, 30159, 30163, 30164, 30165, 30566, 30567, 30568, 30570, 30572, 30573, 30576, 30580, 30582, 34178, 34181, 34186, 35007, 35008, 35012, 35014, 35015, 35017, 35018, 35025, 39943, 40703, 40704, 40705, 40706, 45740, 45741, 45742, 45743, 45744, 45745, 45746, 45747, 45748, 45749, 47803, 47804, 47805, 47806, 47807, 47808, 47809, 47812, 48265, 48266, 48267, 48268, 48269, 48270, 48271, 48272, 48273, 48274, 48275, 48276, 48277, 48278, 48279, 48280, 48281, 48282);

-- Remove not needed Talisman of Binding Shard event.
DELETE FROM `game_event` WHERE `entry`=157;
DELETE FROM `conditions` WHERE `condition_entry`=74;
UPDATE `creature_loot_template` SET `condition_id`=0, `patch_min`=1, `patch_max`=1, `ChanceOrQuestChance`=1 WHERE `item`=17782;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
