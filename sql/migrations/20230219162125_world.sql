DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230219162125');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230219162125');
-- Add your query below.


-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4050; -- Cenarion Caretaker (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4052; -- Cenarion Druid (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4056; -- Mirkfallon Keeper (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4061; -- Mirkfallon Dryad (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4814; -- Twilight Elementalist (was 0.17)
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=5915; -- Brother Ravenoak (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=8518; -- Rynthariel the Keymaster (was 0.14)

-- Damage Multipliers
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2151 && `patch` IN (0); -- Moon Priestess Amara (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3571 && `patch` IN (0); -- Teldrassil Sentinel (was 5.55)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4050 && `patch` IN (0); -- Cenarion Caretaker (was 3.7)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4052 && `patch` IN (0); -- Cenarion Druid (was 3.55)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4056 && `patch` IN (0); -- Mirkfallon Keeper (was 3.35)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4061 && `patch` IN (0); -- Mirkfallon Dryad (was 3.45)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4262 && `patch` IN (0, 2); -- Darnassus Sentinel (was 2.35)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4409 && `patch` IN (0); -- Gatekeeper Kordurus (was 3.25)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5915 && `patch` IN (0); -- Brother Ravenoak (was 3.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6086 && `patch` IN (0); -- Auberdine Sentinel (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6287 && `patch` IN (0); -- Radnaal Maneweaver (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=8518 && `patch` IN (0); -- Rynthariel the Keymaster (was 3.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10604 && `patch` IN (0); -- Huntress Nhemai (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10606 && `patch` IN (0); -- Huntress Yaeliura (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12160 && `patch` IN (0); -- Shadowglen Sentinel (was 1.9)

-- Armor Multipliers
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3571 && `patch` IN (0); -- Teldrassil Sentinel (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4262 && `patch` IN (0, 2); -- Darnassus Sentinel (was 1.2)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12160 && `patch` IN (0); -- Shadowglen Sentinel (was 1.4)

-- Nature Resistance
UPDATE `creature_template` SET `nature_res`=52 WHERE `entry`=4050 && `nature_res`=0; -- Cenarion Caretaker
UPDATE `creature_template` SET `nature_res`=54 WHERE `entry`=4052 && `nature_res`=0; -- Cenarion Druid
UPDATE `creature_template` SET `nature_res`=80 WHERE `entry`=4056 && `nature_res`=0; -- Mirkfallon Keeper


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
