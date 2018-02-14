DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180129234747');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180129234747');
-- Add your query below.


REPLACE INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, 
`maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, 
`attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, 
`minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, 
`resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, 
`equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) 
VALUES (509001, 0, 0, 0, 1126, 0, 0, 0, 'Ossirian Agro Trigger', '', 0, 1, 1, 64, 64, 0, 0, 20, 35, 35, 0, 0.91, 1.14286, 1, 0, 2, 2, 0, 44, 1, 2000, 2200, 1, 0, 0, 0, 0, 0, 0, 0, 1.76, 2.42, 100, 10, 
0, 0, 0, 100008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 128, 'npc_ossirian_agro_trigger');

REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`,
 `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES 
 (509001, 509001, 509, 0, 0, -9481.09, 1993.65, 92.7428, 2.38794, 1, 1, 5, 0, 64, 0, 0, 0, 0, 0, 0, 10),
 (509002, 509001, 509, 0, 0, -9470.54, 2007.47, 91.8306, 2.36046, 1, 1, 5, 0, 64, 0, 0, 0, 0, 0, 0, 10),
 (509003, 509001, 509, 0, 0, -9459.25, 2021.93, 92.8492, 2.37224, 1, 1, 5, 0, 64, 0, 0, 0, 0, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
