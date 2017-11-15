DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171029135125');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171029135125');
-- Add your query below.

-- AQ War Effort event (one event to rule them all)
-- Gong event is activated once we are waiting for the gong to be rung.
-- The post event is started by the master event once the general event has ended.
-- It causes all NPCs that should be spawned and remain after the event to spawn. All the
-- other events end at this point (aside from the master event).
DELETE FROM `game_event` WHERE `entry` IN (84, 85, 86);
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `description`, `hardcoded`, `disabled`, `patch_min`, `patch_max`)
    VALUES  (84, '2005-01-01 00:00:00', '2025-01-01 01:00:00', 1, 2, 'AQ War Effort (master event)', 1, 0, 7, 10), -- Lasts forever, and ever
            (85, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 999999999, 'AQ War Effort (gong)', 0, 0, 7, 10),
            (86, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 2, 'AQ War Effort (post-event)', 0, 0, 7, 10);
-- War Effort events hardcoded; start, end and duration are controlled by the master event
UPDATE `game_event` SET `hardcoded` = 1 WHERE `entry` IN (22, 23, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 65, 85, 86);
UPDATE `game_event` SET `description` = 'AQ War Effort (Cenarion Hold attack)' WHERE `entry` = 59;

-- ------
-- Set quest to 5 hours for Nefarius's Corruption
UPDATE `quest_template` SET `Objectives` = 'Slay Nefarian and recover the Red Scepter Shard. Return the Red Scepter Shard to Anachronos at the Caverns of Time in Tanaris. You have 5 hours to complete this task.',
                            `LimitTime` = 18000
                        WHERE `entry` = 8730;

-- Long Forgotten Memories auto complete
UPDATE `quest_template` SET `Method` = 0 WHERE `entry` = 8305;

-- Eternal Board typos
UPDATE `script_texts` SET `content_default` = 'My forces cannot overcome the Qiraji defenses. We will not be able to get close enough to place your precious barrier, dragon.' WHERE `entry` = -1000754;
UPDATE `script_texts` SET `content_default` = 'We will push them back, Anachronos. This I vow. Uphold your end of this task. Let not your hands falter as you seal our fates behind the barrier.' WHERE `entry` = -1000759;
UPDATE `script_texts` SET `content_default` = 'Anachronos, this diversion will give you and the young druid time enough to seal the gate. Do not falter. Now, let us see how they deal with chaotic magic.' WHERE `entry` = -1000761;
UPDATE `script_texts` SET `content_default` = 'Do not forget the sacrifices we made on this day, night elf. We have all suffered immensely at the hands of these beasts.' WHERE `entry` = -1000763;
UPDATE `script_texts` SET `content_default` = 'It is done dragon. Lead the way...' WHERE `entry` = -1000766;
UPDATE `script_texts` SET `content_default` = 'Before I leave this place, I make one final offering to you, Lord Staghelm. Should a time arise in which you must gain entry to this accursed fortress, use the Scepter of the Shifting Sands on the sacred gong. The magic holding the barrier together will dissipate and the horrors of Ahn\'Qiraj will be unleashed upon the world once more.' WHERE `entry` = -1000774;
UPDATE `script_texts` SET `content_default` = 'My son\'s soul will find no comfort in this hollow victory, dragon. I will have him back. Though it takes a millenia, I WILL have my son back!' WHERE `entry` = -1000780;

-- Remove class/race requirements on Chimaerok Tenderloin
-- Fix forbidden entry for some 1.9 items, such as Chimaerok Tenderloin
UPDATE `item_template` SET `AllowableClass` = -1, `AllowableRace` = -1 WHERE `entry` = 21024;
UPDATE `forbidden_items` SET `AfterOrBefore` = 1, `patch` = 6 WHERE `entry` IN (
  20725, 21023, 21024, 21072, 21217); -- Not allowed <= 1.8

