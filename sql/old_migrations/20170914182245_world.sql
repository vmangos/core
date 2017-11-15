DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20170914182245');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20170914182245');
-- Add your query below.

-- ----------------------------------------------------------------------------
-- Missing Diplomat id: 1447

-- A new old town thug text
UPDATE `script_texts` SET  `content_default` = 'All right, boss. You sure though? Just seems like a waste of good practice.' WHERE `entry` = -1999905;
-- An additional old town thug text
INSERT INTO `script_texts` ( `entry`, `content_default`,  `sound`, `type`, `emote`, `language`, `comment` ) VALUES
 ('-1999915', 'Yeah, okay, boss. No problem.', '0', '0', '0', '7', 'SAY_PROGRESS_5_THU');

-- Small corrections to Dashel's text
UPDATE `script_texts` SET  `content_default` = 'It\'s okay, boys. Back off. You\'ve done enough. I\'ll meet up with you later.' WHERE `entry` = -1999904;

-- A "passive" flag for thugs.
UPDATE `creature_template` SET `unit_flags` = '4608' WHERE `entry` = 4969;

-- ----------------------------------------------------------------------------
-- Missing Diplomat id: 1324

-- Additional text for Hendel's friends when they flee.
INSERT INTO `script_texts` ( `entry`, `content_default`,  `sound`, `type`, `emote`, `language`, `comment` ) VALUES
 ('-1999913', 'She\'ll have our heads if we\'re caught!', '0', '0', '0', '7', 'SAY_PROGRESS_7_SEN');

-- A correct text for Tervosh
UPDATE `script_texts` SET  `content_default` = 'Why don\'t we deal with you now, Hendel? Lady Proudmoore will speak to you back in the tower.' WHERE `entry` = -1000411;

INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`,
`EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`,
`EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`)
VALUES ('7077', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '25', '0', '-1', '-1', '-1', '-1', '-1', 'Teleport Visual on target');

-- ----------------------------------------------------------------------------
-- Missing Diplomat id: 1265

-- Removed a wrong area trigger.
DELETE FROM `areatrigger_involvedrelation` WHERE `quest` = 1265;

-- Event starts from area-trigger script.
INSERT INTO `scripted_areatrigger` VALUES ('1667', 'at_sentry_point');

-- A script text for Tervosh
INSERT INTO `script_texts` ( `entry`, `content_default`,  `sound`, `type`, `emote`, `language`, `comment` ) VALUES
 ('-1999914', 'Go with grace, and may the Lady\'s magic protect you.', '0', '0', '0', '7', 'TERVOSH_SAY_ON_QUEST_MD_PT14');

-- Apply a script
UPDATE `creature_template` SET  `ScriptName` = 'npc_archmage_tervosh' WHERE `entry` = 4967;

-- ----------------------------------------------------------------------------
-- Missing Diplomat id: 1249

-- New waypoint path.
DELETE FROM `script_waypoint` WHERE `entry` = 4962;
INSERT INTO `script_waypoint` VALUES ('4962', '0', '-3804.217285', '-830.535889', '10.093100', '0', '');
INSERT INTO `script_waypoint` VALUES ('4962', '1', '-3803.931396', '-833.711426', '10.082294', '0', '');
INSERT INTO `script_waypoint` VALUES ('4962', '2', '-3802.192139', '-836.115906', '10.077620', '0', '');
INSERT INTO `script_waypoint` VALUES ('4962', '3', '-3795.979736', '-836.211731', '10.077620', '0', '');
INSERT INTO `script_waypoint` VALUES ('4962', '4', '-3766.633301', '-838.983643', '11.041057', '0', '');
INSERT INTO `script_waypoint` VALUES ('4962', '5', '-3730.401855', '-840.066040', '12.059516', '0', '');
INSERT INTO `script_waypoint` VALUES ('4962', '6', '-3707.903320', '-851.155701', '10.711342', '0', '');
INSERT INTO `script_waypoint` VALUES ('4962', '7', '-3685.951172', '-846.704224', '10.129030', '0', '');
INSERT INTO `script_waypoint` VALUES ('4962', '8', '-3663.172119', '-837.296509', '9.899283', '0', '');
INSERT INTO `script_waypoint` VALUES ('4962', '9', '-3659.126709', '-839.593018', '9.897782', '0', '');

-- Detail emotes
UPDATE `quest_template` SET  `DetailsEmote1` = '6', `DetailsEmote2` = '1', `DetailsEmote3` = '1',
 `OfferRewardEmote1` = '6',  `OfferRewardEmote2` = '1',  `OfferRewardEmote3` = '1', `OfferRewardEmote4` = '6'
 WHERE `entry` = 1249;

-- Apply a script for Slim's friend
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 4971;
UPDATE `creature_template` SET  `AIName` = '', `ScriptName` = 'npc_slims_friend' WHERE `entry` = 4971;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
