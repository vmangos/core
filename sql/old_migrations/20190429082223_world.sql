DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190429082223');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190429082223');
-- Add your query below.


-- Add field to set mail template money.
ALTER TABLE `quest_template`
	ADD COLUMN `RewMailMoney` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `RewMailDelaySecs`;

-- Use nagative mail template to mean quest giver should send the mail.
ALTER TABLE `quest_template`
	CHANGE COLUMN `RewMailTemplateId` `RewMailTemplateId` MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `RewSpellCast`;

-- Add mail to quest The Wrath of Neptulon.
UPDATE `quest_template` SET `RewMailTemplateId`=-123, `RewMailDelaySecs`=129600, `RewMailMoney`=1000000 WHERE `entry`=8729;

-- Remove mail text from wrong table.
DELETE FROM `mangos_string` WHERE `entry`=667;

-- Events list for Anachronos
DELETE FROM `creature_ai_events` WHERE `creature_id`=15192;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1519201, 15192, 0, 2, 0, 100, 0, 20, 1, 0, 0, 1519201, 0, 0, 'Anachronos - Despawn at 20\% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=1519201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10658, 0, 0, 0, 0, 0, 0, 0, 0, 'Anachronos - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1519201, 0, 18, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anachronos - Despawn');
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=15192;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
