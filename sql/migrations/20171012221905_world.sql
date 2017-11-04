DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171012221905');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171012221905');
-- Add your query below.


-- Wyrmguard equipment
REPLACE INTO `creature_equip_template` (`entry`, `equipentry1`) VALUES (811, 5597);
UPDATE `creature_template` SET `equipment_id`=811 WHERE `entry`=12460;

-- BWL Disarm immunities
UPDATE creature_template SET MechanicImmuneMask=MechanicImmuneMask | 4 WHERE entry in (13020,12467,12460);

-- Razorgore Cleave range
REPLACE INTO `spell_effect_mod` (`Id`, `EffectRadiusIndex`, `Comment`) VALUES (19632, 13, 'Razorgore Cleave: 10 yd range');

-- Death Talon Hatcher interrupt immunity
UPDATE creature_template SET MechanicImmuneMask=MechanicImmuneMask | 33554432 WHERE entry = 12468;

-- Death Talon Hatcher and Blackwing Spellbinder flamestrike
UPDATE `creature_ai_scripts` SET `event_param1`=6500, `event_param2`=10500, `action1_param2`=1 WHERE `id`=1246802;
UPDATE `creature_ai_scripts` SET `event_param1`=6500, `event_param2`=10500, `action1_param2`=1 WHERE `id`=1245701;

-- Overseer pack position
UPDATE `creature` SET `position_x`=-7469.68, `position_y`=-987.146, `position_z`=449.75, `orientation`=5.3062 WHERE `guid`=84592;
UPDATE `creature` SET `position_x`=-7458.68, `position_y`=-994.986, `position_z`=449.698, `orientation`=2.2352 WHERE `guid`=84591;
UPDATE `creature` SET `position_x`=-7460.91, `position_y`=-984.19, `position_z`=449.702, `orientation`=3.80993 WHERE `guid`=84590;
UPDATE `creature` SET `position_x`=-7466.46, `position_y`=-994.422, `position_z`=449.744, `orientation`=0.672253 WHERE `guid`=84589;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