-- Reputation for Narain's quests
-- Return to Narain requires Neutral reputation with the Brood, not friendly
-- Scrying Goggles? No Problem! requires Neutral
-- The Might of Kalimdoor requires Neutral
UPDATE `quest_template` SET `RequiredMinRepValue` = 0 WHERE `entry` IN (8587, 8578, 8742);

-- Typo in the Nightmare Manifest event sequence
UPDATE `script_texts` SET `content_default` = 'He will stop at nothing to get to Malfurion\'s physical manifestation. That must not happen... We must keep the beast occupied long enough for Tyrande to arrive.' WHERE `entry` = -1000718;

-- ------
-- War effort collection objects (resource stacks) tied to event 22
DELETE FROM `game_event_gameobject` 
    WHERE `guid` IN  (SELECT `guid` FROM `gameobject` WHERE `id` IN (
                      180780, 180781, 180782, 180783, 180784, 180839, 180840, 180841, 180842, 
                      180843, 180800, 180806, 180807, 180808, 180809, 180833, 180834, 180835, 
                      180836, 180837, 180801, 180802, 180803, 180804, 180805, 180819, 180820, 
                      180821, 180822, 180823, 180692, 180693, 180694, 180695, 180696, 180813, 
                      180814, 180815, 180816, 180817, 180674, 180675, 180676, 180677, 180678, 
                      180827, 180828, 180829, 180830, 180831));

INSERT INTO `game_event_gameobject` 
    (SELECT `guid`, 22 FROM `gameobject` WHERE `id` IN (
      180780, 180781, 180782, 180783, 180784, 180839, 180840, 180841, 180842, 
      180843, 180800, 180806, 180807, 180808, 180809, 180833, 180834, 180835, 
      180836, 180837, 180801, 180802, 180803, 180804, 180805, 180819, 180820, 
      180821, 180822, 180823, 180692, 180693, 180694, 180695, 180696, 180813, 
      180814, 180815, 180816, 180817, 180674, 180675, 180676, 180677, 180678, 
      180827, 180828, 180829, 180830, 180831));

-- ------
-- War Effort officer texts and gossips
-- Judging by the Horde Ambassador's gossip menu (which we have sniffs of), 
-- the menus are identical to the officer in the actual city. Therefore, we
-- build a condition to dictate which gossip text is shown (for the actual NPC)
-- but re-use the same menu.

DELETE FROM `conditions` WHERE `condition_entry` IN (260, 261, 262, 263);
DELETE FROM `gossip_menu` WHERE `entry` IN (6772, 6665);
-- Field Marshal Snowfall (Alliance NPC, Ironforge). Entry 15701
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (260, 38, 15701, 1);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6772, 8082, 260);
UPDATE `creature_template` SET `gossip_menu_id` = 6772, `ScriptName` = '' WHERE `entry` = 15701;

-- Commander Stronghammer (Alliance NPC, Orgrimmar). Entry 15458
-- This is just a duplicate of Field Marshal Snowfall's. 
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (261, 38, 15458, 1);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6772, 7949, 261);
UPDATE `creature_template` SET `gossip_menu_id` = 6772, `ScriptName` = '' WHERE `entry` = 15458;

-- Warlord Gorchuk (Horde NPC, Orgrimmar). Entry 15700
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (262, 38, 15700, 1);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6665, 8092, 262);
UPDATE `creature_template` SET `gossip_menu_id` = 6665, `ScriptName` = '' WHERE `entry` = 15700;

-- General Zog (Horde NPC, Ironforge). Entry 15539
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (263, 38, 15539, 1);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6665, 7942, 263);
UPDATE `creature_template` SET `gossip_menu_id` = 6665, `ScriptName` = '' WHERE `entry` = 15539;

