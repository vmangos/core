DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181108222222');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181108222222');
-- Add your query below.


-- These items have no duration and don't need the real time duration flag.
UPDATE `item_template` SET `extra_flags`=0 WHERE `entry` IN (22159, 22160, 22161, 22162, 22163, 22178);

-- Zas'Tysh was added in patch 1.8.
UPDATE `creature_equip_template` SET `patch`=6 WHERE `entry`=7951;
UPDATE `creature_template` SET `patch`=6 WHERE `entry`=7951;
UPDATE `creature` SET `patch_min`=6 WHERE (`patch_min` < 6) && `id`=7951;

-- Melris Malagan had no weapons initially.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=12480;
DELETE FROM `creature_template` WHERE `entry`=12480;
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (12480, 0, 0, 0, 5567, 0, 0, 0, 'Melris Malagan', 'Captain of the Guard', 0, 58, 58, 4484, 4484, 0, 0, 3408, 11, 11, 0, 1.25, 1.14286, 0, 20, 5, 0, 0, 1, 351, 412, 0, 262, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 72.9872, 100.357, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 174, 232, 'EventAI', 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (12480, 7, 0, 0, 5567, 0, 0, 0, 'Melris Malagan', 'Captain of the Guard', 0, 58, 58, 4484, 4484, 0, 0, 3408, 11, 11, 0, 1.25, 1.14286, 0, 20, 5, 0, 0, 1, 351, 412, 0, 262, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 72.9872, 100.357, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 174, 232, 'EventAI', 0, 3, 0, 0, 1, 12480, 0, 0, 0, 0, 2, '');

-- Justine Demalier had no weapons initially.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=12481;
DELETE FROM `creature_template` WHERE `entry`=12481;
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (12481, 0, 0, 0, 5446, 0, 0, 0, 'Justine Demalier', 'Stormwind Recruiter', 0, 57, 57, 4356, 4356, 0, 0, 3326, 11, 11, 0, 1.24, 1.14286, 0, 20, 5, 0, 0, 1, 102, 131, 0, 258, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 72.2304, 99.3168, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 147, 197, 'EventAI', 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (12481, 7, 0, 0, 5446, 0, 0, 0, 'Justine Demalier', 'Stormwind Recruiter', 0, 57, 57, 4356, 4356, 0, 0, 3326, 11, 11, 0, 1.24, 1.14286, 0, 20, 5, 0, 0, 1, 102, 131, 0, 258, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 72.2304, 99.3168, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 147, 197, 'EventAI', 0, 3, 0, 0, 1, 12481, 0, 0, 0, 0, 2, '');

-- High Overlord Saurfang was added in 1.5 and had no weapon until 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=14720;
DELETE FROM `creature_template` WHERE `entry`=14720;
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (14720, 3, 0, 0, 14732, 0, 0, 0, 'High Overlord Saurfang', NULL, 0, 62, 62, 85000, 85000, 0, 0, 4391, 85, 85, 3, 1.1, 1.14286, 0, 20, 5, 0, 1, 1, 659, 820, 0, 284, 1, 1158, 2000, 1, 36864, 0, 0, 0, 0, 0, 0, 63.1904, 86.8868, 100, 7, 8, 0, 0, 0, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 2, 'npc_overlord_saurfang');
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (14720, 7, 0, 0, 14732, 0, 0, 0, 'High Overlord Saurfang', NULL, 0, 62, 62, 85000, 85000, 0, 0, 4391, 85, 85, 3, 1.1, 1.14286, 0, 20, 5, 0, 1, 1, 659, 820, 0, 284, 1, 1158, 2000, 1, 36864, 0, 0, 0, 0, 0, 0, 63.1904, 86.8868, 100, 7, 8, 0, 0, 0, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 14720, 0, 0, 0, 0, 2, 'npc_overlord_saurfang');
UPDATE `creature` SET `patch_min`=3 WHERE (`patch_min` < 3) && `id`=14720;

-- Commander Mar'alith was added in patch 1.8.
UPDATE `creature_equip_template` SET `patch`=6 WHERE `entry`=15181;
UPDATE `creature_template` SET `patch`=6 WHERE `entry`=15181;
UPDATE `creature` SET `patch_min`=6 WHERE (`patch_min` < 6) && `id`=15181;

-- Vyral the Vile was added in patch 1.8.
UPDATE `creature_equip_template` SET `patch`=6 WHERE `entry`=15202;
UPDATE `creature_template` SET `patch`=6 WHERE `entry`=15202;
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `entry`=15202 && (`patch_min` < 6);
UPDATE `creature` SET `patch_min`=6 WHERE (`patch_min` < 6) && `id`=15202;

-- Twilight Overlord was added in patch 1.8.
UPDATE `creature_equip_template` SET `patch`=6 WHERE `entry`=15213;
UPDATE `creature_template` SET `patch`=6 WHERE `entry`=15213;
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `entry`=15213 && (`patch_min` < 6);
UPDATE `pickpocketing_loot_template` SET `patch_min`=6 WHERE `entry`=15213 && (`patch_min` < 6);
UPDATE `creature` SET `patch_min`=6 WHERE (`patch_min` < 6) && `id`=15213;

-- Add patch to equipment for Emperor Vek'nilash.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15275;

-- Add patch to equipment for Emperor Vek'lor.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15276;

-- Twilight Overlord was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15437;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15437;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15437;

-- Lieutenant General Andorov was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15471;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15471;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15471;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15471;

-- Herbalist Proudfeather was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15477;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15477;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15477;

-- Doctor Serratus was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15525;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15525;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15525;

-- Doctor Weavil was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15552;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15552;
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15552 && (`patch_min` < 7);
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15552;
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=155520;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=155520;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=155520;

-- Jonathan the Revelator was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15693;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15693;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15693;

-- Field Marshal Snowfall was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15701;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15701;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15701;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15701;

-- Orgrimmar Elite Shieldguard was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15852;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15852;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15852;

-- Stormwind Cavalryman was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15857;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15857;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15857;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15857;

-- Stormwind Infantryman was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15858;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15858;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15858;

-- Kaldorei Marksman was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15860;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15860;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15860;

-- High Commander Lynore Windstryke was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15866;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15866;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15866;

-- Highlord Leoric Von Zeldig was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15868;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15868;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15868;

-- Malagav the Tactician was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15869;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15869;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15869;

-- Add patch to equipment for Tharl Stonebleeder.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=16076;

-- Add patch to equipment for Captain Armando Ossex.
UPDATE `creature_equip_template` SET `patch`=9 WHERE `entry`=16392;

-- Assign patch to custom version of High Overlord Saurfang.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=987000;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=987000;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=987000;

-- Assign patch to custom version of Lieutenant General Andorov.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=987001;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=987001;
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=987001;

-- Felder Stover's equipment was added in patch 1.3.
UPDATE `creature_equip_template` SET `patch`=1 WHERE `entry`=1296;
DELETE FROM `creature_template` WHERE `entry`=1296;
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (1296, 0, 0, 0, 1426, 0, 0, 0, 'Felder Stover', 'Weaponsmith', 0, 52, 52, 3748, 3748, 0, 0, 2669, 11, 11, 16388, 1.1, 1.14286, 0, 20, 5, 0, 0, 1, 92, 120, 0, 234, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 67.2672, 92.4924, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 2, '');
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (1296, 1, 0, 0, 1426, 0, 0, 0, 'Felder Stover', 'Weaponsmith', 0, 52, 52, 3748, 3748, 0, 0, 2669, 11, 11, 16388, 1.1, 1.14286, 0, 20, 5, 0, 0, 1, 92, 120, 0, 234, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 67.2672, 92.4924, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 1296, 0, 0, 0, 0, 2, '');

-- Brakgul Deathbringer was added in patch 1.6.
UPDATE `creature_equip_template` SET `patch`=4 WHERE `entry`=3890;
UPDATE `creature_template` SET `patch`=4 WHERE `entry`=3890;
UPDATE `creature_template_addon` SET `patch`=4 WHERE `entry`=3890;
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `entry`=3890 && (`patch_min` < 4);
UPDATE `creature` SET `patch_min`=4 WHERE (`patch_min` < 4) && `id`=3890;

-- Kurdrum Barleybeard was added in patch 1.5.
UPDATE `creature_equip_template` SET `patch`=3 WHERE `entry`=5139;
UPDATE `creature_template` SET `patch`=3 WHERE `entry`=5139;
UPDATE `creature_template_addon` SET `patch`=3 WHERE `entry`=5139;
UPDATE `creature_loot_template` SET `patch_min`=3 WHERE `entry`=5139 && (`patch_min` < 3);
UPDATE `creature` SET `patch_min`=3 WHERE (`patch_min` < 3) && `id`=5139;

-- Lord Victor Nefarius was added in patch 1.6.
UPDATE `creature_equip_template` SET `patch`=4 WHERE `entry`=10162;
UPDATE `creature_template` SET `patch`=4 WHERE `entry`=10162;
UPDATE `creature_template_addon` SET `patch`=4 WHERE `entry`=10162;
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `entry`=10162 && (`patch_min` < 4);
UPDATE `creature` SET `patch_min`=4 WHERE (`patch_min` < 4) && `id`=10162;

-- Lord Victor Nefarius was added in patch 1.6.
UPDATE `creature_equip_template` SET `patch`=4 WHERE `entry`=10163;
UPDATE `creature_template` SET `patch`=4 WHERE `entry`=10163;
UPDATE `creature_template_addon` SET `patch`=4 WHERE `entry`=10163;
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `entry`=10163 && (`patch_min` < 4);
UPDATE `creature` SET `patch_min`=4 WHERE (`patch_min` < 4) && `id`=10163;

-- Add patch to equipment for Prince Tortheldrin.
UPDATE `creature_equip_template` SET `patch`=1 WHERE `entry`=11486;

-- Blackwing Taskmaster was added in patch 1.6.
UPDATE `creature_equip_template` SET `patch`=4 WHERE `entry`=12458;
UPDATE `creature_template` SET `patch`=4 WHERE `entry`=12458;
UPDATE `creature_template_addon` SET `patch`=4 WHERE `entry`=12458;
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `entry`=12458 && (`patch_min` < 4);
UPDATE `creature` SET `patch_min`=4 WHERE (`patch_min` < 4) && `id`=12458;

-- Grethok the Controller was added in patch 1.6.
UPDATE `creature_equip_template` SET `patch`=4 WHERE `entry`=12557;
UPDATE `creature_template` SET `patch`=4 WHERE `entry`=12557;
UPDATE `creature_template_addon` SET `patch`=4 WHERE `entry`=12557;
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `entry`=12557 && (`patch_min` < 4);
UPDATE `creature` SET `patch_min`=4 WHERE (`patch_min` < 4) && `id`=12557;

-- Royal Dreadguard was added in patch 1.3.
UPDATE `creature_equip_template` SET `patch`=1 WHERE `entry`=13839;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=13839;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=13839;
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=13839 && (`patch_min` < 1);
UPDATE `creature` SET `patch_min`=1 WHERE (`patch_min` < 1) && `id`=13839;

-- Ravak Grimtotem was added in patch 1.5.
UPDATE `creature_equip_template` SET `patch`=3 WHERE `entry`=14186;
UPDATE `creature_template` SET `patch`=3 WHERE `entry`=14186;
UPDATE `creature_template_addon` SET `patch`=3 WHERE `entry`=14186;
UPDATE `creature_loot_template` SET `patch_min`=3 WHERE `entry`=14186 && (`patch_min` < 3);
UPDATE `creature` SET `patch_min`=3 WHERE (`patch_min` < 3) && `id`=14186;

-- Overlord Runthak was added in patch 1.3.
UPDATE `creature_equip_template` SET `patch`=1 WHERE `entry`=14392;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=14392;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=14392;
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14392 && (`patch_min` < 1);
UPDATE `creature` SET `patch_min`=1 WHERE (`patch_min` < 1) && `id`=14392;

-- Hunter Sagewind was added in patch 1.4.
UPDATE `creature_equip_template` SET `patch`=2 WHERE `entry`=14440;
UPDATE `creature_template` SET `patch`=2 WHERE `entry`=14440;
UPDATE `creature_template_addon` SET `patch`=2 WHERE `entry`=14440;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=14440 && (`patch_min` < 2);
UPDATE `creature` SET `patch_min`=2 WHERE (`patch_min` < 2) && `id`=14440;

-- Hunter Ragetotem was added in patch 1.4.
UPDATE `creature_equip_template` SET `patch`=2 WHERE `entry`=14441;
UPDATE `creature_template` SET `patch`=2 WHERE `entry`=14441;
UPDATE `creature_template_addon` SET `patch`=2 WHERE `entry`=14441;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=14441 && (`patch_min` < 2);
UPDATE `creature` SET `patch_min`=2 WHERE (`patch_min` < 2) && `id`=14441;

-- Hunter Thunderhorn was added in patch 1.4.
UPDATE `creature_equip_template` SET `patch`=2 WHERE `entry`=14442;
UPDATE `creature_template` SET `patch`=2 WHERE `entry`=14442;
UPDATE `creature_template_addon` SET `patch`=2 WHERE `entry`=14442;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=14442 && (`patch_min` < 2);
UPDATE `creature` SET `patch_min`=2 WHERE (`patch_min` < 2) && `id`=14442;

-- Niby the Almighty was added in patch 1.4.
UPDATE `creature_equip_template` SET `patch`=2 WHERE `entry`=14469;
UPDATE `creature_template` SET `patch`=2 WHERE `entry`=14469;
UPDATE `creature_template_addon` SET `patch`=2 WHERE `entry`=14469;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=14469 && (`patch_min` < 2);
UPDATE `creature` SET `patch_min`=2 WHERE (`patch_min` < 2) && `id`=14469;

-- High Priest Venoxis was added in patch 1.7.
UPDATE `creature_equip_template` SET `patch`=5 WHERE `entry`=14507;
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=14507;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=14507;
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `entry`=14507 && (`patch_min` < 5);
UPDATE `creature` SET `patch_min`=5 WHERE (`patch_min` < 5) && `id`=14507;

-- High Priestess Mar'li was added in patch 1.7.
UPDATE `creature_equip_template` SET `patch`=5 WHERE `entry`=14510;
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=14510;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=14510;
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `entry`=14510 && (`patch_min` < 5);
UPDATE `creature` SET `patch_min`=5 WHERE (`patch_min` < 5) && `id`=14510;

-- Lord Blackwood was added in patch 1.11.
UPDATE `creature_equip_template` SET `patch`=9 WHERE `entry`=14695;
UPDATE `creature_template` SET `patch`=9 WHERE `entry`=14695;
UPDATE `creature_template_addon` SET `patch`=9 WHERE `entry`=14695;
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `entry`=14695 && (`patch_min` < 9);
UPDATE `creature` SET `patch_min`=9 WHERE (`patch_min` < 9) && `id`=14695;

-- Captain Shatterskull was added in patch 1.5.
UPDATE `creature_equip_template` SET `patch`=3 WHERE `entry`=14781;
UPDATE `creature_template` SET `patch`=3 WHERE `entry`=14781;
UPDATE `creature_template_addon` SET `patch`=3 WHERE `entry`=14781;
UPDATE `creature_loot_template` SET `patch_min`=3 WHERE `entry`=14781 && (`patch_min` < 3);
UPDATE `creature` SET `patch_min`=3 WHERE (`patch_min` < 3) && `id`=14781;

-- Silas Darkmoon was added in patch 1.6.
UPDATE `creature_equip_template` SET `patch`=4 WHERE `entry`=14823;
UPDATE `creature_template` SET `patch`=4 WHERE `entry`=14823;
UPDATE `creature_template_addon` SET `patch`=4 WHERE `entry`=14823;
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `entry`=14823 && (`patch_min` < 4);
UPDATE `creature` SET `patch_min`=4 WHERE (`patch_min` < 4) && `id`=14823;

-- Zandalar Enforcer was added in patch 1.7.
UPDATE `creature_equip_template` SET `patch`=5 WHERE `entry`=14911;
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=14911;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=14911;
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `entry`=14911 && (`patch_min` < 5);
UPDATE `creature` SET `patch_min`=5 WHERE (`patch_min` < 5) && `id`=14911;

-- Kartra Bloodsnarl was added in patch 1.6.
UPDATE `creature_equip_template` SET `patch`=4 WHERE `entry`=14942;
UPDATE `creature_template` SET `patch`=4 WHERE `entry`=14942;
UPDATE `creature_template_addon` SET `patch`=4 WHERE `entry`=14942;
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `entry`=14942 && (`patch_min` < 4);
UPDATE `creature` SET `patch_min`=4 WHERE (`patch_min` < 4) && `id`=14942;

-- Lady Hoteshem was added in patch 1.7.
UPDATE `creature_equip_template` SET `patch`=5 WHERE `entry`=15008;
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=15008;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=15008;
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `entry`=15008 && (`patch_min` < 5);
UPDATE `creature` SET `patch_min`=5 WHERE (`patch_min` < 5) && `id`=15008;

-- Deathmaster Dwire was added in patch 1.7.
UPDATE `creature_equip_template` SET `patch`=5 WHERE `entry`=15021;
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=15021;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=15021;
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `entry`=15021 && (`patch_min` < 5);
UPDATE `creature` SET `patch_min`=5 WHERE (`patch_min` < 5) && `id`=15021;

-- Wushoolay was added in patch 1.7.
UPDATE `creature_equip_template` SET `patch`=5 WHERE `entry`=15085;
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=15085;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=15085;
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `entry`=15085 && (`patch_min` < 5);
UPDATE `creature` SET `patch_min`=5 WHERE (`patch_min` < 5) && `id`=15085;

-- Geologist Larksbane was added in patch 1.8.
UPDATE `creature_equip_template` SET `patch`=6 WHERE `entry`=15183;
UPDATE `creature_template` SET `patch`=6 WHERE `entry`=15183;
UPDATE `creature_template_addon` SET `patch`=6 WHERE `entry`=15183;
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `entry`=15183 && (`patch_min` < 6);
UPDATE `creature` SET `patch_min`=6 WHERE (`patch_min` < 6) && `id`=15183;

-- Sergeant Stonebrow was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15383;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15383;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15383;
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15383 && (`patch_min` < 7);
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15383;

-- Vethsera was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15504;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15504;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15504;
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15504 && (`patch_min` < 7);
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15504;

-- Twilight Marauder was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15542;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15542;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15542;
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15542 && (`patch_min` < 7);
UPDATE `pickpocketing_loot_template` SET `patch_min`=7 WHERE `entry`=15542 && (`patch_min` < 7);
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15542;

-- Twilight Marauder was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15700;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15700;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15700;
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15700 && (`patch_min` < 7);
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15700;

-- Christmas Prince Tortheldrin was added in patch 1.8.
UPDATE `creature_equip_template` SET `patch`=6 WHERE `entry`=15774;
UPDATE `creature_template` SET `patch`=6 WHERE `entry`=15774;
UPDATE `creature_template_addon` SET `patch`=6 WHERE `entry`=15774;
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `entry`=15774 && (`patch_min` < 6);
UPDATE `creature` SET `patch_min`=6 WHERE (`patch_min` < 6) && `id`=15774;

-- Might of Kalimdor Sergeant was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15840;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15840;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15840;
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15840 && (`patch_min` < 7);
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15840;

-- Might of Kalimdor Major was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15865;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15865;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15865;
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15865 && (`patch_min` < 7);
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15865;

-- Duke August Foehammer was added in patch 1.9.
UPDATE `creature_equip_template` SET `patch`=7 WHERE `entry`=15870;
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15870;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15870;
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `entry`=15870 && (`patch_min` < 7);
UPDATE `creature` SET `patch_min`=7 WHERE (`patch_min` < 7) && `id`=15870;

-- Add patch to equipment for Volida.
UPDATE `creature_equip_template` SET `patch`=8 WHERE `entry`=16058;

-- Add patch to equipment for Isalien.
UPDATE `creature_equip_template` SET `patch`=8 WHERE `entry`=16097;

-- Add patch to equipment for Sothos.
UPDATE `creature_equip_template` SET `patch`=8 WHERE `entry`=16102;

-- Add patch to equipment for Spirit of Sothos.
UPDATE `creature_equip_template` SET `patch`=8 WHERE `entry`=16104;

-- Add patch to equipment for Argent Dawn Paladin.
UPDATE `creature_equip_template` SET `patch`=9 WHERE `entry`=16395;

-- Add patch to equipment for Argent Dawn Champion.
UPDATE `creature_equip_template` SET `patch`=9 WHERE `entry`=16434;

-- Add patch to equipment for Argent Dawn Priest.
UPDATE `creature_equip_template` SET `patch`=9 WHERE `entry`=16436;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
