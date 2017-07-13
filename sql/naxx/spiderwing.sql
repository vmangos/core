-- Venom Stalker Poson charge repeats every 10-20 sec, and targets a random hostile, not current tank
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param3`=10000, `event_param4`=20000, `action1_param2`=4 WHERE `id`=1597601;

-- Poisonous Skitterer scale reduced, increased movementspeed
UPDATE `creature_template` SET `scale`='0.5', `speed_run`='1.75', `speed_walk`='1.5' WHERE `entry`=15977;