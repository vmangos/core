INSERT INTO `migrations` VALUES ('20170916123309');
-- ---
-- Patch 1.12 fixes for missing NPCs, drops, quests, and other issues
-- ---

-- Remove pre-1.4 mounts (Undead mounts don't change aside from the 
-- addition of a purple version at 1.4)
DELETE FROM `npc_vendor` WHERE `item` IN (
    8586,  -- Whistle of the Mottled Red Raptor
    13317, -- Whistle of the Ivory Raptor
    12302, -- Reins of the Frostsaber
    12303, -- Reins of the Nightsaber
    12353, -- White Stallion Bridle
    12354, -- Palomino Bridle
    13328, -- Black Ram
    13329, -- Frost Ram
    12330, -- Horn of the Red Wolf
    12351, -- Horn of the Arctic Wolf
    15292, -- Green Kodo
    15293, -- Teal Kodo
    13326, -- White Mechanostrider Mod A
    13327);-- Icy Blue Mechanostrider Mod A

DELETE FROM `creature` WHERE `id` IN (14561,14560,14559,14546,14548,14547,14556,14555,14602,14551,14552,14553,14542,14549,14550,14540,14539,14541,14545,14543,14544);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES 
    (95100, 14539, 1, 14575, 0, 2153.65, -4657.14, 49.9992, 1.51844, 300, 0, 0, 64, 53, 0, 0, 0),
    (95101, 14540, 1, 14573, 0, 2161.67, -4648.08, 50.3632, 4.18879, 300, 0, 0, 64, 53, 0, 0, 0),
    (95102, 14541, 1, 14574, 0, 2155.59, -4649.18, 50.0618, 5.3058, 300, 0, 0, 64, 53, 0, 0, 0),
    (95103, 14542, 1, 14349, 0, -2285.41, -389.98, -9.20741, 5.95157, 250, 0, 0, 64, 53, 0, 0, 0),
    (95104, 14543, 1, 14344, 0, -846.074, -4884.12, 21.2854, 2.54818, 120, 0, 0, 64, 53, 0, 0, 0),
    (95105, 14544, 1, 14342, 0, -855.627, -4884.4, 22.1798, 1.32645, 120, 0, 0, 64, 53, 0, 0, 0),
    (95106, 14545, 1, 14339, 0, -849.765, -4885.79, 21.8995, 1.15192, 120, 0, 0, 64, 53, 0, 0, 0),
    (95107, 14546, 0, 14347, 0, -5529.51, -1376.1, 398.789, 3.57943, 180, 0, 0, 64, 53, 0, 0, 0),
    (95108, 14547, 0, 14346, 0, -5536.3, -1335.36, 398.769, 1.80959, 180, 0, 0, 64, 53, 0, 0, 0),
    (95109, 14548, 0, 14576, 0, -5532.46, -1358.99, 398.694, 3.04284, 180, 0, 0, 64, 53, 0, 0, 0),
    (95110, 14549, 1, 14578, 0, -2283.82, -394.645, -9.14653, 0.907571, 250, 0, 0, 64, 53, 0, 0, 0),
    (95111, 14550, 1, 14579, 0, -2279.3, -388.407, -9.33995, 5.68977, 250, 0, 0, 64, 53, 0, 0, 0),
    (95112, 14551, 0, 14377, 0, -5447.83, -617.37, 394.511, 3.19395, 180, 0, 0, 64, 53, 0, 0, 0),
    (95113, 14552, 0, 14376, 0, -5452.32, -613.089, 394.51, 4.29351, 180, 0, 0, 64, 53, 0, 0, 0),
    (95114, 14553, 0, 14374, 0, -5449.28, -614.756, 394.539, 3.68265, 180, 0, 0, 64, 53, 0, 0, 0),
    (95115, 14555, 1, 14332, 0, 10126.5, 2527.85, 1323.9, 3.1765, 300, 0, 0, 64, 53, 0, 0, 0),
    (95116, 14556, 1, 14331, 0, 10130.5, 2532.53, 1323.62, 4.10152, 300, 0, 0, 64, 53, 0, 0, 0),
    (95117, 14559, 0, 14582, 0, -777.081, -608.085, 15.2348, 2.32129, 300, 0, 0, 64, 53, 0, 0, 0),
    (95118, 14559, 1, 14582, 0, -3841.59, -4395.53, 10.5345, 2.32129, 360, 0, 0, 64, 53, 0, 0, 0),
    (95119, 14559, 0, 14582, 0, -9456.64, -1386.59, 47.1554, 1.39626, 180, 0, 0, 64, 53, 0, 0, 0),
    (95120, 14560, 1, 14338, 0, -3848.56, -4402.28, 10.3649, 2.37365, 360, 0, 0, 64, 53, 0, 0, 0),
    (95121, 14560, 0, 14338, 0, -774.887, -606.126, 15.2348, 2.30383, 300, 0, 0, 64, 53, 0, 0, 0),
    (95122, 14560, 0, 14338, 0, -9438.08, -1411.84, 47.0352, 1.65806, 180, 0, 0, 64, 53, 0, 0, 0),
    (95123, 14561, 0, 14583, 0, -781.823, -611.991, 15.2348, 2.25148, 300, 0, 0, 64, 53, 0, 0, 0),
    (95124, 14561, 1, 14583, 0, -3848.26, -4393.54, 10.2239, 5.44543, 360, 0, 0, 64, 53, 0, 0, 0),
    (95125, 14561, 0, 14583, 0, -9444.04, -1412.16, 46.9049, 1.72788, 180, 0, 0, 64, 53, 0, 0, 0),
    (95126, 14602, 1, 14632, 0, 10132.9, 2527.95, 1325.16, 4.01426, 300, 0, 0, 64, 0, 0, 0, 0);