-- ------
-- NPC texts from broadcast_text table
DELETE FROM `npc_text` WHERE `id` IN (7867, 7836, 7908, 7862, 7928, 7871, 7877, 7879, 7906, 7910, 7915, 7926, 7919, 7921);
-- Horde Copper Bars complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7867, 'According to the latest count we have all of the copper bars we\'re going to need for the war. If I were you I\'d check with some of the other collectors here to see if they need your help.', '', 0, 1, 1, 1);
-- Alliance Purple Lotus complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7836, 'It is with satisfaction that I relay to you we have collected all of the purple lotus that we feel we need. Thank you for your contribution to the effort, $c. If you are so inclined, there are most likely several still here that are collecting other resources for the struggle.', '', 0, 1, 1, 1);
-- Horde Purple Lotus complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7908, '', 'We\'re filled to capacity on purple lotus, $c. Go ask one of the others if they need your help, and leave me to my studies. There is no time to waste!', 0, 1, 1, 0);
-- Alliance Spotted Yellowtail complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7862, '', 'Thank you for your inquiry, $c, but we have all of the spotted yellowtail necessary. There are others here though that may still be gathering materiel for the upcoming war. Seek them out, and may the goddess shine upon you.', 0, 1, 1, 1);
-- Horde Spotted Yellowtail complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7928, 'Heya, $c! Lookin\' like we got all the spotted yellowtail that we be needin\' for that war. Maybe you going to some of the other collectors \'round here and askin\' them if they be needin\' your help?', '', 0, 1, 1, 6);
-- Horde Tin Bars complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7871, 'No more tin bars! Even my arms hurt from stacking them. We have all that we need, so go ask one of the others if they need you to collect anything.', '', 0, 1, 1, 25);
-- Horde Mithril Bars complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7877, '', 'Yah, I know, it be lookin\' like we already have all of the mithril bars we be needin\' for the war. But ya know, there still be plenty of folk \'round here that can probably be usin\' your help right about now. Thanks mon.', 0, 1, 1, 1);
-- Horde Peacebloom complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7879, '', 'It is good that you wish to help, $c. Unfortunately I have collected up all of the peacebloom that we feel we\'ll need for the war effort. Maybe you could ask around; I\'m sure that there are likely to be others here that still need your aid in gathering other things.', 0, 1, 1, 6);
-- Horde Firebloom complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7906, 'Pele\'keiki know, it seem impossible even to him, but we be havin\' all that firebloom the Horde be wantin\' for the war. If you not be feelin\' too lazy, Pele\'keiki think you be helpin\' out the others here. They sure to have many things they be wantin\' you to get for them.', '', 0, 1, 1, 6);
-- Horde Heavy Leather complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7910, '', 'Ah, that\'s sweet of you mon, but we already got all the heavy leather that we need. And here I\'m sure that your knife is still sharp. Maybe you can put it to use helping the others with their collections, no? Have a good one!', 0, 1, 1, 0);
-- Horde Rugged Leather Complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7915, 'Such a pity, and here I\'ll wager that you sharpened your knife special in anticipation of slicing a few skins for me. Alas, we\'ve already gathered all of the rugged leather necessary, $c. Do make yourself useful though, and check with the others here to see if they have any other collection tasks to send you on.', '', 0, 1, 1, 1);
-- Horde Lean Wolf Steak complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7926, '', 'Looks like we have as many lean wolf steaks as the Horde wants. They told me to pack up what we have here and ready it to be shipped it out to Cenarion Hold in Silithus. But it looks like some of the others here might still be collecting whatever it is that they\'re in charge of. Go bug one of them.', 0, 1, 1, 1);
-- Horde Wool Bandage complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7919, 'I thank you for your inquiry, but I already have all of the wool bandages necessary for the war effort. I suggest that you ask around though; there are many here that could probably still use your aid.', '', 0, 1, 1, 1);
-- Horde Mageweave Bandage complete
INSERT INTO `npc_text` (`id`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`)
  VALUES (7921, '', 'How unfortunate; it would appear that we have collected all of the mageweave bandages necessary. Perhaps you can go sell them on the auction house? But before you go, be a good $g boy : girl; and check with the other collectors present. They may have an errand to send you off on.', 0, 1, 1, 1);

-- ------
-- War Effort recruiter gossip texts
DELETE FROM `gossip_menu` WHERE `entry` IN (20050, 20051, 20052, 20053, 20054, 20055);
DELETE FROM `conditions` WHERE `condition_entry` = 264;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (264, 39, 2, 0);
-- Senior Sergeant Taiga
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (20050, 7969, 264), (20050, 8105, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 20050 WHERE `entry` = 15702;
-- Senior Sergeant Grimsford
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (20051, 8084, 264), (20051, 8106, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 20051 WHERE `entry` = 15703;
-- Senior Sergeant Kai'Jin
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (20052, 8094, 264), (20052, 8107, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 20052 WHERE `entry` = 15704;

-- Master Sergeant Fizzlebolt
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (20053, 8006, 264), (20053, 8101, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 20053 WHERE `entry` = 15707;
-- Master Sergeant Maclure
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (20054, 8052, 264), (20054, 8103, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 20054 WHERE `entry` = 15708;
-- Master Sergeant Moonshadow -- Should probably be text ID 7967, but it just shows as NULL
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (20055, 7969, 264), (20055, 8104, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 20055 WHERE `entry` = 15709;

-- ------
-- Associate some NPC and quest availability with events
-- Jonathan the Revelator only available once the war effort has ended
DELETE FROM `game_event_creature` WHERE `guid` = 42763;
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (42763, 86);

-- Scarab Gong linked to event 85
DELETE FROM `game_event_gameobject` WHERE `guid` = 49451;
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (49451, 85);
DELETE FROM `game_event_quest` WHERE `quest` = 8743; -- Bang a Gong!
INSERT INTO `game_event_quest` (`quest`, `event`) VALUES (8743, 85);

-- Field Duty quests not available until the war is over
DELETE FROM `game_event_quest` WHERE `quest` IN (8507, 8731, 8800);
INSERT INTO `game_event_quest` (`quest`, `event`)
  VALUES  (8507, 86),
          (8731, 86),
          (8800, 86);

-- AQ20 gear quests not available until the war is over
DELETE FROM `game_event_quest` WHERE `quest` IN (
  SELECT `entry` FROM `quest_template` WHERE `RewItemId1` IN (
    SELECT `entry` FROM `item_template` WHERE `itemset` IN (
      506, 495, 498, 508, 502, 500, 494, 504, 510)
    )
  );

INSERT INTO `game_event_quest` (`quest`, `event`)
  (SELECT `entry`, 86 FROM `quest_template` WHERE `RewItemId1` IN (
    SELECT `entry` FROM `item_template` WHERE `itemset` IN (
      506, 495, 498, 508, 502, 500, 494, 504, 510)
    )
  );

-- ------
-- Creature and object spawns and visibility
-- Scarab Gong visibility and active object
UPDATE `gameobject` SET `visibilitymod` = 150, `spawnFlags` = `spawnFlags` | 1 WHERE `guid` = 49451;
-- Gate objects visibility and active
UPDATE `gameobject` SET `visibilitymod` = 350, `spawnFlags` = `spawnFlags` | 1 WHERE `id` IN (176146, 176147, 176148, 180322);

-- Maws defences
UPDATE `creature_template`  SET `armor` = 4691, `resistance2` = 0, `resistance3` = 0, `resistance4` = 0,
                                `resistance5` = 0, `resistance6` = 0 
                            WHERE `entry` = 15571;

-- Spawns, texts and AIs based on the following sources:
-- https://www.youtube.com/watch?v=5fZBwwC-ZaA
-- https://www.youtube.com/watch?v=n2GYY_VPYok
-- https://www.youtube.com/watch?v=Kr0Uo8DPYqA
-- https://www.youtube.com/watch?v=E0kDqUlgM5c
-- https://www.youtube.com/watch?v=F-FeUv7HSzI
-- https://www.youtube.com/watch?v=t-cgmTBDLuQ
-- Adjust the spawn of an Imperial Qiraji Destroyer in front of the AQ gate after opening
UPDATE `creature` SET `position_x` = -8092.06, `position_y` = 1555.11, `position_z` = 3.25, `orientation` = 6.26 WHERE `guid` = 112996;
-- Add another one
DELETE FROM `creature` WHERE `guid` = 112997;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
  VALUES (112997, 15744, 1, 0, 0, -8090.44, 1492.73, 2.62, 6.26, 25, 0, 0, 231222, 6441, 0, 0);
-- Add Rajaxx spawned on top of the gate, will be pacified
DELETE FROM `creature` WHERE `guid` = 112998;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`)
  VALUES (112998, 15341, 1, 0, 0, -8133.01, 1525.23, 37.9, 6.27, 25, 0, 0, 438442, 0, 0, 0, 1, 100);

