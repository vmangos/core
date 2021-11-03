DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211010145936');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211010145936');
-- Add your query below.

-- Using evidence from classic, allow these blessings and totems to stack (kings, might)

-- Add separate group for Strength Totem

INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES ('1080', '0', '1'); 

-- Move Strength Totem to this group

UPDATE `spell_group` SET `group_id` = '1080' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 9 AND `spell_group`.`spell_id` = 8076; 
UPDATE `spell_group` SET `group_id` = '1080' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 10 AND `spell_group`.`spell_id` = 8162; 
UPDATE `spell_group` SET `group_id` = '1080' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 11 AND `spell_group`.`spell_id` = 8163; 
UPDATE `spell_group` SET `group_id` = '1080' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 12 AND `spell_group`.`spell_id` = 10441; 
UPDATE `spell_group` SET `group_id` = '1080' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 13 AND `spell_group`.`spell_id` = 25362; 

-- Add separate group for Windfury Totem

INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES ('1081', '0', '1');

-- Move Windfury Totem to this group

UPDATE `spell_group` SET `group_id` = '1081' WHERE `spell_group`.`group_id` = 1046 AND `spell_group`.`group_spell_id` = 9 AND `spell_group`.`spell_id` = 8514; 
UPDATE `spell_group` SET `group_id` = '1081' WHERE `spell_group`.`group_id` = 1046 AND `spell_group`.`group_spell_id` = 10 AND `spell_group`.`spell_id` = 10607; 
UPDATE `spell_group` SET `group_id` = '1081' WHERE `spell_group`.`group_id` = 1046 AND `spell_group`.`group_spell_id` = 11 AND `spell_group`.`spell_id` = 10611; 

-- Remove Windfury from Kings group

DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1051 AND `spell_group`.`group_spell_id` = 4 AND `spell_group`.`spell_id` = 10611;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1051 AND `spell_group`.`group_spell_id` = 3 AND `spell_group`.`spell_id` = 10607;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1051 AND `spell_group`.`group_spell_id` = 2 AND `spell_group`.`spell_id` = 8514;

-- Remove Strength from Kings group

DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1049 AND `spell_group`.`group_spell_id` = 6 AND `spell_group`.`spell_id` = 25362;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1049 AND `spell_group`.`group_spell_id` = 2 AND `spell_group`.`spell_id` = 8076;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1049 AND `spell_group`.`group_spell_id` = 3 AND `spell_group`.`spell_id` = 8162;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1049 AND `spell_group`.`group_spell_id` = 4 AND `spell_group`.`spell_id` = 8163;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1049 AND `spell_group`.`group_spell_id` = 5 AND `spell_group`.`spell_id` = 10441;

-- Remove Kings from Grace of Air group

DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1050 AND `spell_group`.`group_spell_id` = 1 AND `spell_group`.`spell_id` = 25898;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1050 AND `spell_group`.`group_spell_id` = 0 AND `spell_group`.`spell_id` = 20217;


-- Using evidence obtained by testing on Classic PTR, also prevent all these totem/blessing conflicts

-- Create a separate group for Mana Spring Totem

INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES ('1082', '0', '1');

-- Add Mana Spring Totem to this group

UPDATE `spell_group` SET `group_id` = '1082' WHERE `spell_group`.`group_id` = 1047 AND `spell_group`.`group_spell_id` = 8 AND `spell_group`.`spell_id` = 5677; 
UPDATE `spell_group` SET `group_id` = '1082' WHERE `spell_group`.`group_id` = 1047 AND `spell_group`.`group_spell_id` = 9 AND `spell_group`.`spell_id` = 10491; 
UPDATE `spell_group` SET `group_id` = '1082' WHERE `spell_group`.`group_id` = 1047 AND `spell_group`.`group_spell_id` = 10 AND `spell_group`.`spell_id` = 10493; 
UPDATE `spell_group` SET `group_id` = '1082' WHERE `spell_group`.`group_id` = 1047 AND `spell_group`.`group_spell_id` = 11 AND `spell_group`.`spell_id` = 10494; 

-- Create a separate group for Mana Tide Totem

INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES ('1083', '0', '1');

-- Add Mana Tide totem to this group

UPDATE `spell_group` SET `group_id` = '1083' WHERE `spell_group`.`group_id` = 1048 AND `spell_group`.`group_spell_id` = 8 AND `spell_group`.`spell_id` = 16191; 
UPDATE `spell_group` SET `group_id` = '1083' WHERE `spell_group`.`group_id` = 1048 AND `spell_group`.`group_spell_id` = 9 AND `spell_group`.`spell_id` = 17355; 
UPDATE `spell_group` SET `group_id` = '1083' WHERE `spell_group`.`group_id` = 1048 AND `spell_group`.`group_spell_id` = 10 AND `spell_group`.`spell_id` = 17360; 

-- Remove Tranquil Air Totem from Salvation Group

DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1044 AND `spell_group`.`group_spell_id` = 2 AND `spell_group`.`spell_id` = 25909;

-- Remove Stoneskin from Blessing of Sanctuary Group

DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1052 AND `spell_group`.`group_spell_id` = 5 AND `spell_group`.`spell_id` = 8072;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1052 AND `spell_group`.`group_spell_id` = 6 AND `spell_group`.`spell_id` = 8156;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1052 AND `spell_group`.`group_spell_id` = 7 AND `spell_group`.`spell_id` = 8157;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1052 AND `spell_group`.`group_spell_id` = 8 AND `spell_group`.`spell_id` = 10403;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1052 AND `spell_group`.`group_spell_id` = 9 AND `spell_group`.`spell_id` = 10404;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1052 AND `spell_group`.`group_spell_id` = 10 AND `spell_group`.`spell_id` = 10405;

-- Remove Stoneskin from Devotion Aura Group

DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1040 AND `spell_group`.`group_spell_id` = 7 AND `spell_group`.`spell_id` = 8072;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1040 AND `spell_group`.`group_spell_id` = 8 AND `spell_group`.`spell_id` = 8156;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1040 AND `spell_group`.`group_spell_id` = 9 AND `spell_group`.`spell_id` = 8157;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1040 AND `spell_group`.`group_spell_id` = 10 AND `spell_group`.`spell_id` = 10403;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1040 AND `spell_group`.`group_spell_id` = 11 AND `spell_group`.`spell_id` = 10404;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1040 AND `spell_group`.`group_spell_id` = 12 AND `spell_group`.`spell_id` = 10405;

-- Remove Windwall from Devotion Aura Group

DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1041 AND `spell_group`.`group_spell_id` = 7 AND `spell_group`.`spell_id` = 15108;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1041 AND `spell_group`.`group_spell_id` = 8 AND `spell_group`.`spell_id` = 15109;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1041 AND `spell_group`.`group_spell_id` = 9 AND `spell_group`.`spell_id` = 15110;

-- Remove Windwall from Sanctuary Group

DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1053 AND `spell_group`.`group_spell_id` = 5 AND `spell_group`.`spell_id` = 15108;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1053 AND `spell_group`.`group_spell_id` = 6 AND `spell_group`.`spell_id` = 15109;
DELETE FROM `spell_group` WHERE `spell_group`.`group_id` = 1053 AND `spell_group`.`group_spell_id` = 7 AND `spell_group`.`spell_id` = 15110;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
