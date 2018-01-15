DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171123214903');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171123214903');
-- Add your query below.

-- Anvilrage Captain - EventAI spells Demo Shout, MS, Shield Bash and Shield Block
UPDATE `creature_template` SET `spell1`=13730, `spell2`=13737, `spell3`=11972, `spell4`=12169, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=8903;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=8903;
REPLACE INTO `creature_ai_scripts` (
    `id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,
    `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES
(890301, 8903, 9, 100, 1, 0, 10, 14000, 20000, 11, 13730, 0, 0, 'Anvilrage Captain - Cast Demoralizing Shout'),
(890302, 8903, 0, 100, 1, 5000, 8000, 9000, 13000, 11, 13737, 1, 0, 'Anvilrage Captain - Cast Mortal Strike'),
(890303, 8903, 0, 100, 1, 2000, 4000, 7000, 11000, 11, 12169, 0, 0, 'Anvilrage Captain - Cast Shield Block'),
(890304, 8903, 13, 100, 1, 9000, 12000, 0, 0, 11, 11972, 1, 0, 'Anvilrage Captain - Cast Shield Bash'),
(890305, 8903, 2, 100, 0, 15, 0, 0, 0, 25, 0, 0, 0, 'Anvilrage Captain - Flee at 15% HP');

-- Anvilrage Footman - EventAI spells dual wield, kick and strike
UPDATE `creature_template` SET `spell1`=15614, `spell2`=15580, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=8892;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=8892;
REPLACE INTO `creature_ai_scripts` (
	`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,
	`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES
(889201, 8892, 4, 100, 0, 0, 0, 0, 0, 11, 674, 0, 0, 'Anvilrage Footman - Cast Dual Wield on Aggro'),
(889202, 8892, 0, 100, 1, 3000, 5000, 5000, 8000, 11, 15580, 1, 0, 'Anvilrage Footman - Cast Strike'),
(889203, 8892, 13, 100, 1, 8000, 12000, 0, 0, 11, 15614, 1, 0, 'Anvilrage Footman - Cast Kick'),
(889204, 8892, 2, 100, 0, 15, 0, 0, 0, 25, 0, 0, 0, 'Anvilrage Footman - Flee at 15% HP');

-- Anvilrage Guardsman - Change spells to disarm, shield block and sunder
UPDATE `creature_template` SET `spell1`=6713, `spell2`=12169, `spell3`=11971, `AIName`='', `ScriptName`='generic_spell_ai' WHERE `entry`=8891;

-- Anvilrage Overseer - Add spell Strike
UPDATE `creature_template` SET `spell1`=15580, `AIName`='', `ScriptName`='generic_spell_ai' WHERE `entry`=8889;

-- Anvilrage Soldier - Re-enable EventAI spells Hamstring, Cleave and Recklessness
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=8893;

-- Anvilrage Warden - EventAI spells Hooked Net and Shield Bash
UPDATE `creature_template` SET `spell1`=14030, `spell2`=11972, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=8890;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=8890;
REPLACE INTO `creature_ai_scripts` (
	`id`,`creature_id`,`event_type`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,
	`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES
(889001, 8890, 9, 100, 1, 5, 30, 13000, 18000, 11, 14030, 1, 0, 'Anvilrage Warden - Cast Hooked Net'),
(889002, 8890, 13, 100, 1, 9000, 12000, 0, 0, 11, 11972, 1, 0, 'Anvilrage Warden - Cast Shield Bash'),
(889003, 8890, 2, 100, 0, 15, 0, 0, 0, 25, 0, 0, 0, 'Anvilrage Warden - Flee at 15% HP');

-- One Anvilrage Medic group missing PW:Fortitude
UPDATE `creature_addon` SET `auras`='13864' WHERE `patch`=0 AND `guid` IN (45857,45858,45859,45861,90640);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
