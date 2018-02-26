DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180219001214');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180219001214');
-- Add your query below.


REPLACE INTO `areatrigger_teleport` (`id`, `name`, `required_failed_text`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) 
VALUES (2547, 'Scholomance Kirtonos Balcony', NULL, 1275.05, -2552.03, 90.3994, 3.69);

REPLACE INTO `spell_mod` (`Id`, `rangeIndex`, `Comment`) 
VALUES (17190, 11, 'Ras Frostwhisper Visual Dummy Range');

-- Ras Frostwhisper human form condition
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (5466, 32, 17186);
UPDATE `creature_loot_template` SET `condition_id`=5466 WHERE `item`=13626;

-- The Unforgiven invisibility
UPDATE `creature_ai_scripts` SET `action1_param1`=8203 WHERE `id`=1051601;

-- Remove wrong Death Pact targetting
DELETE FROM `spell_effect_mod` WHERE `Id`=17471;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
