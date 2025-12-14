DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250530110153');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250530110153');
-- Add your query below.


ALTER TABLE `transports`
	ADD COLUMN `build` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `entry`,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`entry`, `build`);

TRUNCATE TABLE `transports`;
INSERT INTO `transports` (`entry`, `build`, `name`, `period`) VALUES 
(20808, 0, 'Ratchet and Booty Bay', 339575),
(20808, 4695, 'Ratchet and Booty Bay', 350818),
(164871, 0, 'Orgrimmar and Undercity', 360016),
(164871, 4695, 'Orgrimmar and Undercity', 356284),
(175080, 0, 'Grom\'Gol Base Camp and Orgrimmar', 303463),
(176231, 0, 'Menethil Harbor and Theramore Isle', 311153),
(176231, 4695, 'Menethil Harbor and Theramore Isle', 329313),
(176244, 0, 'Teldrassil and Auberdine', 316251),
(176310, 0, 'Menethil Harbor and Auberdine', 283065),
(176310, 4695, 'Menethil Harbor and Auberdine', 295579),
(176495, 0, 'Grom\'Gol Base Camp and Undercity', 333044),
(177233, 0, 'Forgotton Coast and Feathermoon Stronghold', 299437),
(177233, 5464, 'Forgotton Coast and Feathermoon Stronghold', 317040),
(181056, 5464, 'Naxxramas', 1208014);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
