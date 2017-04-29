-- Meteors for anubisath defenders had event_param1 and 2 swapped
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527732';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527728';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527724';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527720';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527716';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527712';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527708';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527704';

-- Add detect invis/stealth and taunt immune aura
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('15246', '0', '0', '1', '16', '0', '0', '18950 26602');
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('15247', '0', '0', '1', '16', '0', '0', '18950');
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('15233', '0', '0', '1', '16', '0', '0', '18950');

-- Position adjustments
UPDATE `creature` SET `position_y`='1759.77' WHERE `guid`='88027';
UPDATE `creature` SET `position_y`='1780.08', `position_z`='-42.6571' WHERE `guid`='88024';
UPDATE `creature` SET `position_x`='-900.787109', `position_y`='1916.039063', `position_z`='-43.814262' WHERE `guid`='88063';

-- Replace qiraji mindslayers eventAI with scripted ai. Script is located in instance_temple_of_ahnqiraj.cpp.
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_qiraji_mindslayer' WHERE `entry`='15246';