-- Several Colossal Anubisath spawns near the gates of Ahn'Qiraj (out front),
-- and several more (~10) along the road to Cenarion Hold
DELETE FROM `creature` WHERE `guid` IN (112988, 112989, 112990) OR `guid` BETWEEN 112820 AND 112837;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
  VALUES  (112988, 15743, 1, 0, 0, -8007.78, 1529.98, 2.71, 3.35, 1200, 0, 0, 442554, 0, 0, 0),
          (112989, 15743, 1, 0, 0, -7936.39, 1562.84, 0.52, 4.71, 1200, 0, 0, 442554, 0, 0, 0),
          (112990, 15743, 1, 0, 0, -7916.88, 1467.56, -5.52, 2.49, 1200, 0, 0, 442554, 0, 0, 0),
          -- Along the road
          (112820, 15743, 1, 0, 0, -7771.52, 1195.07, -1.00, 5.41, 1200, 10, 0, 442554, 0, 0, 1),
          (112821, 15743, 1, 0, 0, -7763.24, 1180.40, -0.18, 0.11, 1200, 10, 0, 442554, 0, 0, 1),
          (112822, 15743, 1, 0, 0, -7752.61, 1196.55, 4.89, 2.54, 1200, 10, 0, 442554, 0, 0, 1),
          (112823, 15743, 1, 0, 0, -7756.54, 1210.81, 5.17, 3.84, 1200, 10, 0, 442554, 0, 0, 1),
          (112824, 15743, 1, 0, 0, -7795.33, 1205.43, -0.12, 5.86, 1200, 10, 0, 442554, 0, 0, 1),
          (112825, 15743, 1, 0, 0, -7801.54, 1185.79, 1.39, 0.26, 1200, 10, 0, 442554, 0, 0, 1),
          (112826, 15743, 1, 0, 0, -7792.29, 1166.07, 2.42, 0.73, 1200, 10, 0, 442554, 0, 0, 1),
          (112827, 15743, 1, 0, 0, -7777.31, 1143.89, 2.21, 1.25, 1200, 10, 0, 442554, 0, 0, 1),
          (112828, 15743, 1, 0, 0, -7749.95, 1150.644, 0.63, 5.76, 1200, 10, 0, 442554, 0, 0, 1),
          (112829, 15743, 1, 0, 0, -7729.25, 1179.73, 0.79, 2.07, 1200, 10, 0, 442554, 0, 0, 1),
          -- Several Colossal Anubisath & Qiraji Destroyer spawns during final battle
          (112830, 15743, 1, 0, 0, -8056.69, 1510.31, 2.61, 0.41, 1200, 0, 0, 442554, 0, 0, 0),
          (112831, 15743, 1, 0, 0, -8049.95, 1550.46, 2.63, 5.72, 1200, 0, 0, 442554, 0, 0, 0),
          (112832, 15743, 1, 0, 0, -8055.82, 1532.99, 2.88, 0.21, 1200, 0, 0, 442554, 0, 0, 0),
          (112833, 15743, 1, 0, 0, -8001.10, 1568.40, 3.03, 4.40, 1200, 0, 0, 442554, 0, 0, 0),
          (112834, 15743, 1, 0, 0, -7983.65, 1548.46, 3.65, 3.95, 1200, 0, 0, 442554, 0, 0, 0),
          (112835, 15744, 1, 0, 0, -8036.88, 1501.76, -2.31, 1.00, 1200, 0, 0, 442554, 6441, 0, 0),
          (112836, 15744, 1, 0, 0, -8020.15, 1561.58, 2.61, 4.89, 1200, 0, 0, 442554, 6441, 0, 0),
          (112837, 15744, 1, 0, 0, -8065.63, 1487.94, 2.61, 0.28, 1200, 0, 0, 442554, 6441, 0, 0);

