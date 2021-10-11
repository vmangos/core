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

INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES ('1079', '0', '1'); 

-- Move Strength Totem to this group

UPDATE `spell_group` SET `group_id` = '1079' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 9 AND `spell_group`.`spell_id` = 8076; 
UPDATE `spell_group` SET `group_id` = '1079' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 10 AND `spell_group`.`spell_id` = 8162; 
UPDATE `spell_group` SET `group_id` = '1079' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 11 AND `spell_group`.`spell_id` = 8163; 
UPDATE `spell_group` SET `group_id` = '1079' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 12 AND `spell_group`.`spell_id` = 10441; 
UPDATE `spell_group` SET `group_id` = '1079' WHERE `spell_group`.`group_id` = 1045 AND `spell_group`.`group_spell_id` = 13 AND `spell_group`.`spell_id` = 25362; 

-- Add separate group for Windfury Totem

INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES ('1080', '0', '1');

-- Move Windfury Totem to this group

UPDATE `spell_group` SET `group_id` = '1080' WHERE `spell_group`.`group_id` = 1046 AND `spell_group`.`group_spell_id` = 9 AND `spell_group`.`spell_id` = 8514; 
UPDATE `spell_group` SET `group_id` = '1080' WHERE `spell_group`.`group_id` = 1046 AND `spell_group`.`group_spell_id` = 10 AND `spell_group`.`spell_id` = 10607; 
UPDATE `spell_group` SET `group_id` = '1080' WHERE `spell_group`.`group_id` = 1046 AND `spell_group`.`group_spell_id` = 11 AND `spell_group`.`spell_id` = 10611; 

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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