-- Remove old stables
DELETE FROM `creature` where `guid` IN (81385, 81388, 4155, 4156, 176, 174, 49183, 48577, 6614, 6617, 6405, 6404, 26644, 26654, 24048, 8465, 14806, 14807);

-- ----------
-- Vargus quest availability and turn ins, and vendor items
-- Tie them all to the Patch 1.9 event (166)
DELETE FROM `creature_questrelation` WHERE `id` = 15176;
INSERT INTO  `creature_questrelation` (`id`, `quest`) VALUES 
    (15176, 8548), -- Volunteer's Battlegear
    (15176, 8572), -- Veteran's Battlegear
    (15176, 8573), -- Champion's Battlegear
    (15176, 8574); -- Stalwart's Battlegear

DELETE FROM `creature_involvedrelation` WHERE `id` = 15176;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES
    (15176, 8548), -- Volunteer's Battlegear
    (15176, 8572), -- Veteran's Battlegear
    (15176, 8573), -- Champion's Battlegear
    (15176, 8574), -- Stalwart's Battlegear
    (15176, 8800), -- Cenarion Battlegear (opens badge reward quests)
    (15176, 8783), -- Extraordinary Materials (Logistics - Alliance)
    (15176, 8809); -- Extraordinary Materials (Logistics - Horde)

DELETE FROM `game_event_quest` WHERE `quest` IN (8548, 8572, 8573, 8574, 8800, 8783, 8809);
INSERT INTO `game_event_quest` (`event`, `quest`) VALUES
    (166, 8548),
    (166, 8572),
    (166, 8573),
    (166, 8574),
    (166, 8800),
    (166, 8783),
    (166, 8809);

-- Battlegear quests require Cenarion Battlegear first
UPDATE `quest_template` SET `PrevQuestId` = 8800 WHERE `entry` IN (8548, 8572, 8573, 8574);
-- Ironvine craftable and Obsidian Gear
INSERT IGNORE INTO `npc_vendor` (`entry`, `item`) VALUES
    (15176, 22209), -- Plans: Heavy Obsidian Belt
    (15176, 22214), -- Plans: Light Obsidian Belt
    (15176, 22768), -- Plans: Ironvine Belt
    (15176, 22767), -- Plans: Ironvine Gloves
    (15176, 22766); -- Plans: Ironvine Breastplate

