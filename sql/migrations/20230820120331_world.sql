DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230820120331');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230820120331');
-- Add your query below.


ALTER TABLE `creature_equip_template`
	ADD COLUMN `probability` MEDIUMINT UNSIGNED NOT NULL DEFAULT '1' AFTER `patch`,
	CHANGE COLUMN `equipentry1` `item1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `probability`,
	CHANGE COLUMN `equipentry2` `item2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `item1`,
	CHANGE COLUMN `equipentry3` `item3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `item2`,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`entry`, `item1`, `item2`, `item3`);

-- Riverpaw Taskmaster
DELETE FROM `creature_equip_template` WHERE `entry`=98;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (98, 0, 1, 1897, 2051, 0);

-- Defias Pathstalker
DELETE FROM `creature_equip_template` WHERE `entry`=121;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (121, 0, 1, 2711, 2051, 0);

-- Maybell Maclure
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (251, 0, 0, 3699, 0, 0);
UPDATE `creature_template` SET `equipment_id`=251 WHERE `entry`=251 && `patch` >= 0;
-- Creature changes equipment during end script for quest The Escape.
DELETE FROM `quest_end_scripts` WHERE `id`=114;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(114, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Escape: Maybell Maclure - Remove Npc Flags'),
(114, 2, 19, 0, 0, 0, 0, 0, 0, 0, 0, 3699, -1, -1, 0, 0, 0, 0, 0, 0, 'The Escape: Maybell Maclure - Set Equipment'),
(114, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1862, 0, 0, 0, 0, 0, 0, 0, 0, 'The Escape: Maybell Maclure - Say Text'),
(114, 5, 1, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Escape: Maybell Maclure - Emote OneShotEatNoSheathe'),
(114, 9, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Escape: Maybell Maclure - Despawn Creature');
UPDATE `creature` SET `spawntimesecsmin`=10, `spawntimesecsmax`=10 WHERE `id`=251;

-- William Pestle
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (253, 0, 0, 3699, 3697, 0);
UPDATE `creature_template` SET `equipment_id`=253 WHERE `entry`=253 && `patch` >= 0;
-- Creature changes equipment during end script for quest Collecting Kelp.
DELETE FROM `quest_end_scripts` WHERE `id`=112;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1851, 0, 0, 0, 0, 0, 0, 0, 0, 'Collecting Kelp: William Pestle - Say Text'),
(112, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.5708, 0, 'Collecting Kelp: William Pestle - Set Orientation'),
(112, 0, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Collecting Kelp: William Pestle - Set Emote State to STATE_USESTANDING_NOSHEATHE'),
(112, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Collecting Kelp: William Pestle - Remove Npc Flags'),
(112, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 3699, 3697, -1, 0, 0, 0, 0, 0, 0, 'Collecting Kelp: William Pestle - Set Equipment'),
(112, 5, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.98451, 0, 'Collecting Kelp: William Pestle - Set Orientation'),
(112, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Collecting Kelp: William Pestle - Set Emote State to ONESHOT_NONE'),
(112, 6, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 'Collecting Kelp: William Pestle - Set Equipment'),
(112, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1853, 0, 0, 0, 0, 0, 0, 0, 0, 'Collecting Kelp: William Pestle - Say Text'),
(112, 9, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Collecting Kelp: William Pestle - Add Npc Flags');

-- Kendor Kabonka
DELETE FROM `creature_equip_template` WHERE `entry`=340;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (340, 0, 1, 2705, 12860, 0);

-- Mor'Ladim
DELETE FROM `creature_equip_template` WHERE `entry`=522;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (522, 0, 1, 4991, 2081, 0);

-- Shadowhide Warrior
DELETE FROM `creature_equip_template` WHERE `entry`=568;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (568, 0, 1, 1905, 2051, 0);

-- Defias Henchman
DELETE FROM `creature_equip_template` WHERE `entry`=594;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (594, 0, 1, 2184, 2051, 0);

-- Rhahk'Zor
DELETE FROM `creature_equip_template` WHERE `entry`=644;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (644, 0, 1, 5187, 0, 0);

-- Mr. Smite
-- Creature changes equipment during combat.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (646, 0, 0, 2183, 2183, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (646, 0, 0, 10756, 0, 0);

-- Protector Deni
DELETE FROM `creature_equip_template` WHERE `entry`=870;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (870, 0, 1, 1897, 2053, 0);

-- Protector Korelor
DELETE FROM `creature_equip_template` WHERE `entry`=874;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (874, 0, 1, 1896, 2053, 0);

-- Protector Leick
DELETE FROM `creature_equip_template` WHERE `entry`=876;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (876, 0, 1, 1896, 2052, 0);

-- Thultash
DELETE FROM `creature_equip_template` WHERE `entry`=982;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (982, 0, 1, 2196, 13854, 0);

-- Dragonmaw Swamprunner
DELETE FROM `creature_equip_template` WHERE `entry`=1035;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1035, 0, 1, 1896, 2051, 0);

-- Dark Iron Saboteur
UPDATE `creature_equip_template` SET `probability`=1 WHERE `entry`=1052 && `item1`=1896 && `item2`=2052 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1052, 0, 0, 2884, 2052, 0);
-- This mob changes equipment before he blows himself up.
DELETE FROM `creature_ai_scripts` WHERE `id`=105202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(105202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 638, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - Say Text'),
(105202, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 637, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - Say Text'),
(105202, 0, 2, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2884, 2052, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - Set Equipment'),
(105202, 0, 3, 15, 3204, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - Cast Spell Sapper Explode');

-- Captain Halyndor
DELETE FROM `creature_equip_template` WHERE `entry`=1160;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1160, 0, 1, 1897, 2051, 0);

-- Dark Iron Sapper
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1222, 0, 0, 2884, 0, 0);
-- This mob changes equipment before he blows himself up.
DELETE FROM `creature_ai_scripts` WHERE `id`=122202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(122202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 638, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Sapper - Say Text'),
(122202, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 637, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Sapper - Say Text'),
(122202, 0, 2, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2884, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Sapper - Set Equipment'),
(122202, 0, 3, 15, 3204, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Sapper - Cast Spell Sapper Explode');

-- Alyssa Griffith
DELETE FROM `creature_equip_template` WHERE `entry`=1321;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1321, 0, 1, 12854, 0, 0);

-- Cook Ghilm
UPDATE `creature_equip_template` SET `probability`=1 WHERE `entry`=1355 && `item1`=2827 && `item2`=0 && `item3`=0;
-- Equipment changes from waypoint script.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1355, 0, 0, 2196, 0, 0);

-- Magosh
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1399, 0, 1, 1907, 0, 0);
UPDATE `creature_template` SET `equipment_id`=1399 WHERE `entry`=1399 && `patch` >= 0;

-- Lord Baurles K. Wishock
UPDATE `creature_equip_template` SET `probability`=116 WHERE `entry`=1439 && `item1`=12751 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1439, 0, 0, 2703, 0, 0);
-- Creature changes equipment during end script for quest A Noble Brew.
DELETE FROM `quest_end_scripts` WHERE `id`=336;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(336, 0, 3, 0, 3482, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -8560.68, 362.366, 108.386, 0, 0, 'A Noble Brew: Lord Baurles K. Wishock - Move'),
(336, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew: Lord Baurles K. Wishock - Remove Npc Flags'),
(336, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2703, -1, -1, 0, 0, 0, 0, 0, 0, 'A Noble Brew: Lord Baurles K. Wishock - Set Equipment'),
(336, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 387, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew: Lord Baurles K. Wishock - Say Text'),
(336, 1, 3, 0, 4103, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -8557.23, 365.081, 108.386, 0, 0, 'A Noble Brew: Lord Baurles K. Wishock - Move'),
(336, 6, 15, 2596, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew: Lord Baurles K. Wishock - Cast Spell Touch of the Black Claw'),
(336, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 388, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew: Lord Baurles K. Wishock - Say Text'),
(336, 11, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew: Lord Baurles K. Wishock - Add Npc Flags'),
(336, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew: Lord Baurles K. Wishock - Despawn Creature');
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=60 WHERE `id`=1439;

-- Magistrate Sevren
DELETE FROM `creature_equip_template` WHERE `entry`=1499;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1499, 0, 1, 12862, 0, 0);

-- Grand Inquisitor Isillien
DELETE FROM `creature_equip_template` WHERE `entry`=1840;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1840, 0, 1, 12591, 0, 0);

-- Foreman Marcrid
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1844, 0, 1, 12285, 0, 0);
UPDATE `creature_template` SET `equipment_id`=1844 WHERE `entry`=1844 && `patch` >= 0;

-- Scarlet Smith
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1885, 0, 1, 1903, 12980, 0);
UPDATE `creature_template` SET `equipment_id`=1885 WHERE `entry`=1885 && `patch` >= 0;

-- Stormwind City Patroller
UPDATE `creature_equip_template` SET `probability`=1 WHERE `entry`=1976 && `item1`=1899 && `item2`=143 && `item3`=0;
-- Creature changes equipment during Night event.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1976, 0, 0, 2715, 143, 0);

-- Dark Iron Ambusher
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (1981, 0, 1, 1900, 0, 0);
UPDATE `creature_template` SET `equipment_id`=1981 WHERE `entry`=1981 && `patch` >= 0;

-- Natheril Raincaller
DELETE FROM `creature_equip_template` WHERE `entry`=2084;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2084, 0, 1, 12744, 0, 0);

-- Mrs. Winters
DELETE FROM `creature_equip_template` WHERE `entry`=2134;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2134, 0, 1, 12744, 0, 0);

-- Dark Iron Raider
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2149, 0, 1, 1900, 0, 0);
UPDATE `creature_template` SET `equipment_id`=2149 WHERE `entry`=2149 && `patch` >= 0;

-- Captured Mountaineer
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2211, 0, 0, 2705, 0, 0);
UPDATE `creature_template` SET `equipment_id`=2211 WHERE `entry`=2211 && `patch` >= 0;
-- Creature changes equipment during end script for quest A New Plague.
DELETE FROM `quest_end_scripts` WHERE `id`=492;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(492, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A New Plague: Captured Mountaineer - Remove Npc Flags'),
(492, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2705, -1, -1, 0, 0, 0, 0, 0, 0, 'A New Plague: Captured Mountaineer - Set Equipment'),
(492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 576, 0, 0, 0, 0, 0, 0, 0, 0, 'A New Plague: Captured Mountaineer - Say Text'),
(492, 0, 1, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A New Plague: Captured Mountaineer - Emote OneShotEatNoSheathe'),
(492, 3, 15, 3617, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A New Plague: Captured Mountaineer - Cast Spell Quiet Suicide'),
(492, 10, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A New Plague: Captured Mountaineer - Add Npc Flags');
UPDATE `creature` SET `spawntimesecsmin`=10, `spawntimesecsmax`=10 WHERE `id`=2211;

-- Argus Shadow Mage
UPDATE `creature_equip_template` SET `probability`=1 WHERE `entry`=2318 && `item1`=2559 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2318, 0, 0, 2179, 2179, 0);
-- Creature changes equipment after transforming into skeleton.
DELETE FROM `creature_ai_scripts` WHERE `id`=231801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(231801, 0, 0, 39, 1, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Argus Shadow Mage - Start Melee Attack and Combat Movement'),
(231801, 0, 1, 15, 4063, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Argus Shadow Mage - Cast Spell Argus Shadow Mage Transform'),
(231801, 0, 2, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2179, 2179, 0, 0, 0, 0, 0, 0, 0, 'Argus Shadow Mage - Set Equipment'),
(231801, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 789, 0, 0, 0, 0, 0, 0, 0, 0, 'Argus Shadow Mage - Say Text'),
(231801, 0, 4, 55, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Argus Shadow Mage - Remove Spells Template');

-- Dun Garok Mountaineer
UPDATE `creature_equip_template` SET `probability`=204 WHERE `entry`=2344 && `item1`=12934 && `item2`=1985 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 2, 2765, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 2, 12934, 2220, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1417, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1514, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 15259, 1985, 2780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1821, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1515, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 935, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 2138, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1827, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1819, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 12934, 1985, 2780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1811, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1817, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 2763, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 2766, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 3199, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 12934, 2214, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 3210, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 12934, 1985, 2773);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 12934, 1985, 2777);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 12934, 2210, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 12934, 2213, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 12934, 2221, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1411, 1985, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2344, 0, 1, 1831, 1985, 0);

-- Dun Garok Rifleman
UPDATE `creature_equip_template` SET `probability`=116 WHERE `entry`=2345 && `item1`=1901 && `item2`=0 && `item3`=2552;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 15224, 0, 2552);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 1414, 0, 2552);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 1415, 0, 2552);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 1901, 2214, 2552);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 1513, 0, 2552);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 1814, 0, 2552);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 1819, 0, 2552);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 1824, 0, 2552);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 1901, 0, 2774);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2345, 0, 1, 1812, 0, 2552);

-- Dun Garok Priest
UPDATE `creature_equip_template` SET `probability`=50 WHERE `entry`=2346 && `item1`=2809 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2346, 0, 1, 1819, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2346, 0, 1, 2763, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2346, 0, 1, 2766, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2346, 0, 1, 1831, 0, 0);

-- Kundric Zanden
DELETE FROM `creature_equip_template` WHERE `entry`=2378;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2378, 0, 1, 12862, 0, 0);

-- Southshore Crier
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2435, 0, 1, 0, 13610, 0);
UPDATE `creature_template` SET `equipment_id`=2435 WHERE `entry`=2435 && `patch` >= 0;

-- Keeper Bel'varil
DELETE FROM `creature_equip_template` WHERE `entry`=2437;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2437, 0, 1, 12862, 0, 0);

-- Nimar the Slayer
DELETE FROM `creature_equip_template` WHERE `entry`=2606;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2606, 0, 1, 3433, 0, 0);

-- Theldurin the Lost
-- Creature changes equipment during end script for quest The Lost Fragments.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2785, 0, 1, 1908, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2785, 0, 0, 1911, 0, 0);
UPDATE `creature_template` SET `equipment_id`=2785 WHERE `entry`=2785 && `patch` >= 0;

-- Malygen
DELETE FROM `creature_equip_template` WHERE `entry`=2803;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2803, 0, 1, 12744, 0, 0);

-- Bale
DELETE FROM `creature_equip_template` WHERE `entry`=2806;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2806, 0, 1, 12744, 0, 0);

-- Vikki Lonsav
DELETE FROM `creature_equip_template` WHERE `entry`=2808;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2808, 0, 1, 12744, 0, 0);

-- Myizz Luckycatch
DELETE FROM `creature_equip_template` WHERE `entry`=2834;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2834, 0, 1, 6225, 0, 0);

-- Torn
DELETE FROM `creature_equip_template` WHERE `entry`=2996;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (2996, 0, 1, 12854, 0, 0);

-- Tand
DELETE FROM `creature_equip_template` WHERE `entry`=3016;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3016, 0, 1, 12744, 12745, 0);

-- K'waii
DELETE FROM `creature_equip_template` WHERE `entry`=3186;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3186, 0, 1, 12744, 0, 0);

-- Venture Co. Overseer
UPDATE `creature_equip_template` SET `probability`=632 WHERE `entry`=3286 && `item1`=2147 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3286, 0, 32, 5285, 0, 0);

-- Koma
DELETE FROM `creature_equip_template` WHERE `entry`=3318;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3318, 0, 1, 12856, 12859, 0);

-- Bael'dun Foreman
UPDATE `creature_equip_template` SET `probability`=1 WHERE `entry`=3375 && `item1`=1906 && `item2`=0 && `item3`=6088;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3375, 0, 0, 0, 0, 6088);
-- Creature unequips its melee weapon on aggro.
DELETE FROM `creature_ai_events` WHERE `creature_id`=3375;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (337501, 3375, 0, 4, 0, 100, 0, 0, 0, 0, 0, 337501, 0, 0, 'Bael\'Dun Foreman - Toss Torch on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=337501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(337501, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6088, 0, 0, 0, 0, 0, 0, 'Bael\'Dun Foreman - Set Equipment'),
(337501, 0, 0, 15, 6257, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bael\'Dun Foreman - Cast Spell Torch Toss');
UPDATE `creature_template` SET `spell_list_id`=0, `ai_name`='EventAI' WHERE `entry`=3375;
DELETE FROM `creature_spells` WHERE `entry`=33750;

-- Gazlowe
DELETE FROM `creature_equip_template` WHERE `entry`=3391;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3391, 0, 1, 4994, 13855, 12523);

-- Zel'mak
DELETE FROM `creature_equip_template` WHERE `entry`=3408;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3408, 0, 1, 12348, 0, 0);

-- Mebok Mizzyrix
UPDATE `creature_equip_template` SET `probability`=1 WHERE `entry`=3446 && `item1`=2704 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3446, 0, 0, 2198, 0, 0);
-- Creature changes equipment during end script for quest Raptor Horns.
DELETE FROM `quest_end_scripts` WHERE `id`=865;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(865, 0, 1, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raptor Horns: Mebok Mizzyrix - Emote OneShotEatNoSheathe'),
(865, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.45657, 0, 'Raptor Horns: Mebok Mizzyrix - Set Orientation'),
(865, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2198, -1, -1, 0, 0, 0, 0, 0, 0, 'Raptor Horns: Mebok Mizzyrix - Set Equipment'),
(865, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2078, 0, 0, 0, 0, 0, 0, 0, 0, 'Raptor Horns: Mebok Mizzyrix - Say Text'),
(865, 5, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raptor Horns: Mebok Mizzyrix - Emote OneShotWoundCritical'),
(865, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2079, 0, 0, 0, 0, 0, 0, 0, 0, 'Raptor Horns: Mebok Mizzyrix - Say Text'),
(865, 8, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raptor Horns: Mebok Mizzyrix - Emote OneShotShot'),
(865, 12, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.08923, 0, 'Raptor Horns: Mebok Mizzyrix - Set Orientation'),
(865, 13, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2704, -1, -1, 0, 0, 0, 0, 0, 0, 'Raptor Horns: Mebok Mizzyrix - Set Equipment');

-- Kalyimah Stormcloud
DELETE FROM `creature_equip_template` WHERE `entry`=3487;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3487, 0, 1, 12744, 12745, 0);

-- Fuzruckle
DELETE FROM `creature_equip_template` WHERE `entry`=3496;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3496, 0, 1, 12850, 12859, 0);

-- Jazzik
DELETE FROM `creature_equip_template` WHERE `entry`=3498;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3498, 0, 1, 12744, 0, 0);

-- Sarah Raycroft
DELETE FROM `creature_equip_template` WHERE `entry`=3541;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3541, 0, 1, 12744, 0, 0);

-- Martine Tramblay
DELETE FROM `creature_equip_template` WHERE `entry`=3550;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3550, 0, 1, 6227, 6225, 0);

-- Aldia
DELETE FROM `creature_equip_template` WHERE `entry`=3608;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3608, 0, 1, 12854, 0, 0);

-- Dark Strand Enforcer
UPDATE `creature_equip_template` SET `probability`=1 WHERE `entry`=3727 && `item1`=5289 && `item2`=0 && `item3`=0;
-- This equipment is only seed on a temporary spawn in a given position.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3727, 0, 0, 1821, 0, 0);

-- Dark Strand Assassin
DELETE FROM `creature_equip_template` WHERE `entry`=3879;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3879, 0, 1, 1897, 0, 0);

-- Aligar the Tormentor
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3898, 0, 1, 2179, 0, 0);
UPDATE `creature_template` SET `equipment_id`=3898 WHERE `entry`=3898 && `patch` >= 0;

-- Balizar the Umbrage
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3899, 0, 1, 2559, 0, 0);
UPDATE `creature_template` SET `equipment_id`=3899 WHERE `entry`=3899 && `patch` >= 0;

-- Librarian Mae Paledust
DELETE FROM `creature_equip_template` WHERE `entry`=3979;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3979, 0, 1, 12862, 0, 0);

-- Raleigh the Devout
DELETE FROM `creature_equip_template` WHERE `entry`=3980;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3980, 0, 1, 12883, 12860, 0);
-- Creature changes equipment during end script for quest Down the Scarlet Path.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (3980, 0, 0, 1906, 12860, 0);

-- Illyanie
DELETE FROM `creature_equip_template` WHERE `entry`=4188;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4188, 0, 1, 12854, 0, 0);

-- Laird
DELETE FROM `creature_equip_template` WHERE `entry`=4200;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4200, 0, 1, 6225, 0, 0);

-- Scarlet Scryer
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4293, 0, 1, 4993, 0, 0);
UPDATE `creature_template` SET `equipment_id`=4293 WHERE `entry`=4293 && `patch` >= 0;

-- Firemane Scalebane
DELETE FROM `creature_equip_template` WHERE `entry`=4328;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4328, 0, 1, 3361, 2051, 0);

-- Jonathan Chambers
DELETE FROM `creature_equip_template` WHERE `entry`=4590;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4590, 0, 1, 12744, 12745, 0);

-- Twilight Acolyte
UPDATE `creature_equip_template` SET `probability`=38 WHERE `entry`=4809 && `item1`=2176 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4809, 0, 1, 2176, 2215, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4809, 0, 1, 2176, 0, 2785);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4809, 0, 1, 2176, 0, 2774);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4809, 0, 1, 1825, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4809, 0, 1, 1511, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4809, 0, 1, 1823, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4809, 0, 1, 2176, 2211, 0);

-- Twilight Reaver
UPDATE `creature_equip_template` SET `probability`=49 WHERE `entry`=4810 && `item1`=4991 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4810, 0, 1, 1830, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4810, 0, 1, 1811, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4810, 0, 1, 4991, 2214, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4810, 0, 1, 1416, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4810, 0, 1, 3196, 0, 0);

-- Twilight Aquamancer
DELETE FROM `creature_equip_template` WHERE `entry`=4811;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4811, 0, 1, 1411, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4811, 0, 1, 0, 0, 2786);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4811, 0, 1, 2766, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4811, 0, 1, 1825, 0, 0);

-- Twilight Loreseeker
UPDATE `creature_equip_template` SET `probability`=40 WHERE `entry`=4812 && `item1`=1907 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4812, 0, 1, 1828, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4812, 0, 1, 1414, 0, 0);

-- Twilight Shadowmage
UPDATE `creature_equip_template` SET `probability`=29 WHERE `entry`=4813 && `item1`=2559 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4813, 0, 1, 1818, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4813, 0, 1, 2559, 2211, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4813, 0, 1, 1826, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4813, 0, 1, 2559, 2217, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4813, 0, 1, 1417, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4813, 0, 1, 1827, 0, 0);

-- Twilight Elementalist
UPDATE `creature_equip_template` SET `probability`=40 WHERE `entry`=4814 && `item1`=2177 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4814, 0, 1, 1510, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4814, 0, 1, 1811, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4814, 0, 1, 1514, 0, 0);

-- Twilight Lord Kelris
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4832, 0, 3, 1155, 0, 0);
UPDATE `creature_equip_template` SET `probability`=2 WHERE `entry`=4832 && `item1`=5303 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4832, 0, 1, 2763, 0, 0);

-- "Stinky" Ignatz
DELETE FROM `creature_equip_template` WHERE `entry`=4880;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4880, 0, 1, 0, 12855, 0);

-- Charity Mipsy
DELETE FROM `creature_equip_template` WHERE `entry`=4896;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4896, 0, 1, 12744, 0, 0);

-- Lady Jaina Proudmoore
DELETE FROM `creature_equip_template` WHERE `entry`=4968;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4968, 0, 1, 2177, 12869, 0);

-- Kagoro
DELETE FROM `creature_equip_template` WHERE `entry`=4972;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (4972, 0, 1, 1897, 0, 0);

-- Theramore Deserter
DELETE FROM `creature_equip_template` WHERE `entry`=5057;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5057, 0, 1, 1895, 0, 0);

-- Clerk Lendry
DELETE FROM `creature_equip_template` WHERE `entry`=5083;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5083, 0, 1, 0, 12743, 0);

-- Sentry Point Captain
DELETE FROM `creature_equip_template` WHERE `entry`=5086;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5086, 0, 1, 1899, 1984, 0);

-- Infiltrator Marksen
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5416, 0, 0, 2703, 0, 0);
UPDATE `creature_template` SET `equipment_id`=5416 WHERE `entry`=5416 && `patch` >= 0;
-- Creature changes equipment during end script for quest Nothing But The Truth.
DELETE FROM `quest_end_scripts` WHERE `id`=1391;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1391, 0, 1, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Emote OneShotEatNoSheathe'),
(1391, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Remove Npc Flags'),
(1391, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2703, -1, -1, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Set Equipment'),
(1391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1858, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Say Text'),
(1391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1857, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Say Text'),
(1391, 6, 1, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Set Emote State to STATE_STUN_NOSHEATHE'),
(1391, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1859, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Say Text'),
(1391, 12, 3, 0, 2645, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -10421.6, -3237.93, 20.303, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Move'),
(1391, 12, 15, 7293, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Cast Spell Zombie Form'),
(1391, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1861, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Say Text'),
(1391, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1860, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Say Text'),
(1391, 14, 3, 0, 3180, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -10422.9, -3239.26, 20.303, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Move'),
(1391, 17, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Set Emote State to ONESHOT_NONE'),
(1391, 17, 15, 3617, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth: Infiltrator Marksen - Cast Spell Quiet Suicide');

-- Raging Dune Smasher
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5470, 0, 1, 2813, 0, 0);
UPDATE `creature_template` SET `equipment_id`=5470 WHERE `entry`=5470 && `patch` >= 0;

-- Theresa
-- Equipment changes from OOC script on Gerard Abernathy.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5697, 0, 0, 2717, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5697, 0, 0, 2716, 0, 0);
UPDATE `creature_template` SET `equipment_id`=5697 WHERE `entry`=5697 && `patch` >= 0;

-- Samantha Shackleton
DELETE FROM `creature_equip_template` WHERE `entry`=5700;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5700, 0, 1, 12862, 0, 0);

-- Apothecary Lycanus
DELETE FROM `creature_equip_template` WHERE `entry`=5733;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5733, 0, 1, 12862, 0, 0);

-- Apothecary Keever
-- Equipment changes from OOC script on the creature.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5734, 0, 0, 2199, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5734, 0, 0, 3696, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5734, 0, 0, 2198, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5734, 0, 0, 2201, 0, 0);
UPDATE `creature_template` SET `equipment_id`=5734 WHERE `entry`=5734 && `patch` >= 0;

-- Foreman Grills
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5835, 0, 0, 5285, 5278, 0);
-- Creature changes his equipment at 10% health.
DELETE FROM `creature_ai_events` WHERE `creature_id`=5835;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (583501, 5835, 0, 9, 0, 100, 1, 0, 5, 7000, 11000, 583501, 0, 0, 'Foreman Grills - Cast Hamstring');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (583502, 5835, 0, 2, 0, 100, 1, 10, 1, 5000, 10000, 583502, 0, 0, 'Foreman Grills - Change Weapon at 10% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=583502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(583502, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 5285, 5278, 0, 0, 0, 0, 0, 0, 0, 'Foreman Grills - Set Equipment'),
(583502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1385, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Grills - Emote Text');

-- Captain Gerogg Hammertoe
DELETE FROM `creature_equip_template` WHERE `entry`=5851;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5851, 0, 1, 3361, 1984, 0);

-- Twilight Dark Shaman
UPDATE `creature_equip_template` SET `probability`=646 WHERE `entry`=5860 && `item1`=5277 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 5, 1415, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 4, 3784, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 3, 1512, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 3, 1818, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 3, 4020, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 3, 2764, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 3, 1823, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 3, 4022, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 1412, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 1514, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 1821, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 5277, 3986, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 1830, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 2766, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 3785, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 3786, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 3787, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 1820, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 5277, 2222, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 5277, 0, 2780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 4024, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 2, 5277, 2211, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1824, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 3782, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1813, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1819, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 2216, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1510, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 2763, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 3201, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 4023, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1416, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1413, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 4017, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1511, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 0, 2778);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 15245, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1994, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 4018, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 2765, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1625, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 4568, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 4575, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 0, 2777);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1417, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 0, 2782);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 2219, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 0, 4026);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 0, 8181);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 2212, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 4019, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 3817, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 0, 13824);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 15912, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 15263, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 4566, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 15274, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1825, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 1829, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 3186, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 3783, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 5277, 2215, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5860, 0, 1, 15270, 0, 0);

-- Twilight Fire Guard
UPDATE `creature_equip_template` SET `probability`=1533 WHERE `entry`=5861 && `item1`=3361 && `item2`=1984 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 7, 1511, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 7, 13823, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 6, 1830, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 5, 1823, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 5, 2763, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 3784, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 2765, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 1512, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 1831, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 1814, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 3361, 1984, 13824);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 4023, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 4021, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 3361, 1984, 4025);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 4, 1417, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 4020, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1820, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1510, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1826, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 3779, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1414, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1828, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 2764, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1812, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1513, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1824, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 3361, 1984, 2780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1514, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 2138, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1815, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1816, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1817, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1818, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 1822, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 3361, 1984, 15287);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 3361, 2210, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 3361, 2219, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 4017, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 3361, 3816, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 3, 4018, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 1984, 2777);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 2211, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 1984, 2781);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 1811, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 1821, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 2213, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 1984, 2773);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 1516, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 2766, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3781, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3782, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3783, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 1984, 8188);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3786, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3787, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 2221, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 2216, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 1984, 4026);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 1416, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 4022, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 1415, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 1412, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 3361, 2212, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 2, 13822, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 4562, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 7537, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 768, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 2214, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 2215, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 1984, 3037);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 2220, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 1819, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 2222, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 1825, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 9764, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 2079, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3208, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 2140, 1984, 2778);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3201, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3785, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 1639, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3193, 3986, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 1984, 2782);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 1984, 5069);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 4019, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 1984, 2785);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 864, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 2217, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 1984, 5216);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 4024, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 4575, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 1411, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 15210, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 15250, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 15253, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 866, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 1413, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 1813, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3197, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 1984, 2783);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 1984, 3778);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 1984, 4089);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 1984, 3780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 3652, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 3361, 3986, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 4565, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 8006, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 8177, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 13816, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 13820, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 4566, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 15244, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5861, 0, 1, 15249, 1984, 0);

-- Twilight Geomancer
UPDATE `creature_equip_template` SET `probability`=913 WHERE `entry`=5862 && `item1`=5303 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 5, 2763, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 4, 4022, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 4, 4020, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 4, 1824, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 3, 1512, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 3781, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1820, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1816, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 2138, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 0, 13824);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 2211, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1818, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1417, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1513, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1514, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1821, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1416, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1515, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 0, 4026);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 2220, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1825, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 4021, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1826, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 4024, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 2214, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 0, 2786);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1830, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 13822, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 0, 3780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 1414, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 3779, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 2212, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 0, 3778);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 2, 5303, 0, 5216);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1510, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 767, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 0, 8180);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1413, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 2765, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 4566, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1822, 0, 8179);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1822, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 0, 3039);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 15263, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 2217, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1827, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 2078, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 15228, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 13820, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 0, 2782);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 3783, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 3785, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 4017, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 15230, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 4018, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 0, 2783);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 0, 4025);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 12992, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 13816, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 0, 2774);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 0, 2777);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 3816, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 3986, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 3989, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 15935, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1412, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 15226, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 15245, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 15249, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1415, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 2219, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 0, 2780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1516, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1813, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1814, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 13820, 0, 8181);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1828, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 1829, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 5303, 0, 8181);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 8178, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5862, 0, 1, 15275, 0, 0);

-- Gan'rul Bloodeye
DELETE FROM `creature_equip_template` WHERE `entry`=5875;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5875, 0, 1, 12864, 0, 0);

-- Zansoa
DELETE FROM `creature_equip_template` WHERE `entry`=5942;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5942, 0, 1, 6227, 6225, 0);

-- Nethergarde Foreman
UPDATE `creature_equip_template` SET `probability`=432 WHERE `entry`=5998 && `item1`=2182 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 2, 2182, 0, 2778);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 2, 2182, 0, 2785);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 2, 3783, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 2, 4019, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 1416, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 15243, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 1608, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 2182, 0, 3780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 2182, 0, 13824);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 2182, 2211, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 2182, 2217, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 2766, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 4021, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 1814, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 2182, 15937, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 3779, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 3784, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5998, 0, 1, 13822, 0, 0);

-- Nethergarde Soldier
UPDATE `creature_equip_template` SET `probability`=1935 WHERE `entry`=5999 && `item1`=2178 && `item2`=1984 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 3, 1830, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 3, 2178, 1984, 2773);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 3, 2178, 1984, 13824);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 3, 1826, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 1413, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 2178, 2215, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 3782, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 3786, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 2178, 1984, 2781);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 1415, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 1416, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 2080, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 2765, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 3785, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 3787, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 4018, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 4021, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 13820, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 13822, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 15227, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 2178, 1984, 2780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 2, 2178, 1984, 2786);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1821, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1825, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1831, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 4019, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 1984, 3036);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2766, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 1984, 4087);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1823, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 1984, 15285);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 3987, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 2210, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1811, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 15215, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 2221, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 863, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 4023, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 3784, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1820, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1510, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 1984, 4026);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1812, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 15230, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 3816, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1414, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 4022, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1818, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 8178, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1516, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 4017, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1817, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 15216, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1411, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 15243, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 1984, 3039);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 15249, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1813, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1511, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1815, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1829, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 1984, 2782);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 1515, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 1984, 5212);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 2217, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 3986, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2178, 3989, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 2632, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 3201, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (5999, 0, 1, 15268, 1984, 0);

-- Nethergarde Cleric
UPDATE `creature_equip_template` SET `probability`=159 WHERE `entry`=6000 && `item1`=2176 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6000, 0, 1, 1811, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6000, 0, 1, 1819, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6000, 0, 1, 2176, 0, 2773);

-- Nethergarde Riftwatcher
UPDATE `creature_equip_template` SET `probability`=104 WHERE `entry`=6002 && `item1`=2177 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6002, 0, 1, 1825, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6002, 0, 1, 1829, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6002, 0, 1, 2177, 0, 2778);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6002, 0, 1, 1414, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6002, 0, 1, 1827, 0, 0);

-- Nethergarde Officer
UPDATE `creature_equip_template` SET `probability`=125 WHERE `entry`=6003 && `item1`=5305 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6003, 0, 1, 1510, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6003, 0, 1, 1414, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6003, 0, 1, 5305, 0, 4026);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6003, 0, 1, 3784, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6003, 0, 1, 4021, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6003, 0, 1, 5305, 2216, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6003, 0, 1, 3783, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6003, 0, 1, 5305, 0, 15280);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6003, 0, 1, 5305, 2217, 0);

-- Shadowsworn Cultist
UPDATE `creature_equip_template` SET `probability`=501 WHERE `entry`=6004 && `item1`=5280 && `item2`=0 && `item3`=6886;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 2, 1815, 0, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 5280, 3817, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 15242, 0, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 5280, 3986, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 5280, 0, 2785);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 3781, 0, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 2765, 0, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 5280, 0, 2773);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 1415, 0, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 5280, 9790, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 5280, 3816, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 3190, 0, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 5280, 2214, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 1820, 0, 6886);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6004, 0, 1, 5280, 0, 2781);

-- Shadowsworn Thug
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 300, 0, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 0, 0, 2773);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 1817, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 0, 0, 2777);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 0, 0, 2786);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 1416, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 0, 0, 2774);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 15233, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 1411, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 0, 7555, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 0, 15895, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 1829, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 3784, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 3787, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 4021, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 1511, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 1827, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6005, 0, 1, 2763, 0, 0);
UPDATE `creature_template` SET `equipment_id`=6005 WHERE `entry`=6005 && `patch` >= 0;

-- Shadowsworn Adept
UPDATE `creature_equip_template` SET `probability`=398 WHERE `entry`=6006 && `item1`=1907 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 3, 1818, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 2, 13822, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 1907, 0, 2783);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 1416, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 1907, 2213, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 3783, 0, 5071);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 1822, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 1907, 0, 2785);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 1907, 0, 2780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 1907, 0, 2786);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 4018, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6006, 0, 1, 13818, 0, 0);

-- Shadowsworn Enforcer
UPDATE `creature_equip_template` SET `probability`=96 WHERE `entry`=6007 && `item1`=6224 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6007, 0, 1, 1828, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6007, 0, 1, 864, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6007, 0, 1, 6224, 0, 2777);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6007, 0, 1, 4018, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6007, 0, 1, 1512, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6007, 0, 1, 6224, 0, 2780);

-- Shadowsworn Warlock
UPDATE `creature_equip_template` SET `probability`=100 WHERE `entry`=6008 && `item1`=2559 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6008, 0, 1, 1819, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6008, 0, 1, 13822, 0, 0);

-- Shadowsworn Dreadweaver
DELETE FROM `creature_equip_template` WHERE `entry`=6009;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6009, 0, 1, 1814, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6009, 0, 1, 3199, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6009, 0, 1, 3785, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6009, 0, 1, 4020, 0, 0);

-- Tog Rustsprocket
DELETE FROM `creature_equip_template` WHERE `entry`=6119;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6119, 0, 1, 12862, 0, 0);

-- Daphne Stilwell
-- Equipment changed from core script for quest The Tome of Valor.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6182, 0, 0, 6946, 0, 0);

-- Jorah Annison
DELETE FROM `creature_equip_template` WHERE `entry`=6293;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6293, 0, 1, 2714, 12743, 0);

-- Monnos the Elder
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6646, 0, 1, 5303, 0, 0);
UPDATE `creature_template` SET `equipment_id`=6646 WHERE `entry`=6646 && `patch` >= 0;

-- Harlown Darkweave
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (6731, 0, 1, 5278, 0, 0);
UPDATE `creature_template` SET `equipment_id`=6731 WHERE `entry`=6731 && `patch` >= 0;

-- Jaedenar Enforcer
DELETE FROM `creature_equip_template` WHERE `entry`=7114;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7114, 0, 1, 5291, 2051, 0);

-- Dun Garok Soldier
UPDATE `creature_equip_template` SET `probability`=11 WHERE `entry`=7360 && `item1`=2695 && `item2`=1985 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7360, 0, 1, 1510, 1985, 0);

-- Kalin Windflight
DELETE FROM `creature_equip_template` WHERE `entry`=7772;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7772, 0, 1, 5303, 0, 0);

-- Nethergarde Elite
UPDATE `creature_equip_template` SET `probability`=441 WHERE `entry`=7851 && `item1`=4991 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 4, 2763, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 3, 4991, 0, 2783);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 3, 4017, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 3, 4991, 0, 2780);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 2, 1510, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 2, 4991, 0, 13824);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 2, 3782, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 2, 1417, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 2, 4991, 2211, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 2, 1513, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 2, 4991, 0, 2785);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 2, 4991, 0, 4025);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 2, 13823, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1815, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 13820, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1516, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 0, 2777);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1816, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1825, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 0, 5207);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1828, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 2077, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 2138, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 0, 2774);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 9858, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 2764, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 2766, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 3783, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 3784, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4019, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4022, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 13821, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 10093, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1821, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1827, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 0, 2778);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 0, 3778);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 0, 2782);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 13818, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1411, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1416, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 3986, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1414, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 0, 13825);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 0, 15295);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 2210, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 2219, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 2565, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 3989, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 863, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 15226, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 15231, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1811, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1823, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 1824, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4018, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4020, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4024, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 0, 15291);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 4991, 2217, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7851, 0, 1, 15262, 0, 0);

-- Tran'rek
DELETE FROM `creature_equip_template` WHERE `entry`=7876;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7876, 0, 1, 1903, 12857, 0);

-- Daryn Lightwind
DELETE FROM `creature_equip_template` WHERE `entry`=7907;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (7907, 0, 1, 12862, 0, 0);

-- Zikkel
DELETE FROM `creature_equip_template` WHERE `entry`=8119;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8119, 0, 1, 12744, 12857, 0);

-- Jabbey
DELETE FROM `creature_equip_template` WHERE `entry`=8139;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8139, 0, 1, 12744, 0, 0);

-- Witherheart the Stalker
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8218, 0, 1, 10617, 5285, 0);
UPDATE `creature_template` SET `equipment_id`=8218 WHERE `entry`=8218 && `patch` >= 0;

-- Highlord Mastrogonde
UPDATE `creature_equip_template` SET `probability`=15 WHERE `entry`=8282 && `item1`=2177 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8282, 0, 1, 766, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8282, 0, 1, 2177, 0, 4025);

-- Alenndaar Lapidaar
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8308, 0, 1, 6680, 0, 0);
UPDATE `creature_template` SET `equipment_id`=8308 WHERE `entry`=8308 && `patch` >= 0;

-- Dark Iron Marksman
DELETE FROM `creature_equip_template` WHERE `entry`=8338;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8338, 0, 1, 0, 0, 2552);

-- Chesmu
DELETE FROM `creature_equip_template` WHERE `entry`=8356;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8356, 0, 1, 12744, 0, 0);

-- Pakwa
DELETE FROM `creature_equip_template` WHERE `entry`=8364;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8364, 0, 1, 12744, 12745, 0);

-- Kalaran Windblade
UPDATE `creature_equip_template` SET `probability`=139 WHERE `entry`=8479 && `item1`=2179 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8479, 0, 1, 2179, 2179, 0);

-- Dark Iron Sentry
DELETE FROM `creature_equip_template` WHERE `entry`=8504;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8504, 0, 1, 2147, 0, 0);

-- Auctioneer Beardo
DELETE FROM `creature_equip_template` WHERE `entry`=8661;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (8661, 0, 1, 0, 12859, 0);

-- War Master Voone
-- Creature changes equipment after casting Throw Axe in core script.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (9237, 0, 0, 12348, 0, 0);

-- Warlord Krom'zar
DELETE FROM `creature_equip_template` WHERE `entry`=9456;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (9456, 0, 1, 3433, 0, 0);

-- Horde Axe Thrower
DELETE FROM `creature_equip_template` WHERE `entry`=9458;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (9458, 0, 1, 10611, 0, 5856);

-- Blackrock Ambusher
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (9522, 0, 1, 1909, 2052, 0);
UPDATE `creature_template` SET `equipment_id`=9522 WHERE `entry`=9522 && `patch` >= 0;

-- Furmund
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (9550, 0, 1, 5303, 0, 0);
UPDATE `creature_template` SET `equipment_id`=9550 WHERE `entry`=9550 && `patch` >= 0;

-- Hahk'Zor
DELETE FROM `creature_equip_template` WHERE `entry`=9602;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (9602, 0, 1, 1909, 0, 0);

-- Blackrock Raider
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (9605, 0, 1, 2557, 0, 0);
UPDATE `creature_template` SET `equipment_id`=9605 WHERE `entry`=9605 && `patch` >= 0;

-- Locheed
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (9876, 0, 1, 2557, 0, 0);
UPDATE `creature_template` SET `equipment_id`=9876 WHERE `entry`=9876 && `patch` >= 0;

-- Rexxar
DELETE FROM `creature_equip_template` WHERE `entry`=10182;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10182, 0, 1, 10612, 10612, 0);

-- Scholomance Student
DELETE FROM `creature_equip_template` WHERE `entry`=10475;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10475, 0, 1, 12862, 0, 0);

-- Jandice Barov
DELETE FROM `creature_equip_template` WHERE `entry`=10503;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10503, 0, 1, 12866, 0, 0);

-- Rookery Hatcher
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10683, 0, 1, 10825, 0, 0);
UPDATE `creature_template` SET `equipment_id`=10683 WHERE `entry`=10683 && `patch` >= 0;

-- Royal Overseer Bauhaus
DELETE FROM `creature_equip_template` WHERE `entry`=10781;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10781, 0, 1, 12750, 0, 0);

-- Aurius
DELETE FROM `creature_equip_template` WHERE `entry`=10917;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10917, 0, 1, 12883, 12860, 0);

-- Wizlo Bearingshiner
DELETE FROM `creature_equip_template` WHERE `entry`=10941;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10941, 0, 1, 0, 12857, 0);

-- Davil Lightfire
DELETE FROM `creature_equip_template` WHERE `entry`=10944;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10944, 0, 1, 12901, 0, 0);

-- Jeziba
DELETE FROM `creature_equip_template` WHERE `entry`=10976;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10976, 0, 1, 12862, 0, 0);

-- Legacki
DELETE FROM `creature_equip_template` WHERE `entry`=10978;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (10978, 0, 1, 12862, 0, 0);

-- Jhag
DELETE FROM `creature_equip_template` WHERE `entry`=11066;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (11066, 0, 1, 0, 12860, 0);

-- Argent Guard
DELETE FROM `creature_equip_template` WHERE `entry`=11099;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (11099, 0, 1, 5305, 12980, 0);

-- Awenasa
DELETE FROM `creature_equip_template` WHERE `entry`=11117;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (11117, 0, 1, 12744, 0, 0);

-- Zealot Lor'Khan
DELETE FROM `creature_equip_template` WHERE `entry`=11347;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (11347, 5, 1, 5291, 12749, 0);

-- King Gordok
DELETE FROM `creature_equip_template` WHERE `entry`=11501;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (11501, 1, 1, 13316, 0, 0);

-- Horde Peon
DELETE FROM `creature_equip_template` WHERE `entry`=11656;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (11656, 3, 1, 19014, 0, 0);

-- Mor'vek
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (11701, 0, 1, 2703, 0, 0);
UPDATE `creature_template` SET `equipment_id`=11701 WHERE `entry`=11701 && `patch` >= 0;

-- Arin'sor
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (11702, 0, 1, 2827, 0, 0);
UPDATE `creature_template` SET `equipment_id`=11702 WHERE `entry`=11702 && `patch` >= 0;

-- Burning Blade Toxicologist
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (12319, 0, 1, 2184, 0, 0);
UPDATE `creature_template` SET `equipment_id`=12319 WHERE `entry`=12319 && `patch` >= 0;

-- Stormscale Toxicologist
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (12321, 0, 1, 4993, 0, 0);
UPDATE `creature_template` SET `equipment_id`=12321 WHERE `entry`=12321 && `patch` >= 0;

-- Augustus the Touched
DELETE FROM `creature_equip_template` WHERE `entry`=12384;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (12384, 0, 1, 12854, 0, 0);

-- Lord Kazzak
DELETE FROM `creature_equip_template` WHERE `entry`=12397;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (12397, 1, 1, 13623, 0, 0);

-- Blackwing Legionnaire
DELETE FROM `creature_equip_template` WHERE `entry`=12416;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (12416, 4, 1, 17383, 0, 0);

-- Framnali
DELETE FROM `creature_equip_template` WHERE `entry`=12720;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (12720, 0, 1, 12744, 0, 0);

-- Mitsuwa
DELETE FROM `creature_equip_template` WHERE `entry`=12721;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (12721, 0, 1, 12744, 0, 0);

-- Duriel Moonfire
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (12860, 0, 1, 13632, 0, 0);
UPDATE `creature_template` SET `equipment_id`=12860 WHERE `entry`=12860 && `patch` >= 0;

-- Nergal
DELETE FROM `creature_equip_template` WHERE `entry`=12959;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (12959, 0, 1, 12744, 0, 0);

-- Lieutenant Rugba
DELETE FROM `creature_equip_template` WHERE `entry`=13137;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13137, 3, 1, 12290, 0, 5262);

-- Lieutenant Grummus
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13145, 3, 1, 12593, 0, 5260);
UPDATE `creature_template` SET `equipment_id`=13145 WHERE `entry`=13145 && `patch` >= 3;

-- Lieutenant Murp
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13146, 3, 1, 12593, 0, 14118);
UPDATE `creature_template` SET `equipment_id`=13146 WHERE `entry`=13146 && `patch` >= 3;

-- Commander Louis Philips
DELETE FROM `creature_equip_template` WHERE `entry`=13154;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13154, 3, 1, 13627, 0, 2551);

-- Thanthaldis Snowgleam
DELETE FROM `creature_equip_template` WHERE `entry`=13217;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13217, 3, 1, 12854, 0, 0);

-- Seasoned Mountaineer
DELETE FROM `creature_equip_template` WHERE `entry`=13325;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13325, 3, 1, 10591, 0, 5259);

-- Veteran Mountaineer
DELETE FROM `creature_equip_template` WHERE `entry`=13335;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13335, 3, 1, 13312, 0, 11021);

-- Stormpike Bowman
DELETE FROM `creature_equip_template` WHERE `entry`=13358;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13358, 3, 1, 0, 0, 5262);

-- Champion Mountaineer
DELETE FROM `creature_equip_template` WHERE `entry`=13426;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13426, 3, 1, 14533, 0, 5260);

-- Blackwing Technician
DELETE FROM `creature_equip_template` WHERE `entry`=13996;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (13996, 4, 1, 2717, 3757, 0);

-- Dirk Swindle
DELETE FROM `creature_equip_template` WHERE `entry`=14188;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14188, 3, 1, 12298, 0, 0);

-- Gravis Slipknot
DELETE FROM `creature_equip_template` WHERE `entry`=14221;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14221, 0, 1, 2147, 0, 0);

-- Jimmy the Bleeder
DELETE FROM `creature_equip_template` WHERE `entry`=14281;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14281, 0, 1, 10617, 0, 0);

-- Cho'Rush the Observer
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14324, 1, 3, 2176, 0, 0);
UPDATE `creature_equip_template` SET `probability`=2 WHERE `entry`=14324 && `item1`=14618 && `item2`=0 && `item3`=0;

-- Blackwing Guardsman
DELETE FROM `creature_equip_template` WHERE `entry`=14456;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14456, 4, 1, 17383, 0, 0);

-- Scourge Archer
DELETE FROM `creature_equip_template` WHERE `entry`=14489;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14489, 2, 1, 0, 0, 14105);

-- Zapped Shore Strider
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14603, 3, 1, 5292, 0, 0);
UPDATE `creature_template` SET `equipment_id`=14603 WHERE `entry`=14603 && `patch` >= 3;

-- Zapped Land Walker
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14604, 3, 1, 5293, 0, 0);
UPDATE `creature_template` SET `equipment_id`=14604 WHERE `entry`=14604 && `patch` >= 3;

-- Lookout Captain Lolo Longstriker
DELETE FROM `creature_equip_template` WHERE `entry`=14634;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14634, 3, 1, 2703, 13859, 0);

-- Zapped Cliff Giant
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14640, 3, 1, 5301, 0, 0);
UPDATE `creature_template` SET `equipment_id`=14640 WHERE `entry`=14640 && `patch` >= 3;

-- Horde Laborer
DELETE FROM `creature_equip_template` WHERE `entry`=14718;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14718, 3, 1, 19014, 0, 0);

-- Gelvas Grimegate
DELETE FROM `creature_equip_template` WHERE `entry`=14828;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14828, 4, 1, 0, 12851, 0);

-- Herald
DELETE FROM `creature_equip_template` WHERE `entry`=14848;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14848, 3, 1, 2714, 0, 5259);

-- Darkmoon Faire Carnie
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14849, 4, 49, 5292, 0, 0);
UPDATE `creature_equip_template` SET `probability`=21 WHERE `entry`=14849 && `item1`=3362 && `item2`=13604 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14849, 4, 18, 3362, 13605, 0);

-- Gruk
-- Creature changes equipment from waypoint script.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14850, 4, 0, 2197, 0, 0);
UPDATE `creature_template` SET `equipment_id`=14850 WHERE `entry`=14850 && `patch` >= 4;

-- Erk
DELETE FROM `creature_equip_template` WHERE `entry`=14857;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14857, 4, 1, 0, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14857, 4, 0, 6256, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14857, 4, 0, 6256, 13917, 0);
-- Delete old waypoints and scripts.
DELETE FROM `creature_movement_template` WHERE `entry`=14857;
DELETE FROM `creature_movement_scripts` WHERE `id` IN (1485701, 1485702, 1485703, 1485704, 1485705, 1485718);
-- Add new waypoints.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(14857, 1, -28.861338, -2613.758057, 97.242439, 100.000000, 0, 0.000000, 0),
(14857, 2, -25.789497, -2611.342041, 97.360809, 100.000000, 352, 0.000000, 0),
(14857, 3, -25.789497, -2611.342041, 97.360809, 6.265732, 10483, 0.000000, 1485703),
(14857, 4, -24.330542, -2614.235596, 97.360809, 100.000000, 0, 0.000000, 0),
(14857, 5, -14.748810, -2620.326416, 96.281067, 100.000000, 0, 0.000000, 0),
(14857, 6, 4.128147, -2622.176025, 89.652901, 100.000000, 20773, 0.000000, 1485706),
(14857, 7, -7.710447, -2639.855957, 94.662231, 100.000000, 0, 0.000000, 0),
(14857, 8, -17.632507, -2645.074219, 95.887306, 100.000000, 0, 0.000000, 0),
(14857, 9, -28.323160, -2642.914063, 96.111916, 100.000000, 0, 0.000000, 0),
(14857, 10, -32.274570, -2636.906982, 96.218987, 100.000000, 0, 0.000000, 0),
(14857, 11, -29.166016, -2632.446289, 96.034386, 100.000000, 5207, 0.000000, 1485711),
(14857, 12, -33.265347, -2638.038818, 96.481369, 100.000000, 0, 0.000000, 0),
(14857, 13, -33.406860, -2641.800781, 96.503281, 100.000000, 0, 0.000000, 0),
(14857, 14, -11.607338, -2642.863037, 95.800758, 100.000000, 0, 0.000000, 0),
(14857, 15, 3.762316, -2633.401611, 90.247932, 100.000000, 24631, 0.000000, 1485715),
(14857, 16, 10.486939, -2641.620117, 90.781586, 100.000000, 0, 0.000000, 0),
(14857, 17, 38.454910, -2660.857178, 91.909752, 100.000000, 0, 0.000000, 0),
(14857, 18, 60.803261, -2685.470215, 92.924774, 100.000000, 0, 0.000000, 0),
(14857, 19, 63.849571, -2695.362061, 92.538544, 100.000000, 0, 0.000000, 0),
(14857, 20, 54.940594, -2697.130127, 92.041649, 100.000000, 16213, 0.000000, 1485720),
(14857, 21, 41.134552, -2703.052979, 91.811745, 100.000000, 0, 0.000000, 0),
(14857, 22, 23.574120, -2695.836182, 91.988129, 100.000000, 0, 0.000000, 0),
(14857, 23, 6.167767, -2669.069336, 91.840866, 100.000000, 0, 0.000000, 0),
(14857, 24, -8.951588, -2650.943115, 95.669487, 100.000000, 0, 0.000000, 0),
(14857, 25, -15.688093, -2624.230713, 96.249153, 100.000000, 0, 0.000000, 0),
(14857, 26, -31.136230, -2615.651611, 97.248772, 100.000000, 160000, 5.000000, 1485726);
-- Waypoint scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1485703, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10249, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Say Text'),
(1485703, 5, 19, 0, 0, 0, 0, 0, 0, 0, 0, 6256, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Set Equipment'),
(1485706, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10250, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Say Text'),
(1485706, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10195, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Say Text'),
(1485711, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10196, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Say Text'),
(1485715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10197, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Say Text'),
(1485715, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10205, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Say Text'),
(1485715, 24, 19, 0, 0, 0, 0, 0, 0, 0, 0, 6256, 13917, 0, 0, 0, 0, 0, 0, 0, 'Erk - Set Equipment'),
(1485715, 24, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Set Run'),
(1485720, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Set Walk'),
(1485720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10198, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Say Text'),
(1485720, 4, 35, 1, 0, 0, 0, 13579, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 6.04953, 0, 'Guard Kurall - Set Orientation'),
(1485720, 6, 1, 21, 0, 0, 0, 13579, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kurall - Emote OneShotApplaud'),
(1485720, 6, 0, 0, 0, 0, 0, 13579, 0, 9, 2, 10223, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kurall - Say Text'),
(1485720, 9, 1, 7, 0, 0, 0, 13579, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Kurall - Emote OneShotEat'),
(1485720, 9, 1, 92, 0, 0, 0, 19412, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Guard - Emote OneShotEatNoSheathe'),
(1485720, 9, 19, 0, 0, 0, 0, 0, 0, 0, 0, 6256, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Set Equipment'),
(1485720, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10206, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Say Text'),
(1485726, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erk - Set Equipment');

-- Guard Taruc
UPDATE `creature_equip_template` SET `probability`=1 WHERE `entry`=14859 && `item1`=12285 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14859, 4, 0, 2197, 0, 0);
-- Equipment changes from Gruk's waypoint script.
DELETE FROM `creature_movement_scripts` WHERE `id`=1485002;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1485002, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10184, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Say Text'),
(1485002, 4, 0, 19, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Set Equip'),
(1485002, 7, 0, 0, 0, 0, 0, 0, 13170, 0, 9, 2, 10265, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Taruc - Say Text'),
(1485002, 7, 0, 19, 0, 0, 0, 0, 13170, 0, 9, 2, 2197, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Taruc - Set Equip'),
(1485002, 10, 0, 19, 0, 0, 0, 0, 13170, 0, 9, 2, 12285, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Taruc - Set Equip'),
(1485002, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10266, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Say Text');

-- Karu
-- Creature changes equipment from its waypoint script.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14874, 4, 0, 12744, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14874, 4, 0, 2196, 0, 0);
UPDATE `creature_template` SET `equipment_id`=14874 WHERE `entry`=14874 && `patch` >= 4;

-- Peon
UPDATE `creature_equip_template` SET `probability`=1 WHERE `entry`=14901 && `item1`=12629 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14901, 0, 0, 1910, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14901, 0, 0, 1910, 13605, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14901, 0, 0, 1910, 2081, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14901, 0, 0, 1910, 13604, 0);
-- Different equipment for specific spawns.
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`) VALUES (149010, 1, 1910, 13604, 0);
UPDATE `creature_addon` SET `equipment_id`=149010 WHERE  `guid`=13752;
INSERT INTO `creature_equip_template` (`entry`, `probability`, `item1`, `item2`, `item3`) VALUES (149011, 1, 1910, 13605, 0);
UPDATE `creature_addon` SET `equipment_id`=149011 WHERE  `guid`=13757;

