DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260607172947');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260607172947');
-- Add your query below.


CREATE TABLE IF NOT EXISTS `creature_charm_spells` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature entry',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `availability` float NOT NULL DEFAULT '100' COMMENT 'Chance for creature to spawn with that spell on pet bar',
  `spell_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cooldown_min` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cooldown_max` smallint(5) unsigned NOT NULL DEFAULT '0',
  `patch_min` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum content patch to load this entry',
  `patch_max` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT 'Maximum content patch to load this entry',
  PRIMARY KEY (`entry`,`slot`,`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System (spells under charm)';

-- Kobold Miner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (40, 0, 100, 6016, 28, 40, 0, 10); -- Pierce Armor

-- Murloc Forager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (46, 0, 100, 3368, 24, 25, 0, 10); -- Drink Minor Potion

-- Ruklar the Trapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (60, 0, 100, 6016, 14, 27, 0, 10); -- Pierce Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (60, 1, 100, 12024, 16, 18, 0, 10); -- Net

-- Thuros Lightfingers
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (61, 0, 100, 7159, 10, 10, 0, 10); -- Backstab

-- Narg the Taskmaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (79, 0, 100, 9128, 10, 15, 0, 10); -- Battle Shout

-- Defias Cutpurse
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (94, 0, 100, 53, 10, 10, 0, 10); -- Backstab

-- Defias Smuggler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (95, 0, 100, 53, 10, 10, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (95, 1, 100, 10277, 10, 10, 0, 10); -- Throw

-- Riverpaw Taskmaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (98, 0, 100, 3229, 5, 15, 0, 10); -- Quick Bloodlust

-- Morgaine the Sly
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (99, 1, 100, 1776, 10, 24, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (99, 2, 100, 53, 10, 10, 0, 10); -- Backstab

-- Garrick Padfoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (103, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Harvest Reaper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (115, 0, 100, 7342, 12, 18, 0, 10); -- Wide Slash

-- Defias Bandit
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (116, 0, 100, 8646, 32, 57, 0, 10); -- Snap Kick

-- Defias Pathstalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (121, 0, 100, 7159, 10, 10, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (121, 1, 100, 11972, 25, 40, 0, 10); -- Shield Bash

-- Defias Highwayman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (122, 0, 100, 53, 10, 10, 0, 10); -- Backstab

-- Riverpaw Mongrel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (123, 0, 100, 8016, 40, 56, 0, 10); -- Spirit Decay

-- Riverpaw Brute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (124, 0, 100, 13730, 11, 26, 0, 10); -- Demoralizing Shout

-- Riverpaw Overseer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (125, 0, 100, 3136, 25, 34, 0, 10); -- Frenzied Command

-- Murloc Coastrunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (126, 0, 70, 7357, 29, 41, 0, 10); -- Poisonous Stab

-- Murloc Tidehunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (127, 0, 100, 11831, 21, 24, 0, 10); -- Frost Nova

-- Nightbane Dark Runner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (205, 0, 100, 6595, 10, 10, 0, 10); -- Exploit Weakness

-- Nightbane Vile Fang
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (206, 0, 100, 3427, 17, 25, 0, 10); -- Infected Wound

-- Splinter Fist Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (212, 0, 100, 5242, 10, 10, 0, 10); -- Battle Shout

-- Defias Night Runner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (215, 0, 100, 2589, 10, 10, 0, 10); -- Backstab

-- Grave Robber
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (218, 0, 100, 6595, 10, 10, 0, 10); -- Exploit Weakness

-- Zzarc' Vul
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (300, 0, 100, 8716, 19, 20, 0, 10); -- Low Swipe

-- Gath'Ilzogg
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (334, 0, 100, 11972, 5, 5, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (334, 1, 100, 3427, 10, 10, 0, 10); -- Infected Wound
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (334, 2, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Old Murk-Eye
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (391, 0, 100, 3584, 20, 26, 0, 10); -- Volatile Infection

-- Morganth
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (397, 0, 100, 20811, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (397, 1, 100, 706, 10, 10, 0, 10); -- Demon Armor

-- Imp
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (416, 0, 100, 3110, 0, 0, 0, 10); -- Firebolt

-- Felhunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (417, 0, 100, 19505, 10, 10, 0, 10); -- Devour Magic

-- Redridge Mongrel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (423, 0, 100, 3427, 18, 19, 0, 10); -- Infected Wound

-- Redridge Poacher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (424, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Shadowhide Darkweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (429, 0, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (429, 1, 100, 5740, 18, 30, 0, 10); -- Rain of Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (429, 2, 100, 6205, 10, 10, 0, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (429, 3, 100, 706, 10, 10, 0, 10); -- Demon Armor

-- Redridge Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (430, 0, 100, 20802, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (430, 1, 100, 547, 20, 20, 0, 10); -- Healing Wave

-- Shadowhide Slayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (431, 0, 100, 7160, 10, 10, 0, 10); -- Execute

-- Rabid Shadowhide Gnoll
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (434, 0, 100, 744, 5, 14, 0, 10); -- Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (434, 1, 100, 3150, 11, 56, 0, 10); -- Rabies

-- Blackrock Champion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (435, 0, 100, 3019, 22, 27, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (435, 1, 100, 8258, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (435, 2, 100, 6190, 10, 10, 0, 10); -- Demoralizing Shout

-- Blackrock Shadowcaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (436, 0, 100, 3019, 30, 43, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (436, 1, 100, 706, 10, 10, 0, 10); -- Demon Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (436, 2, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (436, 3, 100, 970, 4, 5, 0, 10); -- Shadow Word: Pain

-- Blackrock Renegade
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (437, 0, 100, 8242, 20, 25, 0, 10); -- Shield Slam
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (437, 1, 100, 3019, 13, 18, 0, 10); -- Enrage

-- Blackrock Grunt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (440, 0, 100, 3019, 17, 28, 0, 10); -- Enrage

-- Redridge Alpha
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (445, 0, 100, 5242, 10, 10, 0, 10); -- Battle Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (445, 1, 100, 8198, 10, 10, 0, 10); -- Thunder Clap
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (445, 2, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Redridge Basher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (446, 0, 100, 5164, 14, 15, 0, 10); -- Knockdown
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (446, 1, 100, 1671, 13, 14, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (446, 2, 100, 71, 10, 10, 0, 10); -- Defensive Stance

-- Hogger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (448, 0, 100, 6730, 15, 24, 0, 10); -- Head Butt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (448, 1, 100, 6016, 9, 15, 0, 10); -- Pierce Armor

-- Defias Knuckleduster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (449, 0, 100, 12555, 5, 8, 0, 10); -- Pummel

-- Defias Renegade Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (450, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (450, 1, 100, 134, 29, 35, 0, 10); -- Fire Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (450, 2, 100, 4979, 0, 0, 0, 10); -- Quick Flame Ward

-- Riverpaw Bandit
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (452, 0, 100, 53, 10, 10, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (452, 1, 100, 7357, 18, 59, 0, 10); -- Poisonous Stab

-- Riverpaw Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (453, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (453, 1, 100, 913, 20, 20, 0, 10); -- Healing Wave

-- Murloc Minor Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (456, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (456, 1, 100, 332, 20, 20, 0, 10); -- Healing Wave

-- Murloc Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (458, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Lieutenant Doren
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (469, 1, 100, 6253, 10, 10, 0, 10); -- Backhand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (469, 2, 100, 23600, 11, 17, 0, 10); -- Piercing Howl
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (469, 3, 100, 19134, 10, 10, 0, 10); -- Intimidating Shout

-- Fedfennel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (472, 0, 100, 13730, 13, 14, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (472, 1, 100, 3238, 23, 27, 0, 10); -- Nimble Reflexes

-- Morgan the Collector
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (473, 0, 100, 7159, 0, 0, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (473, 1, 100, 1776, 7, 8, 0, 10); -- Gouge

-- Defias Rogue Wizard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (474, 0, 100, 13322, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (474, 1, 100, 12544, 14, 30, 0, 10); -- Frost Armor

-- Kobold Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (476, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (476, 1, 100, 12544, 5, 30, 0, 10); -- Frost Armor

-- Riverpaw Outrunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (478, 0, 100, 3391, 10, 30, 0, 10); -- Thrash

-- Rusty Harvest Golem
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (480, 0, 100, 8014, 23, 38, 0, 10); -- Tetanus

-- Defias Footpad
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (481, 0, 100, 7159, 5, 6, 0, 10); -- Backstab

-- Blackrock Outrunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (485, 0, 100, 3019, 17, 30, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (485, 1, 100, 6533, 17, 30, 0, 10); -- Net

-- Tharil'zun
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (486, 0, 100, 6533, 15, 28, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (486, 1, 100, 3019, 10, 17, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (486, 2, 100, 3631, 10, 10, 0, 10); -- Battle Fury

-- Riverpaw Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (500, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Riverpaw Herbalist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (501, 0, 100, 3369, 10, 10, 0, 10); -- Potion Strength II

-- Defias Trapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (504, 0, 100, 12024, 19, 30, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (504, 1, 100, 2589, 10, 10, 0, 10); -- Backstab

-- Sergeant Brashclaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (506, 0, 100, 3136, 10, 13, 0, 10); -- Frenzied Command
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (506, 1, 100, 5164, 10, 10, 0, 10); -- Knockdown

-- Fenros
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (507, 0, 100, 865, 7, 15, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (507, 1, 100, 12544, 10, 10, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (507, 2, 100, 6725, 0, 0, 0, 10); -- Flame Spike

-- Murloc Netter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (513, 0, 100, 12024, 16, 20, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (513, 1, 100, 11971, 6, 15, 0, 10); -- Sunder Armor

-- Murloc Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (517, 1, 100, 9734, 0, 0, 0, 10); -- Holy Smite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (517, 2, 100, 6074, 20, 20, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (517, 3, 100, 4980, 0, 0, 0, 10); -- Quick Frost Ward

-- Brack
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (520, 0, 100, 6016, 14, 29, 0, 10); -- Pierce Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (520, 1, 100, 9080, 24, 28, 0, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (520, 2, 100, 11976, 5, 14, 0, 10); -- Strike

-- Nightbane Shadow Weaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (533, 0, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (533, 1, 100, 992, 68, 71, 0, 10); -- Shadow Word: Pain

-- Nefaru
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (534, 0, 100, 8715, 8, 14, 0, 10); -- Terrifying Howl
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (534, 1, 100, 3604, 10, 11, 0, 10); -- Tendon Rip

-- Murloc Nightcrawler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (544, 0, 100, 2589, 10, 10, 0, 10); -- Backstab

-- Murloc Tidecaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (545, 0, 100, 122, 10, 14, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (545, 1, 100, 913, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (545, 2, 100, 10, 21, 26, 0, 10); -- Blizzard

-- Murloc Minor Tidecaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (548, 0, 100, 547, 25, 25, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (548, 1, 100, 9672, 0, 0, 0, 10); -- Frostbolt

-- Shadowhide Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (568, 0, 100, 7405, 8, 10, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (568, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Foe Reaper 4000
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (573, 0, 100, 5568, 7, 11, 0, 10); -- Trample

-- Shadowhide Assassin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (579, 1, 100, 2590, 10, 10, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (579, 2, 100, 744, 14, 27, 0, 10); -- Poison

-- Kazon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (584, 0, 100, 6253, 10, 15, 0, 10); -- Backhand

-- Bloodscalp Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (587, 0, 100, 11972, 5, 10, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (587, 1, 100, 6713, 11, 20, 0, 10); -- Disarm

-- Defias Pillager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (589, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (589, 2, 100, 12544, 9, 12, 0, 10); -- Frost Armor

-- Defias Looter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (590, 0, 100, 7159, 5, 5, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (590, 1, 100, 6713, 37, 39, 0, 10); -- Disarm

-- Defias Henchman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (594, 0, 100, 8242, 31, 60, 0, 10); -- Shield Slam
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (594, 1, 100, 3248, 30, 60, 0, 10); -- Improved Blocking

-- Bloodscalp Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (595, 0, 100, 10277, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (595, 1, 100, 6533, 16, 23, 0, 10); -- Net

-- Defias Miner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (598, 0, 100, 6016, 12, 22, 0, 10); -- Pierce Armor

-- Blackrock Tracker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (615, 0, 100, 3019, 19, 30, 0, 10); -- Enrage

-- Defias Conjurer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (619, 1, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (619, 2, 100, 12544, 5, 6, 0, 10); -- Frost Armor

-- Goblin Engineer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (622, 1, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Defias Overseer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (634, 0, 100, 5115, 22, 39, 0, 10); -- Battle Command

-- Defias Blackguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (636, 0, 100, 1785, 10, 10, 0, 10); -- Stealth
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (636, 2, 100, 14903, 10, 10, 0, 10); -- Rupture

-- Sneed's Shredder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (642, 0, 100, 7399, 31, 66, 0, 10); -- Terrify
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (642, 1, 100, 3603, 15, 18, 0, 10); -- Distracting Pain

-- Skullsplitter Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (667, 0, 100, 3148, 5, 42, 0, 10); -- Head Crack
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (667, 1, 100, 11972, 5, 15, 0, 10); -- Shield Bash

-- Skullsplitter Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (669, 0, 100, 3148, 16, 55, 0, 10); -- Head Crack
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (669, 1, 100, 3391, 21, 30, 0, 10); -- Thrash

-- Bloodscalp Headhunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (671, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Skullsplitter Spiritchaser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (672, 0, 100, 11986, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (672, 1, 100, 11981, 7, 14, 0, 10); -- Mana Burn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (672, 2, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Mosh'Ogg Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (678, 0, 100, 5164, 14, 25, 0, 10); -- Knockdown

-- Mosh'Ogg Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (679, 0, 100, 6742, 5, 27, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (679, 1, 100, 15659, 0, 0, 0, 10); -- Chain Lightning

-- Mosh'Ogg Lord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (680, 0, 100, 9128, 10, 20, 0, 10); -- Battle Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (680, 1, 100, 7093, 10, 20, 0, 10); -- Intimidation

-- Bloodscalp Axe Thrower
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (694, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Skullsplitter Axe Thrower
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (696, 0, 100, 3148, 31, 55, 0, 10); -- Head Crack
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (696, 1, 100, 10277, 10, 10, 0, 10); -- Throw

-- Bloodscalp Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (697, 0, 100, 11969, 21, 41, 0, 10); -- Fire Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (697, 1, 100, 8788, 10, 11, 0, 10); -- Lightning Shield

-- Bloodscalp Beastmaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (699, 1, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Bloodscalp Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (701, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (701, 1, 100, 11986, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (701, 2, 100, 4979, 11, 29, 0, 10); -- Quick Flame Ward

-- Bloodscalp Scavenger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (702, 0, 100, 7159, 10, 10, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (702, 1, 100, 744, 33, 34, 0, 10); -- Poison

-- Mosh'Ogg Warmonger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (709, 0, 100, 8147, 10, 15, 0, 10); -- Thunderclap

-- Mosh'Ogg Spellcrafter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (710, 0, 100, 12468, 6, 10, 0, 10); -- Flamestrike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (710, 1, 100, 14034, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (710, 2, 100, 12544, 11, 30, 0, 10); -- Frost Armor

-- Ardo Dirtpaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (711, 0, 100, 3650, 0, 0, 0, 10); -- Sling Mud
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (711, 1, 100, 3256, 5, 10, 0, 10); -- Plague Cloud

-- Ironforge Mountaineer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (727, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Murloc Lurker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (732, 0, 100, 7159, 10, 10, 0, 10); -- Backstab

-- Marsh Inkspewer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (750, 0, 100, 9612, 20, 42, 0, 10); -- Ink Spray

-- Marsh Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (752, 0, 100, 11986, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (752, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (752, 2, 100, 12550, 12, 14, 0, 10); -- Lightning Shield

-- Lost One Mudlurker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (755, 0, 100, 7159, 5, 5, 0, 10); -- Backstab

-- Lost One Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (759, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (759, 1, 100, 8806, 24, 43, 0, 10); -- Poisoned Shot

-- Lost One Muckdweller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (760, 0, 100, 3256, 30, 42, 0, 10); -- Plague Cloud

-- Lost One Riftseeker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (762, 0, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (762, 2, 100, 9614, 20, 59, 0, 10); -- Rift Beacon

-- Skullsplitter Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (780, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (780, 2, 100, 11986, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (780, 3, 100, 4980, 7, 8, 0, 10); -- Quick Frost Ward

-- Skullsplitter Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (782, 0, 100, 3148, 12, 59, 0, 10); -- Head Crack

-- Skullsplitter Berserker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (783, 2, 100, 3148, 17, 60, 0, 10); -- Head Crack

-- Grik'nir the Cold
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (808, 0, 100, 6957, 5, 5, 0, 10); -- Frostmane Strength
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (808, 1, 100, 21030, 6, 10, 0, 10); -- Frost Shock

-- Colonel Kurzen
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (813, 1, 100, 8817, 15, 25, 0, 10); -- Smoke Bomb
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (813, 2, 100, 8818, 10, 10, 0, 10); -- Garrote

-- Sergeant Malthus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (814, 1, 100, 7068, 5, 15, 0, 10); -- Veil of Shadow

-- Bookie Herod
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (815, 1, 100, 20816, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (815, 2, 100, 1086, 10, 10, 0, 10); -- Demon Armor

-- Mai'Zoth
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (818, 0, 100, 8398, 4, 5, 0, 10); -- Frostbolt Volley
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (818, 1, 100, 12544, 11, 30, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (818, 2, 100, 8814, 17, 20, 0, 10); -- Flame Spike

-- Servant of Ilgalar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (819, 0, 100, 8129, 21, 44, 0, 10); -- Mana Burn

-- Saltscale Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (873, 0, 100, 959, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (873, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Saltscale Tide Lord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (875, 0, 100, 12544, 10, 10, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (875, 1, 100, 20822, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (875, 2, 100, 6131, 10, 30, 0, 10); -- Frost Nova

-- Saltscale Forager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (877, 0, 100, 744, 10, 10, 0, 10); -- Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (877, 1, 100, 13443, 20, 20, 0, 10); -- Rend

-- Saltscale Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (879, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Surena Caledon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (881, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (881, 1, 100, 12544, 10, 10, 0, 10); -- Frost Armor

-- Splinter Fist Fire Weaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (891, 0, 100, 19816, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (891, 1, 100, 20296, 15, 15, 0, 10); -- Flamestrike

-- Splinter Fist Taskmaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (892, 0, 100, 3631, 10, 10, 0, 10); -- Battle Fury

-- Defias Night Blade
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (909, 0, 100, 744, 33, 45, 0, 10); -- Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (909, 1, 100, 2589, 10, 10, 0, 10); -- Backstab

-- Defias Enchanter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (910, 0, 100, 3443, 5, 9, 0, 10); -- Enchanted Quickness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (910, 1, 100, 12544, 10, 10, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (910, 2, 100, 20811, 0, 0, 0, 10); -- Fireball

-- Nightbane Tainted One
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (920, 0, 100, 3424, 20, 30, 0, 10); -- Tainted Howl

-- Kurzen Commando
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (938, 1, 100, 2591, 10, 10, 0, 10); -- Backstab

-- Kurzen Elite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (939, 1, 100, 17207, 10, 15, 0, 10); -- Whirlwind
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (939, 2, 100, 15496, 5, 10, 0, 10); -- Cleave

-- Kurzen Medicine Man
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (940, 0, 100, 588, 5, 8, 0, 10); -- Inner Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (940, 1, 100, 6064, 20, 30, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (940, 2, 100, 6077, 12, 20, 0, 10); -- Renew

-- Kurzen Headshrinker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (941, 0, 100, 7289, 16, 30, 0, 10); -- Shrink
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (941, 1, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt

-- Kurzen Witch Doctor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (942, 1, 100, 370, 24, 25, 0, 10); -- Purge

-- Kurzen Wrangler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (943, 0, 100, 6533, 16, 28, 0, 10); -- Net

-- Frostmane Novice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (946, 0, 100, 6949, 0, 0, 0, 10); -- Weak Frostbolt

-- Rohh the Silent
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (947, 0, 100, 2590, 10, 10, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (947, 2, 100, 744, 10, 10, 0, 10); -- Poison

-- Kurzen Subchief
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (978, 1, 100, 8053, 5, 10, 0, 10); -- Flame Shock

-- Kurzen Shadow Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (979, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (979, 1, 100, 8806, 18, 27, 0, 10); -- Poisoned Shot

-- Mosshide Mongrel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1008, 0, 100, 8016, 10, 59, 0, 10); -- Spirit Decay

-- Mosshide Mistweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1009, 0, 100, 20792, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1009, 1, 100, 12544, 10, 10, 0, 10); -- Frost Armor

-- Mosshide Trapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1011, 1, 100, 6533, 16, 27, 0, 10); -- Net

-- Mosshide Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1013, 1, 100, 11986, 19, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1013, 2, 100, 11436, 20, 45, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1013, 3, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Mosshide Alpha
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1014, 2, 100, 9128, 10, 19, 0, 10); -- Battle Shout

-- Bluegill Forager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1026, 0, 100, 14873, 5, 15, 0, 10); -- Sinister Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1026, 1, 100, 744, 13, 31, 0, 10); -- Poison

-- Bluegill Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1027, 0, 100, 9080, 27, 57, 0, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1027, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Bluegill Muckdweller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1028, 0, 100, 1777, 8, 11, 0, 10); -- Gouge

-- Bluegill Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1029, 0, 100, 939, 20, 20, 0, 10); -- Healing Wave

-- Dragonmaw Raider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1034, 1, 100, 6533, 15, 29, 0, 10); -- Net

-- Dragonmaw Swamprunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1035, 0, 100, 744, 5, 20, 0, 10); -- Poison

-- Dragonmaw Centurion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1036, 0, 100, 643, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1036, 1, 100, 1672, 5, 10, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1036, 2, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Dragonmaw Battlemaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1037, 1, 100, 3019, 15, 30, 0, 10); -- Enrage

-- Dragonmaw Shadowwarder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1038, 0, 100, 706, 10, 10, 0, 10); -- Demon Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1038, 1, 100, 20807, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1038, 2, 100, 6223, 19, 24, 0, 10); -- Corruption

-- Dark Iron Dwarf
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1051, 0, 100, 7891, 15, 30, 0, 10); -- Gift of Ragnaros

-- Dark Iron Saboteur
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1052, 0, 100, 7891, 15, 20, 0, 10); -- Gift of Ragnaros

-- Dark Iron Tunneler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1053, 0, 100, 7891, 15, 20, 0, 10); -- Gift of Ragnaros
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1053, 1, 100, 7405, 6, 7, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1053, 2, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Dark Iron Demolitionist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1054, 0, 100, 8858, 0, 0, 0, 10); -- Bomb
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1054, 1, 100, 7891, 6, 19, 0, 10); -- Gift of Ragnaros

-- Dragonmaw Bonewarder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1057, 0, 100, 707, 14, 40, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1057, 1, 100, 706, 10, 10, 0, 10); -- Demon Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1057, 3, 100, 6205, 10, 10, 0, 10); -- Curse of Weakness

-- Ana'thek the Cruel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1059, 0, 100, 9791, 0, 0, 0, 10); -- Head Crack
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1059, 1, 100, 7160, 20, 20, 0, 10); -- Execute

-- Mogh the Undying
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1060, 0, 100, 12471, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1060, 1, 100, 696, 10, 10, 0, 10); -- Demon Skin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1060, 2, 100, 8809, 10, 10, 0, 10); -- Slave Drain

-- Nezzliok the Dire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1062, 1, 100, 421, 0, 0, 0, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1062, 2, 100, 2610, 9, 14, 0, 10); -- Shock

-- Riverpaw Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1065, 0, 100, 774, 20, 20, 0, 10); -- Rejuvenation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1065, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Murloc Shorestriker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1083, 0, 100, 6268, 5, 5, 0, 10); -- Rushing Charge

-- Venture Co. Geologist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1096, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1096, 1, 100, 4979, 0, 0, 0, 10); -- Quick Flame Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1096, 2, 100, 184, 10, 15, 0, 10); -- Fire Shield II

-- Venture Co. Mechanic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1097, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1097, 1, 100, 14443, 15, 18, 0, 10); -- Multi-Shot

-- Lost One Cook
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1106, 0, 100, 11962, 10, 15, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1106, 1, 100, 11428, 5, 15, 0, 10); -- Knockdown

-- Rockjaw Skullthumper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1115, 0, 100, 3148, 47, 60, 0, 10); -- Head Crack

-- Rockjaw Ambusher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1116, 0, 100, 7159, 0, 0, 0, 10); -- Backstab

-- Rockjaw Bonesnapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1117, 0, 100, 5164, 15, 30, 0, 10); -- Knockdown

-- Frostmane Snowstrider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1121, 0, 100, 467, 10, 10, 0, 10); -- Thorns
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1121, 1, 100, 6950, 0, 0, 0, 10); -- Faerie Fire

-- Frostmane Hideskinner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1122, 0, 100, 7159, 10, 10, 0, 10); -- Backstab

-- Frostmane Headhunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1123, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Frostmane Shadowcaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1124, 0, 100, 20791, 4, 5, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1124, 1, 100, 20798, 9, 10, 0, 10); -- Demon Skin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1124, 2, 100, 11980, 10, 10, 0, 10); -- Curse of Weakness

-- Young Wendigo
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1134, 0, 100, 3131, 6, 10, 0, 10); -- Frost Breath

-- Wendigo
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1135, 0, 100, 3131, 6, 10, 0, 10); -- Frost Breath

-- Edan the Howler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1137, 0, 100, 3129, 6, 7, 0, 10); -- Frost Breath

-- Mosh'Ogg Witch Doctor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1144, 2, 100, 11980, 36, 39, 0, 10); -- Curse of Weakness

-- Stonesplinter Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1162, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Stonesplinter Skullthumper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1163, 0, 100, 1776, 6, 7, 0, 10); -- Gouge

-- Stonesplinter Bonesnapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1164, 0, 100, 11976, 6, 15, 0, 10); -- Strike

-- Stonesplinter Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1165, 0, 100, 2120, 10, 15, 0, 10); -- Flamestrike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1165, 1, 100, 4979, 0, 0, 0, 10); -- Quick Flame Ward

-- Stonesplinter Seer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1166, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Stonesplinter Digger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1167, 0, 100, 7386, 6, 20, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1167, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Dark Iron Insurgent
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1169, 0, 100, 7020, 31, 40, 0, 10); -- Stoneform

-- Tunnel Rat Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1173, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Tunnel Rat Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1174, 0, 100, 134, 0, 0, 0, 10); -- Fire Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1174, 1, 100, 4979, 0, 0, 0, 10); -- Quick Flame Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1174, 2, 100, 2136, 6, 14, 0, 10); -- Fire Blast

-- Tunnel Rat Digger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1175, 0, 100, 7386, 8, 10, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1175, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Tunnel Rat Forager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1176, 0, 100, 7365, 28, 59, 0, 10); -- Bottle of Poison

-- Mo'grosh Ogre
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1178, 0, 100, 5164, 24, 35, 0, 10); -- Knockdown

-- Mo'grosh Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1179, 0, 100, 8198, 16, 17, 0, 10); -- Thunder Clap
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1179, 1, 100, 13730, 6, 25, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1179, 2, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Mo'grosh Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1181, 0, 100, 3229, 0, 0, 0, 10); -- Quick Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1181, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Mo'grosh Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1183, 0, 100, 547, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1183, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Stonesplinter Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1197, 0, 100, 547, 20, 20, 0, 10); -- Healing Wave

-- Morbent Fel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1200, 0, 100, 3108, 0, 0, 0, 10); -- Touch of Death
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1200, 1, 100, 3109, 17, 24, 0, 10); -- Presence of Death
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1200, 2, 100, 8909, 10, 10, 0, 10); -- Unholy Shield

-- Tunnel Rat Kobold
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1202, 0, 100, 3391, 20, 30, 0, 10); -- Thrash

-- Grawmug
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1205, 0, 100, 3229, 6, 9, 0, 10); -- Quick Bloodlust

-- Gnasher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1206, 0, 100, 3393, 7, 12, 0, 10); -- Consume Flesh

-- Brawler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1207, 0, 100, 6253, 4, 10, 0, 10); -- Backhand

-- Chok'sul
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1210, 0, 100, 18072, 12, 15, 0, 10); -- Uppercut

-- Leper Gnome
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1211, 0, 100, 6951, 24, 40, 0, 10); -- Decayed Strength

-- Kobold Digger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1236, 0, 100, 6016, 12, 18, 0, 10); -- Pierce Armor

-- Splinter Fist Firemonger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1251, 0, 100, 184, 0, 0, 0, 10); -- Fire Shield II
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1251, 1, 100, 4979, 0, 0, 0, 10); -- Quick Flame Ward

-- Gobbler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1259, 0, 100, 12097, 15, 29, 0, 10); -- Pierce Armor

-- Great Father Arctikus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1260, 0, 100, 465, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1260, 1, 100, 139, 43, 59, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1260, 2, 100, 2053, 25, 25, 0, 10); -- Lesser Heal

-- Old Icebeard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1271, 0, 100, 3145, 10, 10, 0, 10); -- Icy Grasp
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1271, 1, 100, 3146, 0, 0, 0, 10); -- Daunting Growl

-- Vagash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1388, 0, 100, 3143, 15, 19, 0, 10); -- Glacial Roar

-- Berserk Trogg
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1393, 0, 100, 3019, 20, 40, 0, 10); -- Enrage

-- Frostmane Seer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1397, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1397, 1, 100, 324, 10, 10, 0, 10); -- Lightning Shield

-- Boss Galgosh
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1398, 1, 100, 3019, 13, 25, 0, 10); -- Enrage

-- Magosh
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1399, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1399, 1, 100, 2606, 5, 13, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1399, 2, 100, 913, 20, 20, 0, 10); -- Healing Wave

-- Bluegill Raider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1418, 0, 100, 10277, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1418, 1, 100, 12024, 15, 30, 0, 10); -- Net

-- Stormwind Guard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1423, 0, 100, 12169, 5, 15, 0, 10); -- Shield Block
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1423, 1, 100, 12170, 5, 10, 0, 10); -- Revenge

-- Master Digger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1424, 0, 100, 6546, 14, 15, 0, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1424, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1424, 2, 100, 25710, 11, 15, 0, 10); -- Heroic Strike

-- Grizlak
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1425, 0, 100, 6074, 20, 20, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1425, 1, 100, 1244, 10, 10, 0, 10); -- Power Word: Fortitude

