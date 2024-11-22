DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241117202208');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241117202208');
-- Add your query below.

-- Golemagg - add missing auras
-- 13879 Magma Splash - Golemagg splashes magma at his attackers, dealing Fire damage over time and reducing their armor. This ability can stack.
-- 20556 Golemagg's Trust - Golemagg's Core Ragers will deal increased damage and have 50% increased attack speed if tanked too close to Golemagg.
-- 18943 Double Attack - Proc chance: 50%, 3s cooldown
UPDATE `creature_template` SET `auras` = "13879 20556 18943" WHERE `entry` = 11988;

DELETE FROM `script_texts` WHERE `entry` = -1409002; -- %s refuses to die while its master is in trouble. (2) -> 7865

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
