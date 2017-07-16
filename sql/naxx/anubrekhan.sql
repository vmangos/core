
-- remove the crypt guards from creature table. They are spawned by anub instead.
DELETE FROM `creature` WHERE `id`='16573';

-- Remove all the corpse scarabs that were next to the crypt guards
DELETE FROM `creature` where id = 16698;

-- Increasing anubs attackspeed from 2.4 to 2.0
UPDATE `creature_template` SET `baseattacktime`=2000, `flags_extra`=257 WHERE `entry`=15956;

-- corpse scarabs dmg reduced
UPDATE `creature_template` SET `mindmg`=200, `maxdmg`=300 WHERE `entry`=16698;


-- we need a dummy creature named Anub'Rekhan to use for casting impale to avoid the visual bug where impale is always cast towards maintank
-- super ugly ninjaing the mob_plague_cloud AI for this creature as well, as it does the same, aka nothing.
DELETE FROM `creature_template` WHERE `entry` = 533003;
INSERT INTO `creature_template` 
(`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) 
VALUES 
('533003', '0', '0', '11686', '0', '0', '0', "Anub'Rekhan", 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '20', '20', '0', '1.2', '1.1486', '1', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', "mob_plague_cloud");


UPDATE creature_template SET `MechanicImmuneMask`=1023383290 where entry = 16573;

-- giving corrpse scarabs an AI to do patrolling
UPDATE `creature_template` SET `ScriptName`='mob_corpse_scarab' WHERE `entry`=16698;