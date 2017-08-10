-- Venom Stalker Poson charge repeats every 10-20 sec, and targets a random hostile, not current tank
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param3`=10000, `event_param4`=20000, `action1_param2`=4 WHERE `id`=1597601;

-- Poisonous Skitterer scale reduced, increased movementspeed
UPDATE `creature_template` SET `scale`='0.5', `speed_run`='1.75', `speed_walk`='3.5' WHERE `entry`=15977;

-- naxxramas acolyte arcane explosion spell changed to one with 1.5sec cast time, and timers randomized slightly 
UPDATE `creature_ai_scripts` SET `event_param1`=7000, `event_param2`=7000, `event_param3`=7000, `event_param4`=9000, `action1_param1`=30096 WHERE `id`=1598101;

-- naxxramas acolyte shadowbolt timer randomized more and changed spell
UPDATE `creature_ai_scripts` SET `event_param1`=1800, `event_param2`=2000, `event_param3`=7000, `event_param4`=9000, `action1_param1`=28448 WHERE `id`=1598102;


UPDATE creature_template SET `MechanicImmuneMask`=1023383290 where entry in 
(
15981, -- naxxramas acoloyte
15980, -- naxxramas cultist
15975, -- carrion spinner
15977, -- poisonous skitter
15976, -- venom stalker
15978, -- crypt reaver
15974, -- dread creaper
16453 -- necro stalker
);


-- carrion spinners dmg increase
UPDATE `creature_template` SET `mindmg`='3000', `maxdmg`='3500' WHERE `entry`=15975;

-- Necro stalker poison charge now targets random person and repeats every 10-20s
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param3`=10000, `event_param4`=20000, `action1_param2`=4 WHERE `id`=1645301;

-- replace crypt reaver with tomb horror after faerlina
update creature SET id = 15979, modelid = 15942 where guid = 5061270;

-- venom stalker back to default scale, necro stalker to scale 2.5
UPDATE `creature_template` SET `scale`='0' WHERE `entry`=15976;
UPDATE `creature_template` SET `scale`='2.5' WHERE `entry`=16453;

-- dummy creature used to perform the rp stuff happening with naxx acolytes and cultists at faerlina
DELETE FROM `creature_template` WHERE `entry` = 533004;
INSERT INTO `creature_template` 
(`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) 
VALUES 
('533004', '0', '0', '11686', '0', '0', '0', "Faerlina RP", 'NULL', '0', '63', '63', '5000', '5000', '0', '0', '7', '20', '20', '0', '1.2', '1.1486', '1', '0', '0', '0', '0', '0', '1', '2000', '2000', '1', '33587968', '0', '0', '0', '0', '0', '0', '1', '1', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', "mob_faerlina_rp");