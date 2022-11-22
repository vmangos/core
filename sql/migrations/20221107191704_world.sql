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
(11007, -1, 11002, 11023, 0, 0, 1), -- NAND gate for Leatherworking and Engineering requirements for Book "Soothsaying for Dummies" gossip (If the conditions for both Leatherworking and Engineering gossips are met then this condition allows to easily decide what should be displayed)
(11008, -1, 11002, 11007, 0, 0, 0), -- Condition for Book "Soothsaying for Dummies" Engineering gossip
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
(11019, 17, 10660, 1, 0, 0, 0), -- Condition to return true if the player has NOT learnt Tribal Leatherworking
(11020, 17, 10658, 1, 0, 0, 0), -- Condition to return true if the player has NOT learnt Elemental Leatherworking
(11021, 17, 10656, 1, 0, 0, 0), -- Condition to return true if the player has NOT learnt Dragonscale Leatherworking
(11022, -2, 11019, 11021, 0, 0, 0), -- Condition to return true if the player has NOT learnt Tribal, Elemental, OR Dragonscale Leatherworking
(11023, -1, 11009, 11018, 11022, 4018, 0), -- Condition to return true if the player doesn't have a Leatherworking specialisation, completed one of the Leatherworking specialisation quests, and has a skill of 225 Leatherworking, and the current patch is 1.10 or later
(11024, -1, 11023, 11007, 0, 0, 0), -- Condition for Book "Soothsaying for Dummies" Engineering gossip
(11025, -3, 11007, 0, 0, 0, 0), -- Condition if requirements for both Engineering and Leatherworking gossip is met
(11026, -2, 11025, 11008, 0, 0, 0); -- Gossip for Book Soothslaying for Dummies includes if both requirements are met (Uses engineering text for now because I have no idea what is correct)

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
(7058, 21003, 0, 11026), -- Gossip for Book Soothslaying for Dummies (Engineering), and for both req
(7058, 21007, 0, 11024), -- Gossip for Book Soothslaying for Dummies (Leatherworking)
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

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
