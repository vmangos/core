DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181016215801');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181016215801');
-- Add your query below.


-- World of Warcraft Client Patch 1.7.0 (2005-09-13)
-- "Some Horde quest NPCs were moved to new locations to promote more"
-- "intuitive quest flow: Storm Shadowhoof who was previously at"
-- "Bloodvenom Falls in Felwood has been moved to Everlook. Witch Doctor"
-- "Mau'ari who was previously in Orgrimmar has been moved to Everlook."

-- Storm Shadowhoof
DELETE FROM `creature` WHERE `id`=10303;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (41759, 10303, 1, 9776, 0, 5105.82, -363.62, 357.068, 1.40569, 333, 333, 0, 0, 3857, 0, 0, 0, 0, 0, 0, 4);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (41763, 10303, 1, 9776, 0, 6716.85, -4713.84, 721.702, 1.27409, 333, 333, 0, 0, 3857, 0, 0, 0, 0, 0, 5, 10);
-- Witch Doctor Mau'ari
DELETE FROM `creature` WHERE `id`=10307;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (41669, 10307, 1, 9774, 0, 1515.83, -4188.57, 41.0674, 0.226893, 333, 333, 0, 0, 4108, 5013, 0, 0, 0, 0, 0, 4);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (41765, 10307, 1, 9774, 0, 6720.53, -4712.91, 721.976, 1.85005, 333, 333, 0, 0, 4108, 5013, 0, 0, 0, 0, 5, 10);
DELETE FROM `creature_template` WHERE `entry`=10307;
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (10307, 0, 0, 0, 9774, 0, 0, 0, 'Witch Doctor Mau\'ari', NULL, 0, 55, 55, 4108, 4108, 5013, 5013, 1644, 876, 876, 3, 1.1, 1.14286, 0, 20, 5, 0, 0, 1, 96, 125, 0, 248, 1, 2000, 2000, 8, 4608, 0, 0, 0, 0, 0, 0, 70.664, 97.163, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 1, 10307, 0, 0, 0, 0, 2, 'npc_witch_doctor_mauari');
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (10307, 8, 0, 0, 9774, 0, 0, 0, 'Witch Doctor Mau\'ari', NULL, 0, 55, 55, 4108, 4108, 5013, 5013, 1644, 855, 855, 3, 1.1, 1.14286, 0, 20, 5, 0, 0, 1, 96, 125, 0, 248, 1, 2000, 2000, 8, 4608, 0, 0, 0, 0, 0, 0, 70.664, 97.163, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 1, 10307, 0, 0, 0, 0, 2, 'npc_witch_doctor_mauari');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
