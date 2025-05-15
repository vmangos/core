DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250509225512');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250509225512');
-- Add your query below.


-- Brother Sarno's greeting script should be assigned to the areatrigger.
DELETE FROM `areatrigger_scripts` WHERE `id`=1125;
INSERT INTO `areatrigger_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1125, 0, 0, 0, 0, 0, 0, 0, 7917, 50, 10, 18, 3988, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Sarno - Say Text');
UPDATE `broadcast_text` SET `emote_id1`=3 WHERE `entry`=3988;
UPDATE `areatrigger_template` SET `name`='Stormwind City - Cathedral of Light Entrance', `script_id`=1125, `cooldown`=30 WHERE `id`=1125;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (791702);
DELETE FROM `creature_ai_events` WHERE `creature_id`=7917;
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=7917;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
