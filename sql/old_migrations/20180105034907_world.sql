DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180105034907');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180105034907');
-- Add your query below.

-- Fix Sonic Burst for 8 beasts (replacing Dual Wield 674).

UPDATE `creature_ai_scripts` SET `action1_param1`='8281' WHERE `id`='453901';
UPDATE `creature_ai_scripts` SET `action1_param1`='8281' WHERE `id`='530701';
UPDATE `creature_ai_scripts` SET `action1_param1`='8281' WHERE `id`='530801';
UPDATE `creature_ai_scripts` SET `action1_param1`='8281' WHERE `id`='533501';
UPDATE `creature_ai_scripts` SET `action1_param1`='8281' WHERE `id`='853501';
UPDATE `creature_ai_scripts` SET `action1_param1`='8281' WHERE `id`='860201';
UPDATE `creature_ai_scripts` SET `action1_param1`='8281' WHERE `id`='1035701';
UPDATE `creature_ai_scripts` SET `action1_param1`='8281' WHERE `id`='1332301';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
