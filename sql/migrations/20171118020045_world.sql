DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171118020045');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171118020045');
-- Add your query below.


-- Some of these texts are from TBC and WotLK, the rest have wrong ids.
DELETE FROM `npc_text` WHERE `ID` IN (20201, 20551, 20564, 21024, 22932, 22990, 30000, 30010, 30031, 40100, 40101, 50013, 55001, 55002, 55003, 55101, 55102, 55103, 55131, 55132, 55133, 100000, 125800, 125801, 672901, 921061, 1491201, 1491301, 1491401, 1491501, 1548101, 1548102, 1548103, 1548104, 1548105, 1548106, 1548107, 1548108, 1548109, 1548110, 1548111, 1548112, 1548113, 1548114, 1603301, 1678785);

-- Text ids used by High Inquisitor Fairbanks. Approximation based on broadcast text id.
UPDATE `npc_text` SET `ID`=8599 WHERE `ID`=30117;
UPDATE `gossip_menu` SET `text_id`=8599 WHERE `text_id`=30117;
UPDATE `npc_text` SET `ID`=8600 WHERE `ID`=30118;
UPDATE `gossip_menu` SET `text_id`=8600 WHERE `text_id`=30118;
UPDATE `npc_text` SET `ID`=8601 WHERE `ID`=30119;
UPDATE `gossip_menu` SET `text_id`=8601 WHERE `text_id`=30119;
UPDATE `npc_text` SET `ID`=8602 WHERE `ID`=30120;
UPDATE `gossip_menu` SET `text_id`=8602 WHERE `text_id`=30120;
UPDATE `npc_text` SET `ID`=8603 WHERE `ID`=30121;
UPDATE `gossip_menu` SET `text_id`=8603 WHERE `text_id`=30121;
UPDATE `npc_text` SET `ID`=8604 WHERE `ID`=30122;
UPDATE `gossip_menu` SET `text_id`=8604 WHERE `text_id`=30122;
UPDATE `npc_text` SET `ID`=8605 WHERE `ID`=30123;
UPDATE `gossip_menu` SET `text_id`=8605 WHERE `text_id`=30123;
UPDATE `npc_text` SET `ID`=8606 WHERE `ID`=30124;
UPDATE `gossip_menu` SET `text_id`=8606 WHERE `text_id`=30124;
UPDATE `npc_text` SET `ID`=8607 WHERE `ID`=30125;
UPDATE `gossip_menu` SET `text_id`=8607 WHERE `text_id`=30125;
UPDATE `npc_text` SET `ID`=8608 WHERE `ID`=30126;
UPDATE `gossip_menu` SET `text_id`=8608 WHERE `text_id`=30126;
UPDATE `npc_text` SET `ID`=8609 WHERE `ID`=30127;
UPDATE `gossip_menu` SET `text_id`=8609 WHERE `text_id`=30127;
UPDATE `npc_text` SET `ID`=8610 WHERE `ID`=30128;
UPDATE `gossip_menu` SET `text_id`=8610 WHERE `text_id`=30128;
UPDATE `npc_text` SET `ID`=8611 WHERE `ID`=30129;
UPDATE `gossip_menu` SET `text_id`=8611 WHERE `text_id`=30129;
UPDATE `npc_text` SET `ID`=8612 WHERE `ID`=30130;
UPDATE `gossip_menu` SET `text_id`=8612 WHERE `text_id`=30130;
UPDATE `npc_text` SET `ID`=8613 WHERE `ID`=30131;
UPDATE `gossip_menu` SET `text_id`=8613 WHERE `text_id`=30131;
UPDATE `npc_text` SET `ID`=8614 WHERE `ID`=30132;
UPDATE `gossip_menu` SET `text_id`=8614 WHERE `text_id`=30132;
UPDATE `npc_text` SET `ID`=8615 WHERE `ID`=30133;
UPDATE `gossip_menu` SET `text_id`=8615 WHERE `text_id`=30133;

-- Gossip menu for Caelestrasz.
INSERT INTO `gossip_menu` VALUES (6794, 8078, 0);
INSERT INTO `gossip_menu` VALUES (6794, 8112, 15727);
UPDATE `creature_template` SET `gossip_menu_id`=6794, `ScriptName`='' WHERE `entry`=15379;
-- Check if C'Thun is done.
INSERT INTO `conditions` VALUES (15727, 18, 5, 5);

-- Approximate npc text id for Rigglefuzz based on broadcast text id.
UPDATE `npc_text` SET `ID`=2398 WHERE `ID`=50010;
UPDATE `npc_gossip` SET `textid`=2398 WHERE `textid`=50010;

-- High Executor Darthalia has a quest greeting, not gossip.
-- https://youtu.be/D9O903Wnmb4?t=11m6s
DELETE FROM `npc_gossip` WHERE `textid`=50013;
INSERT INTO `quest_greeting` (`entry`, `content_default`) VALUES (2215, 'In order to serve the Dark Lady and Varimathras we need to advance the front on the Human Infestation.');

-- Adding quest greeting for Apothecary Lydon.
-- https://youtu.be/D9O903Wnmb4?t=1h41m14s
-- https://youtu.be/D9O903Wnmb4?t=2h16m8s
INSERT INTO `quest_greeting` (`entry`, `content_default`) VALUES (2216, 'We are but so close to developing the New Plague that our Dark Lady desires with such fervor.');

