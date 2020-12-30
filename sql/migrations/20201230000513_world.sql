DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201230000513');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201230000513');
-- Add your query below.


-- Add correct gossip menu for High Inquisitor Fairbanks.
DELETE FROM `npc_text` WHERE `ID` IN (8599, 8600, 8601, 8602, 8603, 8604, 8605, 8606, 8607, 8608, 8609, 8610, 8611, 8612, 8613, 8614, 8615);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES
(8595, 1, 12480),
(8596, 1, 12482),
(8597, 1, 12484),
(8598, 1, 12486),
(8599, 1, 12488),
(8600, 1, 12490),
(8601, 1, 12492),
(8602, 1, 12494),
(8603, 1, 12496),
(8604, 1, 12498),
(8605, 1, 12500),
(8606, 1, 12502),
(8607, 1, 12504),
(8608, 1, 12506),
(8609, 1, 12508),
(8610, 1, 12510),
(8612, 1, 12512);
DELETE FROM `gossip_menu` WHERE `entry` BETWEEN 30101 AND 30117;
DELETE FROM `gossip_menu_option` WHERE `menu_id` BETWEEN 30101 AND 30117;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7284, 8612, 0, 0),
(7283, 8595, 0, 0),
(7282, 8596, 0, 0),
(7281, 8597, 0, 0),
(7280, 8598, 0, 0),
(7279, 8599, 0, 0),
(7278, 8600, 0, 0),
(7277, 8601, 0, 0),
(7276, 8602, 0, 0),
(7275, 8603, 0, 0),
(7274, 8604, 0, 0),
(7273, 8605, 0, 0),
(7272, 8606, 0, 0),
(7271, 8607, 0, 0),
(7270, 8608, 0, 0),
(7269, 8609, 0, 0),
(7268, 8610, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9000, 2, 22691, 1, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(7268, 0, 0, 'But his son is dead.', 12511, 1, 1, 7284, 0, 0, 0, 0, NULL, 0, 0),
(7269, 0, 0, 'You tell an incredible tale, Fairbanks. What of the blade? Is it beyond redemption?', 12509, 1, 1, 7268, 0, 0, 0, 0, NULL, 0, 0),
(7270, 0, 0, 'And you did...', 12507, 1, 1, 7269, 0, 0, 0, 0, NULL, 0, 0),
(7271, 0, 0, 'You were right, Fairbanks. That is tragic.', 12505, 1, 1, 7270, 0, 0, 0, 0, NULL, 0, 0),
(7272, 0, 0, 'You mean...', 12503, 1, 1, 7271, 0, 0, 0, 0, NULL, 0, 0),
(7273, 0, 0, 'Continue please, Fairbanks.', 12501, 1, 1, 7272, 0, 0, 0, 0, NULL, 0, 0),
(7274, 0, 0, 'And did he?', 12499, 1, 1, 7273, 0, 0, 0, 0, NULL, 0, 0),
(7275, 0, 0, 'Yet? Yet what??', 12497, 1, 1, 7274, 0, 0, 0, 0, NULL, 0, 0),
(7276, 0, 0, 'A thousand? For one man?', 12495, 1, 1, 7275, 0, 0, 0, 0, NULL, 0, 0),
(7277, 0, 0, 'How do you know all of this?', 12493, 1, 1, 7276, 0, 0, 0, 0, NULL, 0, 0),
(7278, 0, 0, 'You mean...', 12491, 1, 1, 7277, 0, 0, 0, 0, NULL, 0, 0),
(7279, 0, 0, 'Incredible story. So how did he die?', 12489, 1, 1, 7278, 0, 0, 0, 0, NULL, 0, 0),
(7280, 0, 0, 'I still do not fully understand.', 12487, 1, 1, 7279, 0, 0, 0, 0, NULL, 0, 0),
(7281, 0, 0, 'What do you mean?', 12485, 1, 1, 7280, 0, 0, 0, 0, NULL, 0, 0),
(7282, 0, 0, 'Mograine?', 12483, 1, 1, 7281, 0, 0, 0, 0, NULL, 0, 0),
(7283, 0, 0, 'Curse? What\'s going on here, Fairbanks?', 12481, 1, 1, 7282, 0, 0, 0, 0, NULL, 0, 9000);
UPDATE `creature_template` SET `gossip_menu_id`=7283 WHERE `gossip_menu_id`=30101;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