-- Trigger creature that summons waves of enemies to attack Cenarion Hold during the war
DELETE FROM `creature` WHERE `guid` = 113132;
DELETE FROM `creature_template` WHERE `entry` = 21010;
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`)
  VALUES (21010, 7, 0, 0, 16169, 0, 0, 0, 'AQ War Cenarion Hold Wave Trigger', '', 0, 60, 60, 1, 1, 0, 0, 0, 35, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 272, 1, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 0, 16384, 0, 130, 'npc_aqwar_ch_attack');
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`)
  VALUES  (113132, 21010, 1, 0, 0, -7067.77, 966.62, 4.56, 3.35, 300, 0, 0, 442554, 0, 0, 0, 1);

-- New creature spawn events
DELETE FROM `game_event_creature` WHERE `guid` IN (112988, 112989, 112990, 112997, 112998, 113132) OR `guid` BETWEEN 112820 AND 112837;
INSERT INTO `game_event_creature` (`guid`, `event`) 
  VALUES  (112820, 65),
          (112821, 65),
          (112822, 65),
          (112823, 65),
          (112824, 65),
          (112825, 65),
          (112826, 65),
          (112827, 65),
          (112828, 65),
          (112829, 65),
          (112830, 61),
          (112831, 61),
          (112832, 61),
          (112833, 61),
          (112834, 61),
          (112835, 61),
          (112836, 61),
          (112837, 61),
          (112988, 65),
          (112989, 65),
          (112990, 65),
          (112998, 65), 
          (112997, 65),
          (113132, 59);

