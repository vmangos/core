DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211122153748');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211122153748');
-- Add your query below.


-- Creature 915
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 4659 AND `id` = 1;

-- Creature 916
UPDATE `gossip_menu` SET `text_id` = 4834 WHERE `entry` = 4676 AND `text_id` = 4835;
UPDATE `gossip_menu_option` SET `option_text` = 'I\'m lookin\' for rogue trainin\'.', `option_broadcast_text` = 7490 WHERE `menu_id` = 4676 AND `id` = 0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 4676 AND `id` = 1;

-- Creature 917
UPDATE `gossip_menu` SET `text_id` = 878 WHERE `entry` = 381 AND `text_id` = 4795;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 381 AND `id` = 1;

-- Creature 918
UPDATE `gossip_menu` SET `text_id` = 5993 WHERE `entry` = 4502 AND `text_id` = 5996;

-- Creature 1411
DELETE FROM `gossip_menu` WHERE `entry` = 4658 AND `text_id` = 5996;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 4658 AND `id` = 4;

-- Creature 1234
UPDATE `gossip_menu` SET `condition_id` = 100 WHERE `entry` = 410 AND `text_id` = 907;
UPDATE `gossip_menu` SET `condition_id` = 101 WHERE `entry` = 410 AND `text_id` = 4797;
DELETE FROM `gossip_menu` WHERE `entry` = 410 AND `text_id` = 4795;
UPDATE `gossip_menu_option` SET `option_broadcast_text` = 2929, `option_text` = 'Good day to you, Hogral! I seek training.' WHERE `menu_id` = 410 AND `id` = 0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 410 AND `id` = 1;

-- Creature 2122
-- Creature 2130
DELETE FROM `gossip_menu` WHERE `entry` = 85 AND `text_id` = 5996;
DELETE FROM `gossip_menu_option` WHERE `menu_id`= 85 AND `id` = 4;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 85 AND `id` = 1;

-- Creature 3155
-- Creature 3170
DELETE FROM `gossip_menu` WHERE `entry` = 141 AND `text_id` = 5996;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 141 AND `id` = 4;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 141 AND `id` = 1;

-- Creature 3328
UPDATE `gossip_menu` SET `text_id` = 5993 WHERE `entry` = 4513 AND `text_id` = 5996;

-- Creature 3401
UPDATE `gossip_menu` SET `text_id` = 5993 WHERE `entry` = 521 AND `text_id` = 5996;
UPDATE `gossip_menu_option` SET `option_broadcast_text` = 3143, `option_text` = 'I require training, sir!' WHERE `menu_id` = 521 AND `id` = 0;

-- Creature 3594
UPDATE `gossip_menu` SET `text_id`=4794 WHERE `entry`=4690 && `text_id`=4796;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 4690 AND `id` = 1;

-- Creature 3599
UPDATE `gossip_menu` SET `text_id`=934 WHERE `entry`=436 && `text_id`=4794;
UPDATE `gossip_menu` SET `text_id`=4794 WHERE `entry`=436 && `text_id`=4793;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 436 AND `id` = 1;

-- Creature 4163
UPDATE `gossip_menu` SET `text_id`=4795 WHERE `entry`=4576 && `text_id`=4794;
UPDATE `gossip_menu` SET `text_id`=4794 WHERE `entry`=4576 && `text_id`=4793;

-- Creature 4214
UPDATE `creature_template` SET `gossip_menu_id` = 4577 WHERE `entry` = 4214;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(4577, 4793, 0, 101),
(4577, 4795, 0, 100),
(4577, 5996, 0, 198),
(4577, 8255, 0, 461),
(4577, 8283, 0, 459),
(4577, 8285, 0, 454),
(4577, 8291, 0, 458),
(4577, 8296, 0, 460),
(4577, 8298, 0, 455);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(4577, 0, 3, 'I seek training.', 7478, 5, 16, 0, 0, 0, 0, 0, '', 0, 0),
(4577, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136),
(4577, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198),
(4577, 9, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410, 0, 0, NULL, 0, 462),
(4577, 10, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 411, 0, 0, NULL, 0, 461);

-- Creature 4215
UPDATE `creature_template` SET `gossip_menu_id` = 4575 WHERE `entry` = 4215;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(4575, 4793, 0, 101),
(4575, 4795, 0, 100),
(4575, 5996, 0, 198),
(4575, 8255, 0, 461),
(4575, 8283, 0, 459),
(4575, 8285, 0, 454),
(4575, 8291, 0, 458),
(4575, 8296, 0, 460),
(4575, 8298, 0, 455);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(4575, 0, 3, 'I seek training.', 7478, 5, 16, 0, 0, 0, 0, 0, '', 0, 0),
(4575, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136),
(4575, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198),
(4575, 9, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410, 0, 0, NULL, 0, 462),
(4575, 10, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 411, 0, 0, NULL, 0, 461);

-- Creature 4582
UPDATE `gossip_menu` SET `text_id` = 5993 WHERE `entry` = 4542 AND `text_id` = 5996;
UPDATE `gossip_menu_option` SET `option_broadcast_text` = 2548, `option_text` = 'I would like to train.' WHERE `menu_id` = 4542 AND `id` = 0;

-- Creature 4584
UPDATE `gossip_menu_option` SET `option_broadcast_text` = 2548, `option_text` = 'I would like to train.' WHERE `menu_id` = 4541 AND `id` = 0;

-- Creature 5165
UPDATE `gossip_menu` SET `text_id` = 5993 WHERE `entry` = 411 AND `text_id` = 5996;

-- Creature 5166
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(4562, 5993, 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(4562, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);

-- Creature 5167
UPDATE `gossip_menu` SET `text_id` = 5993 WHERE `entry` = 4561 AND `text_id` = 5996;

-- Creature 13283
DELETE FROM `gossip_menu` WHERE  `entry` = 5061 AND `text_id` = 5996;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 5061 AND `id` = 2;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
