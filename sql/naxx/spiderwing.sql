-- Venom Stalker Poson charge repeats every 10-20 sec, and targets a random hostile, not current tank
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param3`=10000, `event_param4`=20000, `action1_param2`=4 WHERE `id`=1597601;

-- Poisonous Skitterer scale reduced, increased movementspeed
UPDATE `creature_template` SET `scale`='0.5', `speed_run`='1.75', `speed_walk`='1.5' WHERE `entry`=15977;

-- naxxramas acolyte arcane explosion spell changed to one with 1.5sec cast time, and timers randomized slightly 
UPDATE `creature_ai_scripts` SET `event_param2`=3000, `event_param3`=7000, `event_param4`=9000, `action1_param1`=30096 WHERE `id`=1598101;

-- naxxramas acolyte shadowbolt timer randomized more
UPDATE `creature_ai_scripts` SET `event_param2`=5000, `event_param3`=7000, `event_param4`=9000 WHERE `id`=1598102;