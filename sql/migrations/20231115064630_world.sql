DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231115064630');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231115064630');
-- Add your query below.


-- Archmage Tarsis Kir-Moldir 16381
-- remove c++ script (npc_archmage_tarsis), correct gossip menu id
UPDATE creature_template SET script_name='', gossip_menu_id=7229 WHERE entry=16381;
DELETE FROM gossip_menu WHERE entry IN (8400,8401,8402,8403,8404,8405,8406,8407,8408,8409);
DELETE FROM gossip_menu WHERE entry IN (7229,7228,7227,7226,7225,7224,7223,7222,7233,7232,7231);
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7229, 8524, 722901, 0),
(7228, 8517, 0, 0),
(7227, 8518, 0, 0),
(7226, 8519, 0, 0),
(7225, 8520, 0, 0),
(7224, 8521, 0, 0),
(7223, 8522, 0, 0),
(7222, 8523, 0, 0),
(7233, 8529, 0, 0),
(7232, 8530, 0, 0),
(7231, 8531, 0, 0);

DELETE FROM gossip_menu_option WHERE menu_id IN (8400,8401,8402,8403,8404,8405,8406,8407,8408);
DELETE FROM locales_gossip_menu_option WHERE menu_id IN (8400,8401,8402,8403,8404,8405,8406,8407,8408);
DELETE FROM gossip_menu_option WHERE menu_id IN (7228,7227,7226,7225,7224,7223,7222,7233,7232);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_broadcast_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`,`box_broadcast_text`,`condition_id`) VALUES
(7228, 0, 0, 'What are you talking about, mage?', 12283, 1, 1, 7227, 0, 0, 0, 0, NULL, 0, 2301),
(7228, 1, 0, 'What is it Tarsis? I don''t know what to do!', 12313, 1, 1, -1, 0, 722902, 0, 0, NULL, 0, 2300), -- guessed
(7227, 0, 0, 'Why have you done such horrible things?', 12285, 1, 1, 7226, 0, 0, 0, 0, NULL, 0, 0),
(7226, 0, 0, 'I still do not understand.', 12287, 1, 1, 7225, 0, 0, 0, 0, NULL, 0, 0),
(7225, 0, 0, 'You are talking nonsense, mage. ', 12289, 1, 1, 7224, 0, 0, 0, 0, NULL, 0, 0),
(7224, 0, 0, 'What staff?', 12291, 1, 1, 7223, 0, 0, 0, 0, NULL, 0, 0),
(7223, 0, 0, 'You said you would have it back. What does that mean?', 12293, 1, 1, 7222, 0, 0, 0, 0, NULL, 0, 0),
(7222, 0, 0, 'What happened to the staff?', 12304, 1, 1, 7233, 0, 0, 0, 0, NULL, 0, 0),
(7233, 0, 0, 'So what has led you to Naxxramas?', 12306, 1, 1, 7232, 0, 0, 0, 0, NULL, 0, 0),
(7232, 0, 0, 'So Kel''Thuzad holds all of the pieces?', 12308, 1, 1, 7231, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM conditions WHERE condition_entry IN (2300,2301);
INSERT INTO conditions (condition_entry, `type`, value1, value2, value3, value4, flags) VALUES
(2300, 2, 22727, 1, 0, 0, 0), -- player has 1 or more of item 22727 (Frame of Atiesh) in inventory
(2301, -3, 2300, 0, 0, 0, 0); -- NOT player has 1 or more of item 22727 (Frame of Atiesh) in inventory

DELETE FROM gossip_scripts WHERE id IN (722902,722901);
INSERT INTO `gossip_scripts` (`id`,`delay`,`priority`,`command`,`datalong`,`datalong2`,`datalong3`,`datalong4`,`target_param1`,`target_param2`,`target_type`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`condition_id`,`comments`) VALUES
(722901, 0, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Remove Gossip NPCFlag'),
(722901, 3, 0, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Set Stand State to Kneel'),
(722901, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12295, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Say Emote Text'), -- "%s gets to one knee."
(722901, 6, 0, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Set Stand State to Sit'),
(722901, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12296, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Say Emote Text'), -- "%s sits down."
(722901, 7, 0, 84, 7228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Set Default Gossip Menu Id to 7228'),
(722901, 8, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Add Gossip NPCFlag'),

(722902, 0, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Remove Gossip NPCFlag'),
(722902, 1, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Set Stand State to Stand'), -- guesswork
(722902, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12312, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Say Text'), -- "You... The frame! How? You must not... It... the Destroyer..."
(722902, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12314, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Say Emote Text'), -- "%s scratches at his throat."
(722902, 8, 0, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Tarsis Kir-Moldir - Cast Suicide'); -- guesswork


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
