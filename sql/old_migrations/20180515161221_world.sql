DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180515161221');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180515161221');
-- Add your query below.

-- Item: Tome of Conjured Food VII (Patch 1.09) drops & behaves weirdly - ok
-- https://github.com/elysium-project/bug-tracker/issues/130
-- Source: http://wowwiki.wikia.com/wiki/Patch_1.11.0?oldid=172632 "Conjure Food now has a new rank (Rank 7) available in Stratholme."
UPDATE `item_template` SET `patch`=9 WHERE `entry`=22897 AND `patch`=0;


-- Savage Gladiator Chain should have defense reduced in 1.7 - ok
-- https://github.com/LightsHope/issues/issues/84
DELETE FROM `item_template` WHERE `entry`=11726 AND `patch`=5;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `stat_type1`, `stat_value1`, `armor`, `delay`, `spellid_1`, `spelltrigger_1`, `spellid_2`, `spelltrigger_2`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`, `itemset`, `MaxDurability`, `DisenchantID`) VALUES 
(11726, 5, 4, 3, 'Savage Gladiator Chain', 28724, 4, 167666, 33533, 5, 57, 52, 7, 13, 369, 0, 14249, 1, 7598, 1, 0, 0, 1, 5, 1, 140, 64);


-- Messenger to Stormwind etc. - ok
-- https://github.com/LightsHope/issues/issues/258
UPDATE `quest_template` SET `PrevQuestId`=121 WHERE `entry`=143 AND `patch`=0;
UPDATE `quest_template` SET `PrevQuestId`=144 WHERE `entry`=145 AND `patch`=0;


-- DB/Quest: Rot Hide Ichor - Confirmed QAkvast - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21507
-- Source: Masterguide: 
UPDATE `quest_template` SET `PrevQuestId`=439 WHERE `entry`=443 AND `patch`=0;


-- Add missing smoke during Jin'Zil's Forest Magic (1058) quest - ok
-- Add missing wisp spawns leaving the cave
-- Source: http://wowwiki.wikia.com/wiki/Quest:Jin%27Zil%27s_Forest_Magic
-- https://github.com/TrinityCore/TrinityCore/issues/21456
DELETE FROM `quest_end_scripts` WHERE `id`=1058;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1058, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: npc\_flag questgiver removed'),
(1058, 2, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -272.48, -394.084, 17.2051, 4.0078, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Turn'),
(1058, 3, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Roar emote'),
(1058, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1405, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Say text 1'),
(1058, 3, 9, 399737, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'in\'Zil\'s Forest Magic - Jin\'Zil\'s: Spawn smoke'), -- only line added
(1058, 5, 15, 6584, 0, 0, 0, 32294, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Jin\'Zil\'s Curse on Elf 3'),
(1058, 5, 15, 6584, 0, 0, 0, 32293, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Jin\'Zil\'s Curse on Elf 2'),
(1058, 5, 15, 6584, 0, 0, 0, 32292, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Jin\'Zil\'s Curse on Elf 1'),
(1058, 5, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Laugh emote'),
(1058, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1406, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Say text 2'),
(1058, 7, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -268.12, -397.16, 16.97, 5.53, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Walk to Elf'),
(1058, 10, 15, 5, 0, 0, 0, 32294, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Death Touch'),
(1058, 10, 15, 5, 0, 0, 0, 32293, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Death Touch'),
(1058, 10, 15, 5, 0, 0, 0, 32292, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Death Touch'),
(1058, 11, 10, 7570, 12000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, -265.448, -399.296, 17.2284, 0.5, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Elven Wisp 1'),
(1058, 11, 10, 7570, 14000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, -267.003, -403.446, 17.5948, 0.5, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Elven Wisp 2'),
(1058, 11, 10, 7570, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, -278.16, -401.357, 18.9558, 0.5, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Elven Wisp 3'),
(1058, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1407, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Say text 3'),
(1058, 14, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -272.48, -394.084, 17.2051, 3.053, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Walk back'),
(1058, 17, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -272.48, -394.084, 17.2051, 6.19592, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Turn'),
(1058, 18, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: npc\_flag questgiver added');

-- Add smoke to GUID
DELETE FROM `gameobject` WHERE `guid`=399737; -- Empty guid
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES 
(399737, 19544, 1, -273.9, -396.2, 17.3, 0, 0, 0, -15, -15, 100, 1);

-- Add waypoints for wisps
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=7570 AND `patch`=0;
DELETE FROM `creature_movement_template` WHERE `entry`=7570;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES 
(7570, 1, -266.6, -393.1, 17, 0.5),
(7570, 2, -252.7, -384.6, 17.2, 0.65),
(7570, 3, -241.1, -375.7, 17.8, 0.63);

 
-- Change quest scripts to use emote 26 (state stand) instead of 30 (state none) - ok
-- State none breaks continued gossip behavior of the NPC, no more turning to face the player
UPDATE `quest_end_scripts` SET `datalong`=26, `comments`='Blood of Innocents - Apothecary Lydon: Emote stand state' WHERE `id`=1066 AND `delay`=4 AND `command`=1 AND `datalong`=30;
UPDATE `quest_end_scripts` SET `datalong`=26, `comments`='Return to Thunder Bluff - Apothecary Zamah: Emote stand state' WHERE `id`=1067 AND `delay`=4 AND `command`=1 AND `datalong`=30;
UPDATE `quest_end_scripts` SET `datalong`=26, `comments`='Collecting Kelp - William Pestle: Emote stand state' WHERE `id`=112 AND `delay`=6 AND `command`=1 AND `datalong`=30;

-- Fix kneel emote for quest end script Parts for Kravel (1112) - ok
UPDATE `quest_end_scripts` SET `command`=28, `datalong`=8, `comments`='Parts for Kravel - Kravel Koalbeard: Kneel state' WHERE `id`=1112 AND `delay`=4 AND `command`=1;
UPDATE `quest_end_scripts` SET `command`=28, `datalong`=0, `comments`='Parts for Kravel - Kravel Koalbeard: Stand state' WHERE `id`=1112 AND `delay`=9 AND `command`=1;


-- [1964][TBCDB] Add end script for quest 444 - ok
-- https://github.com/cmangos/classic-db/commit/c91f454ecdb6b807a2daad746c15eaf856cabde3
UPDATE `quest_template` SET `CompleteScript`=444 WHERE `entry`=444;
DELETE FROM `quest_end_scripts` WHERE `id`=444;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(444, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Origins - Bethor Iceshard: npc\_flag questgiver removed'),
(444, 2, 15, 5017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Origins - Bethor Iceshard: Cast spell "Divining Trance"'),
(444, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 513, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Origins - Bethor Iceshard: Emote text 1'),
(444, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 514, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Origins - Bethor Iceshard: Say text 1'),
(444, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 515, 516, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Origins - Bethor Iceshard: Say random 2'),
(444, 10, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Origins - Bethor Iceshard: Emote talk'),
(444, 12, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rot Hide Origins - Bethor Iceshard: npc\_flag questgiver added');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
