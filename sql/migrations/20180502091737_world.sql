DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180502091737');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180502091737');
-- Add your query below.

-- Combat pulse on Plague Beast, Embalming Slime, Venom Stalker, Necro Stalker, Plague Slime, Deathknight Captain
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 0x00000200 WHERE `entry` IN (15976, 16024, 16034, 16145, 16243, 16453, 16783, 16784, 16785);

-- Auto cast aura on toxic tunnel
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (16400, 28370);

-- Enable 1.11 Argent Dawn event
UPDATE `game_event` SET `start_time` = '2015-01-01 01:00:00', `end_time` = '2030-01-01 01:00:00', `disabled` = 0 WHERE `entry` = 155;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
