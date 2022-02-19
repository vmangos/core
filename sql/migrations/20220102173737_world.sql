DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220102173737');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220102173737');
-- Add your query below.


-- Add patch to this table.
ALTER TABLE `game_event_creature_data`
	ADD COLUMN `patch` TINYINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Content patch in which this exact version of the entry was added' AFTER `guid`,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`guid`, `event`, `patch`);

-- Spells aded in patch 1.8.
UPDATE `game_event_creature_data` SET `patch`=6 WHERE `spell_start` IN (26231, 26215, 26212, 26209, 26210, 26115, 26214);

-- Spells aded in patch 1.9.
UPDATE `game_event_creature_data` SET `patch`=7 WHERE `spell_start` IN (26383, 26384, 27654, 26870, 26520);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
