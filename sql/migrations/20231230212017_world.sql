DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231230212017');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231230212017');
-- Add your query below.


-- Purge R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (370, 24, 0, 0);
-- Purge R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8012, 64, 0, 0);

-- Vampiric Embrace
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (15286, 2, 0, 0);

-- Shadowguard should cause no threat
-- Delete bad fix
DELETE FROM `spell_mod` WHERE `Id`=28377;
DELETE FROM `spell_mod` WHERE `Id`=28378;
DELETE FROM `spell_mod` WHERE `Id`=28379;
DELETE FROM `spell_mod` WHERE `Id`=28380;
DELETE FROM `spell_mod` WHERE `Id`=28381;
DELETE FROM `spell_mod` WHERE `Id`=28382;
-- Correct fix
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (28377, 0, 0, 0, 5464, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (28378, 0, 0, 0, 5464, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (28379, 0, 0, 0, 5464, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (28380, 0, 0, 0, 5464, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (28381, 0, 0, 0, 5464, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (28382, 0, 0, 0, 5464, 5875);

-- Holy Nova heal should cause no threat
-- Delete bad fix
DELETE FROM `spell_mod` WHERE `Id`=23455;
DELETE FROM `spell_mod` WHERE `Id`=23458;
DELETE FROM `spell_mod` WHERE `Id`=23459;
DELETE FROM `spell_mod` WHERE `Id`=27803;
DELETE FROM `spell_mod` WHERE `Id`=27804;
DELETE FROM `spell_mod` WHERE `Id`=27805;
-- Correct fix
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23455, 0, 0, 0, 4499, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23458, 0, 0, 0, 4499, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23459, 0, 0, 0, 4499, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (27803, 0, 0, 0, 5302, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (27804, 0, 0, 0, 5302, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (27805, 0, 0, 0, 5302, 5875);

-- Feral Charge Effect should cause threat
-- Delete bad fix, wrong value and wrong spell
DELETE FROM `spell_threat` WHERE `entry`=16979;
-- Add threat to Feral Charge Effect (52 threat with bear form threat multiplier)
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (19675, 40, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
