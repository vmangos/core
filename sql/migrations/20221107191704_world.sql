DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221107191704');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221107191704');
-- Add your query below.

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES 
(10994, 8, 3639, 0, 0, 0, 0), -- Condition for completing Show Your Work (goblin engineering)
(10995, 8, 3641, 0, 0, 0, 0), -- Condition for completing Show Your Work (gnomish engineering - alliance side) 
(10996, 8, 3643, 0, 0, 0, 0), -- Condition for completing Show Your Work (gnomish engineering - horde side) 
(10998, -2, 10994, 10995, 10996, 0, 0), -- Condition to return true if any of the above quests are complete
(10999, 17, 20219, 1, 0, 0, 0), -- Condition to return true if the player has NOT learnt Gnomish Engineering
(11000, 17, 20222, 1, 0, 0, 0), -- Condition to return true if the player has NOT learnt Goblin Engineering
(11001, -2, 10999, 11000, 0, 0, 0), -- Condition to return true if the player has NOT learnt Gnomish Engineering OR Goblin Engineering
-- Note: Condition 4018 corresponds to a condition checking if the current patch is 1.10 or higher
-- Note: Condition 393 corresponds to a condition checking if the player has an Engineering skill of 200
(11002, -1, 11001, 10998, 393, 4018, 0), -- Condition to return true if the player doesn't have an Engineering specialisation, completed one of the Engineering specialisation quests, and has a skill of 200 Engineering, and the current patch is 1.10 or later
(11003, -1, 11001, 10995, 393, 10994, 0), -- Same as above (missing patch requirement) but requires specifically completing Show Your Work (gnomish engineering - alliance side) or Show Your Work (goblin engineering) for gossip option
(11004, -1, 11001, 10996, 393, 10994, 0), -- Same as above (missing patch requirement) but requires specifically completing Show Your Work (gnomish engineering - horde side) or Show Your Work (goblin engineering) for gossip option
(11005, -1, 11003, 4018, 0, 0, 0), -- Add patch requirement to alliance-side gossip condition
(11006, -1, 11004, 4018, 0, 0, 0), -- Add patch requirement to horde-side gossip condition
(11027, -1, 11002, 11023, 0, 0, 1), -- NAND gate for Leatherworking and Engineering requirements for Book "Soothsaying for Dummies" gossip (If the conditions for both Leatherworking and Engineering gossips are met then this condition allows to easily decide what should be displayed)
(11028, -1, 11002, 11027, 0, 0, 0), -- Condition for Book "Soothsaying for Dummies" Engineering gossip
(11009, 7, 165, 225, 0, 0, 0), -- Condition for Leatherworking skill of 225
(11010, 8, 5141, 0, 0, 0, 0), -- Condition for completing Dragonscale Leatherworking (alliance side)
(11011, 8, 5143, 0, 0, 0, 0), -- Condition for completing Tribal Leatherworking (alliance side)
(11012, 8, 5144, 0, 0, 0, 0), -- Condition for completing Elemental Leatherworking (alliance side)
(11013, -2, 11012, 11011, 11010, 0, 0), -- Condition to return true if any of the above quests are complete
(11014, 8, 5145, 0, 0, 0, 0), -- Condition for completing Dragonscale Leatherworking (horde side)
(11015, 8, 5148, 0, 0, 0, 0), -- Condition for completing Tribal Leatherworking (horde side)
(11016, 8, 5146, 0, 0, 0, 0), -- Condition for completing Elemental Leatherworking (horde side)
(11017, -2, 11014, 11015, 11016, 0, 0), -- Condition to return true if any of the above quests are complete
(11018, -2, 11013, 11017, 0, 0, 0), -- Condition to return true if either of the two above OR conditions are true
(11019, 17, 10660, 0, 0, 0, 0), -- Condition to return true if the player has learnt Tribal Leatherworking
(11020, 17, 10658, 0, 0, 0, 0), -- Condition to return true if the player has learnt Elemental Leatherworking
(11021, 17, 10656, 0, 0, 0, 0), -- Condition to return true if the player has learnt Dragonscale Leatherworking
(11022, -2, 11019, 11020, 11021, 0, 1), -- Condition to return true if the player has NOT learnt Tribal, Elemental, OR Dragonscale Leatherworking
(11023, -1, 11009, 11018, 11022, 4018, 0), -- Condition to return true if the player doesn't have a Leatherworking specialisation, completed one of the Leatherworking specialisation quests, and has a skill of 225 Leatherworking, and the current patch is 1.10 or later
(11034, -1, 11023, 11027, 0, 0, 0), -- Condition for Book "Soothsaying for Dummies" Leatherworking gossip
(11035, -3, 11027, 0, 0, 0, 0), -- Condition if requirements for both Engineering and Leatherworking gossip is met
(11036, -2, 11035, 11028, 0, 0, 0); -- Gossip for Book Soothslaying for Dummies if both requirements are met (Uses engineering text with this implementation. Can be checked for correct text, although properly accounting for the case of someone being able to relearn both a leatherworking and an engineering specialisation at this book is absurd)

INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) VALUES 
(21000, 11880, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21001, 11882, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21002, 11884, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21003, 11875, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21004, 11894, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21005, 11900, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21006, 11902, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21007, 11892, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21008, 11899, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21009, 11901, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(1469, 21000, 0, 11002), -- Gossip for Nixx Sprocketspring
(1468, 21001, 0, 11005), -- Gossip for Tinkmaster Overspark
(1467, 21002, 0, 11006), -- Gossip for Oglethorpe Obnoticus
(7058, 21003, 0, 11036), -- Gossip for Book Soothslaying for Dummies (Engineering), and for both req
(7058, 21007, 0, 11034), -- Gossip for Book Soothslaying for Dummies (Leatherworking)
(22000, 21004, 0, 0), -- Gossip sub-menu for Dragonscale Leatherworking (male)
(22001, 21005, 0, 0), -- Gossip sub-menu for Elemental Leatherworking (male)
(22002, 21006, 0, 0), -- Gossip sub-menu for Tribal Leatherworking (male)
(22003, 21008, 0, 0), -- Gossip sub-menu for Elemental Leatherworking (female)
(22004, 21009, 0, 0); -- Gossip sub-menu for Tribal Leatherworking (male)

INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2861, 0, 0, 15, 20221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Book Soothsaying for Dummies - Teach Goblin Engineering'),
(2862, 0, 0, 15, 20220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Book Soothsaying for Dummies - Teach Gnomish Engineering'),
(2863, 0, 0, 15, 10657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Book Soothsaying for Dummies - Teach Dragonscale Leatherworking'),
(2864, 0, 0, 15, 10659, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Book Soothsaying for Dummies - Teach Elemental Leatherworking'),
(2865, 0, 0, 15, 10661, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Book Soothsaying for Dummies - Teach Tribal Leatherworking');

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(7058, 1, 0, 'I am 100% confident that I wish to learn in the ways of goblin engineering.', 11876, 1, 1, -1, 0, 2861, 0, 0, '', 0, 11005),
(7058, 2, 0, 'I am 100% confident that I wish to learn in the ways of gnomish engineering.', 11878, 1, 1, -1, 0, 2862, 0, 0, '', 0, 11005),
(7058, 3, 0, 'I am absolutely certain that I want to learn dragonscale leatherworking.', 11889, 1, 1, -1, 0, 2863, 0, 0, '', 0, 11023),
(7058, 4, 0, 'I am absolutely certain that I want to learn elemental leatherworking.', 11890, 1, 1, -1, 0, 2864, 0, 0, '', 0, 11023),
(7058, 5, 0, 'I am absolutely certain that I want to learn tribal leatherworking.', 11876, 1, 1, -1, 0, 2865, 0, 0, '', 0, 11023),
(3067, 2, 0, 'I wish to learn my leatherworking focus.', 8678, 1, 19, 22000, 0, 0, 0, 0, '', 0, 11023),
(3068, 2, 0, 'I wish to learn my leatherworking focus.', 8678, 1, 19, 22000, 0, 0, 0, 0, '', 0, 11023),
(3069, 2, 0, 'I wish to learn my leatherworking focus.', 8678, 1, 19, 22001, 0, 0, 0, 0, '', 0, 11023),
(3070, 2, 0, 'I wish to learn my leatherworking focus.', 8678, 1, 19, 22003, 0, 0, 0, 0, '', 0, 11023),
(3072, 2, 0, 'I wish to learn my leatherworking focus.', 8678, 1, 19, 22004, 0, 0, 0, 0, '', 0, 11023), -- I don't know why it skips 3071
(3073, 2, 0, 'I wish to learn my leatherworking focus.', 8678, 1, 19, 22002, 0, 0, 0, 0, '', 0, 11023);

-- Remove deprecated field trainer spell that is preventing proper implementation
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` = 7406 AND `patch` = 0; -- Trainer gossip for Oglethorpe Obnoticus (Gnomish Engineering - Horde)
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` = 7866 AND `patch` = 0; -- Trainer gossip for Peter Galen (Dragonscale Leatherworking - Alliance)
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` = 7867 AND `patch` = 0; -- Trainer gossip for Thorkaf Dragoneye (Dragonscale Leatherworking - Horde)
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` = 7868 AND `patch` = 0; -- Trainer gossip for Sarah Tanner (Elemental Leatherworking - Alliance)
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` = 7868 AND `patch` = 0; -- Trainer gossip for Brumn Winterhoof (Elemental Leatherworking - Horde)
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` = 7870 AND `patch` = 0; -- Trainer gossip for Caryssia Moonhunter (Tribal Leatherworking - Alliance)
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` = 7871 AND `patch` = 0; -- Trainer gossip for Se'Jib (Tribal Leatherworking - Horde)
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` = 7944 AND `patch` = 0; -- Trainer gossip for Tinkmaster Overspark (Gnomish Engineering - Alliance)
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` = 8126 AND `patch` = 0; -- Trainer gossip for Nixx Sprocketspring (Goblin Engineering)

-- Note: Condition 1367 corresponds to a condition checking if the player has learnt Goblin Engineering
-- Note: Condition 1368 corresponds to a condition checking if the player has learnt Gnomish Engineering
-- Note: Condition 1371 corresponds to a condition checking if the player has a Goblin Engineer Membership Card in their inventory
-- Note: Condition 1374 corresponds to a condition checking if the player has a Gnome Engineer Membership Card in their inventory
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES 
(11037, -1, 1367, 1371, 0, 0, 0), -- Condition for goblin engineering trainer gossip
(11038, -1, 1368, 1374, 0, 0, 0), -- Condition for gnomish engineering trainer gossip
(11039, -1, 11038, 2, 0, 0, 0); -- Condition for gnomish engineering trainer gossip for horde (Oglethorpe is a neutral NPC)
  
-- Add missing trainer gossip menu options
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(3068, 0, 3, 'I would like to train.', 2548, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 11021), -- Trainer gossip menu option for Thorkaf Dragoneye (Dragonscale Leatherworking - Horde)
(3069, 0, 3, 'I would like to train.', 2548, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 11020); -- Trainer gossip menu option for Brumn Winterhoof (Elemental Leatherworking - Horde)

-- Update condition for existing trainer gossip menu options
UPDATE `gossip_menu_option` SET `condition_id` = 11039 WHERE `menu_id` = 1467 AND `id` = 0; -- Condition for trainer gossip for Oglethorpe Obnoticus (Gnomish Engineering - Horde)
UPDATE `gossip_menu_option` SET `condition_id` = 11038 WHERE `menu_id` = 1468 AND `id` = 0; -- Condition for trainer gossip for Tinkmaster Overspark (Gnomish Engineering - Alliance)
UPDATE `gossip_menu_option` SET `condition_id` = 11037 WHERE `menu_id` = 1469 AND `id` = 0; -- Condition for trainer gossip for Nixx Sprocketspring (Goblin Engineering)
UPDATE `gossip_menu_option` SET `condition_id` = 11021 WHERE `menu_id` = 3067 AND `id` = 0; -- Condition for trainer gossip for Peter Galen (Dragonscale Leatherworking - Alliance)
UPDATE `gossip_menu_option` SET `condition_id` = 11020 WHERE `menu_id` = 3070 AND `id` = 0; -- Trainer gossip for Sarah Tanner (Elemental Leatherworking - Alliance)
UPDATE `gossip_menu_option` SET `condition_id` = 11019 WHERE `menu_id` = 3072 AND `id` = 0; -- Condition for trainer gossip for Caryssia Moonhunter (Tribal Leatherworking - Alliance)
UPDATE `gossip_menu_option` SET `condition_id` = 11019 WHERE `menu_id` = 3073 AND `id` = 0; -- Condition for trainer gossip for Se'Jib (Tribal Leatherworking - Horde)

-- Delete now unused condition
DELETE FROM `conditions` WHERE `condition_entry` = 1357;

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES 
(11040, 30, 46, 3, 0, 0, 0), -- Condition to check if the player has less than 6000 Armorsmithing reputation
(11041, 30, 289, 3, 0, 0, 0), -- Condition to check if the player has less than 6000 Weaponsmithing reputation
-- Note: Condition 178 corresponds to a condition checking if the player is level 40 or higher
-- Note: Condition 368 corresponds to a condition checking if the player has a Blacksmithing skill of 200
(11042, 8, 5283, 0, 0, 0, 0), -- Condition to check if the player has completed "The Art of the Armorsmith" (Alliance)
(11043, 8, 5284, 0, 0, 0, 0), -- Condition to check if the player has completed "The Way of the Weaponsmith" (Alliance)
(11044, 8, 5301, 0, 0, 0, 0), -- Condition to check if the player has completed "The Art of the Armorsmith" (Horde)
(11045, 8, 5302, 0, 0, 0, 0), -- Condition to check if the player has completed "The Way of the Weaponsmith" (Horde)
(11046, -2, 11042, 11044, 0, 0, 0), -- Condition to check if the player has completed "The Art of the Armorsmith" (Both factions)
(11047, -2, 11043, 11045, 0, 0, 0), -- Condition to check if the player has completed "The Way of the Weaponsmith" (Both factions)
-- Note: Condition 1356 corresponds to a condition checking if the player has NOT learnt Armorsmith AND has NOT learnt Weaponsmith
(11048, -1, 178, 368, 1356, 11046, 0), -- Condition for respecialisation gossip by Bengus Deepforge (Alliance) and Krathok Moltenfist (Horde) for players who were previously armorsmiths
(11049, -1, 178, 368, 1356, 11047, 0), -- Condition for respecialisation gossip by Bengus Deepforge (Alliance) and Krathok Moltenfist (Horde) for players who were previously weaponsmiths
(11050, 8, 5305, 0, 0, 0, 0), -- Condition to check if the player has completed "Sweet Serenity" (Hammersmith sub-specialisation)
(11051, 8, 5306, 0, 0, 0, 0), -- Condition to check if the player has completed "Snakestone of the Shadow Huntress" (Axesmith sub-specialisation)
(11052, 8, 5307, 0, 0, 0, 0), -- Condition to check if the player has completed "Corruption" (Swordsmith sub-specialisation)
(11053, -2, 11050, 11051, 11052, 0, 0), -- Condition to check if the player has completed any of the above quests
-- Note: Condition 1351 corresponds to a condition checking if the player has a Blacksmithing skill of 250
-- Note: Condition 1352 corresponds to a condition checking if the player has learnt Artisan Weaponsmith
-- Note: Condition 1364 corresponds to a condition checking if the player has NOT learnt any of the weaponsmith sub-specialisations
(11054, -1, 1351, 1352, 1364, 11053, 0), -- Condition for respecialisation for weaponsmith sub-specialisations
(11055, -1, 178, 368, 11040, 11041, 0), -- Condition for first specialisation gossip by Bengus Deepforge (Alliance) and Krathok Moltenfist (Horde)
(11056, -2, 11048, 11049, 0, 0, 0), -- Condition to check if the player meets requirements for respecialisation
-- Note: Condition 1354 corresponds to a condition checking if the player has learnt Armorsmithing
(11057, -2, 1354, 11040, 11042, 0, 1); -- Condition to check if the player has Armorsmithing reputation, has NOT completed "The Art of the Armorsmith" (Alliance), NOR learnt Armorsmithing (for special Grumnus Steelshaper gossip)

UPDATE `quest_template` SET `RequiredMinRepFaction` = 46, `RequiredMinRepValue` = 6000  WHERE `entry` = 5283; -- Add Armorsmithing reputation requirement for "The Art of the Armorsmith" (Alliance)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 46, `RequiredMinRepValue` = 6000  WHERE `entry` = 5301; -- Add Armorsmithing reputation requirement for "The Art of the Armorsmith" (Horde)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 289, `RequiredMinRepValue` = 6000  WHERE `entry` = 5284; -- Add Weaponsmithing reputation requirement for "The Way of the Weaponsmith" (Alliance)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 289, `RequiredMinRepValue` = 6000  WHERE `entry` = 5302; -- Add Weaponsmithing reputation requirement for "The Way of the Weaponsmith" (Horde)

DELETE FROM `gossip_scripts` WHERE `id`=318201;
DELETE FROM `gossip_scripts` WHERE `id`=318202;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(318201, 0, 1, 35, 0, 0, 0, 0, 11177, 10, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Krathok Moltenfist - Set Orientation (Armorsmithing)'),
(318201, 0, 0, 15, 17451, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11055, 'Krathok Moltenfist - Cast Reputation - Armorsmithing'),
(318201, 3, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Krathok Moltenfist - Emote (Armorsmithing)'),
(318201, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6491, 0, 0, 0, 0, 0, 0, 0, 0, 'Krathok Moltenfist - Talk (Armorsmithing)'),
(318201, 6, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.95157, 0, 'Krathok Moltenfist - Set Orientation'),
(318202, 0, 1, 35, 0, 0, 0, 0, 11178, 10, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Krathok Moltenfist - Set Orientation (Weaponsmithing)'),
(318202, 0, 0, 15, 17452, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11055, 'Krathok Moltenfist - Cast Reputation - Weaponsmithing'),
(318202, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6490, 0, 0, 0, 0, 0, 0, 0, 0, 'Krathok Moltenfist - Talk (Weaponsmithing)'),
(318202, 6, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.95157, 0, 'Krathok Moltenfist - Set Orientation'),
(318203, 0, 0, 15, 9790, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11056, 'Cast Artisan Armorsmith'),
(318204, 0, 0, 15, 9789, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11056, 'Cast Artisan Weaponsmith'),
(318205, 0, 0, 15, 17451, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11055, 'Myolor Sunderfury - Cast Reputation - Armorsmithing'),
(318205, 0, 1, 35, 0, 0, 0, 0, 5164, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Myolor Sunderfury - Set Orientation (Armorsmithing)'),
(318205, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6487, 0, 0, 0, 0, 0, 0, 0, 0, 'Myolor Sunderfury - Talk (Armorsmithing)'),
(318205, 3, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Myolor Sunderfury - Emote (Armorsmithing)'),
(318205, 6, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.48033, 0, 'Myolor Sunderfury - Set Orientation'),
(318206, 0, 0, 15, 17452, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11055, 'Myolor Sunderfury - Cast Reputation - Weaponsmithing'),
(318206, 0, 1, 35, 0, 0, 0, 0, 11146, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Myolor Sunderfury - Set Orientation (Weaponsmithing)'),
(318206, 3, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Myolor Sunderfury - Emote (Weaponsmithing)'),
(318206, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6486, 0, 0, 0, 0, 0, 0, 0, 0, 'Myolor Sunderfury - Talk (Weaponsmithing)'),
(318206, 6, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.48033, 0, 'Myolor Sunderfury - Set Orientation');

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(3182, 2, 0, 'Myolor, I was once an armorsmith and wish to retake the hammer once more! Teach me the way of the armorsmith.', 8892, 1, 3, -1, 0, 318203, 0, 0, '', 0, 11048),
(3182, 3, 0, 'Myolor, I was once a weaponsmith and wish to retake the hammer once more! Teach me the way of the weaponsmith!', 8893, 1, 3, -1, 0, 318204, 0, 0, '', 0, 11049), -- Interesting to note this the only option to have 2 exclamation marks, an odd inconsistency by Blizzard.
(3182, 4, 0, 'Myolor, I was once an armorsmith and wish to instead learn the way of the weaponsmith. Will you teach me?', 10895, 1, 3, -1, 0, 318204, 0, 0, '', 0, 11048),
(3182, 5, 0, 'Myolor, I was once a weaponsmith and wish to instead learn the way of the armorsmith. Will you teach me?', 10896, 1, 3, -1, 0, 318203, 0, 0, '', 0, 11049),
(3187, 2, 0, 'Krathok, I was once an armorsmith and wish to retake the hammer once more! Teach me the way of the armorsmith.', 8894, 1, 3, -1, 0, 318203, 0, 0, '', 0, 11048),
(3187, 3, 0, 'Krathok, I was once a weaponsmith and wish to retake the hammer once more! Teach me the way of the weaponsmith.', 8895, 1, 3, -1, 0, 318204, 0, 0, '', 0, 11049),
(3187, 4, 0, 'Krathok, I was once an armorsmith and wish to instead learn the ways of the weaponsmith. Will you train me?', 10897, 1, 3, -1, 0, 318204, 0, 0, '', 0, 11048),
(3187, 5, 0, 'Krathok, I was once a weaponsmith and wish to instead learn the ways of the armorsmith. Will you train me?', 10898, 1, 3, -1, 0, 318203, 0, 0, '', 0, 11049);

-- Update first specialisation gossip and scripts to new condition and new scripts
UPDATE `gossip_menu` SET `condition_id` = 11055 WHERE `entry` = 3187 AND `text_id` = 3953; -- Specialisation gossip for Krathok Moltenfist
UPDATE `gossip_menu` SET `condition_id` = 11055 WHERE `entry` = 3182 AND `text_id` = 3938; -- Specialisation gossip for Myolor Sunderfury
UPDATE `gossip_menu` SET `condition_id` = 11057 WHERE `entry` = 597 AND `text_id` = 1136; -- Special gossip for Grumnus Steelshaper
UPDATE `gossip_menu_option` SET `condition_id` = 11055, `action_script_id` = 318205 WHERE `menu_id` = 3182 AND `id` = 0; -- Armorsmith Alliance
UPDATE `gossip_menu_option` SET `condition_id` = 11055, `action_script_id` = 318206 WHERE `menu_id` = 3182 AND `id` = 1; -- Weaponsmith Alliance
UPDATE `gossip_menu_option` SET `condition_id` = 11055, `action_script_id` = 318201 WHERE `menu_id` = 3187 AND `id` = 0; -- Armorsmith Horde
UPDATE `gossip_menu_option` SET `condition_id` = 11055, `action_script_id` = 318202 WHERE `menu_id` = 3187 AND `id` = 1; -- Weaponsmith Horde

-- Update respecialisation gossip for sub-specialisations only for respecialisation
UPDATE `gossip_menu_option` SET `condition_id` = 11054 WHERE `menu_id` = 6089 AND `id` = 0;
UPDATE `gossip_menu_option` SET `condition_id` = 11054 WHERE `menu_id` = 6090 AND `id` = 0;
UPDATE `gossip_menu_option` SET `condition_id` = 11054 WHERE `menu_id` = 6091 AND `id` = 0;

-- Correct Reward spells for quest templates for specialisations
UPDATE `quest_template` SET `RewSpell` = 9788, `RewSpellCast` = 9790 WHERE `entry` = 5283; -- Armorsmithing (Alliance)
UPDATE `quest_template` SET `RewSpell` = 9788, `RewSpellCast` = 9790 WHERE `entry` = 5301; -- Armorsmithing (Horde)
UPDATE `quest_template` SET `RewSpell` = 9787, `RewSpellCast` = 9789  WHERE `entry` = 5284; -- Weaponsmithing (Alliance)
UPDATE `quest_template` SET `RewSpell` = 9787, `RewSpellCast` = 9789  WHERE `entry` = 5302; -- Weaponsmithing (Horde)
UPDATE `quest_template` SET `RewSpell` = 17040, `RewSpellCast` = 17044  WHERE `entry` = 5305; -- Hammersmithing
UPDATE `quest_template` SET `RewSpell` = 17041, `RewSpellCast` = 17043  WHERE `entry` = 5306; -- Axesmithing
UPDATE `quest_template` SET `RewSpell` = 17039, `RewSpellCast` = 17042  WHERE `entry` = 5307; -- Swordsmithing
UPDATE `quest_template` SET `RewSpell` = 10660  WHERE `entry` = 5143; -- Tribal Leatherworking (Alliance)
UPDATE `quest_template` SET `RewSpell` = 10660  WHERE `entry` = 5148; -- Tribal Leatherworking (Horde)
UPDATE `quest_template` SET `RewSpell` = 10658  WHERE `entry` = 5144; -- Elemental Leatherworking (Alliance)
UPDATE `quest_template` SET `RewSpell` = 10658  WHERE `entry` = 5146; -- Elemental Leatherworking (Horde)
UPDATE `quest_template` SET `RewSpell` = 10656  WHERE `entry` = 5141; -- Dragonscale Leatherworking (Alliance)
UPDATE `quest_template` SET `RewSpell` = 10656  WHERE `entry` = 5145; -- Dragonscale Leatherworking (Horde)
UPDATE `quest_template` SET `RewSpell` = 20222  WHERE `entry` = 3639; -- Goblin Engineering
UPDATE `quest_template` SET `RewSpell` = 20219  WHERE `entry` = 3641; -- Gnomish Engineering (Alliance)
UPDATE `quest_template` SET `RewSpell` = 20219  WHERE `entry` = 3639; -- Gnomish Engineering (Horde)

-- Correct specialisations teaching artisan of profession
UPDATE `spell_chain` WHERE `spell_id` = 9787 SET `prev_spell` = 3538, `rank` = 4; -- Correct for Weaponsmithing
UPDATE `spell_chain` WHERE `spell_id` = 9788 SET `prev_spell` = 3538, `rank` = 4; -- Correct for Armorsmithing
UPDATE`spell_chain` WHERE `spell_id` = 10656 SET `prev_spell` = 3811, `rank` = 4; -- Correct for Dragonscale leatherworking
UPDATE `spell_chain` WHERE `spell_id` = 10658 SET `prev_spell` = 3811, `rank` = 4; -- Correct for Elemental leatherworking
UPDATE `spell_chain` WHERE `spell_id` = 10660 SET `prev_spell` = 3811, `rank` = 4; -- Correct for Tribal leatherworking
UPDATE `spell_chain` WHERE `spell_id` = 20219 SET `prev_spell` = 4038, `rank` = 4; -- Correct for Gnomish engineering
UPDATE `spell_chain` WHERE `spell_id` = 20222 SET `prev_spell` = 4038, `rank` = 4; -- Correct for Goblin engineering
UPDATE `spell_chain` WHERE `spell_id` = 17039 SET `rank` = 5; -- Correct for Swordsmithing
UPDATE `spell_chain` WHERE `spell_id` = 17040 SET `rank` = 5; -- Correct for Hammersmithing
UPDATE `spell_chain` WHERE `spell_id` = 17041 SET `rank` = 5; -- Correct for Axesmithing

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
