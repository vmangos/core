-- Meteors for anubisath defenders had event_param1 and 2 swapped
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527732';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527728';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527724';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527720';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527716';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527712';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527708';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527704';

-- Add detect invis/stealth aura
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('15246', '0', '0', '1', '16', '0', '0', '18950');
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('15247', '0', '0', '1', '16', '0', '0', '18950');
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('15233', '0', '0', '1', '16', '0', '0', '18950');