-- Mogg
-- Equipment changes from waypoint script.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14908, 4, 0, 3350, 0, 0);
UPDATE `creature_template` SET `equipment_id`=14908 WHERE `entry`=14908 && `patch` >= 4;

-- Rin'wosho the Trader
DELETE FROM `creature_equip_template` WHERE `entry`=14921;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14921, 4, 1, 11314, 12851, 0);

-- Gapp Jinglepocket
DELETE FROM `creature_equip_template` WHERE `entry`=14963;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (14963, 5, 1, 12854, 0, 0);

-- Arathi Farmer
UPDATE `creature_equip_template` SET `probability`=34 WHERE `entry`=15045 && `item1`=3367 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15045, 5, 8, 12801, 0, 0);

-- Forsaken Farmer
UPDATE `creature_equip_template` SET `probability`=212 WHERE `entry`=15046 && `item1`=3367 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15046, 5, 26, 13608, 0, 0);

-- Arathi Lumberjack
UPDATE `creature_equip_template` SET `probability`=187 WHERE `entry`=15062 && `item1`=19015 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15062, 5, 13, 1903, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15062, 5, 4, 1911, 0, 0);

-- Arathi Blacksmith
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15063, 5, 0, 1903, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15063, 5, 0, 2705, 0, 0);
UPDATE `creature_template` SET `equipment_id`=15063 WHERE `entry`=15063 && `patch` >= 5;