-- Riverpaw Miner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1426, 0, 100, 11971, 11, 15, 0, 10); -- Sunder Armor

-- Splinter Fist Enslaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1487, 0, 100, 6533, 21, 22, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1487, 1, 100, 10277, 10, 10, 0, 10); -- Throw

-- Zanzil Witch Doctor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1490, 0, 100, 9613, 5, 5, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1490, 1, 100, 7646, 5, 49, 0, 10); -- Curse of Weakness

-- Scarlet Initiate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1507, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1507, 1, 100, 12544, 10, 10, 0, 10); -- Frost Armor

-- Scarlet Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1535, 0, 100, 3238, 11, 27, 0, 10); -- Nimble Reflexes

-- Scarlet Friar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1538, 0, 100, 2052, 25, 25, 0, 10); -- Lesser Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1538, 1, 100, 1243, 10, 10, 0, 10); -- Power Word: Fortitude

-- Scarlet Neophyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1539, 0, 100, 13322, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1539, 1, 100, 12544, 5, 60, 0, 10); -- Frost Armor

-- Scarlet Vanguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1540, 0, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1540, 1, 100, 72, 8, 9, 0, 10); -- Shield Bash

-- Vile Fin Minor Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1544, 0, 100, 2607, 12, 20, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1544, 1, 100, 324, 10, 10, 0, 10); -- Lightning Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1544, 2, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Vile Fin Muckdweller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1545, 0, 100, 7159, 10, 10, 0, 10); -- Backstab

-- Bloodsail Raider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1561, 1, 100, 6533, 23, 26, 0, 10); -- Net

-- Bloodsail Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1562, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1562, 1, 100, 2601, 20, 20, 0, 10); -- Fire Shield III

-- Bloodsail Swashbuckler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1563, 0, 100, 1768, 17, 18, 0, 10); -- Kick
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1563, 1, 100, 6713, 10, 28, 0, 10); -- Disarm

-- Bloodsail Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1564, 0, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1564, 1, 100, 7646, 13, 25, 0, 10); -- Curse of Weakness

-- Bloodsail Sea Dog
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1565, 0, 100, 8721, 10, 10, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1565, 1, 100, 8629, 7, 10, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1565, 2, 100, 744, 10, 39, 0, 10); -- Poison

-- Bloodsail Elder Magus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1653, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1653, 1, 100, 20827, 5, 15, 0, 10); -- Flamestrike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1653, 2, 100, 11969, 5, 15, 0, 10); -- Fire Nova

-- Scarlet Bodyguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1660, 0, 100, 12169, 5, 8, 0, 10); -- Shield Block

-- Dextren Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1663, 0, 100, 19134, 10, 20, 0, 10); -- Intimidating Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1663, 1, 100, 11976, 5, 15, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1663, 2, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Captain Vachon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1664, 0, 100, 72, 10, 10, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1664, 1, 100, 3248, 12, 20, 0, 10); -- Improved Blocking
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1664, 2, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Captain Melrache
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1665, 0, 100, 8258, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1665, 1, 100, 11976, 6, 14, 0, 10); -- Strike

-- Kam Deepfury
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1666, 0, 100, 8242, 6, 20, 0, 10); -- Shield Slam
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1666, 1, 100, 871, 10, 10, 0, 10); -- Shield Wall
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1666, 3, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Avarus Kharag
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1679, 1, 100, 1026, 0, 0, 0, 10); -- Holy Light
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1679, 2, 100, 5588, 10, 10, 0, 10); -- Hammer of Justice

-- Targorr the Dread
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1696, 1, 100, 3391, 5, 15, 0, 10); -- Thrash

-- Defias Prisoner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1706, 0, 100, 1766, 5, 15, 0, 10); -- Kick
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1706, 1, 100, 6713, 0, 20, 0, 10); -- Disarm

-- Defias Captive
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1707, 0, 100, 3427, 8, 60, 0, 10); -- Infected Wound
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1707, 1, 100, 7159, 0, 0, 0, 10); -- Backstab

-- Defias Inmate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1708, 0, 100, 6547, 6, 30, 0, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1708, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Defias Convict
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1711, 1, 100, 6253, 8, 12, 0, 10); -- Backhand

-- Defias Insurgent
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1715, 0, 100, 9128, 15, 29, 0, 10); -- Battle Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1715, 1, 100, 13730, 15, 30, 0, 10); -- Demoralizing Shout

-- Bazil Thredd
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1716, 1, 100, 7964, 10, 20, 0, 10); -- Smoke Bomb
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1716, 2, 100, 9128, 20, 29, 0, 10); -- Battle Shout

-- Hamhock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1717, 0, 100, 6742, 5, 10, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1717, 1, 100, 421, 5, 12, 0, 10); -- Chain Lightning

-- Defias Watchman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1725, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Defias Magician
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1726, 1, 100, 9053, 0, 0, 0, 10); -- Fireball

-- Defias Evoker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1729, 0, 100, 4979, 60, 60, 0, 10); -- Quick Flame Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1729, 1, 100, 11829, 0, 0, 0, 10); -- Flamestrike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1729, 2, 100, 12544, 5, 6, 0, 10); -- Frost Armor

-- Goblin Craftsman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1731, 0, 100, 5159, 31, 60, 0, 10); -- Melt Ore

-- Defias Squallshaper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1732, 0, 100, 122, 20, 20, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1732, 1, 100, 2138, 10, 10, 0, 10); -- Fire Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1732, 2, 100, 12544, 10, 10, 0, 10); -- Frost Armor

-- Vile Fin Shredder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1767, 0, 100, 3252, 17, 60, 0, 10); -- Shred

-- Vile Fin Tidehunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1768, 0, 100, 4980, 0, 0, 0, 10); -- Quick Frost Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1768, 1, 100, 12544, 16, 30, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1768, 2, 100, 12748, 21, 29, 0, 10); -- Frost Nova

-- Moonrage Whitescalp
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1769, 1, 100, 12544, 12, 30, 0, 10); -- Frost Armor

-- Moonrage Glutton
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1779, 0, 100, 6958, 10, 15, 0, 10); -- Blood Leech

-- Scarlet Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1826, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1826, 1, 100, 11831, 10, 20, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1826, 2, 100, 20822, 0, 0, 0, 10); -- Frostbolt

-- Scarlet Sentinel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1827, 2, 100, 12057, 5, 10, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1827, 3, 100, 17198, 10, 10, 0, 10); -- Overpower

-- Scarlet Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1831, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Scarlet Magus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1832, 0, 100, 14034, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1832, 1, 100, 15744, 7, 13, 0, 10); -- Blast Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1832, 2, 100, 15041, 30, 30, 0, 10); -- Fire Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1832, 3, 100, 17203, 15, 20, 0, 10); -- Fireball Volley

-- Scarlet Knight
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1833, 0, 100, 8242, 5, 15, 0, 10); -- Shield Slam
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1833, 1, 100, 6713, 15, 19, 0, 10); -- Disarm

-- Scarlet Paladin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1834, 0, 100, 14518, 3, 7, 0, 10); -- Crusader Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1834, 1, 100, 17143, 5, 14, 0, 10); -- Holy Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1834, 2, 100, 17177, 60, 60, 0, 10); -- Seal of Protection
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1834, 3, 100, 15493, 15, 15, 0, 10); -- Holy Light

-- Scarlet Invoker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1835, 0, 100, 15735, 10, 10, 0, 10); -- Arcane Missiles
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1835, 1, 100, 11975, 9, 15, 0, 10); -- Arcane Explosion

-- Scarlet Cavalier
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1836, 0, 100, 16856, 5, 10, 0, 10); -- Mortal Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1836, 1, 100, 15663, 8, 15, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1836, 2, 100, 6253, 5, 14, 0, 10); -- Backhand

-- Scarlet Judge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1837, 0, 100, 13005, 10, 15, 0, 10); -- Hammer of Justice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1837, 1, 100, 13953, 10, 14, 0, 10); -- Holy Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1837, 2, 100, 14518, 3, 7, 0, 10); -- Crusader Strike

-- Scarlet High Clerist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1839, 0, 100, 17139, 17, 20, 0, 10); -- Power Word: Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1839, 1, 100, 15586, 15, 15, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1839, 2, 100, 15585, 22, 38, 0, 10); -- Prayer of Healing
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1839, 3, 100, 17141, 31, 52, 0, 10); -- Holy Fire

-- Scarlet Executioner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1841, 0, 100, 7160, 5, 5, 0, 10); -- Execute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1841, 1, 100, 16856, 5, 10, 0, 10); -- Mortal Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1841, 2, 100, 15663, 14, 15, 0, 10); -- Cleave

-- Foreman Jerris
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1843, 1, 100, 15618, 6, 13, 0, 10); -- Snap Kick
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1843, 2, 100, 3391, 5, 10, 0, 10); -- Thrash

-- Foreman Marcrid
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1844, 0, 100, 15663, 6, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1844, 1, 100, 11976, 3, 7, 0, 10); -- Strike

-- High Protector Tarsen
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1845, 0, 100, 8258, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1845, 1, 100, 8242, 6, 14, 0, 10); -- Shield Slam
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1845, 2, 100, 10833, 18, 25, 0, 10); -- Arcane Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1845, 3, 100, 13953, 5, 8, 0, 10); -- Holy Strike

-- High Protector Lorik
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1846, 0, 100, 8990, 10, 10, 0, 10); -- Retribution Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1846, 1, 100, 10833, 16, 25, 0, 10); -- Arcane Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1846, 2, 100, 15655, 5, 15, 0, 10); -- Shield Slam
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1846, 3, 100, 13874, 10, 10, 0, 10); -- Divine Shield

-- Lord Maldazzar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1848, 1, 100, 12471, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1848, 2, 100, 17173, 12, 19, 0, 10); -- Drain Life

-- Voidwalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1860, 0, 100, 3716, 10, 10, 0, 10); -- Torment

-- Succubus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1863, 0, 100, 7814, 10, 10, 0, 10); -- Lash of Pain

-- Dalaran Apprentice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1867, 0, 100, 13322, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1867, 1, 100, 12544, 16, 30, 0, 10); -- Frost Armor

-- Scarlet Worker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1883, 0, 100, 11971, 5, 10, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1883, 1, 100, 9791, 10, 30, 0, 10); -- Head Crack

-- Scarlet Lumberjack
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1884, 0, 100, 15496, 5, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1884, 1, 100, 11977, 5, 15, 0, 10); -- Rend

-- Scarlet Smith
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1885, 0, 100, 12057, 6, 10, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1885, 1, 100, 11428, 5, 14, 0, 10); -- Knockdown

-- Dalaran Watcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1888, 0, 100, 134, 0, 0, 0, 10); -- Fire Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1888, 1, 100, 2120, 0, 0, 0, 10); -- Flamestrike

-- Dalaran Wizard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1889, 0, 100, 12544, 4, 30, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1889, 1, 100, 20792, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1889, 2, 100, 4980, 0, 0, 0, 10); -- Quick Frost Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1889, 3, 100, 122, 10, 10, 0, 10); -- Frost Nova

-- Pyrewood Watcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1891, 1, 45, 6660, 10, 10, 0, 10); -- Shoot

-- Moonrage Sentry
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1893, 0, 100, 13730, 32, 59, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1893, 1, 100, 6507, 11, 30, 0, 10); -- Battle Roar

-- Pyrewood Sentry
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1894, 0, 22, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1894, 0, 78, 13730, 30, 58, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1894, 1, 78, 6507, 13, 29, 0, 10); -- Battle Roar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1894, 1, 22, 12169, 10, 10, 0, 10); -- Shield Block
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1894, 2, 22, 11972, 10, 10, 0, 10); -- Shield Bash

-- Pyrewood Elder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1895, 0, 12.5, 2053, 15, 15, 0, 10); -- Lesser Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1895, 2, 87.5, 594, 10, 10, 0, 10); -- Shadow Word: Pain

-- Moonrage Elder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1896, 2, 100, 594, 10, 10, 0, 10); -- Shadow Word: Pain

-- Naga Explorer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1907, 0, 100, 6548, 16, 17, 0, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1907, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Vile Fin Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1908, 0, 100, 2606, 10, 15, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1908, 1, 100, 913, 20, 20, 0, 10); -- Healing Wave

-- Muad
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1910, 1, 100, 2607, 10, 10, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1910, 2, 100, 332, 20, 20, 0, 10); -- Healing Wave

-- Deeb
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1911, 0, 100, 2607, 10, 10, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1911, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Dalaran Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1914, 0, 100, 134, 0, 0, 0, 10); -- Fire Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1914, 1, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1914, 2, 100, 4979, 0, 0, 0, 10); -- Quick Flame Ward

-- Dalaran Conjuror
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1915, 1, 100, 696, 10, 10, 0, 10); -- Demon Skin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1915, 2, 100, 20791, 0, 0, 0, 10); -- Shadow Bolt

-- Dalaran Spellscribe
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1920, 0, 100, 12544, 10, 10, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1920, 1, 100, 20792, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1920, 3, 100, 5276, 75, 87, 0, 10); -- Freeze

-- Moonrage Bloodhowler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1924, 0, 100, 3264, 15, 30, 0, 10); -- Blood Howl

-- Farmer Solliden
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1936, 0, 100, 11976, 5, 14, 0, 10); -- Strike

-- Thule Ravenclaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1947, 0, 100, 20800, 0, 0, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1947, 2, 100, 13787, 10, 10, 0, 10); -- Demon Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1947, 3, 100, 7655, 29, 30, 0, 10); -- Hex of Ravenclaw

-- Vile Fin Shorecreeper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1957, 0, 100, 1776, 35, 36, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1957, 1, 100, 7159, 0, 0, 0, 10); -- Backstab

-- Vile Fin Tidecaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (1958, 0, 100, 11831, 31, 45, 0, 10); -- Frost Nova

-- Rascal Sprite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2002, 0, 100, 6950, 37, 38, 0, 10); -- Faerie Fire

-- Shadow Sprite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2003, 0, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt

-- Dark Sprite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2004, 0, 100, 5514, 19, 25, 0, 10); -- Darken Vision

-- Vicious Grell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2005, 0, 100, 5515, 30, 31, 0, 10); -- Savagery

-- Gnarlpine Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2008, 0, 100, 11976, 29, 30, 0, 10); -- Strike

-- Gnarlpine Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2009, 0, 100, 332, 20, 20, 0, 10); -- Healing Wave

-- Gnarlpine Augur
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2011, 0, 100, 702, 15, 17, 0, 10); -- Curse of Weakness

-- Gnarlpine Pathfinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2012, 0, 100, 9739, 0, 0, 0, 10); -- Wrath

-- Bloodfeather Harpy
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2015, 0, 100, 6958, 10, 10, 0, 10); -- Blood Leech

-- Bloodfeather Sorceress
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2018, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2018, 1, 100, 12544, 10, 10, 0, 10); -- Frost Armor

-- Lord Melenas
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2038, 0, 100, 1822, 10, 10, 0, 10); -- Rake
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2038, 2, 100, 5759, 10, 10, 0, 10); -- Cat Form
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2038, 3, 100, 774, 30, 30, 0, 10); -- Rejuvenation

-- Ursal the Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2039, 0, 100, 15793, 6, 15, 0, 10); -- Maul

-- Haggard Refugee
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2053, 0, 100, 3261, 19, 39, 0, 10); -- Ignite

-- Sickly Refugee
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2054, 0, 100, 2589, 10, 10, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2054, 1, 100, 1776, 10, 10, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2054, 2, 100, 101, 10, 10, 0, 10); -- Trip

-- Deathstalker Faerleia
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2058, 0, 100, 2589, 10, 10, 0, 10); -- Backstab

-- Ma'ruk Wyrmscale
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2090, 0, 100, 9128, 5, 14, 0, 10); -- Battle Shout

-- Chieftain Nek'rosh
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2091, 0, 100, 6192, 5, 20, 0, 10); -- Battle Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2091, 1, 100, 6190, 10, 10, 0, 10); -- Demoralizing Shout

-- Dragonmaw Grunt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2102, 0, 100, 8242, 5, 15, 0, 10); -- Shield Slam

-- Dragonmaw Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2103, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Garneg Charskull
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2108, 0, 100, 6725, 5, 7, 0, 10); -- Flame Spike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2108, 1, 100, 184, 5, 5, 0, 10); -- Fire Shield II
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2108, 2, 100, 15039, 5, 10, 0, 10); -- Flame Shock

-- Archmage Ataeric
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2120, 0, 100, 20792, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2120, 1, 100, 118, 27, 29, 0, 10); -- Polymorph
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2120, 2, 100, 512, 0, 0, 0, 10); -- Chains of Ice

-- Moon Priestess Amara
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2151, 0, 100, 18561, 10, 10, 0, 10); -- Shoot

-- Blackwood Pathfinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2167, 0, 100, 6950, 0, 0, 0, 10); -- Faerie Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2167, 1, 100, 3391, 20, 29, 0, 10); -- Thrash

-- Blackwood Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2168, 0, 100, 8198, 10, 10, 0, 10); -- Thunder Clap
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2168, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Blackwood Ursa
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2170, 2, 100, 1058, 10, 10, 0, 10); -- Rejuvenation

-- Blackwood Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2171, 0, 100, 913, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2171, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2171, 2, 100, 2606, 20, 20, 0, 10); -- Shock

-- Stormscale Wave Rider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2179, 0, 100, 13586, 11, 25, 0, 10); -- Aqua Jet

-- Stormscale Siren
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2180, 0, 100, 11642, 20, 20, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2180, 1, 100, 9734, 0, 0, 0, 10); -- Holy Smite

-- Stormscale Myrmidon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2181, 1, 100, 5164, 30, 39, 0, 10); -- Knockdown

-- Stormscale Sorceress
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2182, 0, 100, 20792, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2182, 1, 100, 12544, 18, 19, 0, 10); -- Frost Armor

-- Stormscale Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2183, 0, 100, 3248, 6, 20, 0, 10); -- Improved Blocking

-- Carnivous the Breaker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2186, 0, 100, 6016, 17, 29, 0, 10); -- Pierce Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2186, 1, 100, 3391, 6, 15, 0, 10); -- Thrash

-- Licillin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2191, 0, 100, 11980, 5, 15, 0, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2191, 1, 100, 20791, 0, 0, 0, 10); -- Shadow Bolt

-- Firecaller Radison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2192, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2192, 1, 100, 11969, 23, 24, 0, 10); -- Fire Nova

-- Greymist Seer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2203, 0, 100, 547, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2203, 1, 100, 324, 10, 10, 0, 10); -- Lightning Shield

-- Greymist Netter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2204, 0, 100, 12024, 18, 19, 0, 10); -- Net

-- Greymist Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2205, 0, 100, 5242, 16, 29, 0, 10); -- Battle Shout

-- Greymist Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2206, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Greymist Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2207, 0, 100, 913, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2207, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Deth'ryll Satyr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2212, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Syndicate Footpad
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2240, 0, 100, 7159, 10, 10, 0, 10); -- Backstab

-- Syndicate Thief
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2241, 0, 100, 7159, 0, 0, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2241, 1, 100, 6713, 30, 45, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2241, 2, 100, 744, 1, 45, 0, 10); -- Poison

-- Syndicate Spy
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2242, 0, 100, 7159, 10, 10, 0, 10); -- Backstab

-- Syndicate Sentry
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2243, 0, 100, 15062, 30, 30, 0, 10); -- Shield Wall
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2243, 2, 100, 11972, 10, 18, 0, 10); -- Shield Bash

-- Syndicate Shadow Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2244, 0, 100, 6909, 43, 60, 0, 10); -- Curse of Thorns
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2244, 1, 100, 706, 10, 10, 0, 10); -- Demon Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2244, 2, 100, 20791, 0, 0, 0, 10); -- Shadow Bolt

-- Syndicate Saboteur
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2245, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2245, 1, 100, 6980, 10, 20, 0, 10); -- Fire Shot

-- Syndicate Assassin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2246, 2, 100, 744, 5, 27, 0, 10); -- Poison

-- Syndicate Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2247, 0, 100, 17207, 10, 10, 0, 10); -- Whirlwind

-- Mountain Yeti
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2250, 0, 100, 3131, 5, 10, 0, 10); -- Frost Breath

-- Giant Yeti
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2251, 0, 100, 3131, 5, 10, 0, 10); -- Frost Breath

-- Crushridge Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2254, 0, 100, 6253, 5, 15, 0, 10); -- Backhand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2254, 1, 100, 11976, 5, 15, 0, 10); -- Strike

-- Crushridge Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2255, 0, 100, 9672, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2255, 1, 100, 6742, 5, 19, 0, 10); -- Bloodlust

-- Crushridge Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2256, 0, 100, 7093, 10, 44, 0, 10); -- Intimidation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2256, 1, 100, 9791, 5, 34, 0, 10); -- Head Crack

-- Mug'thol
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2257, 0, 100, 13730, 5, 15, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2257, 1, 100, 11976, 2, 9, 0, 10); -- Strike

-- Syndicate Rogue
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2260, 1, 100, 2589, 10, 10, 0, 10); -- Backstab

-- Hillsbrad Tailor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2264, 0, 100, 2590, 10, 10, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2264, 1, 100, 101, 10, 10, 0, 10); -- Trip

-- Hillsbrad Apprentice Blacksmith
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2265, 0, 100, 3148, 31, 59, 0, 10); -- Head Crack

-- Hillsbrad Farmer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2266, 0, 100, 6713, 17, 58, 0, 10); -- Disarm

-- Hillsbrad Peasant
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2267, 0, 100, 6016, 49, 72, 0, 10); -- Pierce Armor

-- Hillsbrad Footman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2268, 0, 100, 1671, 19, 20, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2268, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Dalaran Theurgist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2272, 1, 100, 20819, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2272, 2, 100, 15044, 5, 20, 0, 10); -- Frost Ward

-- Captain Ironhill
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2304, 0, 100, 7020, 32, 40, 0, 10); -- Stoneform
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2304, 1, 100, 12555, 10, 20, 0, 10); -- Pummel

-- Foreman Bonds
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2305, 0, 100, 643, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2305, 1, 100, 5588, 10, 10, 0, 10); -- Hammer of Justice

-- Baron Vardus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2306, 0, 100, 20822, 8, 8, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2306, 1, 100, 11831, 8, 19, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2306, 2, 100, 8364, 8, 20, 0, 10); -- Blizzard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2306, 3, 100, 6253, 10, 20, 0, 10); -- Backhand

-- Argus Shadow Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2318, 0, 100, 20816, 0, 0, 0, 10); -- Shadow Bolt

-- Syndicate Wizard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2319, 0, 100, 13323, 32, 44, 0, 10); -- Polymorph
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2319, 1, 100, 20815, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2319, 2, 100, 12544, 10, 10, 0, 10); -- Frost Armor

-- Blackwood Windtalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2324, 0, 100, 6982, 30, 30, 0, 10); -- Gust of Wind

-- Valdred Moray
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2332, 0, 100, 14873, 5, 15, 0, 10); -- Sinister Strike

-- Magistrate Burnside
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2335, 0, 100, 7739, 29, 45, 0, 10); -- Inferno Shell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2335, 1, 100, 20811, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2335, 2, 100, 11969, 22, 44, 0, 10); -- Fire Nova

-- Dark Strand Fanatic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2336, 0, 100, 7098, 22, 38, 0, 10); -- Curse of Mending

-- Dark Strand Voidcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2337, 1, 100, 20807, 0, 0, 0, 10); -- Shadow Bolt

-- Twilight Disciple
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2338, 0, 100, 6074, 20, 20, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2338, 3, 100, 2054, 30, 30, 0, 10); -- Heal

-- Twilight Thug
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2339, 0, 100, 6713, 11, 27, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2339, 1, 100, 7165, 60, 60, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2339, 2, 100, 5242, 59, 60, 0, 10); -- Battle Shout

-- Dun Garok Mountaineer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2344, 0, 100, 3248, 19, 20, 0, 10); -- Improved Blocking
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2344, 1, 100, 13953, 5, 15, 0, 10); -- Holy Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2344, 2, 100, 8258, 10, 10, 0, 10); -- Devotion Aura

-- Dun Garok Rifleman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2345, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2345, 1, 100, 6685, 33, 44, 0, 10); -- Piercing Shot

-- Dun Garok Priest
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2346, 0, 100, 6063, 0, 0, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2346, 1, 100, 8362, 0, 0, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2346, 2, 100, 9734, 0, 0, 0, 10); -- Holy Smite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2346, 3, 100, 2878, 0, 0, 0, 10); -- Turn Undead

-- Dalaran Summoner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2358, 0, 100, 20815, 0, 0, 0, 10); -- Fireball

-- Daggerspine Shorestalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2368, 0, 100, 12555, 5, 10, 0, 10); -- Pummel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2368, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Daggerspine Shorehunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2369, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Daggerspine Screamer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2370, 0, 100, 3589, 20, 30, 0, 10); -- Deafening Screech

-- Daggerspine Siren
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2371, 0, 100, 992, 10, 10, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2371, 1, 100, 6728, 30, 45, 0, 10); -- Enveloping Winds
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2371, 2, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Mudsnout Gnoll
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2372, 1, 100, 3650, 25, 45, 0, 10); -- Sling Mud

