DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260405082412');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260405082412');
-- Add your query below.

-- Shadowfang Keep - Deathstalker Adamant (3849) and Sorcerer Ashcrombe (3850)
-- Set CREATURE_FLAG_EXTRA_NO_MOVEMENT_PAUSE to skip the gossip movement pause.
-- This prevents a rare race where a second near-simultaneous gossip interaction
-- pauses waypoint movement for 180 seconds before the escort starts.
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00000020) WHERE `entry`=3849;
UPDATE `creature_template` SET `flags_extra`=(`flags_extra` | 0x00000020) WHERE `entry`=3850;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
