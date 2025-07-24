DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250526172904');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250526172904');
-- Add your query below.


-- Shield Bash, Shield Slam
-- NOTE: vanilla only mechanic, patched out in 2.0.1
UPDATE `spell_template` SET `customFlags`=(`customFlags` | 0x2000) WHERE `entry` IN (72, 1671, 1672, 8242, 11972, 15655, 23922, 23923, 23924, 23925);

-- Bloodthirt and Execute
UPDATE `spell_template` SET `customFlags`=(`customFlags` | 0x2000) WHERE `entry` IN (20647, 23881, 23892, 23893, 23894);

-- Judgement of Command and Seal of Command
UPDATE `spell_template` SET `customFlags`=(`customFlags` | 0x2000) WHERE `entry` IN (20424, 20467, 20963, 20964, 20965, 20966);

-- Judgement of Righteousness
UPDATE `spell_template` SET `customFlags`=(`customFlags` | 0x2000) WHERE `entry` IN (20187, 20280, 20281, 20282, 20283, 20284, 20285, 20286);

-- Stormstrike
UPDATE `spell_template` SET `customFlags`=(`customFlags` | 0x2000) WHERE `entry` IN (17364);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