-- Meridith the Mermaiden's gossip menu and texts have wrong id.
UPDATE `creature_template` SET `gossip_menu_id`=6658 WHERE `entry`=15526;
UPDATE `gossip_menu_option` SET `menu_id`=6658 WHERE `menu_id`=15526;
DELETE FROM `gossip_menu` WHERE `entry`=15526;

-- Morridune has wrong gossip menu id and text id.
UPDATE `creature_template` SET `gossip_menu_id`=321 WHERE `entry`=6729;
DELETE FROM `gossip_menu` WHERE `entry`=16000;
INSERT INTO `gossip_menu` VALUES (321, 818, 0);
UPDATE `gossip_menu_option` SET `menu_id`=321 WHERE `menu_id`=16000;

-- Custom French crap.
DELETE FROM `gossip_menu` WHERE `entry` IN (14912, 14913, 14914, 14915, 16030, 16031);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=16030;
DELETE FROM `gossip_scripts` WHERE `id` IN (13, 14, 15);

-- AQ gossips.
UPDATE `gossip_menu` SET `text_id`=7885 WHERE `text_id`=1548101;
UPDATE `gossip_menu` SET `text_id`=7886 WHERE `text_id`=1548102;
UPDATE `gossip_menu` SET `text_id`=7887 WHERE `text_id`=1548103;
UPDATE `gossip_menu` SET `text_id`=7888 WHERE `text_id`=1548104;
UPDATE `gossip_menu` SET `text_id`=7889 WHERE `text_id`=1548105;
UPDATE `gossip_menu` SET `text_id`=7890 WHERE `text_id`=1548106;
UPDATE `gossip_menu` SET `text_id`=7891 WHERE `text_id`=1548107;
UPDATE `gossip_menu` SET `text_id`=7892 WHERE `text_id`=1548108;
UPDATE `gossip_menu` SET `text_id`=7893 WHERE `text_id`=1548109;
UPDATE `gossip_menu` SET `text_id`=7894 WHERE `text_id`=1548110;
UPDATE `gossip_menu` SET `text_id`=7895 WHERE `text_id`=1548111;
UPDATE `gossip_menu` SET `text_id`=7896 WHERE `text_id`=1548112;
UPDATE `gossip_menu` SET `text_id`=7897 WHERE `text_id`=1548113;
UPDATE `gossip_menu` SET `text_id`=7901 WHERE `text_id`=1548114;

-- Add gossip menu for Doctor Gustaf VanHowzen and Doctor Gregory Victor.
UPDATE `creature_template` SET `gossip_menu_id`=5382 WHERE `entry` IN (12920, 12939);
DELETE FROM `npc_gossip` WHERE `textid`=1678785;
INSERT INTO `conditions` VALUES (165, 7, 129, 240);
INSERT INTO `conditions` VALUES (166, 7, 129, 260);
INSERT INTO `conditions` VALUES (167, 7, 129, 290);
INSERT INTO `conditions` VALUES (171, 17, 10841, 1);
INSERT INTO `conditions` VALUES (172, 17, 18629, 1);
INSERT INTO `conditions` VALUES (173, 17, 18630, 1);
INSERT INTO `conditions` VALUES (175, 8, 6622, 0);
INSERT INTO `conditions` VALUES (176, 8, 6624, 0);
INSERT INTO `conditions` VALUES (177, -2, 175, 176);
INSERT INTO `conditions` VALUES (178, 15, 40, 1);
INSERT INTO `conditions` VALUES (179, -1, 177, 178);
INSERT INTO `conditions` VALUES (182, -1, 165, 171);
INSERT INTO `conditions` VALUES (183, -1, 166, 172);
INSERT INTO `conditions` VALUES (184, -1, 167, 173);
INSERT INTO `conditions` VALUES (193, -1, 179, 182);
INSERT INTO `conditions` VALUES (194, -1, 179, 183);
INSERT INTO `conditions` VALUES (195, -1, 179, 184);
INSERT INTO `conditions` VALUES (396, 7, 129, 1);
DELETE FROM `gossip_menu` WHERE `entry`=5382;
INSERT INTO `gossip_menu` VALUES (5382, 6413, 2);
INSERT INTO `gossip_menu` VALUES (5382, 6414, 66);
INSERT INTO `gossip_menu` VALUES (5382, 6415, 0);
INSERT INTO `gossip_menu` VALUES (5382, 6573, 396);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (5382, 0, 0, 'Teach me how to create and apply a Heavy Mageweave Bandage, Doctor.', 1, 1, 0, 0, 5382, 0, 0, '', 193);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (5382, 1, 0, 'Teach me how to create and apply a Runecloth Bandage, Doctor.', 1, 1, 0, 0, 5383, 0, 0, '', 194);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (5382, 2, 0, 'Teach me how to create and apply a Heavy Runecloth Bandage, Doctor.', 1, 1, 0, 0, 5384, 0, 0, '', 195);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (5382, 0, 15, 10843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heavy Mageweave Bandage');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (5383, 0, 15, 18631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runecloth Bandages');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (5384, 0, 15, 18632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heavy Runecloth Bandages');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
