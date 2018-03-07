DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180222004055');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180222004055');
-- Add your query below.


-- Dearest Natalia incomplete
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (550, 9, 8304, 1);

-- Frankal
UPDATE `creature_template` SET `gossip_menu_id`=5450, `ScriptName`='' WHERE `entry`=15171;
REPLACE INTO `gossip_menu` VALUES 
(5450, 7736, 0),
(5451, 7762, 0),
(5452, 7763, 0),
(5453, 7764, 0),
(5454, 7765, 0),
(5455, 7766, 0),
(5456, 7767, 0),
(5457, 7768, 0);
REPLACE INTO `gossip_menu_option` VALUES 
(5450, 0, 0, 'Hello, Frankal. I\'ve heard that you might have some information as to the whereabouts of Mistress Natalia Mar\'alith.', 10727, 1, 1, 5451, 0, 0, 0, 0, '', 0, 550),
(5451, 0, 0, 'That\'s what I like to hear.', 10729, 1, 1, 5452, 0, 0, 0, 0, '', 0, 0),
(5452, 0, 0, 'That\'s odd.', 10731, 1, 1, 5453, 0, 0, 0, 0, '', 0, 0),
(5453, 0, 0, 'You couldn\'t handle a lone night elf priestess?', 10733, 1, 1, 5454, 0, 0, 0, 0, '', 0, 0),
(5454, 0, 0, 'I\'ve been meaning to ask you about that monkey.', 10735, 1, 1, 5455, 0, 0, 0, 0, '', 0, 0),
(5455, 0, 0, 'Then what?', 10737, 1, 1, 5456, 0, 0, 0, 0, '', 0, 0),
(5456, 0, 0, 'What a story! So she went into Hive\'Regal and that was the last you saw of her?', 10739, 1, 1, 5457, 0, 0, 0, 0, '', 0, 0),
(5457, 0, 0, 'Thanks for the information, Frankal.', 10741, 1, 1, -1, 0, 5450, 0, 0, '', 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=5450;
REPLACE INTO `gossip_scripts` VALUES (5450, 0, 8, 15221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dearest Natalia - Frankal quest credit');

-- Rutgar
UPDATE `creature_template` SET `gossip_menu_id`=5460, `ScriptName`='' WHERE `entry`=15170;
REPLACE INTO `gossip_menu` VALUES 
(5460, 7735, 0),
(5461, 7755, 0),
(5462, 7756, 0),
(5463, 7757, 0),
(5464, 7758, 0),
(5465, 7759, 0),
(5466, 7760, 0),
(5467, 7761, 0);
REPLACE INTO `gossip_menu_option` VALUES 
(5460, 0, 0, 'Hello, Rutgar. The Commander has sent me here to gather some information about his missing wife.', 10712, 1, 1, 5461, 0, 0, 0, 0, '', 0, 550),
(5461, 0, 0, 'That sounds dangerous.', 10714, 1, 1, 5462, 0, 0, 0, 0, '', 0, 0),
(5462, 0, 0, 'What happened to her after that?', 10716, 1, 1, 5463, 0, 0, 0, 0, '', 0, 0),
(5463, 0, 0, 'Natalia?', 10718, 1, 1, 5464, 0, 0, 0, 0, '', 0, 0),
(5464, 0, 0, 'What demands?', 10720, 1, 1, 5465, 0, 0, 0, 0, '', 0, 0),
(5465, 0, 0, 'Lost it? What do you mean?', 10722, 1, 1, 5466, 0, 0, 0, 0, '', 0, 0),
(5466, 0, 0, 'Possessed by what?', 10724, 1, 1, 5467, 0, 0, 0, 0, '', 0, 0),
(5467, 0, 0, 'I\'ll be back once I straighten this mess out.', 10726, 1, 1, -1, 0, 5460, 0, 0, '', 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=5460;
REPLACE INTO `gossip_scripts` VALUES (5460, 0, 8, 15222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dearest Natalia - Rutgar quest credit');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
