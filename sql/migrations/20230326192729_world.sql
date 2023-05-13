DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230326192729');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230326192729');
-- Add your query below.


-- The Alliance wins!
DELETE FROM `mangos_string` WHERE `entry`=600;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7335; -- AV
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9843; -- WSG

-- The Horde wins!
DELETE FROM `mangos_string` WHERE `entry`=601;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=7336; -- AV
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9842; -- WSG

-- The battle for Warsong Gulch begins in 1 minute.
DELETE FROM `mangos_string` WHERE `entry`=602;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10015;

-- The battle for Warsong Gulch begins in 30 seconds.  Prepare yourselves!
DELETE FROM `mangos_string` WHERE `entry`=603;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10016;

-- Let the battle for Warsong Gulch begin!
DELETE FROM `mangos_string` WHERE `entry`=604;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10014;

-- $n captured the Horde Flag!
DELETE FROM `mangos_string` WHERE `entry`=605;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9801;

-- $n captured the Alliance Flag!
DELETE FROM `mangos_string` WHERE `entry`=606;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9802;

-- The Horde Flag was dropped by $n!
DELETE FROM `mangos_string` WHERE `entry`=607;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9806;

-- The Alliance Flag was dropped by $n!
DELETE FROM `mangos_string` WHERE `entry`=608;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9805;

-- The Alliance Flag was returned to its base by $n!
DELETE FROM `mangos_string` WHERE `entry`=609;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9808;

-- The Horde Flag was returned to its base by $n!
DELETE FROM `mangos_string` WHERE `entry`=610;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9809;

-- The Horde Flag was picked up by $n!
DELETE FROM `mangos_string` WHERE `entry`=611;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9807;

-- The Alliance Flag was picked up by $n!
DELETE FROM `mangos_string` WHERE `entry`=612;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9804;

-- The flags are now placed at their bases.
DELETE FROM `mangos_string` WHERE `entry`=613;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=9803;

-- The Alliance Flag has returned to its base!
DELETE FROM `mangos_string` WHERE `entry`=614;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10022;

-- The Horde Flag has returned to its base!
DELETE FROM `mangos_string` WHERE `entry`=615;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=10023;

-- The Alliance has gathered $1776W resources, and is near victory!
DELETE FROM `mangos_string` WHERE `entry`=664;

-- The Horde has gathered $1777W resources, and is near victory!
DELETE FROM `mangos_string` WHERE `entry`=665;

-- The Alliance Team is running out of reinforcements!
DELETE FROM `mangos_string` WHERE `entry`=787;

-- The Horde Team is running out of reinforcements!
DELETE FROM `mangos_string` WHERE `entry`=788;

-- The Battle for Arathi Basin begins in 1 minute.
DELETE FROM `mangos_string` WHERE `entry`=661;

-- The Battle for Arathi Basin begins in 30 seconds. Prepare yourselves!
DELETE FROM `mangos_string` WHERE `entry`=662;

-- The Battle for Arathi Basin has begun!
DELETE FROM `mangos_string` WHERE `entry`=663;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
