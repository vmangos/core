DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171201203827');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171201203827');
-- Add your query below.

REPLACE INTO `battleground_events` (`map`, `event1`, `event2`, `description`) VALUES (30, 66, 0, 'Alliance - Explosives Expert');
REPLACE INTO `battleground_events` (`map`, `event1`, `event2`, `description`) VALUES (30, 67, 0, 'Horde - Explosives Expert');
REPLACE INTO `battleground_events` (`map`, `event1`, `event2`, `description`) VALUES (30, 68, 0, 'Alliance - Lieutenant Dead');
REPLACE INTO `battleground_events` (`map`, `event1`, `event2`, `description`) VALUES (30, 69, 0, 'Horde - Lieutenant Dead');

-- Explosive Experts
REPLACE INTO `creature_battleground` (`guid`, `event1`, `event2`) VALUES 
(53671, 66, 0),
(53670, 67, 0);

-- Alliance Lieutenants
REPLACE INTO `creature_battleground` (`guid`, `event1`, `event2`) VALUES 
(53200, 68, 0),
(53202, 68, 0),
(53203, 68, 0),
(53204, 68, 0),
(53201, 68, 0),
(53087, 68, 0);

-- Horde Lieutenants
REPLACE INTO `creature_battleground` (`guid`, `event1`, `event2`) VALUES 
(53109, 69, 0),
(53111, 69, 0),
(53110, 69, 0),
(53086, 69, 0),
(53107, 69, 0),
(53108, 69, 0);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