-- Forsaken Blacksmith
UPDATE `creature_equip_template` SET `probability`=40 WHERE `entry`=15064 && `item1`=1903 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15064, 5, 1, 2704, 0, 0);

-- Forsaken Miner
UPDATE `creature_equip_template` SET `probability`=169 WHERE `entry`=15075 && `item1`=1910 && `item2`=0 && `item3`=0;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15075, 5, 22, 12862, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15075, 5, 0, 2704, 0, 0);

-- Riggle Bassbait
DELETE FROM `creature_equip_template` WHERE `entry`=15077;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15077, 5, 1, 1117, 0, 0);

-- Forsaken Stablehand
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15087, 5, 0, 3367, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15087, 5, 0, 1910, 0, 0);
UPDATE `creature_template` SET `equipment_id`=15087 WHERE `entry`=15087 && `patch` >= 5;

-- Forsaken Lumberjack
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15089, 5, 0, 19015, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15089, 5, 0, 1903, 0, 0);
UPDATE `creature_template` SET `equipment_id`=15089 WHERE `entry`=15089 && `patch` >= 5;

-- The Banshee Queen
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15193, 6, 1, 2179, 0, 14118);
UPDATE `creature_template` SET `equipment_id`=15193 WHERE `entry`=15193 && `patch` >= 6;