-- Mudsnout Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2373, 0, 100, 939, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2373, 1, 100, 20805, 0, 0, 0, 10); -- Lightning Bolt

-- Torn Fin Muckdweller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2374, 0, 100, 3427, 31, 59, 0, 10); -- Infected Wound

-- Torn Fin Coastrunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2375, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Torn Fin Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2376, 0, 100, 939, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2376, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Torn Fin Tidehunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2377, 0, 100, 865, 15, 43, 0, 10); -- Frost Nova

-- Hillsbrad Councilman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2387, 0, 100, 20806, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2387, 1, 100, 12544, 18, 19, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2387, 2, 100, 122, 32, 59, 0, 10); -- Frost Nova

-- Warden Belamoore
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2415, 0, 100, 13323, 16, 25, 0, 10); -- Polymorph
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2415, 1, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2415, 2, 100, 20828, 10, 20, 0, 10); -- Cone of Cold

-- Crushridge Plunderer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2416, 0, 100, 15496, 5, 10, 0, 10); -- Cleave

-- Grel'borg the Miser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2417, 0, 100, 6742, 5, 10, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2417, 1, 100, 11990, 5, 15, 0, 10); -- Rain of Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2417, 2, 100, 4979, 5, 15, 0, 10); -- Quick Flame Ward

-- Targ
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2420, 0, 100, 8147, 10, 15, 0, 10); -- Thunderclap
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2420, 1, 100, 15496, 4, 9, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2420, 2, 100, 7366, 10, 10, 0, 10); -- Berserker Stance

-- Muckrake
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2421, 0, 100, 12555, 5, 10, 0, 10); -- Pummel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2421, 1, 100, 8379, 10, 25, 0, 10); -- Disarm

-- Glommus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2422, 0, 100, 9128, 10, 10, 0, 10); -- Battle Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2422, 1, 100, 11428, 5, 18, 0, 10); -- Knockdown
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2422, 2, 100, 13730, 16, 28, 0, 10); -- Demoralizing Shout

-- Lord Aliden Perenolde
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2423, 0, 100, 15970, 14, 30, 0, 10); -- Sleep
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2423, 1, 100, 11974, 10, 15, 0, 10); -- Power Word: Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2423, 2, 100, 8362, 15, 24, 0, 10); -- Renew

-- Jailor Marlgen
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2428, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2428, 1, 100, 6533, 25, 39, 0, 10); -- Net

-- Jailor Borhuin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2431, 0, 100, 6533, 15, 30, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2431, 1, 100, 8379, 10, 25, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2431, 2, 100, 12555, 10, 15, 0, 10); -- Pummel

-- Shadowy Assassin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2434, 0, 100, 1785, 10, 10, 0, 10); -- Stealth
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2434, 1, 100, 14903, 10, 10, 0, 10); -- Rupture

-- Drunken Footpad
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2440, 1, 100, 13584, 5, 15, 0, 10); -- Strike

-- Skhowl
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2452, 0, 100, 16508, 17, 29, 0, 10); -- Intimidating Roar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2452, 1, 100, 6253, 5, 15, 0, 10); -- Backhand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2452, 2, 100, 15971, 15, 43, 0, 10); -- Demoralizing Roar

-- Son of Arugal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2529, 0, 100, 7124, 5, 19, 0, 10); -- Arugal's Gift

-- Lord Sakrasis
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2541, 0, 100, 3583, 10, 31, 0, 10); -- Deadly Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2541, 1, 100, 15496, 5, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2541, 3, 100, 7160, 10, 10, 0, 10); -- Execute

-- Archmage Ansirem Runeweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2543, 0, 100, 20792, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2543, 1, 100, 118, 27, 30, 0, 10); -- Polymorph
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2543, 2, 100, 512, 0, 0, 0, 10); -- Chains of Ice

-- Fleet Master Firallon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2546, 1, 100, 6192, 10, 10, 0, 10); -- Battle Shout

-- Ironpatch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2547, 0, 100, 11972, 2, 7, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2547, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Captain Keelhaul
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2548, 0, 100, 13730, 10, 19, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2548, 1, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2548, 2, 100, 7896, 5, 10, 0, 10); -- Exploding Shot

-- Garr Salthoof
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2549, 0, 100, 8260, 30, 30, 0, 10); -- Rushing Charge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2549, 1, 100, 6253, 6, 12, 0, 10); -- Backhand

-- Captain Stillwater
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2550, 0, 100, 8439, 10, 10, 0, 10); -- Arcane Explosion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2550, 1, 100, 6146, 5, 10, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2550, 2, 100, 6725, 24, 26, 0, 10); -- Flame Spike

-- Witherbark Troll
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2552, 0, 100, 4974, 14, 45, 0, 10); -- Wither Touch

-- Witherbark Shadowcaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2553, 2, 100, 20816, 0, 0, 0, 10); -- Shadow Bolt

-- Witherbark Axe Thrower
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2554, 1, 100, 10277, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2554, 2, 100, 4974, 15, 42, 0, 10); -- Wither Touch

-- Witherbark Headhunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2556, 0, 100, 4974, 16, 45, 0, 10); -- Wither Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2556, 1, 100, 6533, 15, 30, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2556, 2, 100, 7160, 20, 20, 0, 10); -- Execute

-- Witherbark Shadow Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2557, 0, 100, 6726, 30, 30, 0, 10); -- Silence
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2557, 1, 100, 992, 15, 15, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2557, 2, 100, 7646, 11, 23, 0, 10); -- Curse of Weakness

-- Witherbark Berserker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2558, 0, 100, 3019, 10, 10, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2558, 2, 100, 4974, 18, 44, 0, 10); -- Wither Touch

-- Boulderfist Ogre
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2562, 0, 100, 4955, 20, 45, 0, 10); -- Fist of Stone

-- Boulderfist Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2564, 0, 100, 4955, 22, 43, 0, 10); -- Fist of Stone
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2564, 1, 100, 13730, 10, 15, 0, 10); -- Demoralizing Shout

-- Boulderfist Brute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2566, 0, 100, 4955, 21, 45, 0, 10); -- Fist of Stone
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2566, 1, 100, 11428, 10, 15, 0, 10); -- Knockdown

-- Boulderfist Magus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2567, 0, 100, 20822, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2567, 1, 100, 12544, 10, 10, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2567, 2, 100, 11831, 10, 18, 0, 10); -- Frost Nova

-- Boulderfist Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2569, 0, 100, 4955, 13, 45, 0, 10); -- Fist of Stone

-- Boulderfist Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2570, 1, 100, 959, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2570, 2, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Boulderfist Lord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2571, 0, 100, 4955, 11, 26, 0, 10); -- Fist of Stone
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2571, 1, 100, 8258, 10, 10, 0, 10); -- Devotion Aura

-- Drywhisker Surveyor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2573, 0, 100, 20822, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2573, 1, 100, 865, 5, 28, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2573, 2, 100, 12544, 10, 10, 0, 10); -- Frost Armor

-- Drywhisker Digger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2574, 0, 100, 8380, 6, 7, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2574, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Dark Iron Supplier
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2575, 0, 100, 4961, 10, 10, 0, 10); -- Resupply
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2575, 1, 100, 744, 10, 10, 0, 10); -- Poison

-- Dark Iron Shadowcaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2577, 1, 100, 20816, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2577, 2, 100, 2941, 10, 10, 0, 10); -- Immolate

-- Stromgarde Troll Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2583, 0, 100, 2767, 14, 15, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2583, 1, 100, 6064, 20, 20, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2583, 2, 100, 1090, 0, 0, 0, 10); -- Sleep

-- Stromgarde Defender
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2584, 0, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2584, 1, 100, 11972, 12, 19, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2584, 2, 100, 3639, 10, 10, 0, 10); -- Improved Blocking

-- Syndicate Highwayman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2586, 1, 100, 2591, 10, 10, 0, 10); -- Backstab

-- Syndicate Pathstalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2587, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Syndicate Prowler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2588, 1, 100, 6713, 10, 24, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2588, 2, 100, 14873, 6, 25, 0, 10); -- Sinister Strike

-- Syndicate Conjuror
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2590, 0, 100, 15970, 20, 30, 0, 10); -- Sleep
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2590, 1, 100, 1086, 10, 10, 0, 10); -- Demon Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2590, 2, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt

-- Syndicate Magus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2591, 0, 100, 9672, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2591, 1, 100, 12544, 10, 10, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2591, 2, 100, 8364, 10, 20, 0, 10); -- Blizzard

-- Daggerspine Raider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2595, 0, 100, 6533, 16, 28, 0, 10); -- Net

-- Daggerspine Sorceress
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2596, 0, 100, 20824, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2596, 1, 100, 8134, 20, 20, 0, 10); -- Lightning Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2596, 2, 100, 421, 7, 14, 0, 10); -- Chain Lightning

-- Lord Falconcrest
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2597, 1, 100, 6713, 10, 13, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2597, 2, 100, 6192, 10, 10, 0, 10); -- Battle Shout

-- Darbel Montrose
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2598, 1, 100, 12741, 11, 20, 0, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2598, 2, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2598, 3, 100, 8994, 15, 25, 0, 10); -- Banish

-- Otto
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2599, 0, 100, 6253, 7, 10, 0, 10); -- Backhand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2599, 1, 100, 12555, 5, 10, 0, 10); -- Pummel

-- Singer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2600, 2, 100, 6190, 10, 10, 0, 10); -- Demoralizing Shout

-- Foulbelly
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2601, 0, 100, 3256, 0, 0, 0, 10); -- Plague Cloud
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2601, 1, 100, 3106, 10, 10, 0, 10); -- Aura of Rot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2601, 2, 100, 3583, 6, 7, 0, 10); -- Deadly Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2601, 3, 100, 7992, 5, 6, 0, 10); -- Slowing Poison

-- Ruul Onestone
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2602, 0, 100, 6742, 8, 10, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2602, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2602, 2, 100, 6219, 19, 20, 0, 10); -- Rain of Fire

-- Molok the Crusher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2604, 0, 100, 6253, 5, 10, 0, 10); -- Backhand

-- Zalas Witherbark
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2605, 0, 100, 851, 10, 14, 0, 10); -- Polymorph: Sheep
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2605, 1, 100, 512, 12, 14, 0, 10); -- Chains of Ice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2605, 2, 100, 4974, 6, 9, 0, 10); -- Wither Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2605, 3, 100, 9081, 0, 0, 0, 10); -- Shadow Bolt Volley

-- Nimar the Slayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2606, 0, 100, 17207, 12, 13, 0, 10); -- Whirlwind
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2606, 1, 100, 845, 10, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2606, 2, 100, 2458, 10, 10, 0, 10); -- Berserker Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2606, 3, 100, 7160, 10, 10, 0, 10); -- Execute

-- Prince Galen Trollbane
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2607, 0, 100, 8053, 5, 9, 0, 10); -- Flame Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2607, 1, 100, 2610, 5, 8, 0, 10); -- Shock

-- Commander Amaren
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2608, 0, 100, 9128, 13, 14, 0, 10); -- Battle Shout

-- Geomancer Flintdagger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2609, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2609, 1, 100, 2601, 5, 7, 0, 10); -- Fire Shield III

-- Lieutenant Valorcall
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2612, 0, 100, 642, 10, 10, 0, 10); -- Divine Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2612, 1, 100, 13953, 11, 19, 0, 10); -- Holy Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2612, 2, 100, 3472, 9, 10, 0, 10); -- Holy Light

-- Hammerfall Grunt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2619, 0, 100, 3019, 11, 30, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2619, 1, 100, 3427, 10, 26, 0, 10); -- Infected Wound

-- Gazban
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2624, 0, 100, 5403, 0, 0, 0, 10); -- Crash of Waves

-- Vilebranch Axe Thrower
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2639, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Vilebranch Witch Doctor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2640, 0, 100, 18503, 22, 50, 0, 10); -- Hex
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2640, 1, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2640, 2, 100, 8005, 20, 20, 0, 10); -- Healing Wave

-- Vilebranch Headhunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2641, 0, 100, 15607, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2641, 1, 100, 15656, 21, 34, 0, 10); -- Poisonous Stab

-- Vilebranch Shadowcaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2642, 1, 100, 7289, 27, 45, 0, 10); -- Shrink
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2642, 2, 100, 12471, 0, 0, 0, 10); -- Shadow Bolt

-- Vilebranch Hideskinner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2644, 0, 100, 15657, 10, 10, 0, 10); -- Backstab

-- Vilebranch Shadow Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2645, 0, 100, 14032, 18, 30, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2645, 1, 100, 9657, 10, 15, 0, 10); -- Shadow Shell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2645, 2, 100, 15547, 10, 10, 0, 10); -- Shoot

-- Vilebranch Blood Drinker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2646, 0, 100, 11015, 20, 20, 0, 10); -- Blood Leech

-- Vilebranch Soul Eater
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2647, 0, 100, 11016, 10, 30, 0, 10); -- Soul Bite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2647, 1, 100, 7154, 10, 10, 0, 10); -- Dark Offering

-- Vilebranch Aman'zasi Guard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2648, 0, 100, 3248, 19, 22, 0, 10); -- Improved Blocking
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2648, 1, 100, 15655, 10, 19, 0, 10); -- Shield Slam

-- Witherbark Scalper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2649, 0, 100, 7160, 10, 10, 0, 10); -- Execute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2649, 1, 100, 10277, 10, 10, 0, 10); -- Throw

-- Witherbark Hideskinner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2651, 0, 100, 8721, 10, 10, 0, 10); -- Backstab

-- Witherbark Sadist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2653, 0, 100, 25710, 10, 30, 7, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2653, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Witherbark Caller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2654, 0, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt

-- Highvale Outrunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2691, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Highvale Marksman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2693, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2693, 1, 100, 14443, 10, 20, 0, 10); -- Multi-Shot

-- Highvale Ranger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2694, 1, 100, 6950, 15, 29, 0, 10); -- Faerie Fire

-- Kinelory
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2713, 0, 100, 3627, 15, 15, 0, 10); -- Rejuvenation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2713, 1, 100, 4948, 16, 24, 0, 10); -- Kinelory's Bear Form

-- Dustbelcher Wyrmhunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2716, 0, 100, 6533, 17, 29, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2716, 1, 100, 9483, 0, 0, 0, 10); -- Boulder

-- Dustbelcher Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2717, 1, 100, 3391, 20, 29, 0, 10); -- Thrash

-- Dustbelcher Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2718, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2718, 1, 100, 8005, 15, 15, 0, 10); -- Healing Wave

-- Dustbelcher Lord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2719, 0, 100, 13730, 13, 29, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2719, 1, 100, 9128, 10, 20, 0, 10); -- Battle Shout

-- Dustbelcher Ogre Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2720, 0, 100, 20822, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2720, 1, 100, 6742, 10, 24, 0, 10); -- Bloodlust

-- Stromgarde Cavalryman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2738, 0, 100, 6268, 14, 15, 0, 10); -- Rushing Charge

-- Shadowforge Tunneler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2739, 0, 100, 8380, 10, 10, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2739, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Shadowforge Darkweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2740, 0, 100, 9482, 21, 30, 0, 10); -- Amplify Flames
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2740, 1, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt

-- Shadowforge Chanter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2742, 0, 100, 6077, 15, 30, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2742, 1, 100, 6066, 15, 26, 0, 10); -- Power Word: Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2742, 2, 100, 700, 21, 41, 0, 10); -- Sleep

-- Shadowforge Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2743, 1, 100, 17207, 20, 30, 0, 10); -- Whirlwind

-- Shadowforge Commander
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2744, 0, 100, 1032, 10, 10, 0, 10); -- Devotion Aura

-- Sleeby
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2764, 0, 100, 6064, 15, 15, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2764, 1, 100, 700, 27, 28, 0, 10); -- Sleep

-- Znort
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2765, 0, 100, 845, 10, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2765, 1, 100, 7366, 10, 10, 0, 10); -- Berserker Stance

-- Kor'gresh Coldrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2793, 0, 100, 4320, 0, 0, 0, 10); -- Trelane's Freezing Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2793, 1, 100, 865, 10, 10, 0, 10); -- Frost Nova

-- Stonevault Seer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2892, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2892, 1, 100, 8005, 20, 20, 0, 10); -- Healing Wave

-- Stonevault Bonesnapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2893, 0, 100, 11976, 15, 25, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2893, 1, 100, 12555, 15, 20, 0, 10); -- Pummel

-- Dustbelcher Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2907, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2907, 1, 100, 13281, 5, 14, 0, 10); -- Earth Shock

-- Vicious Owlbeast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2927, 0, 100, 7938, 10, 10, 0, 10); -- Fatal Bite

-- Primitive Owlbeast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2928, 0, 100, 3252, 20, 60, 0, 10); -- Shred

-- Magregan Deepshadow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2932, 0, 100, 17207, 11, 28, 0, 10); -- Whirlwind
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2932, 1, 100, 8820, 5, 13, 0, 10); -- Slam

-- Palemane Skinner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2950, 2, 100, 774, 10, 10, 0, 10); -- Rejuvenation

-- Bristleback Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2953, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Windfury Sorceress
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2964, 0, 100, 13322, 0, 0, 0, 10); -- Frostbolt

-- Galak Outrunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (2968, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Bluffwatcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3084, 0, 100, 11976, 5, 15, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3084, 1, 100, 6253, 7, 15, 0, 10); -- Backhand

-- Dire Mottled Boar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3099, 0, 100, 3385, 10, 10, 0, 10); -- Boar Charge

-- Vile Familiar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3101, 0, 100, 11921, 0, 0, 0, 10); -- Fireball

-- Makrura Snapclaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3105, 0, 100, 5424, 10, 10, 0, 10); -- Claw Grasp

-- Razormane Quilboar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3111, 0, 100, 5280, 27, 28, 0, 10); -- Razor Mane

-- Razormane Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3112, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Razormane Dustrunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3113, 0, 100, 774, 10, 10, 0, 10); -- Rejuvenation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3113, 1, 100, 6950, 0, 0, 0, 10); -- Faerie Fire

-- Razormane Battleguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3114, 0, 100, 3248, 36, 37, 0, 10); -- Improved Blocking

-- Dustwind Pillager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3116, 0, 100, 3147, 10, 10, 0, 10); -- Rend Flesh

-- Dustwind Storm Witch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3118, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Kolkar Drudge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3119, 0, 100, 7272, 10, 10, 0, 10); -- Dust Cloud

-- Kolkar Outrunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3120, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Kul Tiras Marine
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3129, 1, 100, 11972, 10, 20, 0, 10); -- Shield Bash

-- Makrura Elder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3141, 0, 100, 5424, 10, 10, 0, 10); -- Claw Grasp

-- Lieutenant Benedict
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3192, 0, 100, 72, 2, 3, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3192, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3192, 2, 100, 3248, 10, 26, 0, 10); -- Improved Blocking

-- Burning Blade Neophyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3196, 0, 100, 348, 0, 0, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3196, 1, 100, 687, 10, 10, 0, 10); -- Demon Skin

-- Burning Blade Fanatic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3197, 0, 100, 5262, 0, 0, 0, 10); -- Fanatic Blade

-- Burning Blade Apprentice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3198, 1, 100, 20791, 0, 0, 0, 10); -- Shadow Bolt

-- Burning Blade Cultist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3199, 1, 100, 11962, 0, 0, 0, 10); -- Immolate

-- Fizzle Darkstorm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3203, 0, 100, 7290, 30, 31, 0, 10); -- Soul Siphon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3203, 2, 100, 20791, 0, 0, 0, 10); -- Shadow Bolt

-- Gazz'uz
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3204, 0, 100, 172, 0, 0, 0, 10); -- Corruption
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3204, 1, 100, 20798, 10, 10, 0, 10); -- Demon Skin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3204, 3, 100, 20791, 0, 0, 0, 10); -- Shadow Bolt

-- Zalazane
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3205, 0, 100, 7289, 0, 0, 0, 10); -- Shrink
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3205, 1, 100, 332, 0, 0, 0, 10); -- Healing Wave

-- Voodoo Troll
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3206, 0, 100, 324, 10, 10, 0, 10); -- Lightning Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3206, 1, 100, 332, 0, 0, 0, 10); -- Healing Wave

-- Hexed Troll
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3207, 0, 100, 687, 10, 10, 0, 10); -- Demon Skin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3207, 1, 100, 348, 0, 0, 0, 10); -- Immolate

-- Bristleback Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3258, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3258, 1, 100, 8806, 10, 10, 0, 10); -- Poisoned Shot

-- Bristleback Water Seeker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3260, 0, 100, 12748, 17, 20, 0, 10); -- Frost Nova

-- Razormane Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3265, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Razormane Defender
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3266, 0, 100, 13730, 10, 10, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3266, 1, 100, 25710, 15, 24, 7, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3266, 2, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Razormane Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3269, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3269, 1, 100, 12544, 10, 10, 0, 10); -- Frost Armor

-- Elder Mystic Razorsnout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3270, 3, 100, 547, 20, 20, 0, 10); -- Healing Wave

-- Razormane Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3271, 0, 100, 547, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3271, 1, 100, 324, 10, 10, 0, 10); -- Lightning Shield

-- Kolkar Wrangler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3272, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3272, 1, 100, 12024, 20, 27, 0, 10); -- Net

-- Kolkar Stormer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3273, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3273, 1, 100, 6535, 0, 0, 0, 10); -- Lightning Cloud

-- Kolkar Pack Runner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3274, 0, 100, 9128, 33, 45, 0, 10); -- Battle Shout

-- Kolkar Marauder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3275, 0, 100, 11976, 10, 15, 0, 10); -- Strike

-- Witchwing Roguefeather
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3277, 0, 100, 7992, 16, 38, 0, 10); -- Slowing Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3277, 1, 100, 6595, 10, 10, 0, 10); -- Exploit Weakness

-- Witchwing Slayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3278, 0, 100, 13730, 10, 10, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3278, 1, 100, 7160, 0, 0, 0, 10); -- Execute

-- Witchwing Ambusher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3279, 1, 100, 6595, 10, 10, 0, 10); -- Exploit Weakness

-- Witchwing Windcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3280, 0, 100, 6728, 30, 45, 0, 10); -- Enveloping Winds

-- Venture Co. Mercenary
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3282, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Orgrimmar Grunt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3296, 0, 100, 15496, 5, 10, 0, 10); -- Cleave

-- Burning Blade Acolyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3380, 0, 100, 696, 10, 10, 0, 10); -- Demon Skin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3380, 1, 100, 707, 0, 0, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3380, 2, 100, 980, 10, 10, 0, 10); -- Curse of Agony
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3380, 3, 100, 689, 10, 10, 0, 10); -- Drain Life

-- Southsea Brigand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3381, 0, 100, 6253, 10, 28, 0, 10); -- Backhand

-- Southsea Cannoneer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3382, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Kolkar Bloodcharger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3397, 0, 100, 172, 0, 0, 0, 10); -- Corruption
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3397, 1, 100, 6742, 18, 25, 0, 10); -- Bloodlust

-- Serena Bloodfeather
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3452, 0, 100, 3264, 20, 30, 0, 10); -- Blood Howl

-- Ratchet Bruiser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3502, 0, 100, 12024, 9, 10, 0, 10); -- Net

-- Pyrewood Tailor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3530, 0, 50, 6713, 10, 10, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3530, 0, 50, 7140, 15, 29, 0, 10); -- Expose Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3530, 1, 50, 15657, 5, 5, 0, 10); -- Backstab

-- Moonrage Tailor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3531, 0, 100, 7140, 18, 30, 0, 10); -- Expose Weakness

-- Dalaran Brewmaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3577, 0, 100, 7638, 30, 30, 0, 10); -- Potion Toss

-- Thundris Windweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3649, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Mad Magglish
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3655, 1, 100, 7964, 10, 14, 0, 10); -- Smoke Bomb

-- Delmanis the Hated
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3662, 0, 100, 7101, 9, 9, 0, 10); -- Flame Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3662, 1, 100, 20792, 0, 0, 0, 10); -- Frostbolt

-- Ilkrud Magthrull
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3664, 1, 100, 20791, 0, 0, 0, 10); -- Shadow Bolt

-- Lord Cobrahn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3669, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3669, 1, 100, 5188, 20, 20, 0, 10); -- Healing Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3669, 2, 100, 8040, 16, 20, 0, 10); -- Druid's Slumber

-- Lord Pythas
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3670, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3670, 2, 100, 5187, 15, 15, 0, 10); -- Healing Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3670, 3, 100, 700, 15, 19, 0, 10); -- Sleep

-- Lady Anacondra
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3671, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3671, 1, 100, 5187, 15, 15, 0, 10); -- Healing Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3671, 2, 100, 700, 5, 10, 0, 10); -- Sleep
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3671, 3, 100, 8148, 10, 10, 0, 10); -- Thorns Aura

-- Boahn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3672, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3672, 1, 100, 8041, 20, 30, 0, 10); -- Serpent Form
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3672, 2, 100, 5187, 15, 15, 0, 10); -- Healing Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3672, 3, 100, 8040, 15, 20, 0, 10); -- Druid's Slumber

-- Lord Serpentis
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3673, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3673, 1, 100, 700, 11, 14, 0, 10); -- Sleep
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3673, 2, 100, 6778, 5, 5, 0, 10); -- Healing Touch

-- Ran Bloodtooth
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3696, 0, 100, 14443, 16, 19, 0, 10); -- Multi-Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3696, 1, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Wrathtail Myrmidon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3711, 0, 100, 11976, 5, 15, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3711, 1, 100, 11977, 20, 39, 0, 10); -- Rend

-- Wrathtail Razortail
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3712, 0, 100, 782, 19, 20, 0, 10); -- Thorns
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3712, 1, 100, 6016, 0, 0, 0, 10); -- Pierce Armor

-- Wrathtail Sea Witch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3715, 0, 100, 2691, 20, 20, 0, 10); -- Mana Burn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3715, 1, 100, 8598, 0, 0, 0, 10); -- Lightning Blast

-- Wrathtail Sorceress
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3717, 0, 100, 20792, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3717, 1, 100, 11831, 5, 10, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3717, 2, 100, 4980, 20, 20, 0, 10); -- Quick Frost Ward

-- Forsaken Seeker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3732, 0, 100, 2054, 20, 20, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3732, 1, 100, 9734, 0, 0, 0, 10); -- Holy Smite

-- Forsaken Herbalist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3733, 0, 100, 7102, 10, 10, 0, 10); -- Contagion of Rot

-- Forsaken Thug
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3734, 0, 100, 6253, 15, 24, 0, 10); -- Backhand

-- Apothecary Falthis
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3735, 1, 100, 20791, 0, 0, 0, 10); -- Shadow Bolt

-- Saltspittle Puddlejumper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3737, 0, 100, 6268, 5, 5, 0, 10); -- Rushing Charge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3737, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Saltspittle Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3739, 0, 100, 7386, 11, 15, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3739, 1, 100, 72, 14, 17, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3739, 2, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Saltspittle Muckdweller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3740, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Saltspittle Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3742, 0, 100, 2608, 10, 10, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3742, 1, 100, 913, 20, 20, 0, 10); -- Healing Wave

-- Foulweald Pathfinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3745, 1, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Foulweald Den Watcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3746, 1, 100, 3391, 20, 29, 0, 10); -- Thrash

-- Foulweald Ursa
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3749, 1, 100, 9080, 10, 27, 0, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3749, 2, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Xavian Rogue
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3752, 0, 100, 6595, 10, 10, 0, 10); -- Exploit Weakness

-- Xavian Betrayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3754, 0, 100, 5242, 20, 21, 0, 10); -- Battle Shout

-- Xavian Felsworn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3755, 0, 100, 6223, 0, 0, 0, 10); -- Corruption

-- Xavian Hellcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3757, 0, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3757, 1, 100, 5740, 11, 15, 0, 10); -- Rain of Fire

-- Felmusk Satyr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3758, 0, 100, 6942, 12, 19, 0, 10); -- Overwhelming Stench