-- ----------
-- Rename Silithus @ 1.9 to Silithus @ 1.8 (quest revamp)
UPDATE `game_event` SET `description` = 'Silithus @ 1.8 (revamp)' WHERE `entry` = 154;

-- ----------
-- Twilight Cultist sets and Encrypted Twilight Text event condition
-- Tied to event 154, Silithus @ 1.8. Condition entry 71
UPDATE `creature_loot_template` SET `condition_id` = 71 WHERE `item` IN (
    20404, 20406, 20407, 20408
);

-- ----------
-- Tie Silithyst Geyser to event 103 (Silithus PVP)
INSERT IGNORE INTO `game_event_gameobject` (`event`, `guid`) (
    SELECT 103, `go`.`guid` 
        FROM `gameobject` `go` JOIN `gameobject_template` `got`
            ON `got`.`entry` = `go`.`id` 
        WHERE `got`.`entry` = 181598
);

-- Zanza's Potent Potables potions cost 1 token @ 1.11, no longer persist through death
UPDATE `quest_template` SET `ReqItemCount1` = 1 WHERE `entry` = 8243;

-- ----------
-- Eternal Quintessence
-- Add conditions for availability
DELETE FROM `conditions` WHERE `condition_entry` BETWEEN 200 AND 236;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
    (200, 12, 168, 0),      -- Patch 1.11
    (201, 5, 749, 6),       -- Revered reputation with Hydraxian Waterlords
    (202, -1, 200, 201),    -- AND condition, require 1.11 and revered
    (203, 5, 749, 5),       -- Honoured with Hydraxian
    (204, 8, 6824, 0),      -- Completed quest Hands of the Enemy
    (205, -1, 203, 204),    -- Honoured & Completed Hands of the Enemy

    (206, 24, 17333, 1),    -- Has no Aqual Quintessence
    (207, 24, 22754, 1),    -- Has no Eternal Quintessence
    
    (208, -1, 207, 202),    -- Has no Eternal, Revered, patch 1.11

    (209, -1, 205, 206),    -- Has no Aqual, Honoured, completed Hands of the Enemy
    (210, -1, 209, 207),    -- Has no Aqual, has no Eternal, Honoured, completed Hands

    -- Gossip text Conditions
    (212, 23, 22754, 1),    -- Has Eternal Quintessence
    (213, -1, 201, 212),    -- Revered, has Eternal Quintessence

    (214, 8, 6821, 0),      -- Completed Eye of the Emberseer
    (215, -3, 204, 0),      -- Has NOT completed Hands of the Enemy
    (216, -1, 214, 215),    -- Completed Eye of the Emberseer and has NOT completed Hands of the Enemy

    (217, -3, 208, 0),      -- NOT 208
    (218, -1, 217, 210),    -- NOT 208 AND 210 (Do not offer Aqual when we can take an Eternal)

    (219, -3, 200, 0),      -- NOT Patch 1.11
    (220, 23, 17333, 1),    -- Has Aqual Quintessence
    (221, -1, 219, 220),    -- NOT Patch 1.11 AND has Aqual Quintessence
    (222, -1, 221, 201),    -- Revered, NOT Patch 1.11 AND has Aqual Quintessence
    (223, -2, 222, 213),    -- Revered, NOT Patch 1.11 AND has Aqual Quintessence OR Revered AND has Eternal Quintessence
    (224, 8, 6804, 0),      -- Completed Poisoned Water
    (225, 8, 6805, 0),      -- Completed Stormers and Rumblers
    (226, -3, 224, 0),
    (227, -3, 225, 0),
    (228, -1, 226, 227),    -- NOT 226 AND NOT 227 (Hasn't completed Poisoned/Stormers)
    (229, -2, 224, 225),    -- Completed either Poisoned Water or Stormers
    (230, -1, 208, 204),    -- Has no Eternal, Revered, patch 1.11, completed Hands of the Enemy

    (231, -3, 218, 0),      -- NOT 218
    (232, -3, 230, 0),      -- NOT 230
    (233, -3, 223, 0),      -- NOT 223
    (234, -1, 229, 231),    -- Completed either Poisoned Water or Stormers and NOT 218
    (235, -1, 234, 232),    -- Completed either Poisoned Water or Stormers and NOT 218 AND NOT 230
    (236, -1, 235, 233);    -- Completed either Poisoned Water or Stormers and NOT 218 AND NOT 230 AND NOT 223


UPDATE `creature_template` SET 
    `gossip_menu_id` = 5065, 
    `ScriptName` = '' WHERE `entry` = 13278;

-- Gossips
DELETE FROM `gossip_menu` WHERE `entry` = 5065;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
    (5065, 6108, 228), -- Initial introduction
    (5065, 6109, 236), -- Completed either of the initial quests and none of the later conditions
    (5065, 6158, 218), -- Completed Hands, Honoured, ready for aqual
    (5065, 8541, 230), -- 1.11 and Revered, ready for Eternal Quintessence
    (5065, 8542, 223); -- Revered and (has an Eternal OR (has an aqual and NOT patch 1.11))


DELETE FROM `gossip_menu_option` WHERE `menu_id` = 5065;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
    (5065, 0, 0, 'I require a vial of Aqual Quintessence, Hydraxis, for I go to the Molten Core to extinguish a rune of the Firelords', 1, 1, -1, 0, 50650, 0, 0, '', 218);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
    (5065, 1, 0, 'I desire this Eternal Quintessence, Duke Hydraxis', 1, 1, -1, 0, 50651, 0, 0, '', 230);

DELETE FROM `gossip_scripts` WHERE `id` IN (50650, 50651);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `comments`) VALUES
    (50650, 0, 17, 17333, 1, 'Duke Hydraxis - Give players an Aqual Quintessence'),
    (50651, 0, 17, 22754, 1, 'Duke Hydraxis - Give players an Eternal Quintessence');

