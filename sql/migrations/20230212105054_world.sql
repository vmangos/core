DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230212105054');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230212105054');
-- Add your query below.


-- Damage Multipliers
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=747 && `patch` IN (0); -- Marsh Murloc (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=751 && `patch` IN (0); -- Marsh Flesheater (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=752 && `patch` IN (0); -- Marsh Oracle (was 1.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=853 && `patch` IN (0); -- Coldridge Mountaineer (was 2.55)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1976 && `patch` IN (0); -- Stormwind City Patroller (was 2.35)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2305 && `patch` IN (0); -- Foreman Bonds (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2344 && `patch` IN (0); -- Dun Garok Mountaineer (was 3.35)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2345 && `patch` IN (0); -- Dun Garok Rifleman (was 3)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2346 && `patch` IN (0); -- Dun Garok Priest (was 3.35)
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=5595 && `patch` IN (0); -- Ironforge Guard (was 2.35)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7865 && `patch` IN (0); -- Wildhammer Sentry (was 2.1)
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=10037 && `patch` IN (0); -- Lakeshire Guard (was 2.35)
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=10038 && `patch` IN (0, 5); -- Night Watch Guard (was 3.25)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14446 && `patch` IN (0); -- Fingat (was 3.6)
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15137 && `patch` IN (5); -- Menethil Elite (was 1.45)

-- Armor Multipliers
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=752 && `patch` IN (0); -- Marsh Oracle (was 0.75)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=853 && `patch` IN (0); -- Coldridge Mountaineer (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1976 && `patch` IN (0); -- Stormwind City Patroller (was 1.2)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5476 && `patch` IN (0); -- Watcher Biggs (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5595 && `patch` IN (0); -- Ironforge Guard (was 1.2)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7865 && `patch` IN (0); -- Wildhammer Sentry (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10038 && `patch` IN (0, 5); -- Night Watch Guard (was 0.6)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=15137 && `patch` IN (5); -- Menethil Elite (was 1)

-- arcane resistance
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=10038 && `arcane_res`=10; -- Night Watch Guard


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