-- Felmusk Rogue
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3759, 0, 100, 6942, 10, 13, 0, 10); -- Overwhelming Stench
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3759, 1, 100, 6595, 0, 0, 0, 10); -- Exploit Weakness

-- Felmusk Felsworn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3762, 0, 100, 6942, 12, 17, 0, 10); -- Overwhelming Stench
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3762, 1, 100, 6205, 5, 16, 0, 10); -- Curse of Weakness

-- Felmusk Shadowstalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3763, 0, 100, 6942, 11, 17, 0, 10); -- Overwhelming Stench
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3763, 2, 100, 6927, 10, 10, 0, 10); -- Shadowstalker Slash

-- Bleakheart Shadowstalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3770, 2, 100, 6927, 10, 10, 0, 10); -- Shadowstalker Slash

-- Lesser Felguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3772, 0, 100, 184, 5, 10, 0, 10); -- Fire Shield II
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3772, 1, 100, 18812, 10, 20, 0, 10); -- Knockdown

-- Akkrilus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3773, 0, 100, 5740, 10, 26, 0, 10); -- Rain of Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3773, 1, 100, 1094, 0, 0, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3773, 2, 100, 184, 10, 10, 0, 10); -- Fire Shield II

-- Felslayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3774, 0, 100, 2691, 29, 30, 0, 10); -- Mana Burn

-- Terrowulf Fleshripper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3789, 0, 100, 3604, 10, 30, 0, 10); -- Tendon Rip

-- Terrowulf Shadow Weaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3791, 0, 100, 7068, 18, 18, 0, 10); -- Veil of Shadow

-- Terrowulf Packlord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3792, 0, 100, 6576, 21, 30, 0, 10); -- Intimidating Growl
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3792, 1, 100, 6507, 10, 29, 0, 10); -- Battle Roar

-- Cenarion Protector
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3797, 0, 100, 7090, 10, 10, 0, 10); -- Bear Form
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3797, 1, 100, 15727, 10, 30, 0, 10); -- Demoralizing Roar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3797, 2, 100, 1430, 14, 15, 0, 10); -- Rejuvenation

-- Forsaken Intruder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3804, 1, 100, 7159, 10, 10, 0, 10); -- Backstab

-- Forsaken Dark Stalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3808, 1, 100, 10277, 10, 10, 0, 10); -- Throw

-- Cenarion Vindicator
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3833, 0, 100, 15798, 30, 30, 0, 10); -- Moonfire

-- Druid of the Fang
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3840, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3840, 1, 100, 8041, 20, 30, 0, 10); -- Serpent Form
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3840, 2, 100, 5187, 15, 15, 0, 10); -- Healing Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3840, 3, 100, 8040, 15, 20, 0, 10); -- Druid's Slumber

-- Sorcerer Ashcrombe
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3850, 0, 100, 122, 10, 10, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3850, 1, 100, 2120, 0, 0, 0, 10); -- Flamestrike

-- Shadowfang Whitescalp
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3851, 0, 100, 12544, 30, 31, 0, 10); -- Frost Armor

-- Shadowfang Moonwalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3853, 0, 100, 7121, 15, 15, 0, 10); -- Anti-Magic Shield

-- Shadowfang Wolfguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3854, 0, 100, 7106, 19, 20, 0, 10); -- Dark Restore

-- Shadowfang Glutton
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3857, 0, 100, 7122, 3, 5, 0, 10); -- Blood Tap

-- Rethilgore
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3914, 0, 100, 7295, 7, 30, 0, 10); -- Soul Drain

-- Thistlefur Ursa
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3921, 0, 100, 25712, 15, 29, 7, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3921, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Thistlefur Den Watcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3923, 1, 100, 3490, 10, 20, 0, 10); -- Frenzied Rage

-- Thistlefur Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3924, 0, 100, 11986, 15, 15, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3924, 2, 100, 6742, 5, 15, 0, 10); -- Bloodlust

-- Thistlefur Pathfinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3926, 1, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Ruuzel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3943, 0, 100, 25712, 9, 10, 7, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3943, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Wrathtail Priestess
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3944, 0, 100, 15970, 15, 20, 0, 10); -- Sleep
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3944, 1, 100, 11642, 20, 20, 0, 10); -- Heal

-- Interrogator Vishas
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3983, 2, 100, 2767, 5, 8, 0, 10); -- Shadow Word: Pain

-- Sarilus Foulborne
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3986, 0, 100, 20806, 0, 0, 0, 10); -- Frostbolt

-- Dal Bloodclaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3987, 0, 100, 12170, 5, 5, 0, 10); -- Revenge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3987, 1, 100, 6713, 10, 19, 0, 10); -- Disarm

-- Venture Co. Logger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3989, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Venture Co. Deforester
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3991, 0, 100, 5740, 18, 19, 0, 10); -- Rain of Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3991, 1, 100, 20793, 0, 0, 0, 10); -- Fireball

-- Venture Co. Engineer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (3992, 0, 100, 7978, 0, 0, 0, 10); -- Throw Dynamite

-- Windshear Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4003, 1, 100, 20792, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4003, 2, 100, 8139, 16, 39, 0, 10); -- Fevered Fatigue

-- Windshear Overlord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4004, 0, 100, 3631, 10, 10, 0, 10); -- Battle Fury

-- Bloodfury Roguefeather
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4023, 0, 100, 3391, 15, 18, 0, 10); -- Thrash

-- Bloodfury Slayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4024, 0, 100, 7160, 4, 5, 0, 10); -- Execute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4024, 1, 100, 16231, 9, 11, 0, 10); -- Curse of Recklessness

-- Bloodfury Ambusher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4025, 0, 100, 2608, 13, 14, 0, 10); -- Shock

-- Bloodfury Windcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4026, 0, 100, 6728, 21, 24, 0, 10); -- Enveloping Winds

-- Bloodfury Storm Witch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4027, 0, 100, 6535, 11, 12, 0, 10); -- Lightning Cloud
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4027, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Cenarion Caretaker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4050, 0, 100, 782, 10, 15, 0, 10); -- Thorns
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4050, 1, 100, 7090, 10, 10, 0, 10); -- Bear Form
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4050, 2, 100, 12161, 10, 10, 0, 10); -- Maul

-- Cenarion Botanist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4051, 0, 100, 1430, 25, 25, 0, 10); -- Rejuvenation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4051, 1, 100, 9739, 0, 0, 0, 10); -- Wrath

-- Cenarion Druid
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4052, 0, 100, 5759, 10, 10, 0, 10); -- Cat Form
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4052, 1, 100, 5217, 116, 117, 0, 10); -- Tiger's Fury
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4052, 2, 100, 9739, 0, 0, 0, 10); -- Wrath

-- Daughter of Cenarius
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4053, 0, 100, 10277, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4053, 1, 100, 527, 10, 10, 0, 10); -- Dispel Magic

-- Mirkfallon Keeper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4056, 0, 100, 8138, 36, 42, 0, 10); -- Mirkfallon Fungus

-- Mirkfallon Dryad
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4061, 0, 100, 10277, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4061, 1, 100, 7992, 70, 71, 0, 10); -- Slowing Poison

-- Dark Iron Bombardier
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4062, 0, 100, 8858, 0, 0, 0, 10); -- Bomb

-- Feeboz
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4063, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4063, 1, 100, 6131, 11, 12, 0, 10); -- Frost Nova

-- Blackrock Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4064, 0, 100, 3019, 15, 24, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4064, 1, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Blackrock Sentry
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4065, 2, 100, 3019, 10, 17, 0, 10); -- Enrage

-- Venture Co. Builder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4070, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Galak Wrangler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4093, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4093, 1, 100, 6533, 15, 29, 0, 10); -- Net

-- Galak Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4094, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Galak Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4095, 0, 100, 13730, 20, 35, 0, 10); -- Demoralizing Shout

-- Galak Windchaser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4096, 0, 100, 6728, 30, 35, 0, 10); -- Enveloping Winds
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4096, 1, 100, 939, 20, 20, 0, 10); -- Healing Wave

-- Galak Stormer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4097, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4097, 1, 100, 6535, 25, 34, 0, 10); -- Lightning Cloud

-- Galak Marauder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4099, 0, 100, 6268, 5, 5, 0, 10); -- Rushing Charge

-- Screeching Harpy
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4100, 0, 100, 3589, 12, 16, 0, 10); -- Deafening Screech

-- Screeching Roguefeather
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4101, 0, 100, 6595, 9, 10, 0, 10); -- Exploit Weakness

-- Screeching Windcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4104, 0, 100, 6982, 30, 46, 0, 10); -- Gust of Wind

-- Gravelsnout Kobold
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4111, 0, 100, 11976, 22, 29, 0, 10); -- Strike

-- Gravelsnout Vermin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4112, 0, 100, 3427, 30, 44, 0, 10); -- Infected Wound

-- Gravelsnout Digger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4113, 0, 100, 3551, 37, 38, 0, 10); -- Skull Crack

-- Gravelsnout Forager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4114, 0, 100, 8245, 30, 44, 0, 10); -- Corrosive Acid

-- Gravelsnout Surveyor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4116, 0, 100, 20806, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4116, 1, 100, 6141, 40, 45, 0, 10); -- Blizzard

-- Naram Longclaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4183, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Braelyn Firehand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4198, 0, 100, 20811, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4198, 1, 100, 12468, 5, 6, 0, 10); -- Flamestrike

-- Keeper Ordanus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4273, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4273, 1, 100, 12747, 19, 30, 0, 10); -- Entangling Roots

-- Scarlet Preserver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4280, 0, 100, 1042, 10, 10, 0, 10); -- Holy Light
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4280, 1, 100, 13953, 5, 10, 0, 10); -- Holy Strike

-- Scarlet Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4281, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4281, 1, 100, 6979, 5, 10, 0, 10); -- Fire Shot

-- Scarlet Magician
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4282, 0, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4282, 1, 100, 8457, 9, 15, 0, 10); -- Fire Ward

-- Scarlet Augur
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4284, 0, 100, 1490, 0, 1, 0, 10); -- Curse of the Elements
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4284, 1, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt

-- Scarlet Disciple
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4285, 0, 100, 6063, 0, 0, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4285, 1, 100, 8362, 13, 14, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4285, 2, 100, 9734, 0, 0, 0, 10); -- Holy Smite

-- Scarlet Soldier
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4286, 0, 100, 3639, 10, 10, 0, 10); -- Improved Blocking

-- Scarlet Gallant
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4287, 0, 100, 14517, 2, 8, 0, 10); -- Crusader Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4287, 1, 100, 5589, 5, 10, 0, 10); -- Hammer of Justice

-- Scarlet Beastmaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4288, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4288, 1, 100, 7896, 7, 15, 0, 10); -- Exploding Shot

-- Scarlet Evoker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4289, 0, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4289, 1, 100, 2601, 10, 15, 0, 10); -- Fire Shield III
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4289, 2, 100, 8422, 10, 30, 0, 10); -- Flamestrike

-- Scarlet Guardsman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4290, 0, 100, 676, 10, 10, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4290, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Scarlet Diviner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4291, 0, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4291, 1, 100, 8131, 0, 6, 0, 10); -- Mana Burn

-- Scarlet Protector
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4292, 0, 100, 3472, 10, 10, 0, 10); -- Holy Light
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4292, 1, 100, 8258, 10, 10, 0, 10); -- Devotion Aura

-- Scarlet Scryer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4293, 0, 100, 1090, 10, 30, 0, 10); -- Sleep
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4293, 1, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt

-- Scarlet Sorcerer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4294, 0, 100, 8364, 5, 30, 0, 10); -- Blizzard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4294, 1, 100, 6146, 10, 19, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4294, 2, 100, 9672, 8, 8, 0, 10); -- Frostbolt

-- Scarlet Adept
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4296, 0, 100, 6063, 10, 10, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4296, 1, 100, 9734, 0, 0, 0, 10); -- Holy Smite

-- Scarlet Conjuror
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4297, 1, 100, 9053, 0, 0, 0, 10); -- Fireball

-- Scarlet Defender
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4298, 0, 100, 11972, 5, 15, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4298, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4298, 2, 100, 3639, 6, 13, 0, 10); -- Improved Blocking

-- Scarlet Chaplain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4299, 0, 100, 1006, 6, 20, 0, 10); -- Inner Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4299, 1, 100, 6066, 5, 25, 0, 10); -- Power Word: Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4299, 2, 100, 8362, 10, 25, 0, 10); -- Renew

-- Scarlet Wizard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4300, 0, 100, 8439, 10, 10, 0, 10); -- Arcane Explosion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4300, 1, 100, 2601, 15, 20, 0, 10); -- Fire Shield III

-- Scarlet Champion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4302, 0, 100, 17143, 5, 20, 0, 10); -- Holy Strike

-- Scarlet Abbot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4303, 0, 100, 1006, 10, 29, 0, 10); -- Inner Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4303, 1, 100, 6064, 10, 10, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4303, 2, 100, 8362, 20, 20, 0, 10); -- Renew

-- Mirefin Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4360, 1, 100, 6190, 10, 10, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4360, 2, 100, 6192, 16, 30, 0, 10); -- Battle Shout

-- Mirefin Muckdweller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4361, 1, 100, 6278, 10, 20, 0, 10); -- Creeping Mold

-- Mirefin Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4363, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4363, 2, 100, 959, 20, 20, 0, 10); -- Healing Wave

-- Strashaz Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4364, 0, 100, 16856, 5, 10, 0, 10); -- Mortal Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4364, 1, 100, 9080, 11, 17, 0, 10); -- Hamstring

-- Strashaz Serpent Guard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4366, 0, 100, 6713, 11, 20, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4366, 1, 100, 16509, 10, 20, 0, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4366, 2, 100, 12057, 5, 15, 0, 10); -- Strike

-- Strashaz Myrmidon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4368, 0, 100, 15754, 5, 13, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4368, 1, 100, 18812, 5, 10, 0, 10); -- Knockdown

-- Strashaz Sorceress
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4370, 0, 100, 12737, 5, 10, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4370, 1, 100, 15499, 5, 10, 0, 10); -- Frost Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4370, 2, 100, 15532, 15, 20, 0, 10); -- Frost Nova

-- Strashaz Siren
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4371, 1, 100, 15654, 10, 20, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4371, 2, 100, 15587, 0, 0, 0, 10); -- Mind Blast

-- Muckshell Clacker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4401, 0, 100, 3604, 25, 30, 0, 10); -- Tendon Rip

-- Muckshell Scrabbler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4404, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4404, 1, 100, 8005, 15, 15, 0, 10); -- Healing Wave

-- Defias Strip Miner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4416, 0, 100, 6016, 19, 30, 0, 10); -- Pierce Armor

-- Defias Taskmaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4417, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4417, 1, 100, 6685, 10, 10, 0, 10); -- Piercing Shot

-- Defias Wizard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4418, 0, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4418, 1, 100, 4979, 0, 0, 0, 10); -- Quick Flame Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4418, 3, 100, 113, 0, 0, 0, 10); -- Chains of Ice

-- Ward Guardian
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4427, 0, 100, 959, 5, 5, 0, 10); -- Healing Wave

-- Death Speaker Jargba
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4428, 0, 100, 9613, 2, 2, 0, 10); -- Shadow Bolt

-- Razorfen Quilguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4436, 0, 100, 8258, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4436, 1, 100, 15548, 30, 43, 0, 10); -- Thunderclap
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4436, 2, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Razorfen Warden
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4437, 0, 100, 6533, 17, 25, 0, 10); -- Net

-- Razorfen Spearhide
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4438, 0, 100, 8148, 10, 10, 0, 10); -- Thorns Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4438, 1, 100, 8259, 15, 20, 0, 10); -- Whirling Barrage

-- Razorfen Defender
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4442, 0, 100, 3248, 11, 28, 0, 10); -- Improved Blocking
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4442, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4442, 2, 100, 11972, 10, 15, 0, 10); -- Shield Bash

-- Murkgill Forager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4457, 0, 100, 744, 10, 10, 0, 10); -- Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4457, 1, 100, 13443, 10, 10, 0, 10); -- Rend

-- Blackrock Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4462, 0, 100, 3019, 16, 30, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4462, 1, 100, 10277, 10, 10, 0, 10); -- Throw

-- Blackrock Summoner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4463, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4463, 1, 100, 184, 0, 8, 0, 10); -- Fire Shield II
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4463, 2, 100, 3019, 33, 59, 0, 10); -- Enrage

-- Blackrock Gladiator
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4464, 0, 100, 3019, 11, 27, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4464, 1, 100, 676, 11, 20, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4464, 2, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4464, 3, 100, 5242, 28, 29, 0, 10); -- Battle Shout

-- Vilebranch Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4465, 0, 100, 12057, 5, 8, 0, 10); -- Strike

-- Vilebranch Scalper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4466, 0, 100, 7160, 10, 10, 0, 10); -- Execute

-- Vilebranch Soothsayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4467, 0, 100, 10395, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4467, 1, 100, 20824, 0, 0, 0, 10); -- Lightning Bolt

-- Fardel Dabyrie
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4479, 0, 100, 3583, 13, 22, 0, 10); -- Deadly Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4479, 2, 100, 3391, 11, 15, 0, 10); -- Thrash

-- Kenata Dabyrie
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4480, 1, 100, 8379, 12, 20, 0, 10); -- Disarm

-- Marcel Dabyrie
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4481, 0, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4481, 1, 100, 11972, 5, 10, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4481, 2, 100, 15062, 60, 60, 0, 10); -- Shield Wall

-- Scarlet Avenger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4493, 1, 100, 3391, 5, 13, 0, 10); -- Thrash

-- Scarlet Spellbinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4494, 0, 100, 11436, 18, 26, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4494, 1, 100, 11831, 11, 19, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4494, 2, 100, 20822, 0, 0, 0, 10); -- Frostbolt

-- Death's Head Acolyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4515, 0, 100, 8362, 15, 15, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4515, 1, 100, 15785, 5, 9, 0, 10); -- Mana Burn

-- Death's Head Adept
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4516, 0, 100, 9672, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4516, 1, 100, 113, 10, 20, 0, 10); -- Chains of Ice

-- Death's Head Priest
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4517, 0, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4517, 1, 100, 6063, 10, 10, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4517, 2, 100, 1245, 10, 10, 0, 10); -- Power Word: Fortitude

-- Razorfen Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4520, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Razorfen Dustweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4522, 0, 100, 6728, 15, 23, 0, 10); -- Enveloping Winds

-- Razorfen Groundshaker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4523, 0, 100, 6524, 10, 20, 0, 10); -- Ground Tremor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4523, 1, 100, 8046, 10, 15, 0, 10); -- Earth Shock

-- Razorfen Earthbreaker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4525, 0, 100, 8272, 21, 28, 0, 10); -- Mind Tremor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4525, 1, 100, 8046, 10, 19, 0, 10); -- Earth Shock

-- Razorfen Handler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4530, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Razorfen Beast Trainer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4531, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4531, 1, 100, 6984, 5, 10, 0, 10); -- Frost Shot

-- Razorfen Beastmaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4532, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4532, 1, 100, 8275, 29, 45, 0, 10); -- Poisoned Shot

-- Scarlet Monk
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4540, 1, 100, 3391, 5, 15, 0, 10); -- Thrash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4540, 2, 100, 11978, 3, 7, 0, 10); -- Kick

-- Quilguard Champion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4623, 0, 100, 8258, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4623, 1, 100, 15572, 5, 10, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4623, 2, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Booty Bay Bruiser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4624, 0, 100, 12024, 9, 10, 0, 10); -- Net

-- Kolkar Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4633, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Kolkar Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4634, 0, 100, 3391, 15, 18, 0, 10); -- Thrash

-- Kolkar Windchaser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4635, 0, 100, 6728, 28, 29, 0, 10); -- Enveloping Winds
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4635, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Kolkar Battle Lord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4636, 0, 100, 8258, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4636, 1, 100, 25710, 10, 11, 7, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4636, 2, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Kolkar Destroyer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4637, 0, 100, 11824, 5, 12, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4637, 1, 100, 7160, 20, 20, 0, 10); -- Execute

-- Magram Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4638, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Magram Wrangler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4640, 0, 100, 6533, 20, 21, 0, 10); -- Net

-- Magram Windchaser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4641, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4641, 1, 100, 959, 20, 20, 0, 10); -- Healing Wave

-- Magram Stormer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4642, 0, 100, 6535, 18, 19, 0, 10); -- Lightning Cloud
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4642, 1, 100, 8788, 10, 10, 0, 10); -- Lightning Shield

-- Magram Marauder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4644, 0, 100, 845, 10, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4644, 1, 100, 7366, 10, 10, 0, 10); -- Berserker Stance

-- Magram Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4645, 0, 100, 3391, 19, 23, 0, 10); -- Thrash

-- Gelkis Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4647, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Gelkis Stamper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4648, 0, 100, 5568, 12, 13, 0, 10); -- Trample

-- Gelkis Windchaser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4649, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4649, 1, 100, 959, 20, 20, 0, 10); -- Healing Wave

-- Gelkis Earthcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4651, 0, 100, 20815, 0, 0, 0, 10); -- Fireball

-- Gelkis Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4652, 0, 100, 3391, 12, 13, 0, 10); -- Thrash

-- Gelkis Marauder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4653, 0, 100, 845, 10, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4653, 1, 100, 7366, 10, 10, 0, 10); -- Berserker Stance

-- Maraudine Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4654, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Maraudine Wrangler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4655, 0, 100, 6533, 20, 23, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4655, 1, 100, 8379, 15, 16, 0, 10); -- Disarm

-- Maraudine Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4656, 0, 100, 3391, 5, 6, 0, 10); -- Thrash

-- Maraudine Windchaser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4657, 0, 100, 6728, 0, 0, 0, 10); -- Enveloping Winds
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4657, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4657, 2, 100, 11986, 10, 10, 0, 10); -- Healing Wave

-- Maraudine Stormer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4658, 0, 100, 9654, 0, 0, 0, 10); -- Jumping Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4658, 1, 100, 8788, 10, 10, 0, 10); -- Lightning Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4658, 2, 100, 8293, 21, 23, 0, 10); -- Lightning Cloud

-- Maraudine Marauder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4659, 0, 100, 7366, 10, 10, 0, 10); -- Berserker Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4659, 1, 100, 15496, 6, 9, 0, 10); -- Cleave

-- Burning Blade Augur
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4663, 0, 100, 6909, 14, 21, 0, 10); -- Curse of Thorns
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4663, 1, 100, 20807, 0, 0, 0, 10); -- Shadow Bolt

-- Burning Blade Reaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4664, 0, 100, 8374, 10, 10, 0, 10); -- Arcing Smash

-- Burning Blade Adept
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4665, 0, 100, 19816, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4665, 1, 100, 6742, 19, 20, 0, 10); -- Bloodlust

-- Burning Blade Shadowmage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4667, 0, 100, 9657, 10, 10, 0, 10); -- Shadow Shell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4667, 1, 100, 20816, 0, 0, 0, 10); -- Shadow Bolt

-- Burning Blade Summoner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4668, 1, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt

-- Hatefury Rogue
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4670, 0, 100, 6920, 10, 10, 0, 10); -- Hide

-- Hatefury Trickster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4671, 0, 100, 744, 13, 35, 0, 10); -- Poison

-- Hatefury Shadowstalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4674, 0, 100, 6595, 10, 10, 0, 10); -- Exploit Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4674, 1, 100, 8629, 10, 17, 0, 10); -- Gouge

-- Hatefury Hellcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4675, 0, 100, 1094, 20, 26, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4675, 1, 100, 5740, 20, 25, 0, 10); -- Rain of Fire

-- Lesser Infernal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4676, 0, 100, 2601, 10, 15, 0, 10); -- Fire Shield III

-- Mana Eater
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4678, 0, 100, 8131, 10, 10, 0, 10); -- Mana Burn

-- Nether Maiden
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4679, 0, 100, 7816, 5, 5, 0, 10); -- Lash of Pain

-- Doomwarder Captain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4680, 0, 100, 3261, 15, 30, 0, 10); -- Ignite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4680, 1, 100, 6192, 16, 26, 0, 10); -- Battle Shout

-- Mage Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4681, 0, 100, 3429, 16, 19, 0, 10); -- Plague Mind

-- Nether Sister
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4682, 0, 100, 7816, 5, 5, 0, 10); -- Lash of Pain

-- Nether Sorceress
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4684, 0, 100, 15968, 10, 10, 0, 10); -- Lash of Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4684, 1, 100, 20297, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4684, 2, 100, 11831, 15, 23, 0, 10); -- Frost Nova

-- Ley Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4685, 0, 100, 22189, 5, 15, 0, 10); -- Mana Burn

-- Burning Blade Invoker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4705, 0, 100, 11829, 12, 16, 0, 10); -- Flamestrike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4705, 1, 100, 9658, 10, 11, 0, 10); -- Flame Buffet

-- Slitherblade Naga
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4711, 0, 100, 7947, 13, 14, 0, 10); -- Localized Toxin

-- Slitherblade Sorceress
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4712, 0, 100, 12544, 10, 10, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4712, 1, 100, 20819, 0, 0, 0, 10); -- Frostbolt

-- Slitherblade Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4713, 0, 100, 9080, 28, 29, 0, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4713, 1, 100, 11977, 13, 14, 0, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4713, 2, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4713, 3, 100, 7947, 19, 20, 0, 10); -- Localized Toxin

-- Slitherblade Myrmidon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4714, 1, 100, 7947, 5, 16, 0, 10); -- Localized Toxin

-- Slitherblade Razortail
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4715, 1, 100, 7947, 10, 11, 0, 10); -- Localized Toxin

-- Slitherblade Tidehunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4716, 0, 100, 10277, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4716, 1, 100, 865, 21, 23, 0, 10); -- Frost Nova

-- Slitherblade Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4718, 0, 100, 11436, 22, 23, 0, 10); -- Slow

-- Slitherblade Sea Witch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4719, 0, 100, 8427, 11, 15, 0, 10); -- Blizzard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4719, 1, 100, 12544, 29, 30, 0, 10); -- Frost Armor

-- Foreman Cozzle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4723, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4723, 1, 100, 4979, 0, 0, 0, 10); -- Quick Flame Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4723, 2, 100, 184, 10, 14, 0, 10); -- Fire Shield II

-- Fallenroot Satyr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4788, 0, 100, 676, 16, 29, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4788, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Fallenroot Rogue
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4789, 1, 100, 8355, 10, 10, 0, 10); -- Exploit Weakness

-- Fallenroot Shadowstalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4798, 1, 100, 6205, 10, 15, 0, 10); -- Curse of Weakness

-- Fallenroot Hellcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4799, 0, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4799, 1, 100, 8129, 5, 10, 0, 10); -- Mana Burn

-- Blackfathom Tide Priestess
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4802, 0, 100, 9672, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4802, 1, 100, 2055, 20, 20, 0, 10); -- Heal

-- Blackfathom Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4803, 0, 100, 939, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4803, 1, 100, 8363, 10, 20, 0, 10); -- Parasite

-- Blackfathom Sea Witch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4805, 0, 100, 8364, 20, 29, 0, 10); -- Blizzard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4805, 1, 100, 6143, 10, 10, 0, 10); -- Frost Ward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4805, 2, 100, 12544, 2, 20, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4805, 3, 100, 122, 15, 20, 0, 10); -- Frost Nova

-- Blackfathom Myrmidon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4807, 0, 100, 8379, 15, 30, 0, 10); -- Disarm

-- Twilight Acolyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4809, 0, 100, 2055, 0, 0, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4809, 1, 100, 8362, 15, 25, 0, 10); -- Renew

-- Twilight Reaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4810, 0, 100, 8374, 0, 0, 0, 10); -- Arcing Smash

-- Twilight Aquamancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4811, 0, 100, 9672, 0, 0, 0, 10); -- Frostbolt