-- ----------
-- Mishta's Tailoring patterns, available in 1.11
INSERT IGNORE INTO `npc_vendor` (`entry`, `item`) VALUES
    (15179, 22683), -- Gaea's Embrace
    (15179, 22772), -- Sylvan Shoulders
    (15179, 22773), -- Sylvan Crown
    (15179, 22774); -- Sylvan Vest

-- ----------
-- Aendel Windspear Leatherworking
INSERT IGNORE INTO `npc_vendor` (`entry`, `item`) VALUES
    (15293, 22769), -- Bramblewood Belt
    (15293, 22770), -- Bramblewood Boots
    (15293, 22771); -- Bramblewood Helm

-- ----------
-- Meilosh Enchant Weapon - 2H Agility
INSERT IGNORE INTO `npc_vendor` (`entry`, `item`) VALUES 
    (11557, 22392);

-- ---------
-- Dungeon Set 2 (T0.5) changes/fixes
-- Chain starters
DELETE FROM `creature` where `id` IN (16013, 16012);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES 
    (2530189 , 16012, 1, 0, 0, 1915.67, -4170.77, 41.0061, 0.750492, 300, 0, 0, 4000, 0, 0, 0, 0),
    (2530187, 16013, 0, 0, 0, -4846.98, -1057.77, 502.19, 1.29154, 25000, 0, 0, 4400, 5751, 0, 0, 0);