-- Scale of Resonationg Crystal Formations
UPDATE `gameobject_template` SET `size` = 3 WHERE `entry` IN (180810, 180811);
-- Remove usability of Resonating Crystal Formation
UPDATE `gameobject_template` SET `type` = 5, `data1` = 0, `data2` = 0 WHERE `entry` = 180810;

-- Hive Colossus active and increased draw distance
UPDATE `gameobject` SET `visibilitymod` = 110, `spawnFlags` = `spawnFlags` | 1 WHERE `id` IN (15740, 15741, 15742);

-- AI for soldiers and priestess
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = 'npc_orgrimmar_infantry' WHERE `entry` IN (15853);
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = 'npc_orgrimmar_rifleman' WHERE `entry` IN (15855);
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = 'npc_ironforge_infantry' WHERE `entry` IN (15861);

-- Priestess
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = 'npc_priestess' WHERE `entry` IN (15634);
DELETE FROM `creature_template_addon` WHERE `entry` = 15634; -- No auto mount

-- High Overlord Saurfang active & AI, health and damage
-- He should 'tank all the mobs and destroy them'
UPDATE `creature` SET `spawnFlags` = `spawnFlags` | 1, `curhealth` = 2100000 WHERE `id` = 987000;
UPDATE `creature_template` SET  `minhealth` = 2100000, `maxhealth` = 2100000,
                                `ScriptName` = 'npc_aqwar_saurfang',
                                `mindmg` = 3900, `maxdmg` = 4300
                           WHERE `entry` = 987000;