-- Twilight Loreseeker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4812, 0, 100, 18972, 10, 19, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4812, 1, 100, 8365, 5, 10, 0, 10); -- Enlarge

-- Twilight Shadowmage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4813, 0, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt

-- Twilight Elementalist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4814, 0, 100, 8046, 5, 15, 0, 10); -- Earth Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4814, 1, 100, 8052, 7, 23, 0, 10); -- Flame Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4814, 2, 100, 8056, 5, 15, 0, 10); -- Frost Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4814, 3, 100, 2609, 5, 24, 0, 10); -- Shock

-- Murkshallow Snapclaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4815, 0, 100, 8379, 30, 44, 0, 10); -- Disarm

-- Blindlight Murloc
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4818, 0, 100, 7405, 6, 9, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4818, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Blindlight Muckdweller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4819, 0, 100, 8382, 16, 30, 0, 10); -- Leech Poison

-- Blindlight Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4820, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4820, 1, 100, 8362, 20, 20, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4820, 2, 100, 6063, 20, 20, 0, 10); -- Heal

-- Lady Sarevess
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4831, 0, 100, 8435, 0, 0, 0, 10); -- Forked Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4831, 1, 100, 865, 10, 15, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4831, 2, 100, 246, 5, 10, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4831, 3, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Earthcaller Halmgar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4842, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Shadowforge Surveyor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4844, 0, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4844, 1, 100, 12544, 17, 30, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4844, 2, 100, 865, 10, 23, 0, 10); -- Frost Nova

-- Shadowforge Ruffian
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4845, 0, 100, 1767, 7, 8, 0, 10); -- Kick
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4845, 2, 100, 6772, 10, 10, 0, 10); -- Trip

-- Shadowforge Digger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4846, 0, 100, 8380, 6, 9, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4846, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Shadowforge Relic Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4847, 0, 100, 6064, 10, 10, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4847, 1, 100, 2767, 17, 30, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4847, 2, 100, 6726, 15, 25, 0, 10); -- Silence

-- Stonevault Cave Lurker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4850, 1, 100, 8721, 1, 3, 0, 10); -- Backstab

-- Stonevault Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4852, 0, 100, 8005, 10, 10, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4852, 1, 100, 945, 5, 15, 0, 10); -- Lightning Shield

-- Stonevault Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4853, 0, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4853, 1, 100, 10452, 5, 20, 0, 10); -- Flame Buffet

-- Grimlok
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4854, 0, 100, 8292, 5, 10, 0, 10); -- Chain Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4854, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4854, 2, 100, 6742, 10, 15, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4854, 3, 100, 11892, 17, 26, 0, 10); -- Shrink

-- Stonevault Brawler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4855, 0, 100, 3391, 10, 15, 0, 10); -- Thrash

-- Stonevault Cave Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4856, 0, 100, 6533, 15, 24, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4856, 1, 100, 10277, 10, 10, 0, 10); -- Throw

-- Guard Edward
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4922, 0, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4922, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4922, 2, 100, 11976, 10, 10, 0, 10); -- Strike

-- Guard Jarad
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4923, 0, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4923, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4923, 2, 100, 11976, 0, 0, 0, 10); -- Strike

-- Dashel Stonefist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4961, 0, 100, 12555, 6, 10, 0, 10); -- Pummel

-- Tapoke "Slim" Jahn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4962, 0, 100, 12555, 5, 9, 0, 10); -- Pummel

-- Private Hendel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4966, 0, 100, 11977, 15, 30, 0, 10); -- Rend

-- Guard Lasiter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (4973, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Guard Kahil
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5091, 0, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5091, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5091, 2, 100, 11976, 0, 0, 0, 10); -- Strike

-- Guard Lana
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5092, 0, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5092, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Guard Narrisha
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5093, 0, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5093, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Guard Tark
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5094, 0, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5094, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Gordunni Brute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5232, 0, 100, 10966, 17, 19, 0, 10); -- Uppercut

-- Gordunni Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5234, 1, 100, 3391, 21, 25, 0, 10); -- Thrash

-- Gordunni Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5236, 0, 100, 8005, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5236, 2, 100, 8134, 13, 14, 0, 10); -- Lightning Shield

-- Gordunni Ogre Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5237, 0, 100, 6742, 36, 37, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5237, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Gordunni Battlemaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5238, 1, 100, 13730, 29, 30, 0, 10); -- Demoralizing Shout

-- Gordunni Mage-Lord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5239, 0, 100, 6742, 35, 36, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5239, 1, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5239, 2, 100, 20827, 30, 31, 0, 10); -- Flamestrike

-- Gordunni Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5240, 0, 100, 20298, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5240, 1, 100, 7289, 39, 40, 0, 10); -- Shrink

-- Gordunni Warlord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5241, 0, 100, 10967, 24, 33, 0, 10); -- Echoing Roar

-- Woodpaw Mongrel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5249, 0, 100, 7102, 33, 34, 0, 10); -- Contagion of Rot

-- Woodpaw Trapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5251, 0, 100, 6533, 29, 30, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5251, 1, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Woodpaw Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5254, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5254, 1, 100, 8005, 19, 20, 0, 10); -- Healing Wave

-- Woodpaw Reaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5255, 0, 100, 7369, 10, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5255, 1, 100, 7366, 10, 10, 0, 10); -- Berserker Stance

-- Atal'ai Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5256, 0, 100, 13445, 12, 28, 0, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5256, 1, 100, 13446, 6, 15, 0, 10); -- Strike

-- Atal'ai Witch Doctor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5259, 0, 100, 11641, 15, 25, 0, 10); -- Hex
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5259, 1, 100, 12058, 10, 20, 0, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5259, 2, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5259, 3, 100, 11986, 15, 15, 0, 10); -- Healing Wave

-- Atal'ai Priest
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5269, 0, 100, 12039, 15, 15, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5269, 2, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5269, 3, 100, 12040, 44, 55, 0, 10); -- Shadow Shield

-- Atal'ai High Priest
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5273, 0, 100, 12039, 15, 15, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5273, 1, 100, 12040, 43, 56, 0, 10); -- Shadow Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5273, 2, 100, 8362, 28, 33, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5273, 3, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt

-- Elder Rage Scar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5297, 0, 100, 6507, 44, 45, 0, 10); -- Battle Roar

-- Ferocious Rage Scar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5299, 0, 100, 3147, 23, 24, 0, 10); -- Rend Flesh

-- Coast Crawl Deepseer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5328, 0, 100, 9672, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5328, 1, 100, 12544, 29, 30, 0, 10); -- Frost Armor

-- Hatecrest Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5331, 0, 100, 6713, 19, 20, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5331, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Hatecrest Wave Rider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5332, 0, 100, 10987, 21, 31, 0, 10); -- Geyser

-- Hatecrest Screamer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5335, 0, 100, 8281, 16, 28, 0, 10); -- Sonic Burst
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5335, 1, 100, 6078, 22, 23, 0, 10); -- Renew

-- Hatecrest Siren
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5337, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Diamond Head
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5345, 0, 100, 5164, 10, 13, 0, 10); -- Knockdown

-- Northspring Harpy
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5362, 0, 100, 11014, 10, 10, 0, 10); -- Flow of the Northspring

-- Northspring Roguefeather
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5363, 0, 100, 11014, 23, 24, 0, 10); -- Flow of the Northspring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5363, 1, 100, 3391, 12, 23, 0, 10); -- Thrash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5363, 2, 100, 6595, 10, 10, 0, 10); -- Exploit Weakness

-- Northspring Slayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5364, 0, 100, 11014, 25, 26, 0, 10); -- Flow of the Northspring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5364, 1, 100, 7160, 20, 20, 0, 10); -- Execute

-- Northspring Windcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5366, 0, 100, 6728, 21, 22, 0, 10); -- Enveloping Winds
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5366, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5366, 2, 100, 11014, 26, 27, 0, 10); -- Flow of the Northspring

-- Veyzhak the Cannibal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5399, 1, 100, 12054, 10, 15, 0, 10); -- Rend

-- Kazkaz the Unholy
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5401, 1, 100, 11639, 10, 20, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5401, 2, 100, 9081, 11, 19, 0, 10); -- Shadow Bolt Volley

-- Dunemaul Ogre
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5471, 0, 100, 25710, 27, 28, 7, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5471, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Dunemaul Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5472, 1, 100, 13730, 22, 23, 0, 10); -- Demoralizing Shout

-- Dunemaul Ogre Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5473, 0, 100, 6742, 33, 34, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5473, 1, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5473, 2, 100, 11436, 10, 11, 0, 10); -- Slow

-- Dunemaul Brute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5474, 0, 100, 10966, 23, 28, 0, 10); -- Uppercut

-- Dunemaul Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5475, 0, 100, 6909, 33, 34, 0, 10); -- Curse of Thorns
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5475, 1, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5475, 2, 100, 2941, 22, 38, 0, 10); -- Immolate

-- Ironforge Guard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5595, 0, 100, 11971, 5, 10, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5595, 1, 100, 8078, 26, 45, 0, 10); -- Thunderclap

-- Khan Dez'hepah
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5600, 0, 100, 25710, 5, 6, 7, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5600, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Khan Jehn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5601, 0, 100, 11972, 5, 6, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5601, 1, 100, 8380, 10, 10, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5601, 2, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Khan Shaka
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5602, 0, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5602, 1, 100, 9080, 18, 19, 0, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5602, 2, 100, 11977, 10, 11, 0, 10); -- Rend

-- Wastewander Rogue
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5615, 1, 100, 8721, 0, 11, 0, 10); -- Backstab

-- Wastewander Thief
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5616, 0, 100, 6713, 15, 21, 0, 10); -- Disarm

-- Wastewander Shadow Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5617, 1, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5617, 2, 100, 20826, 12, 39, 0, 10); -- Immolate

-- Wastewander Bandit
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5618, 0, 100, 8629, 10, 10, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5618, 1, 100, 8721, 10, 10, 0, 10); -- Backstab

-- Wastewander Assassin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5623, 0, 100, 7160, 10, 10, 0, 10); -- Execute

-- Tyranis Malem
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5643, 0, 100, 15798, 14, 15, 0, 10); -- Moonfire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5643, 1, 100, 9739, 0, 0, 0, 10); -- Wrath

-- Sandfury Hideskinner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5645, 0, 100, 15657, 3, 5, 0, 10); -- Backstab

-- Sandfury Axe Thrower
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5646, 0, 100, 15607, 10, 10, 0, 10); -- Throw

-- Sandfury Firecaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5647, 0, 100, 6219, 30, 41, 0, 10); -- Rain of Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5647, 1, 100, 14034, 0, 0, 0, 10); -- Fireball

-- Sandfury Shadowcaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5648, 0, 100, 12471, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5648, 1, 100, 14032, 5, 30, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5648, 2, 100, 20798, 59, 61, 0, 10); -- Demon Skin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5648, 3, 100, 18396, 5, 5, 0, 10); -- Dismounting Blast

-- Sandfury Blood Drinker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5649, 0, 100, 11898, 5, 20, 0, 10); -- Blood Leech

-- Sandfury Witch Doctor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5650, 2, 100, 17843, 15, 20, 0, 10); -- Flash Heal

-- Dalin Forgewright
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5682, 0, 100, 6075, 25, 25, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5682, 1, 100, 1244, 10, 10, 0, 10); -- Power Word: Fortitude
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5682, 2, 100, 2054, 30, 30, 0, 10); -- Heal

-- Comar Villard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5683, 2, 100, 1776, 10, 10, 0, 10); -- Gouge

-- Lord Azrethoc
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5760, 0, 100, 13737, 5, 10, 0, 10); -- Mortal Strike

-- Jugkar Grim'rod
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5771, 0, 100, 12471, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5771, 1, 100, 12741, 7, 8, 0, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5771, 2, 100, 20787, 5, 6, 0, 10); -- Immolate

-- Snagglespear
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5786, 0, 100, 12024, 27, 28, 0, 10); -- Net

-- Watch Commander Zalaphil
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5809, 0, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5809, 1, 100, 11972, 5, 5, 0, 10); -- Shield Bash

-- Felweaver Scornn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5822, 1, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5822, 2, 100, 696, 10, 10, 0, 10); -- Demon Skin

-- Captain Flat Tusk
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5824, 0, 100, 25710, 8, 12, 7, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5824, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Geolord Mottle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5826, 0, 100, 547, 13, 13, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5826, 1, 100, 324, 10, 10, 0, 10); -- Lightning Shield

-- Sister Rathtalon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5830, 0, 100, 6982, 10, 20, 0, 10); -- Gust of Wind
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5830, 1, 100, 6728, 29, 30, 0, 10); -- Enveloping Winds
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5830, 2, 100, 6535, 15, 30, 0, 10); -- Lightning Cloud

-- Foreman Grills
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5835, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5835, 2, 100, 9080, 10, 11, 0, 10); -- Hamstring

-- Brokespear
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5838, 0, 100, 10277, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5838, 1, 100, 7992, 45, 56, 0, 10); -- Slowing Poison

-- Dark Iron Geologist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5839, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5839, 1, 100, 8858, 5, 10, 0, 10); -- Bomb

-- Dark Iron Steamsmith
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5840, 0, 100, 11983, 17, 35, 0, 10); -- Steam Jet

-- Rocklance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5841, 0, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5841, 1, 100, 7386, 4, 5, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5841, 2, 100, 5532, 10, 19, 0, 10); -- Cleave

-- Dark Iron Slaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5844, 0, 100, 6533, 20, 33, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5844, 1, 100, 11977, 10, 20, 0, 10); -- Rend

-- Dark Iron Taskmaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5846, 1, 100, 5115, 10, 19, 0, 10); -- Battle Command

-- Digger Flameforge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5849, 0, 100, 7978, 0, 0, 0, 10); -- Throw Dynamite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5849, 1, 100, 6253, 19, 22, 0, 10); -- Backhand

-- Twilight Dark Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5860, 0, 100, 7289, 27, 45, 0, 10); -- Shrink
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5860, 1, 100, 15500, 7, 15, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5860, 2, 100, 12491, 20, 20, 0, 10); -- Healing Wave

-- Twilight Fire Guard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5861, 0, 100, 15243, 28, 44, 0, 10); -- Fireball Volley

-- Twilight Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5862, 0, 100, 14034, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5862, 1, 100, 11436, 11, 44, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5862, 2, 100, 11990, 12, 30, 0, 10); -- Rain of Fire

-- Geopriest Gukk'rok
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5863, 0, 100, 600, 16, 20, 0, 10); -- Power Word: Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5863, 1, 100, 6075, 21, 25, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5863, 2, 100, 2054, 20, 20, 0, 10); -- Heal

-- Brother Ravenoak
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5915, 0, 100, 7090, 10, 10, 0, 10); -- Bear Form
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5915, 1, 100, 2090, 19, 20, 0, 10); -- Rejuvenation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5915, 2, 100, 8716, 10, 10, 0, 10); -- Low Swipe
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5915, 3, 100, 12161, 10, 10, 0, 10); -- Maul

-- Sentinel Amarassan
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5916, 1, 100, 5217, 1, 1, 0, 10); -- Tiger's Fury
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5916, 2, 100, 9739, 0, 0, 0, 10); -- Wrath

-- Sister Riven
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5930, 0, 100, 3356, 44, 45, 0, 10); -- Flame Lash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5930, 1, 100, 6725, 22, 23, 0, 10); -- Flame Spike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5930, 2, 100, 184, 30, 30, 0, 10); -- Fire Shield II

-- Foreman Rigger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5931, 0, 100, 6016, 10, 10, 0, 10); -- Pierce Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5931, 1, 100, 6533, 18, 28, 0, 10); -- Net

-- Taskmaster Whipfang
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5932, 1, 100, 16508, 32, 33, 0, 10); -- Intimidating Roar

-- Achellios the Banished
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5933, 0, 100, 6192, 20, 24, 0, 10); -- Battle Shout

-- Dreadmaul Ogre Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5975, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5975, 1, 100, 6742, 12, 19, 0, 10); -- Bloodlust

-- Dreadmaul Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5977, 0, 100, 3391, 10, 15, 0, 10); -- Thrash

-- Dreadmaul Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5978, 0, 100, 20298, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5978, 1, 100, 8282, 16, 26, 0, 10); -- Curse of Blood

-- Wretched Lost One
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5979, 0, 100, 11962, 12, 13, 0, 10); -- Immolate

-- Portal Seeker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5981, 0, 100, 20822, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5981, 1, 100, 11975, 11, 25, 0, 10); -- Arcane Explosion

-- Helboar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5993, 0, 100, 11970, 16, 23, 0, 10); -- Fire Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5993, 1, 100, 6268, 5, 5, 0, 10); -- Rushing Charge

-- Nethergarde Miner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5996, 0, 100, 11971, 5, 8, 0, 10); -- Sunder Armor

-- Nethergarde Engineer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5997, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5997, 1, 100, 8858, 7, 8, 0, 10); -- Bomb

-- Nethergarde Foreman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5998, 0, 100, 5115, 10, 13, 0, 10); -- Battle Command

-- Nethergarde Soldier
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5999, 0, 100, 3248, 13, 20, 0, 10); -- Improved Blocking
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (5999, 1, 100, 11972, 11, 12, 0, 10); -- Shield Bash

-- Nethergarde Cleric
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6000, 0, 100, 11642, 20, 20, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6000, 1, 100, 11974, 28, 29, 0, 10); -- Power Word: Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6000, 2, 100, 9734, 0, 0, 0, 10); -- Holy Smite

-- Nethergarde Analyst
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6001, 0, 100, 7140, 10, 14, 0, 10); -- Expose Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6001, 1, 100, 7159, 10, 10, 0, 10); -- Backstab

-- Nethergarde Riftwatcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6002, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6002, 1, 100, 11975, 10, 13, 0, 10); -- Arcane Explosion

-- Nethergarde Officer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6003, 0, 100, 11976, 5, 7, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6003, 1, 100, 11977, 13, 14, 0, 10); -- Rend

-- Shadowsworn Cultist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6004, 0, 100, 10277, 10, 10, 0, 10); -- Throw

-- Shadowsworn Thug
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6005, 0, 100, 3391, 19, 20, 0, 10); -- Thrash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6005, 1, 100, 8646, 12, 15, 0, 10); -- Snap Kick
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6005, 2, 100, 11978, 5, 9, 0, 10); -- Kick

-- Shadowsworn Adept
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6006, 0, 100, 7154, 24, 30, 0, 10); -- Dark Offering
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6006, 1, 100, 11015, 6, 15, 0, 10); -- Blood Leech

-- Shadowsworn Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6007, 0, 100, 15496, 5, 14, 0, 10); -- Cleave

-- Shadowsworn Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6008, 0, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6008, 1, 100, 11980, 25, 44, 0, 10); -- Curse of Weakness

-- Shadowsworn Dreadweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6009, 0, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6009, 1, 100, 8994, 180, 180, 0, 10); -- Banish
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6009, 2, 100, 7098, 19, 45, 0, 10); -- Curse of Mending

-- Felhound
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6010, 0, 100, 13321, 19, 20, 0, 10); -- Mana Burn

-- Razorfen Stalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6035, 1, 100, 7159, 4, 6, 0, 10); -- Backstab

-- Vejrek
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6113, 0, 100, 7386, 6, 7, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6113, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Felguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6115, 0, 100, 11428, 9, 11, 0, 10); -- Knockdown

-- Haldarr Trickster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6126, 0, 100, 7098, 20, 45, 0, 10); -- Curse of Mending

-- Haldarr Felsworn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6127, 1, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt

-- Arkkoran Pincer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6137, 0, 100, 13443, 25, 44, 0, 10); -- Rend

-- Arkkoran Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6138, 0, 100, 11824, 10, 11, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6138, 1, 100, 12550, 9, 38, 0, 10); -- Lightning Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6138, 2, 100, 11986, 20, 20, 0, 10); -- Healing Wave

-- Roogug
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6168, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt

-- Gutspill
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6170, 0, 100, 3424, 24, 29, 0, 10); -- Tainted Howl

-- Daphne Stilwell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6182, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Timbermaw Pathfinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6184, 0, 100, 16498, 21, 29, 0, 10); -- Faerie Fire

-- Timbermaw Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6185, 0, 100, 11976, 5, 14, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6185, 1, 100, 11977, 17, 35, 0, 10); -- Rend

-- Timbermaw Den Watcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6187, 0, 100, 9128, 20, 44, 0, 10); -- Battle Shout

-- Timbermaw Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6188, 0, 100, 20295, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6188, 1, 100, 6535, 24, 29, 0, 10); -- Lightning Cloud
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6188, 2, 100, 11986, 20, 20, 0, 10); -- Healing Wave

-- Timbermaw Ursa
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6189, 0, 100, 8078, 34, 44, 0, 10); -- Thunderclap

-- Spitelash Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6190, 0, 100, 6713, 20, 30, 0, 10); -- Disarm

-- Spitelash Screamer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6193, 0, 100, 3589, 15, 25, 0, 10); -- Deafening Screech

-- Spitelash Serpent Guard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6194, 0, 100, 12548, 11, 30, 0, 10); -- Frost Shock

-- Spitelash Siren
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6195, 0, 100, 12551, 15, 24, 0, 10); -- Frost Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6195, 1, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6195, 2, 100, 11640, 21, 30, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6195, 3, 100, 11831, 31, 43, 0, 10); -- Frost Nova

-- Spitelash Myrmidon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6196, 1, 100, 11976, 11, 13, 0, 10); -- Strike

-- Blood Elf Surveyor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6198, 0, 100, 11969, 10, 25, 0, 10); -- Fire Nova

-- Blood Elf Reclaimer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6199, 0, 100, 11640, 15, 15, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6199, 1, 100, 11642, 20, 20, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6199, 2, 100, 20823, 0, 0, 0, 10); -- Fireball

-- Legashi Satyr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6200, 0, 100, 11981, 16, 23, 0, 10); -- Mana Burn

-- Legashi Rogue
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6201, 0, 100, 12540, 16, 20, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6201, 1, 100, 7159, 2, 2, 0, 10); -- Backstab

-- Legashi Hellcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6202, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6202, 1, 100, 11990, 22, 27, 0, 10); -- Rain of Fire

-- Caverndeep Burrower
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6206, 0, 100, 7405, 7, 8, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6206, 1, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Caverndeep Ambusher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6207, 0, 100, 2590, 10, 10, 0, 10); -- Backstab

-- Caverndeep Looter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6209, 0, 100, 10851, 10, 13, 0, 10); -- Grab Weapon

-- Caverndeep Pillager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6210, 0, 100, 1777, 10, 10, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6210, 1, 100, 3391, 5, 10, 0, 10); -- Thrash

-- Caverndeep Reaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6211, 0, 100, 845, 10, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6211, 1, 100, 7366, 10, 10, 0, 10); -- Berserker Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6211, 2, 100, 8374, 0, 0, 0, 10); -- Arcing Smash

-- Irradiated Invader
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6213, 1, 100, 9771, 0, 0, 0, 10); -- Radiation Bolt

-- Addled Leper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6221, 0, 100, 25712, 5, 10, 0, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6221, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6221, 2, 33.3333, 9080, 21, 30, 0, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6221, 3, 100, 2055, 0, 0, 0, 10); -- Heal

-- Leprous Technician
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6222, 0, 100, 10345, 19, 20, 0, 10); -- Rebuild
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6222, 1, 100, 10732, 20, 21, 0, 10); -- Supercharge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6222, 2, 100, 13398, 10, 10, 0, 10); -- Throw Wrench

-- Leprous Defender
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6223, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6223, 1, 100, 14443, 10, 25, 0, 10); -- Multi-Shot

-- Leprous Machinesmith
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6224, 0, 100, 10732, 21, 39, 0, 10); -- Supercharge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6224, 1, 100, 10345, 10, 17, 0, 10); -- Rebuild
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6224, 2, 100, 13398, 10, 10, 0, 10); -- Throw Wrench

-- Mechano-Tank
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6225, 0, 100, 10346, 0, 0, 0, 10); -- Machine Gun

-- Mechano-Flamewalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6226, 0, 100, 11970, 10, 14, 0, 10); -- Fire Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6226, 1, 100, 10733, 5, 12, 0, 10); -- Flame Spray

-- Mechano-Frostwalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6227, 0, 100, 11264, 21, 30, 0, 10); -- Ice Blast

-- Crowd Pummeler 9-60
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6229, 0, 100, 10887, 17, 20, 0, 10); -- Crowd Pummel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6229, 1, 100, 5568, 17, 20, 0, 10); -- Trample
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6229, 2, 100, 8374, 6, 7, 0, 10); -- Arcing Smash

-- Peacekeeper Security Suit
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6230, 0, 100, 10730, 18, 35, 0, 10); -- Pacify
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6230, 1, 100, 6533, 15, 26, 0, 10); -- Net

-- Arcane Nullifier X-21
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6232, 0, 100, 10831, 21, 30, 0, 10); -- Reflection Field
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6232, 1, 100, 10832, 10, 10, 0, 10); -- Mass Nullify

-- Mechanized Guardian
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6234, 0, 100, 11820, 12, 15, 0, 10); -- Electrified Net

-- Electrocutioner 6000
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6235, 0, 100, 11082, 10, 17, 0, 10); -- Megavolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6235, 1, 100, 11084, 14, 20, 0, 10); -- Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6235, 2, 100, 11085, 17, 24, 0, 10); -- Chain Bolt

-- Stockade Archer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6237, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Gelihast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6243, 1, 100, 6533, 5, 8, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6243, 2, 100, 7165, 10, 10, 0, 10); -- Battle Stance

-- Irradiated Pillager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6329, 1, 100, 9771, 0, 0, 0, 10); -- Radiation Bolt

-- Makrinni Razorclaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6350, 0, 100, 13444, 5, 8, 0, 10); -- Sunder Armor

-- Storm Bay Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6351, 0, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6351, 1, 100, 11642, 20, 20, 0, 10); -- Heal

-- Makrinni Scrabbler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6370, 0, 100, 20822, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6370, 1, 100, 11642, 20, 20, 0, 10); -- Heal

-- Storm Bay Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6371, 0, 100, 11976, 6, 15, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6371, 1, 100, 12555, 24, 27, 0, 10); -- Pummel

-- Makrinni Snapclaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6372, 0, 100, 3604, 28, 44, 0, 10); -- Tendon Rip

-- Holdout Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6391, 0, 100, 12555, 5, 9, 0, 10); -- Pummel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6391, 1, 100, 11976, 5, 14, 0, 10); -- Strike

-- Tazan
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6494, 0, 100, 6253, 10, 10, 0, 10); -- Backhand

-- Dark Iron Rifleman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6523, 0, 100, 7891, 15, 29, 0, 10); -- Gift of Ragnaros
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6523, 1, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Fenwick Thatros
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6570, 0, 100, 18072, 6, 14, 0, 10); -- Uppercut

-- Lady Sesspira
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6649, 0, 100, 20299, 5, 10, 0, 10); -- Forked Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6649, 1, 100, 15495, 5, 10, 0, 10); -- Explosive Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6649, 2, 100, 15547, 10, 10, 0, 10); -- Shoot

-- General Fangferror
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6650, 0, 100, 12057, 5, 10, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6650, 1, 100, 15284, 6, 14, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6650, 2, 100, 18812, 10, 19, 0, 10); -- Knockdown

-- Gatekeeper Rageroar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6651, 0, 100, 12747, 15, 20, 0, 10); -- Entangling Roots
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6651, 1, 100, 13584, 5, 10, 0, 10); -- Strike

-- Master Feardred
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6652, 0, 100, 21073, 3, 6, 0, 10); -- Arcane Explosion

-- Defias Bodyguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6866, 0, 100, 7159, 5, 5, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6866, 1, 100, 6713, 30, 37, 0, 10); -- Disarm

