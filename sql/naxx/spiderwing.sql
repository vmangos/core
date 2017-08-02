-- Venom Stalker Poson charge repeats every 10-20 sec, and targets a random hostile, not current tank
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param3`=10000, `event_param4`=20000, `action1_param2`=4 WHERE `id`=1597601;

-- Poisonous Skitterer scale reduced, increased movementspeed
UPDATE `creature_template` SET `scale`='0.5', `speed_run`='1.75', `speed_walk`='3.5' WHERE `entry`=15977;

-- naxxramas acolyte arcane explosion spell changed to one with 1.5sec cast time, and timers randomized slightly 
UPDATE `creature_ai_scripts` SET `event_param2`=3000, `event_param3`=7000, `event_param4`=9000, `action1_param1`=30096 WHERE `id`=1598101;

-- naxxramas acolyte shadowbolt timer randomized more
UPDATE `creature_ai_scripts` SET `event_param2`=5000, `event_param3`=7000, `event_param4`=9000 WHERE `id`=1598102;


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
/*

