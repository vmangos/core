DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191103005859');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191103005859');
-- Add your query below.


UPDATE `creature` SET `position_x` = -11834.8, `position_y` = 1257.81, `position_z` = 2.14911, `orientation` = 5.595153, `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE `guid` = 314 AND `id` = 14911;
UPDATE `creature` SET `position_x` = -11838.2, `position_y` = 1256.01, `position_z` = 2.08196, `orientation` = 5.77616, `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE `guid` = 2368 AND `id` = 14912;
UPDATE `creature` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60, `MovementType` = 2 WHERE `guid` = 312 AND `id` = 14910;

UPDATE `creature_template_addon` SET `bytes1` = 0 WHERE `entry` = 14912;

UPDATE `gameobject_template` SET `data2` = 393216 WHERE `entry` = 180104;

DELETE FROM `creature_movement` WHERE `id` = 312;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(312, 1, -11827.8, 1246.61, 2.30972, 6000, 1491001, 100),
(312, 2, -11826.5, 1249.88, 2.45471, 0, 0, 0),
(312, 3, -11830.1, 1253.57, 2.25573, 0, 0, 0),
(312, 4, -11832.6, 1255.68, 2.21323, 8000, 1491002, 100),
(312, 5, -11829.2, 1253.21, 2.25743, 0, 0, 0),
(312, 6, -11825.7, 1250.48, 2.46781, 0, 0, 0),
(312, 7, -11828.2, 1246.82, 2.31921, 0, 0, 0),
(312, 8, -11827.8, 1246.61, 2.30972, 400000, 1491003, 100);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (1491001, 1491002, 1491003);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1491001, 0, 4, 147, 3, 2, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Remove Npc Flags Quest Giver & Gossip"),

(1491002, 2, 0, 1, 0, 0, 0, 0, 0, 0, 4, 10306, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491002, 6, 0, 0, 0, 0, 0, 314, 0, 9, 2, 10307, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14911)"),

(1491003, 1, 13, 0, 0, 0, 0, 180104, 20, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Activate Gameobject"),
(1491003, 2, 0, 0, 0, 0, 0, 314, 0, 9, 2, 10308, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14911)"),
(1491003, 2, 3, 0, 0, 2, 0, 314, 0, 9, 2, 0, 0, 0, 0, -11819.1, 1242.81, 1.7513, 0, 0, "Exzhal - Move To Position (Creature ID: 14911)"),
(1491003, 3, 60, 3, 1, 0, 1, 2368, 0, 9, 2, 0, 2368, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Start Waypoints (Creature ID: 14912)"),
(1491003, 12, 35, 1, 0, 0, 0, 314, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 2.70683, 0, "Exzhal - Set Orientation (Creature ID: 14911)"),
(1491003, 13, 35, 1, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 2.73156, 0, "Exzhal - Set Orientation (Creature ID: 14912)"),
(1491003, 14, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10309, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491003, 20, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10310, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 25, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10311, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491003, 26, 2, 138, 8, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Set Bytes1 (Creature ID: 14912)"),
(1491003, 31, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10312, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491003, 36, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10313, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 41, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10314, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491003, 46, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10315, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 48, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10316, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 53, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10317, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491003, 58, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10315, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 60, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10318, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 65, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10319, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 70, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10320, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491003, 75, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10321, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 77, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10322, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 82, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10323, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 87, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10324, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 92, 0, 1, 0, 0, 0, 0, 0, 0, 4, 10325, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491003, 97, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10315, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 99, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10326, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 104, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10327, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 109, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10328, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 111, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10329, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 116, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10330, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491003, 121, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10331, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 123, 0, 2, 0, 0, 0, 0, 0, 0, 4, 10332, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text"),
(1491003, 123, 15, 23950, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Cast Spell"),
(1491003, 128, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10333, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 133, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10334, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 138, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10335, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14912)"),
(1491003, 142, 2, 138, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Set Bytes1 (Creature ID: 14912)"),
(1491003, 143, 48, 50000, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Deal 50k Damage (Creature ID: 14912)"),
(1491003, 143, 1, 36, 0, 0, 0, 314, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Play Emote (Creature ID: 14911)"),
(1491003, 146, 0, 2, 0, 0, 0, 314, 0, 9, 2, 10336, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Say Text (Creature ID: 14911)"),
(1491003, 147, 60, 3, 1, 0, 0, 314, 0, 9, 2, 0, 314, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Start Waypoints (Creature ID: 14911)"),
(1491003, 149, 4, 147, 3, 1, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Add Npc Flags Quest Giver & Gossip"),
(1491003, 150, 18, 0, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Exzhal - Despawn Creature (Creature ID: 14912)");

DELETE FROM `creature_movement_special` WHERE `id` IN (314, 2368);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`) VALUES 
(314, 1, -11820.1, 1245.06, 2.06946, 0, 0),
(314, 2, -11827.9, 1252.08, 2.36752, 0, 0),
(314, 3, -11835.8, 1258.33, 2.14388, 0, 0),
(314, 4, -11834.8, 1257.81, 2.14911, 5.595153, 0),

(2368, 1, -11832.6, 1254.32, 2.27876, 0, 0),
(2368, 2, -11828.6, 1252.47, 2.31295, 0, 0),
(2368, 3, -11823.1, 1244.18, 2.00798, 100, 160000);

UPDATE `broadcast_text` SET `EmoteId0` = 5 WHERE `ID` IN (10306, 10311, 10325);
UPDATE `broadcast_text` SET `EmoteId0` = 1 WHERE `ID` IN (10307, 10308, 10309, 10314, 10316, 10319, 10320, 10322, 10323, 10324, 10327, 10331, 10334);
UPDATE `broadcast_text` SET `EmoteId0` = 6 WHERE `ID` IN (10310, 10312, 10313, 10317, 10318, 10326, 10328, 10330, 10333);
UPDATE `broadcast_text` SET `EmoteId0` = 11 WHERE `ID` IN (10315, 10321);

UPDATE `broadcast_text` SET `Language` = 14 WHERE `ID` IN (10310, 10311, 10312, 10313, 10314, 10316, 10317, 10318, 10319, 10320, 10322, 10323, 10324, 10325, 10326, 10327, 10328, 10330, 10331, 10333, 10334);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