-- Sergeant Hartman
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15199, 6, 1, 12890, 11041, 0);
UPDATE `creature_template` SET `equipment_id`=15199 WHERE `entry`=15199 && `patch` >= 6;

-- Anachronos the Ancient
-- Equipment changes from core script for quest A Pawn on the Eternal Board.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15381, 7, 0, 20738, 0, 0);
UPDATE `creature_template` SET `equipment_id`=15381 WHERE `entry`=15381 && `patch` >= 7;

-- Fandral Staghelm
-- Equipment changes from core script for quest A Pawn on the Eternal Board.
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15382, 7, 0, 20738, 0, 0);
UPDATE `creature_template` SET `equipment_id`=15382 WHERE `entry`=15382 && `patch` >= 7;

-- Kaldorei Infantry
DELETE FROM `creature_equip_template` WHERE `entry`=15423;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15423, 7, 1, 14881, 14881, 0);

-- Kandrostrasz
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15503, 7, 1, 13723, 0, 0);
UPDATE `creature_template` SET `equipment_id`=15503 WHERE `entry`=15503 && `patch` >= 7;

-- Cenarion Outrider
DELETE FROM `creature_equip_template` WHERE `entry`=15545;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15545, 6, 1, 14882, 20417, 0);

-- Doctor Weavil
DELETE FROM `creature_equip_template` WHERE `entry`=15552;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15552, 7, 1, 21129, 12869, 0);

