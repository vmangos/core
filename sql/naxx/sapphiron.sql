-- sapphiron hitbox update
UPDATE `creature_model_info` SET `bounding_radius`='10', `combat_reach`='20' WHERE `modelid`='16033';

-- wing buffet crature
DELETE FROM `creature_template` WHERE `entry` = 17025;
INSERT INTO `creature_template` 
(`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) 
VALUES 
('17025', '0', '0', '15880', '0', '0', '0', "Sapphiron's Wing buffet", 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '35', '35', '0', '1.2', '1.1486', '2.5', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', 'npc_sapphiron_wing_buffet');

-- sapphirons blizzard no longer eventai. Giving it a script.
UPDATE `creature_template` SET `faction_A`=20, `faction_H`=20, `AIName`=0, `ScriptName`='npc_sapphiron_blizzard', `minlevel`=63, `maxlevel`=63, `speed_walk`='0.28', `speed_run`='0.28', `unit_flags`=0 /*33554434*/ WHERE `entry`=16474;