-- Add Mor Grayhoof spawn triggers
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1604401, 1604402) AND `creature_id` = 16044;
INSERT INTO `creature_ai_scripts` 
    VALUES  ('1604401', '16044', '8', '0', '100', '2', '27184', '-1', '0', '0', '12', '16080', '1', '60000', '41', '0', '0', '0', '0', '0', '0', '0', 'Mor Grayhoof Trigger - Spawn Mor Grayhoof and Despawn Trigger on Summon Mor Grayhoof DND Spellhit'),
            ('1604402', '16044', '8', '0', '100', '2', '27203', '-1', '0', '0', '12', '16080', '1', '60000', '41', '0', '0', '0', '0', '0', '0', '0', 'Mor Grayhoof Trigger - Spawn Mor Grayhoof and Despawn Trigger on Summon Various DND Spellhit');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 16044;

-- Disable T0.5 100% test spawns
UPDATE `creature` SET `spawnFlags` = 2 WHERE `id` in (16042, 16080, 16118, 16101, 16102, 16097);

-- ADD GO "Arena Spoils" & ITS LOOT
DELETE FROM `gameobject_template` WHERE entry = 181074;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES 
    (181074, 3, 10, 'Arena Spoils', 0, 0, 1, 57, 181074, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_loot_template` WHERE entry = 181074;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES 
    (181074, 22305, 38, 1, 1, 1, 0),
    (181074, 22317, 17, 1, 1, 1, 0),
    (181074, 22318, 26, 1, 1, 1, 0),
    (181074, 22330, 19, 1, 1, 1, 0);

-- Add "Arena Spoils" to the map
DELETE FROM `gameobject` WHERE `guid` = 399068 AND `id` = 181074;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`)
    VALUES  (399068, 181074, 230, 602.083374, -187.792740, -54.081768, 4.925726, 0, 0, 0, -600, 100, 1, 0);

-- Remove loot tables from Theldren's lackys, but not Theldren himself (must drop quest item)
DELETE FROM `creature_loot_template` WHERE `entry` IN (16049, 16050, 16051, 16052, 16053, 16054, 16055, 16058);

-- Fix faction and flags of Theldren trigger in BRD arena
UPDATE `creature_template` 
    SET     `faction_A` = 35, `faction_H` = 35, `unit_class` = 0,
            `unit_flags` = 33554432 WHERE `entry` = 16079;

-- Fix faction of NPCs in Theldren challenge. All NPCs should be hostile to players
-- but the same faction so that the healers can heal
UPDATE `creature_template` 
    SET     `faction_A` = 48, `faction_H` = 48
    WHERE   `entry` IN (16049, 16050, 16051, 16052, 16053, 16054, 16055, 16058, 16059, 16095);

-- Fix spells on Theldren and his companions
-- Lefty's Five Fat Finger Exploding Heart Technique
-- TODO: Implement dummy effect that does massive damage if the unit moves too far
UPDATE `creature_template` SET `spell1` = 27673 WHERE `entry` = 16049;
-- NPC Bodley EquipID
UPDATE `creature_template` SET `equipment_id` = 16033 WHERE `entry` = 16033;
DELETE FROM `creature_equip_template` WHERE `entry` = 16033;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (16033, 13069, 0, 0);
UPDATE `creature_template_addon` SET `b2_0_sheath` = 1 WHERE `entry` = 16033;
UPDATE `creature_template_addon` SET `auras` = 27614 WHERE `entry` = 16033;
DELETE FROM `creature_addon` WHERE `guid` = 94490;
INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES 
    (94490, 0, 0, 1, 16, 0, 0, 27614);
-- Disable Bodley (Debug?) Gossip, previously 16030
UPDATE `creature_template` SET `gossip_menu_id` = 0 WHERE entry = 16033; 

-- These quests have no prereq
UPDATE `quest_template` SET `NextQuestId` = 0 WHERE `entry` IN (8962, 8963, 8964, 8965);

-- ---------
-- Remove certain drops from Majordomo's guards (they are contained in the chest)
DELETE FROM `creature_loot_template` 
    WHERE `entry` IN (11663, 11664) 
        AND `item` IN 
            (18646, 18703, 
             18806, 18809, 18810, 18812, 19140,
             18803, 18805, 18808, 18811, 19139);