-- Onin MacHammar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6886, 0, 100, 6408, 10, 10, 0, 10); -- Faded

-- Defias Dockworker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (6927, 0, 100, 8646, 43, 44, 0, 10); -- Snap Kick

-- Arantir
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7009, 0, 100, 9733, 6, 7, 0, 10); -- Arantir's Anger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7009, 1, 100, 8621, 10, 10, 0, 10); -- Sinister Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7009, 2, 100, 5171, 10, 10, 0, 10); -- Slice and Dice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7009, 3, 100, 8629, 10, 10, 0, 10); -- Gouge

-- Flagglemurk the Cruel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7015, 0, 100, 11428, 5, 15, 0, 10); -- Knockdown
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7015, 1, 100, 11976, 5, 10, 0, 10); -- Strike

-- Lady Vespira
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7016, 0, 100, 12549, 5, 15, 0, 10); -- Forked Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7016, 1, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7016, 2, 100, 11428, 11, 20, 0, 10); -- Knockdown

-- Lord Sinslayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7017, 0, 100, 13586, 10, 20, 0, 10); -- Aqua Jet
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7017, 1, 100, 12057, 5, 15, 0, 10); -- Strike

-- Blackrock Soldier
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7025, 0, 100, 3248, 10, 15, 0, 10); -- Improved Blocking
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7025, 1, 100, 12170, 5, 11, 0, 10); -- Revenge

-- Blackrock Sorcerer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7026, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7026, 1, 100, 20827, 11, 15, 0, 10); -- Flamestrike

-- Blackrock Slayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7027, 0, 100, 7160, 10, 10, 0, 10); -- Execute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7027, 1, 100, 9080, 8, 12, 0, 10); -- Hamstring

-- Blackrock Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7028, 0, 100, 20826, 5, 10, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7028, 1, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7028, 2, 100, 13338, 20, 30, 0, 10); -- Curse of Tongues

-- Shadowforge Geologist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7030, 0, 100, 8814, 39, 47, 0, 10); -- Flame Spike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7030, 1, 100, 3356, 21, 26, 0, 10); -- Flame Lash

-- Firegut Ogre
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7033, 0, 100, 13382, 16, 29, 0, 10); -- Torch

-- Firegut Ogre Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7034, 0, 100, 13381, 15, 30, 0, 10); -- Torch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7034, 1, 100, 6742, 10, 23, 0, 10); -- Bloodlust

-- Firegut Brute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7035, 0, 100, 10101, 10, 30, 0, 10); -- Knock Away
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7035, 1, 100, 13382, 15, 29, 0, 10); -- Torch

-- Thaurissan Spy
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7036, 0, 100, 744, 10, 10, 0, 10); -- Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7036, 2, 100, 7159, 5, 5, 0, 10); -- Backstab

-- Thaurissan Firewalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7037, 0, 100, 10452, 0, 0, 0, 10); -- Flame Buffet
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7037, 1, 100, 10733, 5, 15, 0, 10); -- Flame Spray

-- Thaurissan Agent
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7038, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7038, 1, 100, 6685, 10, 18, 0, 10); -- Piercing Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7038, 2, 100, 12540, 5, 15, 0, 10); -- Gouge

-- Digmaster Shovelphlange
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7057, 1, 100, 8380, 3, 4, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7057, 2, 100, 7164, 10, 10, 0, 10); -- Defensive Stance

-- Jadefire Rogue
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7106, 0, 100, 13578, 16, 30, 0, 10); -- Jadefire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7106, 1, 100, 13579, 21, 24, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7106, 2, 100, 7159, 5, 5, 0, 10); -- Backstab

-- Jadefire Trickster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7107, 0, 100, 13338, 30, 30, 0, 10); -- Curse of Tongues
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7107, 2, 100, 11980, 21, 30, 0, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7107, 3, 100, 13578, 17, 29, 0, 10); -- Jadefire

-- Jadefire Betrayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7108, 0, 100, 13443, 11, 30, 0, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7108, 1, 100, 5532, 5, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7108, 2, 100, 13578, 15, 30, 0, 10); -- Jadefire

-- Jadefire Felsworn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7109, 0, 100, 13578, 22, 30, 0, 10); -- Jadefire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7109, 1, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7109, 2, 100, 11443, 28, 45, 0, 10); -- Cripple

-- Jadefire Shadowstalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7110, 2, 100, 13578, 17, 29, 0, 10); -- Jadefire

-- Jadefire Hellcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7111, 0, 100, 11990, 11, 18, 0, 10); -- Rain of Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7111, 1, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7111, 2, 100, 13578, 21, 27, 0, 10); -- Jadefire

-- Jaedenar Cultist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7112, 0, 100, 20825, 8, 8, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7112, 1, 100, 11639, 8, 22, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7112, 2, 100, 11980, 8, 25, 0, 10); -- Curse of Weakness

-- Jaedenar Guardian
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7113, 0, 100, 11972, 5, 10, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7113, 1, 100, 3248, 20, 22, 0, 10); -- Improved Blocking

-- Jaedenar Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7114, 0, 100, 11977, 12, 14, 0, 10); -- Rend

-- Jaedenar Adept
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7115, 0, 100, 20823, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7115, 1, 100, 20832, 12, 13, 0, 10); -- Fire Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7115, 2, 100, 14514, 21, 34, 0, 10); -- Blink

-- Jaedenar Darkweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7118, 0, 100, 11962, 14, 18, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7118, 1, 100, 9613, 14, 19, 0, 10); -- Shadow Bolt

-- Jaedenar Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7120, 0, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7120, 2, 100, 8699, 23, 28, 0, 10); -- Unholy Frenzy

-- Jaedenar Hound
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7125, 0, 100, 13321, 5, 12, 0, 10); -- Mana Burn

-- Infernal Bodyguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7135, 1, 100, 10966, 26, 42, 0, 10); -- Uppercut

-- Immolatus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7137, 0, 100, 10101, 14, 15, 0, 10); -- Knock Away

-- Deadwood Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7153, 0, 100, 13584, 8, 13, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7153, 1, 100, 13583, 41, 49, 0, 10); -- Curse of the Deadwood

-- Deadwood Gardener
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7154, 0, 100, 12160, 15, 17, 0, 10); -- Rejuvenation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7154, 1, 100, 11986, 20, 20, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7154, 2, 100, 13583, 39, 40, 0, 10); -- Curse of the Deadwood

-- Deadwood Pathfinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7155, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7155, 1, 100, 6685, 20, 21, 0, 10); -- Piercing Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7155, 2, 100, 13583, 24, 25, 0, 10); -- Curse of the Deadwood

-- Deadwood Den Watcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7156, 0, 100, 13583, 32, 33, 0, 10); -- Curse of the Deadwood

-- Deadwood Avenger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7157, 0, 100, 13583, 30, 31, 0, 10); -- Curse of the Deadwood

-- Deadwood Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7158, 0, 100, 13585, 18, 19, 0, 10); -- Lightning Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7158, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7158, 2, 100, 12058, 14, 15, 0, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7158, 3, 100, 13583, 54, 55, 0, 10); -- Curse of the Deadwood

-- Stonevault Ambusher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7175, 0, 100, 8721, 4, 6, 0, 10); -- Backstab

-- Ferocitas the Dream Eater
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7234, 0, 100, 3391, 10, 10, 0, 10); -- Thrash

-- Gnarlpine Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7235, 0, 100, 12160, 10, 10, 0, 10); -- Rejuvenation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7235, 1, 100, 9739, 0, 0, 0, 10); -- Wrath

-- Sandfury Shadowhunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7246, 0, 100, 15547, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7246, 1, 100, 11641, 27, 45, 0, 10); -- Hex
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7246, 2, 100, 18395, 5, 5, 0, 10); -- Dismounting Shot

-- Sandfury Soul Eater
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7247, 0, 100, 11016, 15, 30, 0, 10); -- Soul Bite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7247, 1, 100, 7154, 10, 10, 0, 10); -- Dark Offering

-- Sandfury Executioner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7274, 0, 100, 7160, 10, 10, 0, 10); -- Execute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7274, 1, 100, 15623, 7, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7274, 2, 100, 7366, 10, 10, 0, 10); -- Berserker Stance

-- Shadowpriest Sezz'ziz
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7275, 0, 100, 15537, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7275, 1, 100, 13704, 13, 20, 0, 10); -- Psychic Scream
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7275, 2, 100, 8362, 10, 23, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7275, 3, 100, 12039, 10, 11, 0, 10); -- Heal

-- Stonevault Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7320, 0, 100, 3391, 5, 9, 0, 10); -- Thrash

-- Stonevault Flameweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7321, 0, 100, 7739, 15, 26, 0, 10); -- Inferno Shell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7321, 1, 100, 2941, 5, 10, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7321, 2, 100, 2602, 31, 44, 0, 10); -- Fire Shield IV

-- Death's Head Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7335, 0, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7335, 1, 100, 8814, 3, 5, 0, 10); -- Flame Spike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7335, 2, 100, 11436, 9, 12, 0, 10); -- Slow

-- Death's Head Necromancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7337, 0, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7337, 1, 100, 11443, 4, 5, 0, 10); -- Cripple
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7337, 2, 100, 11444, 43, 44, 0, 10); -- Shackle Undead
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7337, 3, 100, 11445, 9, 11, 0, 10); -- Bone Armor

-- Deadwind Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7371, 0, 100, 10966, 5, 8, 0, 10); -- Uppercut

-- Deadwind Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7372, 0, 100, 11980, 16, 19, 0, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7372, 1, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7372, 2, 100, 20787, 6, 10, 0, 10); -- Immolate

-- Deadwind Ogre Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7379, 0, 100, 6742, 5, 8, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7379, 1, 100, 20824, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7379, 2, 100, 12550, 10, 13, 0, 10); -- Lightning Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7379, 3, 100, 15039, 10, 15, 0, 10); -- Flame Shock

-- Galak Flame Guard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7404, 0, 100, 13730, 22, 34, 0, 10); -- Demoralizing Shout

-- Winterfall Ursa
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7438, 0, 100, 17205, 59, 60, 0, 10); -- Winterfall Firewater

-- Winterfall Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7439, 0, 100, 11431, 8, 15, 0, 10); -- Healing Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7439, 1, 100, 9532, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7439, 2, 100, 13585, 3, 21, 0, 10); -- Lightning Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7439, 3, 100, 17205, 59, 60, 0, 10); -- Winterfall Firewater

-- Winterfall Den Watcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7440, 0, 100, 17205, 60, 60, 0, 10); -- Winterfall Firewater

-- Winterfall Totemic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7441, 2, 100, 17205, 4, 60, 0, 10); -- Winterfall Firewater

-- Winterfall Pathfinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7442, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7442, 1, 100, 16498, 5, 15, 0, 10); -- Faerie Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7442, 2, 100, 17205, 60, 60, 0, 10); -- Winterfall Firewater

-- Ragged Owlbeast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7450, 0, 100, 15848, 15, 40, 0, 10); -- Festering Rash

-- Raging Owlbeast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7451, 0, 100, 13443, 8, 13, 0, 10); -- Rend

-- Moontouched Owlbeast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7453, 0, 100, 15798, 5, 11, 0, 10); -- Moonfire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7453, 1, 100, 12160, 11, 13, 0, 10); -- Rejuvenation

-- Rogue Ice Thistle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7457, 1, 100, 3604, 10, 14, 0, 10); -- Tendon Rip

-- Ice Thistle Yeti
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7458, 1, 100, 3604, 12, 15, 0, 10); -- Tendon Rip

-- Ice Thistle Matriarch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7459, 1, 100, 6268, 5, 5, 0, 10); -- Rushing Charge

-- Ice Thistle Patriarch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7460, 1, 100, 3131, 3, 7, 0, 10); -- Frost Breath

-- Sergeant Bly
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7604, 1, 100, 11972, 5, 15, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7604, 3, 100, 12170, 5, 10, 0, 10); -- Revenge

-- Raven
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7605, 0, 100, 7159, 2, 2, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7605, 1, 100, 12540, 5, 15, 0, 10); -- Gouge

-- Oro Eyegouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7606, 0, 100, 12741, 20, 28, 0, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7606, 1, 100, 11962, 11, 16, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7606, 2, 100, 11990, 10, 19, 0, 10); -- Rain of Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7606, 3, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt

-- Weegli Blastfuse
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7607, 0, 100, 8858, 5, 5, 0, 10); -- Bomb
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7607, 2, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Murta Grimgut
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7608, 0, 100, 11642, 10, 10, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7608, 1, 100, 11640, 11, 13, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7608, 2, 100, 9734, 0, 0, 0, 10); -- Holy Smite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7608, 3, 100, 11974, 6, 7, 0, 10); -- Power Word: Shield

-- Grimtotem Raider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7725, 0, 100, 6533, 34, 35, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7725, 1, 100, 845, 10, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7725, 2, 100, 7366, 10, 10, 0, 10); -- Berserker Stance

-- Grimtotem Naturalist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7726, 0, 100, 19030, 67, 68, 0, 10); -- Bear Form
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7726, 1, 100, 12160, 26, 27, 0, 10); -- Rejuvenation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7726, 2, 100, 9739, 0, 0, 0, 10); -- Wrath
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7726, 3, 100, 12161, 25, 26, 0, 10); -- Maul

-- Grimtotem Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7727, 0, 100, 930, 26, 27, 0, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7727, 1, 100, 8005, 20, 20, 0, 10); -- Healing Wave

-- Kirith the Damned
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7728, 1, 100, 12097, 12, 18, 0, 10); -- Pierce Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7728, 2, 100, 12745, 12, 14, 0, 10); -- Mana Burn

-- Sandfury Cretin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7789, 1, 100, 14032, 7, 39, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7789, 2, 100, 20798, 24, 60, 0, 10); -- Demon Skin

-- Hydromancer Velratha
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7795, 0, 100, 12491, 10, 10, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7795, 1, 100, 12739, 0, 0, 0, 10); -- Shadow Bolt

-- Mekgineer Thermaplugg
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7800, 1, 100, 10101, 17, 18, 0, 10); -- Knock Away

-- Vilebranch Ambusher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7809, 0, 100, 7160, 10, 10, 0, 10); -- Execute

-- Gnomeregan Evacuee
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7843, 0, 100, 25712, 5, 10, 0, 10); -- Heroic Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7843, 1, 100, 7165, 10, 10, 0, 10); -- Battle Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7843, 2, 33.3333, 9080, 17, 28, 0, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7843, 3, 45, 2055, 0, 0, 0, 10); -- Heal

-- Southsea Pirate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7855, 0, 100, 11976, 7, 14, 0, 10); -- Strike

-- Southsea Freebooter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7856, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Southsea Dock Worker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7857, 0, 100, 3148, 44, 45, 0, 10); -- Head Crack

-- Southsea Swashbuckler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7858, 0, 100, 6713, 20, 20, 0, 10); -- Disarm

-- Death's Head Cultist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7872, 0, 100, 11433, 0, 0, 0, 10); -- Death & Decay
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7872, 1, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt

-- Razorfen Battleguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7873, 0, 100, 11430, 12, 18, 0, 10); -- Slam

-- Razorfen Thornweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7874, 0, 100, 11431, 8, 10, 0, 10); -- Healing Touch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7874, 1, 100, 11922, 4, 6, 0, 10); -- Entangling Roots
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7874, 2, 100, 7966, 10, 10, 0, 10); -- Thorns Aura

-- Spitelash Enchantress
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7886, 0, 100, 3443, 22, 39, 0, 10); -- Enchanted Quickness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7886, 1, 100, 12548, 22, 26, 0, 10); -- Frost Shock

-- Kindal Moonweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7956, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7956, 1, 100, 14443, 10, 10, 0, 10); -- Multi-Shot

-- Vile Priestess Hexx
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7995, 0, 100, 11641, 10, 12, 0, 10); -- Hex
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7995, 1, 100, 15586, 11, 12, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7995, 2, 100, 15654, 5, 6, 0, 10); -- Shadow Word: Pain

-- Qiaga the Keeper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7996, 0, 100, 11639, 5, 8, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7996, 1, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (7996, 2, 100, 11640, 20, 25, 0, 10); -- Renew

-- Thelsamar Mountaineer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8055, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Edana Hatetalon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8075, 0, 100, 12058, 7, 9, 0, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8075, 1, 100, 8293, 13, 19, 0, 10); -- Lightning Cloud
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8075, 2, 100, 12167, 0, 0, 0, 10); -- Lightning Bolt

-- Warleader Krazzilak
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8199, 0, 100, 9080, 20, 21, 0, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8199, 1, 100, 17230, 14, 19, 0, 10); -- Infected Wound
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8199, 2, 100, 6713, 18, 19, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8199, 3, 100, 18103, 10, 14, 0, 10); -- Backhand

-- Jin'Zallah the Sandbringer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8200, 0, 100, 7272, 14, 20, 0, 10); -- Dust Cloud
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8200, 2, 100, 20824, 0, 0, 0, 10); -- Lightning Bolt

-- Cyclok the Mad
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8202, 0, 100, 6742, 11, 12, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8202, 1, 100, 11975, 7, 9, 0, 10); -- Arcane Explosion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8202, 2, 100, 20829, 0, 0, 0, 10); -- Arcane Bolt

-- Kregg Keelhaul
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8203, 2, 100, 11976, 6, 7, 0, 10); -- Strike

-- Jalinde Summerdrake
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8214, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8214, 1, 100, 8806, 11, 18, 0, 10); -- Poisoned Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8214, 2, 100, 15495, 5, 10, 0, 10); -- Explosive Shot

-- Retherokk the Berserker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8216, 0, 100, 3391, 5, 10, 0, 10); -- Thrash

-- Mith'rethis the Enchanter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8217, 0, 100, 3443, 12, 20, 0, 10); -- Enchanted Quickness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8217, 1, 100, 11436, 10, 19, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8217, 2, 100, 15654, 11, 15, 0, 10); -- Shadow Word: Pain

-- Witherheart the Stalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8218, 2, 100, 7159, 5, 5, 0, 10); -- Backstab

-- Zul'arek Hatefowler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8219, 0, 100, 6726, 10, 10, 0, 10); -- Silence
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8219, 1, 100, 17228, 5, 14, 0, 10); -- Shadow Bolt Volley

-- Shleipnarr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8280, 0, 100, 13321, 8, 13, 0, 10); -- Mana Burn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8280, 1, 100, 7399, 12, 25, 0, 10); -- Terrify

-- Highlord Mastrogonde
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8282, 0, 100, 13323, 21, 36, 0, 10); -- Polymorph
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8282, 1, 100, 11974, 22, 30, 0, 10); -- Power Word: Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8282, 2, 100, 12739, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8282, 3, 100, 15654, 17, 25, 0, 10); -- Shadow Word: Pain

-- Slave Master Blackheart
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8283, 0, 100, 6533, 24, 29, 0, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8283, 1, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Mojo the Twisted
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8296, 0, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8296, 1, 100, 17228, 5, 10, 0, 10); -- Shadow Bolt Volley

-- Magronos the Unyielding
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8297, 0, 100, 15663, 6, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8297, 1, 100, 9080, 15, 25, 0, 10); -- Hamstring

-- Akubar the Seer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8298, 0, 100, 20824, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8298, 1, 100, 11436, 11, 16, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8298, 2, 100, 20831, 5, 8, 0, 10); -- Chain Lightning

-- Dreadscorn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8304, 0, 100, 21049, 5, 15, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8304, 1, 100, 12057, 5, 10, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8304, 2, 100, 6253, 10, 15, 0, 10); -- Backhand

-- Warlord Krellian
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8408, 0, 100, 11976, 10, 10, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8408, 1, 100, 10968, 30, 30, 0, 10); -- Demoralizing Roar

-- Caravan Master Tset
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8409, 0, 100, 9672, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8409, 1, 100, 11831, 15, 20, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8409, 2, 100, 12544, 9, 10, 0, 10); -- Frost Armor

-- Trade Master Kovic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8444, 0, 100, 14034, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8444, 1, 100, 11436, 13, 45, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8444, 2, 100, 11990, 11, 27, 0, 10); -- Rain of Fire

-- Gibblewilt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8503, 0, 100, 20793, 0, 0, 0, 10); -- Fireball

-- Rynthariel the Keymaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8518, 0, 100, 10277, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8518, 1, 100, 7992, 56, 70, 0, 10); -- Slowing Poison

-- Dark Adept
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8546, 0, 100, 8646, 5, 10, 0, 10); -- Snap Kick

-- Death Cultist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8547, 0, 100, 16583, 5, 8, 0, 10); -- Shadow Shock

-- Vile Tutor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8548, 0, 100, 12040, 12, 18, 0, 10); -- Shadow Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8548, 1, 100, 16587, 5, 5, 0, 10); -- Dark Whispers

-- Shadowmage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8550, 0, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8550, 1, 100, 16592, 10, 10, 0, 10); -- Shadowform

-- Dark Summoner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8551, 0, 100, 20829, 1, 2, 0, 10); -- Arcane Bolt

-- Necromancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8553, 1, 100, 11443, 8, 12, 0, 10); -- Cripple

-- Mossflayer Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8560, 0, 100, 9080, 8, 12, 0, 10); -- Hamstring

-- Mossflayer Shadowhunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8561, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8561, 1, 100, 17171, 3, 6, 0, 10); -- Shadow Shot

-- Mossflayer Cannibal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8562, 0, 100, 17172, 20, 25, 0, 10); -- Hex
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8562, 1, 100, 17173, 8, 12, 0, 10); -- Drain Life

-- Woodsman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8563, 0, 100, 11971, 5, 8, 0, 10); -- Sunder Armor

-- Ranger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8564, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8564, 1, 100, 14443, 5, 6, 0, 10); -- Multi-Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8564, 2, 100, 17174, 11, 14, 0, 10); -- Concussive Shot

-- Pathstrider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8565, 1, 100, 16498, 8, 12, 0, 10); -- Faerie Fire

-- Dark Iron Lookout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8566, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Atal'alarion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8580, 0, 100, 12887, 20, 34, 0, 10); -- Sweeping Slam
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8580, 1, 100, 6524, 15, 45, 0, 10); -- Ground Tremor

-- Plaguehound
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8597, 0, 100, 3427, 18, 24, 0, 10); -- Infected Wound

-- Morta'gya the Keeper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8636, 0, 100, 11639, 5, 8, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8636, 1, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8636, 2, 100, 11640, 20, 25, 0, 10); -- Renew

-- Dark Iron Watchman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8637, 0, 100, 11976, 0, 0, 0, 10); -- Strike

-- Felbeast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8675, 0, 100, 13321, 14, 18, 0, 10); -- Mana Burn

-- Sandfury Acolyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8876, 0, 100, 11639, 13, 30, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8876, 1, 100, 9613, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8876, 2, 100, 11980, 21, 30, 0, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8876, 3, 100, 11981, 5, 15, 0, 10); -- Mana Burn

-- Anvilrage Overseer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8889, 0, 100, 15580, 10, 15, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8889, 1, 100, 13589, 10, 10, 0, 10); -- Haste Aura

-- Anvilrage Warden
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8890, 0, 100, 11972, 10, 15, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8890, 1, 100, 14030, 12, 18, 0, 10); -- Hooked Net

-- Anvilrage Guardsman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8891, 0, 100, 12169, 3, 5, 0, 10); -- Shield Block
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8891, 1, 100, 6713, 10, 15, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8891, 2, 100, 11971, 4, 6, 0, 10); -- Sunder Armor

-- Anvilrage Footman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8892, 1, 100, 15580, 5, 12, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8892, 2, 100, 15614, 5, 12, 0, 10); -- Kick

-- Anvilrage Soldier
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8893, 0, 100, 15284, 4, 6, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8893, 1, 100, 9080, 8, 12, 0, 10); -- Hamstring

-- Anvilrage Medic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8894, 0, 100, 15586, 6, 10, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8894, 1, 100, 15585, 10, 15, 0, 10); -- Prayer of Healing
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8894, 2, 100, 15587, 8, 10, 0, 10); -- Mind Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8894, 3, 100, 13864, 3, 5, 0, 10); -- Power Word: Fortitude

-- Anvilrage Officer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8895, 0, 100, 15620, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8895, 1, 100, 9128, 11, 15, 0, 10); -- Battle Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8895, 2, 100, 6253, 10, 15, 0, 10); -- Backhand

-- Shadowforge Peasant
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8896, 0, 31.25, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8896, 1, 12.5, 9053, 3, 5, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8896, 2, 6.25, 11642, 8, 9, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8896, 3, 50, 13584, 8, 12, 0, 10); -- Strike

-- Doomforge Craftsman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8897, 0, 70, 15619, 10, 10, 0, 10); -- Throw Wrench
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8897, 1, 100, 13951, 10, 10, 0, 10); -- Rebuild
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8897, 2, 70, 9143, 6, 12, 0, 10); -- Bomb

-- Anvilrage Marshal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8898, 0, 100, 8258, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8898, 1, 100, 15493, 13, 15, 0, 10); -- Holy Light
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8898, 2, 100, 13953, 10, 12, 0, 10); -- Holy Strike

-- Doomforge Dragoon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8899, 0, 100, 15620, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8899, 1, 100, 15496, 8, 9, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8899, 2, 100, 15495, 3, 5, 0, 10); -- Explosive Shot

-- Shadowforge Citizen
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8902, 0, 60, 15547, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8902, 2, 60, 13446, 6, 7, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8902, 3, 40, 11642, 9, 12, 0, 10); -- Heal

-- Shadowforge Senator
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8904, 0, 33.3333, 14034, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8904, 3, 33.3333, 15547, 10, 10, 0, 10); -- Shoot

-- Twilight's Hammer Torturer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8912, 0, 100, 14032, 8, 10, 0, 10); -- Shadow Word: Pain

-- Twilight Emissary
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8913, 0, 100, 15288, 3, 5, 0, 10); -- Fury of Ragnaros
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8913, 1, 40, 15043, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8913, 2, 35, 13748, 0, 0, 0, 10); -- Arcane Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8913, 3, 35, 12466, 11, 15, 0, 10); -- Fireball

-- Twilight Bodyguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8914, 0, 100, 13902, 15, 19, 0, 10); -- Fist of Ragnaros
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8914, 1, 100, 13903, 21, 29, 0, 10); -- Seal of Sacrifice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8914, 2, 100, 15615, 8, 12, 0, 10); -- Pummel

-- Arena Spectator
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8916, 0, 15, 9128, 16, 19, 0, 10); -- Battle Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8916, 1, 30, 13730, 16, 20, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8916, 2, 30, 13446, 6, 11, 0, 10); -- Strike

-- Quarry Slave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8917, 0, 50, 14516, 5, 8, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8917, 1, 20, 11971, 5, 8, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8917, 2, 50, 9080, 5, 8, 0, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8917, 3, 10, 11986, 12, 18, 0, 10); -- Healing Wave

-- Weapon Technician
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8920, 0, 100, 15620, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8920, 3, 50, 12551, 3, 5, 0, 10); -- Frost Shot

-- Bloodhound
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8921, 1, 100, 8279, 10, 10, 0, 10); -- Stealth Detection
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8921, 2, 100, 13692, 12, 18, 0, 10); -- Dire Growl
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8921, 3, 100, 13445, 8, 12, 0, 10); -- Rend

-- Bloodhound Mastiff
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8922, 1, 100, 8279, 10, 10, 0, 10); -- Stealth Detection
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8922, 2, 100, 7140, 6, 9, 0, 10); -- Expose Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8922, 3, 100, 15608, 5, 10, 0, 10); -- Ravenous Claw

-- Krom'Grul
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8977, 0, 100, 13381, 25, 29, 0, 10); -- Torch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8977, 1, 100, 6742, 10, 24, 0, 10); -- Bloodlust

-- Thauris Balgarr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8978, 1, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8978, 2, 100, 6533, 28, 35, 0, 10); -- Net

