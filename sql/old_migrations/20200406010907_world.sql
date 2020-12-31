DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200406010907');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200406010907');
-- Add your query below.


ALTER TABLE `player_premade_item_template`
	ADD COLUMN `role` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `level`;

UPDATE `player_premade_item_template` SET `role`=1 WHERE `entry` IN (1, 2, 4);
UPDATE `player_premade_item_template` SET `role`=2 WHERE `entry` IN (3, 5, 6, 7, 8, 9);
UPDATE `player_premade_item_template` SET `role`=3 WHERE `entry` IN (14, 15, 16);
UPDATE `player_premade_item_template` SET `role`=4 WHERE `entry` IN (10, 11, 12, 13);

ALTER TABLE `player_premade_spell_template`
	ADD COLUMN `role` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `level`;

UPDATE `player_premade_spell_template` SET `role`=1 WHERE `entry` IN (1, 2, 4);
UPDATE `player_premade_spell_template` SET `role`=2 WHERE `entry` IN (3, 5, 6, 7, 8, 9);
UPDATE `player_premade_spell_template` SET `role`=3 WHERE `entry` IN (14, 15, 16);
UPDATE `player_premade_spell_template` SET `role`=4 WHERE `entry` IN (10, 11, 12, 13);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
