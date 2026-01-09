DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251218170610');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251218170610');
-- Add your query below.


-- Add spell script for Elune's Candle.
UPDATE `spell_template` SET `script_name`='spell_elunes_candle' WHERE `entry` = 26374;

-- Add spell script for all first aid bandages.
UPDATE `spell_template` SET `script_name`='spell_first_aid' WHERE `mechanic` = 16;

-- Add spell script for paladin bubbles.
UPDATE `spell_template` SET `script_name`='spell_paladin_bubble' WHERE `entry` IN (498, 642, 1020, 1022, 5573, 5599, 10278);

-- Add spell script for holy nova.
UPDATE `spell_template` SET `script_name`='spell_priest_holy_nova' WHERE `entry` IN (15237, 15430, 15431, 27799, 27800, 27801) && `build` > 4222;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