-- Gruklash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8979, 0, 100, 6253, 10, 15, 0, 10); -- Backhand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (8979, 1, 100, 12555, 5, 10, 0, 10); -- Pummel

-- Pyromancer Loregrain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9024, 1, 100, 15616, 5, 8, 0, 10); -- Flame Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9024, 2, 100, 15095, 0, 0, 0, 10); -- Molten Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9024, 3, 100, 15041, 6, 8, 0, 10); -- Fire Ward

-- Verek
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9042, 0, 100, 15042, 5, 8, 0, 10); -- Curse of Blood

-- Scarshield Grunt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9043, 0, 100, 12057, 5, 15, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9043, 1, 100, 14895, 10, 10, 0, 10); -- Overpower

-- Scarshield Sentry
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9044, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9044, 1, 100, 14897, 27, 44, 0, 10); -- Slowing Poison
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9044, 2, 100, 14443, 11, 19, 0, 10); -- Multi-Shot

-- Scarshield Acolyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9045, 0, 100, 8362, 8, 30, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9045, 1, 100, 14032, 20, 30, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9045, 2, 100, 12039, 15, 15, 0, 10); -- Heal

-- Scarshield Legionnaire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9097, 0, 100, 11972, 5, 15, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9097, 1, 100, 15496, 5, 10, 0, 10); -- Cleave

-- Scarshield Spellbinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9098, 0, 100, 15122, 5, 15, 0, 10); -- Counterspell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9098, 1, 100, 15123, 23, 44, 0, 10); -- Resist Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9098, 2, 100, 15785, 21, 32, 0, 10); -- Mana Burn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9098, 3, 100, 13748, 8, 8, 0, 10); -- Arcane Bolt

-- Gor'tesh
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9176, 0, 100, 12734, 10, 10, 0, 10); -- Ground Smash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9176, 1, 100, 10101, 34, 43, 0, 10); -- Knock Away

-- Spirestone Battle Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9197, 0, 100, 16170, 12, 20, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9197, 1, 100, 15305, 6, 14, 0, 10); -- Chain Lightning

-- Spirestone Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9198, 0, 100, 15981, 20, 29, 0, 10); -- Rejuvenation
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9198, 1, 100, 15982, 15, 16, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9198, 2, 100, 15659, 13, 20, 0, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9198, 3, 100, 8435, 12, 16, 0, 10); -- Forked Lightning

-- Spirestone Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9199, 1, 100, 14516, 6, 10, 0, 10); -- Strike

-- Spirestone Reaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9200, 0, 100, 11876, 15, 25, 0, 10); -- War Stomp
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9200, 1, 100, 15284, 9, 14, 0, 10); -- Cleave

-- Spirestone Ogre Magus
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9201, 0, 100, 6742, 10, 10, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9201, 1, 100, 13747, 18, 25, 0, 10); -- Slow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9201, 2, 100, 15979, 5, 10, 0, 10); -- Arcane Bolt

-- Spirestone Warlord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9216, 1, 100, 16171, 10, 19, 0, 10); -- Empower Will
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9216, 2, 100, 8269, 180, 180, 0, 10); -- Enrage

-- Smolderthorn Mystic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9239, 0, 100, 15799, 10, 10, 0, 10); -- Chain Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9239, 1, 100, 16006, 5, 7, 0, 10); -- Chain Lightning

-- Smolderthorn Shadow Priest
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9240, 0, 100, 15800, 10, 19, 0, 10); -- Mana Burn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9240, 1, 100, 11641, 11, 15, 0, 10); -- Hex
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9240, 2, 100, 15090, 10, 10, 0, 10); -- Dispel Magic

-- Smolderthorn Headhunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9241, 0, 100, 15795, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9241, 1, 100, 16001, 5, 13, 0, 10); -- Impale
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9241, 2, 100, 6016, 17, 30, 0, 10); -- Pierce Armor

-- Scarshield Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9257, 1, 100, 12471, 0, 0, 0, 10); -- Shadow Bolt

-- Scarshield Raider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9258, 0, 100, 14030, 26, 33, 0, 10); -- Hooked Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9258, 1, 100, 12057, 5, 10, 0, 10); -- Strike

-- Firebrand Grunt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9259, 0, 100, 15128, 17, 44, 0, 10); -- Mark of Flames
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9259, 1, 100, 13737, 7, 15, 0, 10); -- Mortal Strike

-- Firebrand Darkweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9261, 0, 100, 15128, 9, 42, 0, 10); -- Mark of Flames
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9261, 1, 100, 14887, 5, 9, 0, 10); -- Shadow Bolt Volley
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9261, 2, 100, 16071, 10, 14, 0, 10); -- Curse of the Firebrand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9261, 3, 100, 12471, 0, 0, 0, 10); -- Shadow Bolt

-- Firebrand Invoker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9262, 0, 100, 15128, 5, 35, 0, 10); -- Mark of Flames
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9262, 1, 100, 12468, 18, 35, 0, 10); -- Flamestrike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9262, 2, 100, 12470, 11, 30, 0, 10); -- Fire Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9262, 3, 100, 15242, 0, 0, 0, 10); -- Fireball

-- Firebrand Dreadweaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9263, 0, 100, 16071, 16, 25, 0, 10); -- Curse of the Firebrand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9263, 1, 100, 15728, 20, 43, 0, 10); -- Plague Cloud
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9263, 2, 100, 15729, 10, 10, 0, 10); -- Remove Curse
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9263, 3, 100, 15128, 8, 38, 0, 10); -- Mark of Flames

-- Firebrand Pyromancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9264, 2, 100, 15128, 10, 17, 0, 10); -- Mark of Flames
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9264, 3, 100, 15096, 8, 15, 0, 10); -- Flame Shock

-- Smolderthorn Shadow Hunter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9265, 1, 100, 15582, 5, 5, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9265, 2, 100, 12540, 13, 20, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9265, 3, 100, 15614, 10, 10, 0, 10); -- Kick

-- Smolderthorn Axe Thrower
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9267, 0, 100, 16000, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9267, 1, 100, 3391, 5, 10, 0, 10); -- Thrash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9267, 2, 100, 11428, 10, 17, 0, 10); -- Knockdown

-- Smolderthorn Berserker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9268, 0, 100, 17547, 6, 14, 0, 10); -- Mortal Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9268, 1, 100, 13446, 5, 15, 0, 10); -- Strike

-- Smolderthorn Seer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9269, 0, 100, 15801, 6, 6, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9269, 1, 100, 12492, 5, 6, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9269, 2, 100, 15802, 12, 30, 0, 10); -- Shrink
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9269, 3, 100, 13585, 10, 11, 0, 10); -- Lightning Shield

-- Scarlet Warder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9447, 0, 100, 14518, 4, 7, 0, 10); -- Crusader Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9447, 1, 100, 15493, 13, 16, 0, 10); -- Holy Light

-- Scarlet Praetorian
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9448, 0, 100, 17149, 10, 10, 0, 10); -- Exorcism
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9448, 1, 100, 17143, 3, 6, 0, 10); -- Holy Strike

-- Scarlet Cleric
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9449, 0, 100, 15586, 13, 17, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9449, 1, 100, 15587, 3, 5, 0, 10); -- Mind Blast

-- Scarlet Curate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9450, 0, 100, 9734, 0, 0, 0, 6); -- Holy Smite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9450, 0, 100, 25054, 0, 0, 7, 10); -- Holy Smite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9450, 1, 100, 11640, 13, 15, 0, 6); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9450, 1, 100, 25058, 13, 15, 7, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9450, 2, 100, 17201, 6, 9, 0, 10); -- Dispel Magic

-- Scarlet Archmage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9451, 0, 100, 15242, 15, 15, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9451, 1, 100, 15244, 5, 9, 0, 10); -- Cone of Cold
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9451, 2, 100, 15122, 10, 15, 0, 10); -- Counterspell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9451, 3, 100, 18100, 5, 11, 0, 10); -- Frost Armor

-- Scarlet Enchanter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9452, 0, 100, 15230, 0, 0, 0, 6); -- Arcane Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9452, 0, 100, 25055, 0, 0, 7, 10); -- Arcane Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9452, 1, 100, 15970, 16, 25, 0, 10); -- Sleep

-- Xavathras
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9454, 0, 100, 13443, 5, 15, 0, 10); -- Rend

-- Gadgetzan Bruiser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9460, 0, 100, 12024, 9, 10, 0, 10); -- Net

-- Chieftain Bloodmaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9462, 0, 100, 13583, 34, 35, 0, 10); -- Curse of the Deadwood

-- Overlord Ror
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9464, 0, 100, 14100, 23, 30, 0, 10); -- Terrifying Roar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9464, 1, 100, 15793, 6, 8, 0, 10); -- Maul

-- Shadow Lord Fel'dan
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9517, 0, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9517, 1, 100, 16583, 5, 7, 0, 10); -- Shadow Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9517, 2, 100, 9081, 14, 15, 0, 10); -- Shadow Bolt Volley

-- Rakaiah
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9518, 0, 100, 15968, 5, 5, 0, 10); -- Lash of Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9518, 1, 100, 17227, 10, 19, 0, 10); -- Curse of Weakness

-- Bloodaxe Veteran
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9583, 1, 100, 15618, 6, 14, 0, 10); -- Snap Kick
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9583, 2, 100, 15615, 5, 15, 0, 10); -- Pummel

-- Gorgon'och
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9604, 0, 100, 13381, 18, 28, 0, 10); -- Torch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9604, 1, 100, 6742, 10, 24, 0, 10); -- Bloodlust

-- Bloodaxe Raider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9692, 0, 100, 15284, 5, 8, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9692, 1, 100, 15572, 3, 7, 0, 10); -- Sunder Armor

-- Bloodaxe Evoker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9693, 0, 100, 15743, 19, 27, 0, 10); -- Flamecrack
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9693, 1, 100, 15744, 7, 14, 0, 10); -- Blast Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9693, 2, 100, 13748, 0, 0, 0, 10); -- Arcane Bolt

-- Bloodaxe Warmonger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9716, 0, 100, 8269, 300, 300, 0, 10); -- Enrage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9716, 1, 100, 10966, 10, 14, 0, 10); -- Uppercut

-- Bloodaxe Summoner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9717, 0, 100, 15734, 5, 20, 0, 10); -- Summon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9717, 1, 100, 15790, 10, 10, 0, 10); -- Arcane Missiles
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9717, 2, 100, 15532, 10, 20, 0, 10); -- Frost Nova

-- Quartermaster Zigris
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9736, 0, 100, 15609, 11, 20, 0, 10); -- Hooked Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9736, 1, 100, 15504, 25, 29, 0, 10); -- Drink Healing Potion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9736, 2, 100, 16496, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9736, 3, 100, 16497, 10, 15, 0, 10); -- Stun Bomb

-- Flamekin Spitter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9776, 0, 100, 15664, 0, 0, 0, 10); -- Venom Spit

-- Flamekin Sprite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9777, 0, 100, 3391, 15, 16, 0, 10); -- Thrash

-- Flamekin Torcher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9778, 0, 100, 15665, 0, 0, 0, 10); -- Fireball

-- Moora
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9861, 0, 100, 11639, 6, 14, 0, 10); -- Shadow Word: Pain

-- Jaedenar Legionnaire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9862, 0, 100, 10966, 5, 10, 0, 10); -- Uppercut

-- Prince Xavalis
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9877, 0, 100, 11962, 7, 12, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (9877, 1, 100, 13578, 19, 29, 0, 10); -- Jadefire

-- Terrorspark
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10078, 0, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10078, 1, 100, 11968, 10, 10, 0, 10); -- Fire Shield

-- Sandarr Dunereaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10080, 0, 100, 14516, 3, 6, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10080, 1, 100, 15615, 5, 10, 0, 10); -- Pummel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10080, 2, 100, 13730, 8, 15, 0, 10); -- Demoralizing Shout

-- Dustwraith
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10081, 2, 100, 15667, 2, 4, 0, 10); -- Sinister Strike

-- Zerillis
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10082, 0, 100, 12551, 3, 5, 0, 10); -- Frost Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10082, 1, 100, 15547, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10082, 2, 100, 6533, 9, 15, 0, 10); -- Net

-- Moonkin Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10157, 0, 100, 15798, 21, 22, 0, 10); -- Moonfire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10157, 1, 100, 9739, 0, 0, 0, 10); -- Wrath
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10157, 2, 100, 16561, 20, 20, 0, 10); -- Regrowth

-- Moonkin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10158, 0, 100, 3391, 10, 15, 0, 10); -- Thrash

-- Raging Moonkin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10160, 0, 100, 13443, 15, 16, 0, 10); -- Rend

-- Mezzir the Howler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10197, 0, 100, 14100, 12, 18, 0, 10); -- Terrifying Roar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10197, 1, 100, 15971, 5, 12, 0, 10); -- Demoralizing Roar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10197, 2, 100, 3131, 3, 5, 0, 10); -- Frost Breath

-- Grizzle Snowpaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10199, 0, 100, 8364, 5, 10, 0, 10); -- Blizzard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10199, 1, 100, 15793, 3, 8, 0, 10); -- Maul
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10199, 2, 100, 12548, 6, 15, 0, 10); -- Frost Shock

-- Emberstrife
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10321, 0, 100, 16054, 10000, 10000, 0, 10); -- Flames of the Black Flight
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10321, 1, 100, 9573, 0, 0, 0, 10); -- Flame Breath
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10321, 2, 100, 8269, 18, 19, 0, 10); -- Enrage

-- Murkdeep
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10323, 0, 100, 11971, 18, 19, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10323, 1, 100, 6533, 34, 35, 0, 10); -- Net

-- Bayne
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10356, 0, 100, 13443, 5, 15, 0, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10356, 1, 100, 3604, 15, 28, 0, 10); -- Tendon Rip

-- Thuzadin Shadowcaster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10398, 0, 100, 15232, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10398, 1, 100, 11443, 6, 12, 0, 10); -- Cripple
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10398, 2, 100, 16429, 5, 8, 0, 10); -- Piercing Shadow

-- Thuzadin Necromancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10400, 1, 100, 16430, 5, 10, 0, 10); -- Soul Tap
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10400, 2, 100, 16431, 5, 8, 0, 10); -- Bone Armor

-- Crimson Guardsman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10418, 0, 100, 15749, 6, 10, 0, 10); -- Shield Charge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10418, 1, 100, 6713, 8, 12, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10418, 2, 100, 11972, 8, 15, 0, 10); -- Shield Bash

-- Crimson Conjuror
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10419, 0, 100, 12675, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10419, 1, 100, 12674, 8, 15, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10419, 2, 100, 17195, 3, 5, 0, 10); -- Scorch

-- Crimson Initiate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10420, 0, 100, 8362, 3, 6, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10420, 1, 100, 17138, 5, 8, 0, 10); -- Flash Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10420, 2, 100, 17194, 2, 4, 0, 10); -- Mind Blast

-- Crimson Defender
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10421, 0, 100, 8258, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10421, 1, 100, 15493, 6, 11, 0, 10); -- Holy Light
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10421, 2, 100, 13005, 6, 10, 0, 10); -- Hammer of Justice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10421, 3, 100, 13874, 10, 10, 0, 10); -- Divine Shield

-- Crimson Sorcerer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10422, 0, 100, 15230, 0, 0, 0, 10); -- Arcane Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10422, 1, 100, 13323, 13, 18, 0, 10); -- Polymorph
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10422, 2, 100, 12544, 11, 12, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10422, 3, 100, 14145, 6, 10, 0, 10); -- Fire Blast

-- Crimson Priest
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10423, 0, 100, 15586, 5, 8, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10423, 1, 100, 15238, 0, 0, 0, 10); -- Holy Smite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10423, 2, 100, 17139, 6, 10, 0, 10); -- Power Word: Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10423, 3, 100, 17142, 60, 60, 0, 10); -- Holy Fire

-- Crimson Gallant
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10424, 0, 100, 17143, 4, 7, 0, 10); -- Holy Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10424, 1, 100, 14518, 3, 5, 0, 10); -- Crusader Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10424, 2, 100, 8990, 10, 10, 0, 10); -- Retribution Aura

-- Crimson Battle Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10425, 1, 100, 15253, 2, 4, 0, 10); -- Arcane Explosion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10425, 2, 100, 17145, 5, 10, 0, 10); -- Blast Wave

-- Crimson Inquisitor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10426, 0, 100, 15785, 5, 8, 0, 10); -- Mana Burn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10426, 1, 100, 17146, 5, 8, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10426, 2, 100, 17165, 5, 8, 0, 10); -- Mind Flay
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10426, 3, 100, 17151, 5, 6, 0, 10); -- Shadow Barrier

-- Scholomance Adept
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10469, 0, 100, 15043, 0, 0, 0, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10469, 1, 100, 15499, 5, 14, 0, 10); -- Frost Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10469, 2, 100, 15244, 5, 14, 0, 10); -- Cone of Cold

-- Scholomance Neophyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10470, 0, 100, 12739, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10470, 1, 100, 12542, 10, 15, 0, 10); -- Fear
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10470, 2, 100, 17165, 11, 20, 0, 10); -- Mind Flay

-- Scholomance Acolyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10471, 0, 100, 17613, 20, 20, 0, 10); -- Dark Mending
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10471, 1, 100, 11443, 11, 20, 0, 10); -- Cripple
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10471, 2, 100, 17615, 5, 15, 0, 10); -- Mana Burn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10471, 3, 100, 16592, 60, 61, 0, 10); -- Shadowform

-- Scholomance Occultist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10472, 0, 100, 15122, 6, 15, 0, 10); -- Counterspell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10472, 1, 100, 17682, 5, 15, 0, 10); -- Drain Mana
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10472, 2, 100, 16431, 21, 34, 0, 10); -- Bone Armor

-- Scholomance Necrolyte
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10476, 0, 100, 12739, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10476, 1, 100, 17151, 20, 29, 0, 10); -- Shadow Barrier
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10476, 2, 100, 17234, 5, 10, 0, 10); -- Shadow Shock

-- Scholomance Necromancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10477, 0, 100, 17616, 10, 15, 0, 10); -- Corpse Explosion
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10477, 1, 100, 12020, 17, 29, 0, 10); -- Call of the Grave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10477, 2, 100, 14887, 5, 15, 0, 10); -- Shadow Bolt Volley

-- Lady Vespia
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10559, 0, 100, 13586, 5, 15, 0, 10); -- Aqua Jet
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10559, 1, 100, 8398, 10, 15, 0, 10); -- Frostbolt Volley
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10559, 2, 100, 4980, 15, 20, 0, 10); -- Quick Frost Ward

-- Scarlet Medic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10605, 0, 100, 17137, 10, 10, 0, 10); -- Flash Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10605, 1, 100, 11640, 22, 32, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10605, 2, 100, 17175, 41, 57, 0, 10); -- Resist Arcane

-- Scarlet Priest
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10608, 0, 100, 12039, 14, 15, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10608, 1, 100, 8362, 15, 15, 0, 10); -- Renew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10608, 2, 100, 15498, 0, 0, 0, 10); -- Holy Smite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10608, 3, 100, 13864, 15, 15, 0, 10); -- Power Word: Fortitude

-- Rorgish Jowl
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10639, 0, 100, 3391, 6, 15, 0, 10); -- Thrash

-- Oakpaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10640, 3, 100, 12160, 10, 20, 0, 10); -- Rejuvenation

-- Mugglefin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10643, 0, 100, 3584, 179, 180, 0, 10); -- Volatile Infection

-- Prince Raze
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10647, 0, 100, 11969, 8, 15, 0, 10); -- Fire Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10647, 1, 100, 9053, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10647, 2, 100, 16570, 10, 10, 0, 10); -- Charged Arcane Bolt

-- Raider Jhash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10676, 0, 100, 6533, 15, 23, 0, 10); -- Net

-- Raider Kerr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10682, 0, 100, 6533, 17, 19, 0, 10); -- Net

-- Refuge Pointe Defender
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10696, 0, 100, 7164, 10, 10, 0, 10); -- Defensive Stance
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10696, 1, 100, 11972, 10, 20, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10696, 2, 100, 3639, 20, 34, 0, 10); -- Improved Blocking

-- High Chief Winterfall
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10738, 0, 100, 8364, 5, 10, 0, 10); -- Blizzard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10738, 1, 100, 15793, 3, 8, 0, 10); -- Maul
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10738, 2, 100, 12548, 6, 12, 0, 10); -- Frost Shock

-- Grimtotem Bandit
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10758, 0, 100, 6713, 12, 18, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10758, 1, 100, 11978, 6, 10, 0, 10); -- Kick

-- Grimtotem Stomper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10759, 1, 100, 13281, 5, 13, 0, 10); -- Earth Shock

-- Grimtotem Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10760, 0, 100, 20813, 5, 15, 0, 10); -- Flamestrike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10760, 1, 100, 20811, 2, 6, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10760, 2, 100, 11436, 27, 40, 0, 10); -- Slow

-- Grimtotem Reaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10761, 0, 100, 15496, 7, 8, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10761, 1, 100, 11976, 9, 10, 0, 10); -- Strike

-- Hitah'ya the Keeper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10802, 0, 100, 11639, 5, 8, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10802, 1, 100, 20825, 0, 0, 0, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10802, 2, 100, 11640, 21, 24, 0, 10); -- Renew

-- Duggan Wildhammer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10817, 0, 100, 15284, 5, 8, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10817, 1, 100, 15547, 10, 10, 0, 10); -- Shoot

-- Warlord Thresh'jin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10822, 0, 100, 17207, 5, 8, 0, 10); -- Whirlwind
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10822, 1, 100, 11971, 3, 6, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10822, 2, 100, 9080, 9, 12, 0, 10); -- Hamstring

-- Zul'Brin Warpbranch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10823, 0, 100, 17172, 10, 15, 0, 10); -- Hex
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10823, 1, 100, 12491, 10, 12, 0, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10823, 2, 100, 20831, 7, 9, 0, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10823, 3, 100, 15039, 8, 11, 0, 10); -- Flame Shock

-- Ranger Lord Hawkspear
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10824, 0, 100, 15547, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10824, 2, 100, 12057, 4, 7, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10824, 3, 100, 11978, 6, 9, 0, 10); -- Kick

-- High General Abbendis
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10828, 0, 100, 9128, 5, 10, 0, 10); -- Battle Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10828, 1, 100, 13730, 9, 12, 0, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10828, 2, 100, 17143, 5, 8, 0, 10); -- Holy Strike

-- Arnak Grimtotem
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10896, 0, 100, 11977, 7, 8, 0, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (10896, 1, 100, 10966, 11, 12, 0, 10); -- Uppercut

-- Crimson Monk
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11043, 1, 100, 3391, 6, 15, 0, 10); -- Thrash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11043, 2, 100, 11978, 3, 7, 0, 10); -- Kick

-- Crimson Hammersmith
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11120, 0, 100, 17445, 10, 15, 0, 10); -- Bone Smelt

-- Everlook Bruiser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11190, 0, 100, 12024, 10, 10, 0, 10); -- Net

-- Scholomance Handler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11257, 0, 100, 10833, 5, 10, 0, 10); -- Arcane Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11257, 1, 100, 15244, 5, 15, 0, 10); -- Cone of Cold
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11257, 2, 100, 17145, 5, 14, 0, 10); -- Blast Wave

-- Ragefire Trogg
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11318, 0, 100, 11976, 3, 6, 0, 10); -- Strike

-- Ragefire Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11319, 0, 100, 9532, 2, 4, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11319, 1, 100, 11986, 8, 12, 0, 10); -- Healing Wave

-- Searing Blade Cultist
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11322, 0, 100, 18266, 8, 12, 0, 10); -- Curse of Agony

-- Searing Blade Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11323, 0, 100, 8242, 6, 10, 0, 10); -- Shield Slam

-- Searing Blade Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11324, 0, 100, 20791, 0, 0, 0, 10); -- Shadow Bolt

-- Hakkari Oracle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11346, 0, 100, 15982, 15, 15, 5, 10); -- Healing Wave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11346, 1, 100, 16006, 5, 10, 5, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11346, 2, 100, 15501, 5, 7, 5, 10); -- Earth Shock

-- Gurubashi Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11355, 0, 100, 11428, 6, 10, 0, 10); -- Knockdown
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11355, 1, 100, 18501, 11, 15, 0, 10); -- Enrage

-- High Priestess Hai'watna
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11383, 0, 100, 15586, 5, 8, 0, 10); -- Heal
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11383, 1, 100, 14887, 2, 4, 0, 10); -- Shadow Bolt Volley
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11383, 2, 100, 18503, 10, 15, 0, 10); -- Hex

-- Gordok Enforcer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11440, 0, 100, 15663, 5, 10, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11440, 1, 100, 12057, 0, 5, 0, 10); -- Strike

-- Gordok Brute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11441, 1, 10, 15615, 3, 5, 1, 10); -- Pummel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11441, 1, 90, 18072, 6, 10, 1, 10); -- Uppercut
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11441, 2, 10, 6253, 6, 8, 1, 10); -- Backhand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11441, 2, 90, 22572, 8, 12, 1, 10); -- Bruising Blow

-- Gordok Mauler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11442, 1, 100, 3391, 5, 10, 0, 10); -- Thrash

-- Gordok Ogre-Mage
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11443, 0, 100, 12466, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11443, 1, 100, 6742, 5, 9, 0, 10); -- Bloodlust

-- Gordok Mage-Lord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11444, 0, 100, 16170, 4, 6, 1, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11444, 1, 100, 14145, 6, 10, 1, 10); -- Fire Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11444, 2, 100, 15530, 0, 0, 1, 10); -- Frostbolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11444, 3, 100, 16102, 15, 20, 1, 10); -- Flamestrike

-- Gordok Captain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11445, 0, 100, 22574, 5, 8, 1, 10); -- Dark Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11445, 1, 100, 16244, 10, 12, 1, 10); -- Demoralizing Shout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11445, 2, 100, 12096, 12, 15, 1, 10); -- Fear
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11445, 3, 100, 22575, 8, 10, 1, 10); -- Shadow Shock

-- Gordok Warlock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11448, 0, 100, 15232, 0, 0, 1, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11448, 1, 100, 17883, 0, 0, 1, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11448, 2, 100, 8994, 15, 20, 1, 10); -- Banish
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11448, 3, 100, 13338, 5, 10, 1, 10); -- Curse of Tongues

-- Gordok Reaver
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11450, 0, 100, 15284, 6, 9, 1, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11450, 1, 100, 16145, 6, 9, 1, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11450, 2, 100, 13737, 12, 15, 1, 10); -- Mortal Strike

-- Wildspawn Satyr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11451, 0, 100, 15580, 4, 6, 1, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11451, 1, 100, 9080, 6, 10, 1, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11451, 2, 100, 9128, 10, 15, 1, 10); -- Battle Shout

-- Wildspawn Rogue
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11452, 2, 100, 15583, 6, 8, 1, 10); -- Rupture
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11452, 3, 100, 15667, 3, 5, 1, 10); -- Sinister Strike

-- Wildspawn Trickster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11453, 0, 100, 12493, 4, 5, 1, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11453, 1, 100, 22371, 10, 10, 1, 10); -- Curse of Impotence
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11453, 3, 100, 3609, 25, 26, 1, 10); -- Paralyzing Poison

-- Wildspawn Betrayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11454, 0, 100, 16100, 10, 10, 1, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11454, 1, 100, 18649, 6, 8, 1, 10); -- Shadow Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11454, 2, 100, 7896, 6, 7, 1, 10); -- Exploding Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11454, 3, 100, 11428, 10, 13, 1, 10); -- Knockdown

-- Wildspawn Felsworn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11455, 0, 100, 15537, 0, 0, 1, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11455, 1, 100, 22417, 10, 10, 1, 10); -- Shadow Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11455, 2, 100, 15654, 4, 6, 1, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11455, 3, 100, 22418, 10, 10, 1, 10); -- Chaotic Focus

