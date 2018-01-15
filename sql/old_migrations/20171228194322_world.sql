DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171228194322');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171228194322');
-- Add your query below.


-- Add creature_spells_scripts table.
DROP TABLE IF EXISTS `creature_spells_scripts`;
CREATE TABLE IF NOT EXISTS `creature_spells_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Add script support to creature_spells table.
ALTER TABLE `creature_spells`
	ADD COLUMN `scriptId_1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `delayRepeatMax_1`,
	ADD COLUMN `scriptId_2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `delayRepeatMax_2`,
	ADD COLUMN `scriptId_3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `delayRepeatMax_3`,
	ADD COLUMN `scriptId_4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `delayRepeatMax_4`,
	ADD COLUMN `scriptId_5` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `delayRepeatMax_5`,
	ADD COLUMN `scriptId_6` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `delayRepeatMax_6`,
	ADD COLUMN `scriptId_7` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `delayRepeatMax_7`,
	ADD COLUMN `scriptId_8` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `delayRepeatMax_8`;

-- Azuregos spawn time 3 days to 7 days.
UPDATE `creature` SET `spawntimesecsmin`=259200, `spawntimesecsmax`=604800 WHERE `id`=6109;

-- Lord Kazzak spawn time 3 days to 7 days.
UPDATE `creature` SET `spawntimesecsmin`=259200, `spawntimesecsmax`=604800 WHERE `id`=12397;

-- Gossip for Spirit of Azuregos.
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=15481;
INSERT INTO `gossip_menu` VALUES (15014, 7898, 0);
DELETE FROM `gossip_scripts` WHERE `id`=7;
UPDATE `gossip_menu_option` SET `action_menu_id`=15014, `action_script_id`=0 WHERE `menu_id`=15013 && `id`=0;

-- Gossip for Azuregos.
UPDATE `creature_template` SET `gossip_menu_id`=15000, `spells_template`=61090, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=6109;
UPDATE `gossip_menu_option` SET `action_menu_id`=-1, `action_script_id`=7 WHERE `menu_id`=15000 && `id`=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=15000 && `id`=1;
DELETE FROM `gossip_menu` WHERE `entry`=15000 && `text_id`!=7880;
DELETE FROM `gossip_scripts` WHERE `id`=15000;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `dataint`, `data_flags`, `comments`) VALUES
(7, 0, 0, 0, 11017, 0, 'Azuregos - Say Text 1'),
(7, 0, 22, 168, 0, 2, 'Azuregos - Set Faction to Enemy'),
(7, 1, 26, 0, 0, 0, 'Azuregos - Attack Player');

-- EventAI script for Azuregos.
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (610900, 6109, 4, 0, 100, 0, 0, 0, 0, 0, 1, 9072, 0, 0, 11, 23184, 0, 34, 0, 0, 0, 0, 'Azuregos - Aggro - Say Text and Cast Mark of Frost');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (610901, 6109, 7, 0, 100, 0, 0, 0, 0, 0, 28, 0, 23184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azuregos - Evade - Remove Mark of Frost aura');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (610902, 6109, 5, 0, 100, 1, 10000, 10000, 0, 0, 1, 9073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azuregos - Killed Played- Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (610903, 6109, 1, 0, 100, 1, 3000, 5000, 3000, 5000, 11, 23185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Azuregos - Out of Combat - Cast Aura of Frost');

-- Adding creature_spells template for Azuregos.
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (61090, 'Azshara - Azuregos', 23185, 100, 0, 0, 0, 0, 3, 5, 0, 21147, 100, 0, 0, 20, 20, 30, 45, 21147, 21098, 100, 1, 0, 14, 14, 22, 29, 0, 21099, 100, 1, 0, 12, 12, 10, 20, 0, 21097, 100, 4, 0, 16, 16, 11, 22, 0, 22067, 100, 0, 0, 21, 21, 20, 35, 0, 15613, 100, 1, 0, 7, 7, 7, 7, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0);

-- Script when casting Arcane Vacuum
INSERT INTO `creature_spells_scripts` (`id`, `delay`, `command`, `dataint`, `comments`) VALUES (21147, 0, 0, 9071, 'Azuregos - Arcane Vacuum - Say Text');

-- Removing old script texts.
DELETE FROM `script_texts` WHERE `entry` IN (-1000006, -1000098, -1000099, -1000100);

-- Updating chat type to zone yell.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID` IN (9071, 9072, 9073);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
