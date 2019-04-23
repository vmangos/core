DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180830022134');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180830022134');
-- Add your query below.


-- Define poison and other temporary enchant charges in the db.
CREATE TABLE `spell_enchant_charges` (
	`entry` INT UNSIGNED NOT NULL,
	`charges` INT UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `spell_enchant_charges` VALUES (8679, 40);
INSERT INTO `spell_enchant_charges` VALUES (8686, 55);
INSERT INTO `spell_enchant_charges` VALUES (8688, 70);
INSERT INTO `spell_enchant_charges` VALUES (11338, 85);
INSERT INTO `spell_enchant_charges` VALUES (11339, 100);
INSERT INTO `spell_enchant_charges` VALUES (11340, 115);
INSERT INTO `spell_enchant_charges` VALUES (5761, 50);
INSERT INTO `spell_enchant_charges` VALUES (8693, 75);
INSERT INTO `spell_enchant_charges` VALUES (11399, 100);
INSERT INTO `spell_enchant_charges` VALUES (2823, 60);
INSERT INTO `spell_enchant_charges` VALUES (2824, 75);
INSERT INTO `spell_enchant_charges` VALUES (11355, 90);
INSERT INTO `spell_enchant_charges` VALUES (11356, 105);
INSERT INTO `spell_enchant_charges` VALUES (25351, 120);
INSERT INTO `spell_enchant_charges` VALUES (13219, 60);
INSERT INTO `spell_enchant_charges` VALUES (13225, 75);
INSERT INTO `spell_enchant_charges` VALUES (13226, 90);
INSERT INTO `spell_enchant_charges` VALUES (13227, 105);
INSERT INTO `spell_enchant_charges` VALUES (14792, 15);

-- Duration of Venomhide Poison should be 5 minutes.
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectBasePoints`, `Comment`) VALUES (14792, 1, 299, 'Venomhide Poison Enchant Duration');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
