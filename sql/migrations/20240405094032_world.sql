DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240405094032');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240405094032');
-- Add your query below.


-- Missing CREATURE_STATIC_FLAG_TAMEABLE.
UPDATE `creature_template` SET `static_flags1`=(`static_flags1` | 0x00000010) WHERE `entry` IN (11369, 11367);

-- Missing CREATURE_STATIC_FLAG_VISIBLE_TO_GHOSTS.
UPDATE `creature_template` SET `static_flags1`=(`static_flags1` | 0x00200000) WHERE `entry` IN (2815);

-- Missing CREATURE_STATIC_FLAG_RAID_BOSS_MOB.
UPDATE `creature_template` SET `static_flags1`=(`static_flags1` | 0x00010000) WHERE `entry` IN (11379, 11980, 17075);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
