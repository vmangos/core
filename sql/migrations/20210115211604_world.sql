DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210115211604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210115211604');
-- Add your query below.


-- Christmas Cannon Master Willey
UPDATE `game_event_creature_data` SET `spell_start`=26209, `display_id`=0 WHERE `guid`=54433;
-- Christmas Prince Tortheldrin
UPDATE `game_event_creature_data` SET `spell_start`=26210, `display_id`=0 WHERE `guid`=56951;
-- Christmas Emperor Dagran Thaurissan
UPDATE `game_event_creature_data` SET `spell_start`=26212, `display_id`=0 WHERE `guid`=47613;
-- Christmas Warchief Rend Blackhand
INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `display_id`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES (41809, 0, 0, 0, 26214, 0, 2);
-- Christmas War Master Voone
UPDATE `game_event_creature_data` SET `spell_start`=26215, `display_id`=0 WHERE `guid`=45840;
-- Christmas Goraluk Anvilcrack
UPDATE `game_event_creature_data` SET `spell_start`=26231, `display_id`=0 WHERE `guid`=45829;

-- Don't remove christmas hat auras on evade.
UPDATE `spell_template` SET `customFlags`=`customFlags` | 0x400 WHERE `entry` IN (26200, 26209, 26210, 26212, 26214, 26215, 26231);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
