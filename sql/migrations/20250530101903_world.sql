DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250530101903');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250530101903');
-- Add your query below.


-- Ratchet and Booty Bay
UPDATE `transports` SET `period`=350818 WHERE `entry`=20808;
-- Orgrimmar and Undercity
UPDATE `transports` SET `period`=356284 WHERE `entry`=164871;
-- Grom'Gol Base Camp and Orgrimmar
UPDATE `transports` SET `period`=303463 WHERE `entry`=175080;
-- Menethil Harbor and Theramore Isle
UPDATE `transports` SET `period`=329313 WHERE `entry`=176231;
-- Teldrassil and Auberdine
UPDATE `transports` SET `period`=316251 WHERE `entry`=176244;
-- Menethil Harbor and Auberdine
UPDATE `transports` SET `period`=295579 WHERE `entry`=176310;
-- Forgotton Coast and Feathermoon Stronghold
UPDATE `transports` SET `period`=317040 WHERE `entry`=177233;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