-- ------
-- Creature equipment and addons
-- Cavalryman mounts
DELETE FROM `creature_template_addon` WHERE `entry` IN (15862, 15854, 15857);
-- Ironforge Cavalryman rides a Black War Ram
INSERT INTO `creature_template_addon`(`entry`, `mount`) VALUES (15862, 14577);
-- Orgrimmary Elite Cavalryman rides a Black War Wolf
INSERT INTO `creature_template_addon`(`entry`, `mount`) VALUES (15854, 14334);
-- Stormwind Cavalryman rides a Warhorse
INSERT INTO `creature_template_addon`(`entry`, `mount`) VALUES (15857, 8469); 

-- Stormwind Infantryman Grand Marshal's Longsword RH and Grand Marshal's Aegis LH
DELETE FROM `creature_equip_template` WHERE `entry` = 1450;
DELETE FROM `creature_equip_template_raw` WHERE `entry` = 1450;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`) VALUES (1450, 12584, 18825);

-- ------
-- Battle Event script texts
-- https://www.youtube.com/watch?v=E0kDqUlgM5c
-- https://www.youtube.com/watch?v=Kr0Uo8DPYqA
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1780312 AND -1780300;
INSERT INTO `script_texts` (`entry`, `content_default`, `type`, `emote`, `comment`) 
  VALUES  (-1780300, 'Sandstorm coming from the south, take co... That\'s no sandstorm! INCOMING QIRAJI ARMY!', 6, 93, 'AQ Saurfang CH attack'),
          (-1780301, 'You know me to be the Supreme Commander of the Might of Kalimdor', 0, 93, 'AQ Saurfang speech 1'),
          (-1780302, 'An orc - a true orc warrior - wishes for one thing: To die in the glory of battle gainst a hated enemy.', 0, 93, 'AQ Saurfang speech 2'),
          (-1780303, 'Some of you have not fought in battles. Peace has been with us for many years. Many years we sat idle, but many years we battled.', 0, 93, 'AQ Saurfang speech 3'),
          (-1780304, 'In those years - where strife filled the land as Legion and Scource sacked our homes, killed our families - these insects dwelled beneath us. Beneath our homes - waiting', 0, 93, 'AQ Saurfang speech 4'),
          (-1780305, 'Waiting to crush the life from our little ones. To slay all in their path. This they do for their god.', 0, 93, 'AQ Saurfang speech 5'),
          (-1780306, 'And for our gods?', 0, 93, 'AQ Saurfang speech 6'),
          (-1780307, 'We defend. We stand. We show that as one. United. We destroy. Their god will fall.', 0, 93, 'AQ Saurfang speech 7'),
          (-1780308, 'To die today, on this field of battle, is to die an orcish death. To die today is to die for our little ones. Our old ones. Our... loved ones', 0, 93, 'AQ Saurfang speech 8'),
          (-1780309, 'Would any of you deny yourselves such a death? Such an honor?', 0, 93, 'AQ Saurfang speech 9'),
          (-1780310, 'ONWARD! TO AHN\'QIRAJ!', 6, 0, 'AQ Saurfang speech 10'),
          (-1780311, 'The final battle for Kalimdor is upon us. The supreme commander of the Might of Kalimdor orders his troops to march upon Ahn\'Qiraj and destroy all in their path..', 0, 0, 'AQ Final battle world text'),
          (-1780312, 'The Might of Kalimdor is victorious! The last of the Qiraji forces are defeated, retreating back to the ancient city-fortress of Ahn\'Qiraj. The Qiraji Resonating Crystals littering Kalimdor vanish as quickly as they appeared, leaving behind nothing but sundered earth.', 0, 0, 'AQ War over');


-- ------
-- Quest requirements
UPDATE `quest_template` SET `MinLevel` = 10 WHERE `entry` IN (8792, 8795);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