-- Dark Iron Kidnapper
DELETE FROM `creature_equip_template` WHERE `entry`=15692;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15692, 6, 1, 2147, 0, 0);

-- Lieutenant General Nokhor
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15818, 7, 1, 13706, 0, 0);
UPDATE `creature_template` SET `equipment_id`=15818 WHERE `entry`=15818 && `patch` >= 7;

-- Tauren Primalist
DELETE FROM `creature_equip_template` WHERE `entry`=15856;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15856, 7, 1, 13337, 0, 0);

-- Malagav the Tactician
DELETE FROM `creature_equip_template` WHERE `entry`=15869;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (15869, 7, 1, 0, 0, 21554);

-- Unrelenting Deathknight
DELETE FROM `creature_equip_template` WHERE `entry`=16125;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16125, 9, 1, 12304, 23356, 0);

-- Unrelenting Rider
DELETE FROM `creature_equip_template` WHERE `entry`=16126;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16126, 9, 1, 2181, 0, 0);

-- Death Touched Warrior
DELETE FROM `creature_equip_template` WHERE `entry`=16158;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16158, 9, 1, 1903, 0, 0);

-- Deathknight Cavalier
DELETE FROM `creature_equip_template` WHERE `entry`=16163;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16163, 9, 1, 2181, 0, 0);

