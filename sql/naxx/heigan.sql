-- correct possition for Heigan
-- UPDATE creature SET position_x = 2793.86, position_y = -3707.38, position_z = 276.627, orientation = 0.593412 WHERE id = 15936;

-- Creating a creature that will be the caster of the eruption. Looking at vanilla combatlogs it seems when players are hit it says "Plague fissure eruption hits you for xxxx"
-- Since we cant have the GOs themself do the cast, we need this creature to be the caster.
-- Same for Plague Cloud creature which will be casting the plague cloud in the gauntlet room
DELETE FROM `creature_template` WHERE `entry` IN (533001, 533002);
INSERT INTO `creature_template` 
(`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) 
VALUES 
('533001', '0', '0', '11686', '0', '0', '0', 'Plague Fissure', 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '20', '20', '0', '1.2', '1.1486', '1', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', ""),
('533002', '0', '0', '11686', '0', '0', '0', 'Plague Cloud', 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '20', '20', '0', '1.2', '1.1486', '1', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', "mob_plague_cloud");

-- Rotting maggots in heigans gauntlet. 
-- Should be elite, does around 700-900 in an AQ geared hunter, and move randomly around in its area
-- need a script to properly control its evading
UPDATE `creature_template` SET `faction_A`=20, `faction_H`=20, `speed_walk`=0.55, `speed_run`=0.63, `rank`=1, `mindmg`=1425, `maxdmg`=1722, `MovementType`=1, `ScriptName`='mob_rotting_maggot',`baseattacktime`='3000', `rangeattacktime`='3000' WHERE `entry`=16057;

-- Diseased maggots pretty much the same, but less melee dmg as they use a spell
UPDATE `creature_template` SET `faction_A`=20, `faction_H`=20, `speed_walk`=0.55, `speed_run`=0.63, `rank`=1, `mindmg`=700, `maxdmg`=900, `MovementType`=1, `ScriptName`='mob_diseased_maggot'  WHERE `entry`=16056;

-- Allowing rotting maggtots and diseased maggots to randomly patrol within a 15yd radius, and respawn after 1 minute
UPDATE creature SET spawndist = 15, spawntimesecs = 60, MovementType = 1 WHERE id IN (16056, 16057);

-- Replacing half the rotting maggots with Diseased Maggots
update creature set id = 16056, modelid = 15978 where guid in (88233, 88235, 88237, 88239, 88241, 88243, 88245, 88247, 88249, 88251, 88253, 88255, 88257, 88259);


-- Heigan should have a slightly larger hitbox judging from videos
UPDATE `creature_model_info` SET `bounding_radius`='4', `combat_reach`='6' WHERE `modelid`='16309';

-- Eye stalks should have "around 500 hp" according to original vanilla guides. Corrected faction, and unitflag DISABLE_MOVE
UPDATE `creature_template` SET `minhealth`=500, `maxhealth`=500, `faction_A`=20, `faction_H`=20, `unit_flags`=4, `AIName` = "", `ScriptName`='mob_eye_stalk' WHERE `entry`=16236;

-- eye stalks cast spell "root anybody forever" instead of disabling combat movement, which isent working at all.
-- also added an event which recasts it on itself after evade

-- eye stalks no longer eventai
DELETE FROM `creature_ai_scripts` where id IN (1623601,1623602, 1623603);
/*
-- remove all eye stalks from creature table. Script spawns them 
DELETE FROM `creature` WHERE id = 16236;
*/