-- Wildspawn Shadowstalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11456, 2, 100, 22416, 4, 6, 1, 10); -- Backstab

-- Wildspawn Hellcaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11457, 0, 100, 20754, 16, 19, 1, 10); -- Rain of Fire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11457, 1, 100, 15228, 0, 0, 1, 10); -- Fireball

-- Oggleflint
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11517, 0, 100, 5532, 3, 4, 0, 10); -- Cleave

-- Jergosh the Invoker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11518, 0, 100, 20800, 2, 5, 0, 10); -- Immolate
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11518, 1, 100, 18267, 6, 10, 0, 10); -- Curse of Weakness

-- Bazzalan
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11519, 1, 100, 14873, 4, 6, 0, 10); -- Sinister Strike

-- Taragaman the Hungerer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11520, 0, 100, 11970, 7, 12, 0, 10); -- Fire Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11520, 1, 100, 18072, 5, 8, 0, 10); -- Uppercut

-- Outcast Necromancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11559, 0, 100, 20298, 0, 0, 0, 10); -- Shadow Bolt

-- Drysnap Crawler
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11562, 0, 100, 12544, 10, 10, 0, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11562, 1, 100, 12548, 8, 12, 0, 10); -- Frost Shock

-- Drysnap Pincer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11563, 0, 100, 13444, 6, 8, 0, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11563, 1, 100, 13443, 9, 11, 0, 10); -- Rend

-- Scholomance Dark Summoner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11582, 1, 100, 12279, 10, 19, 0, 10); -- Curse of Blood
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11582, 2, 100, 17620, 15, 19, 0, 10); -- Drain Life

-- Cavalier Durgen
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11611, 0, 100, 13953, 5, 8, 0, 10); -- Holy Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11611, 1, 100, 13005, 10, 15, 0, 10); -- Hammer of Justice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11611, 2, 100, 13008, 10, 10, 0, 10); -- Retribution Aura

-- Huntsman Radley
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11613, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11613, 1, 100, 14443, 6, 8, 0, 10); -- Multi-Shot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11613, 2, 100, 11976, 3, 5, 0, 10); -- Strike

-- Horde Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11680, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11680, 1, 100, 18545, 6, 10, 0, 10); -- Scorpid Sting

-- Horde Deforester
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11681, 0, 100, 11971, 4, 6, 0, 10); -- Sunder Armor

-- Horde Grunt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11682, 0, 100, 11972, 10, 15, 0, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11682, 2, 100, 22540, 5, 10, 0, 10); -- Cleave

-- Horde Shaman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11683, 0, 100, 6742, 3, 6, 0, 10); -- Bloodlust
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11683, 1, 100, 20805, 0, 0, 0, 10); -- Lightning Bolt

-- Maraudine Priest
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11685, 0, 100, 11639, 6, 8, 0, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11685, 1, 100, 16568, 5, 8, 0, 10); -- Mind Flay

-- Cursed Centaur
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11688, 0, 100, 21048, 10, 15, 0, 10); -- Curse of the Tribes

-- Mannoroc Lasher
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11697, 0, 100, 9613, 15, 22, 0, 10); -- Shadow Bolt

-- Sentinel Aynasha
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11711, 0, 100, 19767, 10, 10, 0, 10); -- Aynasha's Bow

-- Ganoosh
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11750, 0, 100, 6951, 25, 29, 0, 10); -- Decayed Strength

-- Putridus Satyr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11790, 0, 100, 15667, 3, 5, 0, 10); -- Sinister Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11790, 1, 100, 12540, 7, 10, 0, 10); -- Gouge

-- Putridus Trickster
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11791, 1, 100, 15657, 4, 6, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11791, 2, 100, 3391, 5, 14, 0, 10); -- Thrash

-- Putridus Shadowstalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11792, 1, 100, 9080, 6, 10, 0, 10); -- Hamstring

-- Celebrian Dryad
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11793, 0, 100, 16000, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11793, 2, 100, 17201, 5, 8, 0, 10); -- Dispel Magic

-- Sister of Celebrian
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11794, 0, 100, 15795, 10, 10, 0, 10); -- Throw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11794, 1, 100, 14516, 3, 6, 0, 10); -- Strike

-- Twilight Keeper Exeter
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11803, 0, 100, 22427, 5, 7, 0, 10); -- Concussion Blow
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11803, 1, 100, 16856, 4, 6, 0, 10); -- Mortal Strike

-- Twilight Keeper Havunth
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11804, 0, 100, 13339, 3, 5, 0, 10); -- Fire Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11804, 1, 100, 17366, 6, 8, 0, 10); -- Fire Nova

-- Doomguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11859, 0, 100, 19482, 10, 10, 0, 10); -- War Stomp
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11859, 1, 100, 19476, 10, 10, 0, 10); -- Dispel Magic
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11859, 2, 100, 89, 29, 31, 0, 10); -- Cripple
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11859, 3, 100, 19474, 10, 10, 0, 10); -- Rain of Fire

-- Twilight Geolord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11881, 0, 100, 9483, 0, 0, 0, 10); -- Boulder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11881, 1, 100, 13728, 10, 20, 0, 10); -- Earth Shock

-- Twilight Stonecaller
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11882, 1, 100, 11020, 16, 30, 0, 10); -- Petrify
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11882, 2, 100, 9053, 0, 0, 0, 10); -- Fireball

-- Twilight Master
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11883, 0, 100, 12058, 6, 14, 0, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11883, 1, 100, 11831, 10, 24, 0, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11883, 2, 100, 13339, 6, 15, 0, 10); -- Fire Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11883, 3, 100, 9672, 0, 0, 0, 10); -- Frostbolt

-- Mercutio Filthgorger
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11886, 0, 100, 12540, 5, 8, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11886, 1, 100, 14516, 6, 8, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11886, 2, 100, 11971, 8, 12, 0, 10); -- Sunder Armor

-- Crusader Lord Valdelmar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11898, 0, 100, 15754, 3, 6, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11898, 1, 100, 13005, 8, 12, 0, 10); -- Hammer of Justice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11898, 2, 100, 17232, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11898, 3, 100, 17233, 179, 180, 0, 10); -- Lay on Hands

-- Grimtotem Mercenary
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11911, 1, 100, 12555, 18, 19, 0, 10); -- Pummel

-- Grimtotem Brute
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11912, 0, 100, 6268, 142, 143, 0, 10); -- Rushing Charge

-- Grimtotem Sorcerer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11913, 0, 100, 20802, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11913, 1, 100, 12160, 10, 11, 0, 10); -- Rejuvenation

-- Gorehoof the Black
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11914, 0, 100, 45, 16, 17, 0, 10); -- War Stomp

-- Gogger Rock Keeper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11915, 0, 100, 13281, 7, 9, 0, 10); -- Earth Shock

-- Gogger Geomancer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11917, 0, 100, 20793, 0, 0, 0, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (11917, 1, 100, 11990, 7, 8, 0, 10); -- Rain of Fire

-- Gor'marok the Ravager
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12046, 0, 100, 16856, 9, 10, 0, 10); -- Mortal Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12046, 1, 100, 15496, 12, 13, 0, 10); -- Cleave

-- Stormpike Mountaineer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12047, 0, 100, 15547, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12047, 1, 100, 15495, 10, 20, 0, 10); -- Explosive Shot

-- Lunaclaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12138, 0, 100, 3391, 10, 15, 0, 10); -- Thrash

-- Poison Sprite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12216, 0, 100, 21067, 0, 0, 0, 10); -- Poison Bolt

-- Corruptor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12217, 0, 100, 5413, 5, 8, 0, 10); -- Noxious Catalyst
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12217, 1, 100, 21068, 5, 8, 0, 10); -- Corruption

-- Quel'Lithien Protector
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12322, 0, 100, 15547, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12322, 2, 100, 12057, 4, 7, 0, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12322, 3, 100, 11978, 6, 10, 0, 10); -- Kick

-- Crimson Courier
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12337, 0, 100, 13005, 8, 10, 0, 10); -- Hammer of Justice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12337, 1, 100, 19725, 12, 18, 0, 10); -- Turn Undead
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12337, 2, 100, 17149, 6, 9, 0, 10); -- Exorcism
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12337, 3, 100, 17143, 5, 8, 0, 10); -- Holy Strike

-- Scarlet Trooper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12352, 0, 100, 8258, 10, 10, 0, 10); -- Devotion Aura
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12352, 1, 100, 15493, 6, 7, 0, 10); -- Holy Light
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12352, 2, 100, 13005, 6, 10, 0, 10); -- Hammer of Justice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12352, 3, 100, 13874, 10, 10, 0, 10); -- Divine Shield

-- Lord Kragaru
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12369, 0, 100, 15496, 6, 7, 0, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12369, 1, 100, 12555, 9, 10, 0, 10); -- Pummel

-- Flint Shadowmore
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12425, 1, 100, 15582, 2, 3, 0, 10); -- Backstab
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12425, 2, 100, 6434, 15, 18, 0, 10); -- Slice and Dice
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12425, 3, 100, 12540, 10, 15, 0, 10); -- Gouge

-- Bloodfury Ripper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12579, 0, 100, 13445, 4, 6, 0, 10); -- Rend

-- Ashenvale Outrunner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12856, 0, 100, 20540, 10, 10, 0, 10); -- Ashenvale Outrunner Sneak
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12856, 1, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12856, 2, 100, 18545, 6, 14, 0, 10); -- Scorpid Sting
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12856, 3, 100, 8646, 5, 10, 0, 10); -- Snap Kick

-- Duriel Moonfire
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12860, 0, 100, 12097, 22, 30, 0, 10); -- Pierce Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12860, 1, 100, 11428, 16, 30, 0, 10); -- Knockdown

-- Warsong Scout
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12862, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12862, 1, 100, 18545, 8, 10, 0, 10); -- Scorpid Sting

-- Warsong Runner
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12863, 0, 100, 6660, 10, 10, 0, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12863, 1, 100, 18545, 6, 10, 0, 10); -- Scorpid Sting

-- Silverwing Sentinel
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12896, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Silverwing Warrior
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12897, 0, 100, 11977, 22, 30, 0, 10); -- Rend

-- Lorgus Jett
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12902, 0, 100, 12167, 0, 0, 0, 10); -- Lightning Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12902, 1, 100, 12550, 15, 29, 0, 10); -- Lightning Shield

-- Mounted Ironforge Mountaineer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12996, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Dwarven Farmer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12998, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Burning Blade Seer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13019, 0, 100, 11829, 11, 12, 0, 10); -- Flamestrike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13019, 1, 100, 9658, 10, 11, 0, 10); -- Flame Buffet

-- Dun Morogh Mountaineer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13076, 0, 100, 6660, 10, 10, 0, 10); -- Shoot

-- Coldmine Explorer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13096, 0, 100, 15242, 0, 0, 3, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13096, 1, 100, 15244, 5, 14, 3, 10); -- Cone of Cold
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13096, 2, 100, 12544, 19, 20, 3, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13096, 3, 100, 14145, 5, 15, 3, 10); -- Fire Blast

-- Crimson Bodyguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13118, 0, 100, 15749, 6, 8, 0, 10); -- Shield Charge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13118, 1, 100, 6713, 9, 12, 0, 10); -- Disarm
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13118, 2, 100, 11972, 10, 15, 0, 10); -- Shield Bash

-- Wildspawn Imp
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13276, 0, 100, 13340, 6, 8, 1, 10); -- Fire Blast

-- Seasoned Coldmine Explorer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13546, 0, 100, 15242, 0, 0, 3, 10); -- Fireball
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13546, 1, 100, 15244, 5, 14, 3, 10); -- Cone of Cold
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13546, 2, 100, 12544, 10, 10, 3, 10); -- Frost Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13546, 3, 100, 14145, 8, 11, 3, 10); -- Fire Blast

-- The Nameless Prophet
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13718, 0, 100, 16098, 15, 30, 0, 10); -- Curse of Blood
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13718, 1, 100, 15848, 16, 30, 0, 10); -- Festering Rash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13718, 2, 100, 15501, 5, 10, 0, 10); -- Earth Shock

-- Royal Dreadguard
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13839, 0, 100, 11972, 10, 10, 1, 10); -- Shield Bash
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13839, 1, 100, 14516, 5, 10, 1, 10); -- Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13839, 2, 100, 9080, 10, 15, 1, 10); -- Hamstring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (13839, 3, 100, 16100, 10, 10, 1, 10); -- Shoot

-- Kor'kron Elite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14304, 0, 100, 15496, 5, 6, 1, 10); -- Cleave

-- Thief Catcher Thunderbrew
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14367, 1, 100, 15572, 15, 29, 1, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14367, 2, 100, 14030, 11, 20, 1, 10); -- Hooked Net

-- Scout Stronghand
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14375, 1, 100, 15572, 18, 23, 1, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14375, 2, 100, 14030, 10, 19, 1, 10); -- Hooked Net

-- Scout Manslayer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14376, 1, 100, 15572, 20, 29, 1, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14376, 2, 100, 14030, 10, 18, 1, 10); -- Hooked Net

-- Scout Tharr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14377, 1, 100, 15572, 20, 28, 1, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14377, 2, 100, 14030, 13, 20, 1, 10); -- Hooked Net

-- Huntress Ravenoak
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14379, 1, 100, 15572, 15, 27, 1, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14379, 2, 100, 14030, 10, 20, 1, 10); -- Hooked Net

-- Netherwalker
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14389, 0, 100, 22878, 5, 10, 1, 10); -- Shadow Bolt Volley

-- Overlord Runthak
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14392, 0, 100, 16508, 15, 24, 1, 10); -- Intimidating Roar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14392, 1, 100, 16509, 5, 15, 1, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14392, 2, 100, 15580, 5, 10, 1, 10); -- Strike

-- Major Mattingly
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14394, 0, 100, 14518, 10, 10, 1, 10); -- Crusader Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14394, 1, 100, 15493, 13, 17, 1, 10); -- Holy Light

-- Seeker Cromwell
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14402, 1, 100, 15572, 26, 28, 2, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14402, 2, 100, 14030, 11, 19, 2, 10); -- Hooked Net

-- Seeker Nahr
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14403, 1, 100, 15572, 16, 23, 2, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14403, 2, 100, 14030, 13, 19, 2, 10); -- Hooked Net

-- Seeker Thompson
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14404, 1, 100, 15572, 18, 26, 2, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14404, 2, 100, 14030, 12, 13, 2, 10); -- Hooked Net

-- Officer Jaxon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14423, 1, 100, 15572, 17, 30, 2, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14423, 2, 100, 14030, 10, 19, 2, 10); -- Hooked Net

-- Gnawbone
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14425, 1, 100, 11977, 5, 9, 0, 10); -- Rend

-- Harb Foulmountain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14426, 0, 100, 45, 10, 20, 0, 10); -- War Stomp
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14426, 1, 100, 3391, 10, 20, 0, 10); -- Thrash

-- Gibblesnik
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14427, 0, 100, 11971, 5, 12, 0, 10); -- Sunder Armor

-- Uruson
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14428, 0, 100, 15727, 10, 10, 0, 10); -- Demoralizing Roar

-- Grimmaw
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14429, 0, 100, 19319, 11, 15, 0, 10); -- Vicious Bite

-- Fury Shelda
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14431, 0, 100, 3589, 10, 15, 0, 10); -- Deafening Screech

-- Threggil
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14432, 0, 100, 11976, 10, 10, 2, 10); -- Strike

-- Officer Pomeroy
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14438, 1, 100, 15572, 24, 25, 2, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14438, 2, 100, 14030, 16, 17, 2, 10); -- Hooked Net

-- Officer Brady
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14439, 1, 100, 15572, 17, 30, 2, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14439, 2, 100, 14030, 11, 19, 2, 10); -- Hooked Net

-- Hunter Sagewind
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14440, 1, 100, 15572, 18, 27, 2, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14440, 2, 100, 14030, 15, 20, 2, 10); -- Hooked Net

-- Hunter Ragetotem
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14441, 1, 100, 15572, 26, 30, 2, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14441, 2, 100, 14030, 13, 15, 2, 10); -- Hooked Net

-- Hunter Thunderhorn
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14442, 1, 100, 15572, 10, 10, 2, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14442, 2, 100, 14030, 0, 0, 2, 10); -- Hooked Net

-- Fingat
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14446, 0, 100, 3391, 5, 15, 0, 10); -- Thrash

-- Gilmorian
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14447, 0, 100, 13579, 6, 10, 0, 10); -- Gouge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14447, 1, 100, 19472, 5, 10, 0, 10); -- Sinister Strike

-- Setis
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14471, 0, 100, 16727, 15, 20, 0, 10); -- War Stomp
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14471, 1, 100, 10887, 5, 10, 0, 10); -- Crowd Pummel

-- Twilight Lord Everun
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14479, 0, 100, 17439, 5, 10, 2, 10); -- Shadow Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14479, 1, 100, 19816, 5, 10, 2, 10); -- Fireball

-- Gluggle
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14487, 0, 100, 6306, 5, 9, 0, 10); -- Acid Splash

-- Roloch
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14488, 0, 100, 15496, 6, 8, 0, 10); -- Cleave

-- Ur'dan
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14522, 0, 100, 9613, 0, 0, 2, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14522, 2, 100, 8699, 24, 25, 2, 10); -- Unholy Frenzy

-- Ulathek
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14523, 0, 100, 9613, 0, 0, 2, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14523, 2, 100, 8699, 24, 27, 2, 10); -- Unholy Frenzy

-- Overseer Maltorius
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14621, 0, 100, 13323, 23, 40, 3, 10); -- Polymorph
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14621, 1, 100, 11974, 20, 30, 3, 10); -- Power Word: Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14621, 2, 100, 12739, 0, 0, 3, 10); -- Shadow Bolt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14621, 3, 100, 15654, 11, 24, 3, 10); -- Shadow Word: Pain

-- Silverwing Elite
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14715, 0, 100, 15620, 10, 10, 3, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14715, 1, 100, 15496, 5, 10, 3, 10); -- Cleave

-- Field Marshal Afrasiabi
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14721, 0, 100, 10967, 22, 42, 3, 10); -- Echoing Roar

-- Sentinel Farsong
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14733, 0, 100, 15620, 10, 10, 3, 10); -- Shoot
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14733, 1, 100, 15496, 10, 10, 3, 10); -- Cleave

-- Vilebranch Kidnapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14748, 0, 100, 7160, 10, 10, 3, 10); -- Execute

-- Blood Steward of Kirtonos
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14861, 0, 100, 12493, 3, 6, 4, 10); -- Curse of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14861, 1, 100, 22371, 3, 6, 4, 10); -- Curse of Impotence
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (14861, 3, 100, 3609, 20, 29, 4, 10); -- Paralyzing Poison

-- Twilight Keeper Mayna
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15200, 0, 100, 22884, 10, 10, 6, 10); -- Psychic Scream
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15200, 1, 100, 17165, 10, 10, 6, 10); -- Mind Flay
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15200, 3, 100, 15654, 10, 12, 6, 10); -- Shadow Word: Pain

-- Vyral the Vile
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15202, 0, 100, 17439, 5, 10, 6, 10); -- Shadow Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15202, 1, 100, 19816, 5, 10, 6, 10); -- Fireball

-- Twilight Overlord
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15213, 0, 100, 12058, 5, 15, 6, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15213, 1, 100, 11831, 10, 23, 6, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15213, 2, 100, 13339, 5, 13, 6, 10); -- Fire Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15213, 3, 100, 9672, 0, 0, 6, 10); -- Frostbolt

-- Twilight Prophet
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15308, 0, 100, 15531, 15, 20, 6, 10); -- Frost Nova
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15308, 1, 100, 15305, 2, 4, 6, 10); -- Chain Lightning
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15308, 2, 100, 22884, 10, 20, 6, 10); -- Psychic Scream
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15308, 3, 100, 17366, 3, 4, 6, 10); -- Fire Nova

-- Steam Tonk
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15328, 0, 100, 24933, 4, 4, 8, 10); -- Cannon
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15328, 1, 100, 25003, 5, 5, 8, 10); -- Mortar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15328, 2, 25, 25024, 10, 10, 8, 10); -- Drop Mine
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15328, 2, 25, 25026, 10, 10, 8, 10); -- Activate MG Turret
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15328, 2, 25, 25027, 2, 2, 8, 10); -- Flamethrower
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15328, 2, 25, 27759, 15, 15, 8, 10); -- Shield Generator
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15328, 3, 100, 27746, 10, 10, 8, 10); -- Nitrous Boost

-- Ironforge Brigade Rifleman
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15441, 0, 100, 25200, 10, 10, 7, 10); -- Shoot Silithus Rifleman Long Range

-- Janela Stouthammer
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15443, 0, 100, 25263, 31, 40, 7, 10); -- Holy Light
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15443, 1, 100, 13874, 32, 39, 7, 10); -- Divine Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15443, 2, 100, 14518, 4, 10, 7, 10); -- Crusader Strike

-- Arcanist Nozzlespring
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15444, 0, 100, 15790, 10, 12, 7, 10); -- Arcane Missiles
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15444, 1, 100, 13375, 7, 13, 7, 10); -- Fireball

-- Twilight Marauder Morna
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15541, 0, 100, 23600, 8, 9, 7, 10); -- Piercing Howl
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15541, 1, 100, 15572, 9, 9, 7, 10); -- Sunder Armor
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15541, 2, 100, 16856, 4, 5, 7, 10); -- Mortal Strike

-- Twilight Marauder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15542, 0, 100, 22911, 10, 10, 7, 10); -- Charge
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15542, 1, 100, 23600, 8, 19, 7, 10); -- Piercing Howl

-- Cenarion Outrider
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15545, 1, 100, 13730, 8, 14, 6, 10); -- Demoralizing Shout

-- Krug Skullsplit
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15612, 0, 100, 16856, 5, 10, 7, 10); -- Mortal Strike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15612, 1, 100, 15548, 23, 28, 7, 10); -- Thunderclap

-- Merok Longstride
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15613, 1, 100, 15616, 7, 8, 7, 10); -- Flame Shock
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15613, 2, 100, 15507, 30, 32, 7, 10); -- Lightning Shield
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15613, 3, 100, 15982, 41, 50, 7, 10); -- Healing Wave

-- Shadow Priestess Shai
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15615, 0, 100, 17146, 20, 25, 7, 10); -- Shadow Word: Pain
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15615, 1, 100, 17194, 3, 8, 7, 10); -- Mind Blast
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15615, 2, 100, 19285, 67, 82, 7, 10); -- Hex of Weakness
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15615, 3, 100, 17138, 32, 39, 7, 10); -- Flash Heal

-- Orgrimmar Legion Axe Thrower
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15617, 0, 100, 10277, 10, 10, 7, 10); -- Throw

-- Southsea Kidnapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15685, 0, 100, 6713, 19, 20, 6, 10); -- Disarm

-- Dark Iron Kidnapper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15692, 0, 100, 6533, 20, 35, 6, 10); -- Net
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (15692, 1, 100, 11977, 6, 20, 6, 10); -- Rend

-- Mokvar
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16012, 0, 100, 16006, 0, 0, 8, 10); -- Chain Lightning

-- Deliana
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16013, 0, 100, 15228, 2, 2, 8, 10); -- Fireball

-- Tidelord Rrurgaz
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16072, 0, 100, 17207, 10, 15, 8, 10); -- Whirlwind
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16072, 1, 100, 16509, 10, 15, 8, 10); -- Rend
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16072, 2, 100, 15588, 21, 28, 8, 10); -- Thunderclap
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16072, 3, 100, 16244, 30, 39, 8, 10); -- Demoralizing Shout

-- Steamwheedle Bruiser
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16096, 0, 100, 12024, 9, 10, 8, 10); -- Net

-- Naxxramas Worshipper
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16506, 0, 100, 28732, 0, 0, 9, 10); -- Widow's Embrace

-- Deathknight Understudy
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16803, 0, 100, 29060, 60, 60, 9, 10); -- Taunt
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (16803, 1, 100, 29061, 30, 30, 9, 10); -- Shield Wall

-- Razorgore the Untamed
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12435, 0, 100, 22425, 0, 0, 4, 10); -- Fireball Volley
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12435, 1, 100, 19872, 0, 0, 4, 10); -- Calm Dragonkin
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12435, 2, 100, 19632, 6, 6, 4, 10); -- Cleave
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12435, 3, 100, 19873, 7, 7, 4, 10); -- Destroy Egg

-- Blackwing Spellbinder
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12457, 0, 100, 22275, 0, 0, 4, 10); -- Flamestrike
INSERT INTO `creature_charm_spells` (`entry`, `slot`, `availability`, `spell_id`, `cooldown_min`, `cooldown_max`, `patch_min`, `patch_max`) VALUES (12457, 1, 100, 22274, 0, 0, 4, 10); -- Greater Polymorph

ALTER TABLE `creature_template`
	ADD COLUMN `totem_spell_id` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell that will be used by totems.' AFTER `spawn_spell_id`;

-- Transfer totem spell to dedicated field.
UPDATE `creature_template` SET `totem_spell_id`=`spell_id1` WHERE `type`=11;
UPDATE `creature_template` SET `totem_spell_id`=`spell_id1` WHERE `ai_name`='TotemAI';
UPDATE `creature_template` SET `totem_spell_id`=`spell_id1` WHERE `script_name`='npc_etendard';
UPDATE `creature_template` SET `totem_spell_id`=`spell_id1` WHERE `script_name`='TotemGlebe';
UPDATE `creature_template` SET `totem_spell_id`=`spell_id1` WHERE `entry` IN (2523, 2630, 3527, 3573, 3579, 3580, 3902, 3903, 3904, 3906, 3907, 3908, 3909, 3911, 3912, 3913, 3968, 5873, 5874, 5879, 5913, 5919, 5920, 5921, 5922, 5923, 5924, 5925, 5926, 5927, 5929, 5950, 6012, 6016, 6017, 6066, 6110, 6111, 6112, 7366, 7367, 7368, 7398, 7399, 7400, 7402, 7403, 7412, 7413, 7414, 7415, 7416, 7423, 7424, 7425, 7464, 7465, 7466, 7467, 7468, 7469, 7483, 7484, 7486, 7487, 7844, 7845, 8510, 9637, 9687, 9688, 9689, 10183, 10217, 10467, 10557, 11100, 11101, 12141, 13838, 13916, 14662, 14663, 14664, 14666, 14667, 14870, 15112, 15304, 15363, 15463, 15464, 15803, 16385);
UPDATE `creature_template` SET `totem_spell_id`=`spell_id1` WHERE `entry` IN (2523, 2630, 2992, 3527, 3560, 3573, 3579, 3580, 3844, 3902, 3903, 3904, 3906, 3907, 3908, 3909, 3911, 3912, 3913, 3968, 5873, 5874, 5879, 5913, 5919, 5920, 5921, 5922, 5923, 5924, 5925, 5926, 5927, 5929, 5950, 6012, 6016, 6017, 6110, 6111, 6112, 6386, 7366, 7367, 7368, 7398, 7399, 7400, 7402, 7403, 7412, 7413, 7414, 7415, 7416, 7423, 7424, 7425, 7464, 7465, 7466, 7467, 7468, 7469, 7483, 7484, 7486, 7487, 7785, 7844, 7845, 8179, 8510, 8836, 9637, 9687, 9688, 9689, 10183, 10217, 10218, 10467, 10557, 11100, 11101, 12141, 13838, 14465, 14466, 14667, 14751, 14752, 14870, 14987, 15112, 15304, 15363, 15463, 15464, 15803);

ALTER TABLE `creature_template`
	DROP COLUMN `spell_id1`,
	DROP COLUMN `spell_id2`,
	DROP COLUMN `spell_id3`,
	DROP COLUMN `spell_id4`;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