-- Necro Knight
DELETE FROM `creature_equip_template` WHERE `entry`=16165;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16165, 9, 1, 5305, 0, 0);

-- Unholy Staff
DELETE FROM `creature_equip_template` WHERE `entry`=16215;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16215, 9, 1, 13622, 0, 0);

-- Infectious Ghoul
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16244, 9, 1, 22213, 0, 0);
UPDATE `creature_template` SET `equipment_id`=16244 WHERE `entry`=16244 && `patch` >= 9;

-- Argent Dawn Initiate
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16384, 9, 1, 19053, 0, 0);
UPDATE `creature_template` SET `equipment_id`=16384 WHERE `entry`=16384 && `patch` >= 9;

-- Deathchill Servant
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16390, 9, 1, 2147, 0, 0);
UPDATE `creature_template` SET `equipment_id`=16390 WHERE `entry`=16390 && `patch` >= 9;

-- Plagued Ghoul
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16447, 9, 1, 22213, 0, 0);
UPDATE `creature_template` SET `equipment_id`=16447 WHERE `entry`=16447 && `patch` >= 9;

-- Naxxramas Follower
DELETE FROM `creature_equip_template` WHERE `entry`=16505;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16505, 9, 1, 5491, 0, 0);

-- Death Lord
DELETE FROM `creature_equip_template` WHERE `entry`=16861;
INSERT INTO `creature_equip_template` (`entry`, `patch`, `probability`, `item1`, `item2`, `item3`) VALUES (16861, 9, 1, 13623, 0, 0);

ALTER TABLE `creature_equip_template`
	CHANGE COLUMN `patch` `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Minimum content patch to load this entry' AFTER `item3`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' COMMENT 'Maximum content patch to load this entry' AFTER `patch_min`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
