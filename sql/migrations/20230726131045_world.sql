DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230726131045');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230726131045');
-- Add your query below.

UPDATE `spell_threat` SET `Threat` = 126 WHERE `entry` = 21992; -- thunderfury single target
UPDATE `spell_threat` SET `Threat` = 126 WHERE `entry` = 27648; -- thunderfury chain

INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (676, 99, 1, 0, 0, 5875); -- Disarm
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (7384, 0, 0.75, 0, 0, 5875); -- Overpower

UPDATE `spell_threat` SET `Threat` = 178 WHERE `entry` = 23922; -- Shield slam R1
UPDATE `spell_threat` SET `Threat` = 203 WHERE `entry` = 23923; -- Shield slam R2
UPDATE `spell_threat` SET `Threat` = 229 WHERE `entry` = 23924; -- Shield slam R3
UPDATE `spell_threat` SET `Threat` = 254 WHERE `entry` = 23925; -- Shield slam R4

DELETE FROM `spell_threat` WHERE `entry` = 72; -- Shield Bash
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (72, 36, 1.5, 0, 0, 5875); -- Shield Bash R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (1671, 96, 1.5, 0, 0, 5875); -- Shield Bash R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (1672, 156, 1.5, 0, 0, 5875); -- Shield Bash R3

UPDATE `spell_threat` SET `Threat` = 63, `multiplier` = 2.25 WHERE `entry` = 6572; -- Revenge R1
UPDATE `spell_threat` SET `Threat` = 108, `multiplier` = 2.25 WHERE `entry` = 6574; -- Revenge R2
UPDATE `spell_threat` SET `Threat` = 153, `multiplier` = 2.25 WHERE `entry` = 7379; -- Revenge R3
UPDATE `spell_threat` SET `Threat` = 198, `multiplier` = 2.25 WHERE `entry` = 11600; -- Revenge R4
UPDATE `spell_threat` SET `Threat` = 243, `multiplier` = 2.25 WHERE `entry` = 11601; -- Revenge R5
UPDATE `spell_threat` SET `Threat` = 270, `multiplier` = 2.25 WHERE `entry` = 25288; -- Revenge R6	

UPDATE `spell_threat` SET `Threat` = 45 WHERE `entry` = 7386; -- Sunder Armor R1
UPDATE `spell_threat` SET `Threat` = 99 WHERE `entry` = 7405; -- Sunder Armor R2
UPDATE `spell_threat` SET `Threat` = 153 WHERE `entry` = 8380; -- Sunder Armor R3
UPDATE `spell_threat` SET `Threat` = 207 WHERE `entry` = 11596; -- Sunder Armor R4
UPDATE `spell_threat` SET `Threat` = 261 WHERE `entry` = 11597; -- Sunder Armor R5

UPDATE `spell_threat` SET `Threat` = 1 WHERE `entry` = 6673; -- Battle Shout R1
UPDATE `spell_threat` SET `Threat` = 12 WHERE `entry` = 5242; -- Battle Shout R2
UPDATE `spell_threat` SET `Threat` = 22 WHERE `entry` = 6192; -- Battle Shout R3
UPDATE `spell_threat` SET `Threat` = 32 WHERE `entry` = 11549; -- Battle Shout R4
UPDATE `spell_threat` SET `Threat` = 42 WHERE `entry` = 11550; -- Battle Shout R5
UPDATE `spell_threat` SET `Threat` = 52 WHERE `entry` = 11551; -- Battle Shout R6
UPDATE `spell_threat` SET `Threat` = 60 WHERE `entry` = 25289; -- Battle Shout R7

UPDATE `spell_threat` SET `Threat` = 11 WHERE `entry` = 1160; -- Demoralizing Shout R1
UPDATE `spell_threat` SET `Threat` = 19 WHERE `entry` = 6190; -- Demoralizing Shout R2
UPDATE `spell_threat` SET `Threat` = 27 WHERE `entry` = 11554; -- Demoralizing Shout R3
UPDATE `spell_threat` SET `Threat` = 35 WHERE `entry` = 11555; -- Demoralizing Shout R4
UPDATE `spell_threat` SET `Threat` = 43 WHERE `entry` = 11556; -- Demoralizing Shout R5

UPDATE `spell_threat` SET `Threat` = 20, `multiplier` = 1.25 WHERE `entry` = 1715; -- Hamstring R1
UPDATE `spell_threat` SET `Threat` = 80, `multiplier` = 1.25 WHERE `entry` = 7372; -- Hamstring R2
UPDATE `spell_threat` SET `Threat` = 135, `multiplier` = 1.25 WHERE `entry` = 7373; -- Hamstring R3

DELETE FROM `spell_threat` WHERE `entry` = 6343; -- Thunderclap R1
DELETE FROM `spell_threat` WHERE `entry` = 8198; -- Thunderclap R2
DELETE FROM `spell_threat` WHERE `entry` = 8204; -- Thunderclap R3
DELETE FROM `spell_threat` WHERE `entry` = 8205; -- Thunderclap R4
DELETE FROM `spell_threat` WHERE `entry` = 11580; -- Thunderclap R5
DELETE FROM `spell_threat` WHERE `entry` = 11581; -- Thunderclap R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (6343, 0, 2.5, 0, 0, 5875); -- Thunder clap generic all ranks

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
