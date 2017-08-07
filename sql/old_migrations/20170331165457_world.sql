INSERT INTO `migrations` VALUES ('20170331165457');

-- Fix Uldaman Archaedas spells for Awakening Earthens and Stone guardians
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('10252', '1', '7076');
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('10258', '1', '10120');
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('10259', '1', '7077');
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('10259', '1', '7309');
-- Lore Keeper of Norgannon is not in Cenarion Circle
UPDATE `creature_template` SET `faction_A`='35', `faction_H`='35' WHERE `entry`='7172';
-- Obsidian Sentinel second action on hp events is not happening, it hould be triggered
UPDATE `creature_ai_scripts` SET `action2_param3`='2' WHERE `id`='702301';
UPDATE `creature_ai_scripts` SET `action2_param3`='2' WHERE `id`='702302';
UPDATE `creature_ai_scripts` SET `action2_param3`='2' WHERE `id`='702303';
UPDATE `creature_ai_scripts` SET `action2_param3`='2' WHERE `id`='702304';

