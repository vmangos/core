DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171222185720');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171222185720');
-- Add your query below.


-- Add new creature_spells table.
DROP TABLE IF EXISTS `creature_spells`;
CREATE TABLE IF NOT EXISTS `creature_spells` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `spellId_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_1` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_1` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_1` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellId_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_2` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_2` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_2` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellId_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_3` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_3` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_3` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellId_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_4` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_4` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_4` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellId_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_5` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_5` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_5` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellId_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_6` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_6` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_6` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellId_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_7` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_7` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_7` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellId_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_8` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_8` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_8` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Add creature spells id to creature template.
ALTER TABLE `creature_template`
	ADD COLUMN `spells_template` int(11) unsigned NOT NULL DEFAULT '0' AFTER `spell4`;

-- Varimathas
UPDATE `creature_template` SET `spells_template`=24250, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=2425;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `spellId_4`, `probability_4`, `castTarget_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `spellId_5`, `probability_5`, `castTarget_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `spellId_6`, `probability_6`, `castTarget_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `spellId_7`, `probability_7`, `castTarget_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `spellId_8`, `probability_8`, `castTarget_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`) VALUES (24250, 'Undercity - Varimathras', 20743, 100, 1, 2, 15, 15, 20, 20, 20741, 100, 0, 0, 25, 25, 20, 20, 20740, 100, 5, 0, 20, 20, 15, 25, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (242500, 2425, 11, 0, 100, 0, 0, 0, 0, 0, 11, 7741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Varimathras - Cast Summoned Demon on Spawn');

-- Defias Pillager
UPDATE `creature_template` SET `spells_template`=5890 WHERE `entry`=589;
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `spellId_4`, `probability_4`, `castTarget_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `spellId_5`, `probability_5`, `castTarget_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `spellId_6`, `probability_6`, `castTarget_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `spellId_7`, `probability_7`, `castTarget_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `spellId_8`, `probability_8`, `castTarget_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`) VALUES (5890, 'Westfall - Defias Pillager', 20793, 100, 1, 0, 1, 1, 1, 1, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=589;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (58900, 589, 1, 0, 100, 1, 1000, 1000, 1800000, 1800000, 11, 12544, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Pillager - Cast Frost Armor on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (58901, 589, 4, 0, 15, 0, 0, 0, 0, 0, 1, 1866, 1866, 1867, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Pillager - Random Aggro Say');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (58902, 589, 2, 0, 100, 0, 15, 0, 0, 0, 21, 1, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 'Defias Pillager - Start Combat Movement and Flee at 15% HP (Phase 3)');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
