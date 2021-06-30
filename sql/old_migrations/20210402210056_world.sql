DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210402210056');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210402210056');
-- Add your query below.

-- Thulbek was not spawned in Grom'gol until Patch 1.7.
-- https://web.archive.org/web/20041115164537/http://wow.allakhazam.com/db/mob.html?wmob=5814
UPDATE `creature` SET `patch_min` = 5 WHERE `id` = 5814;
UPDATE `creature_equip_template` SET `patch`=5 WHERE `entry`=5814;
UPDATE `creature_template` SET `patch` = 5 WHERE `entry` = 5814 AND `patch` = 0;
INSERT INTO `creature_template` VALUES (5814,0,4353,0,0,0,0,0,0,0,100,0,0,0,100,0,'Thulbek','Gun Merchant',0,30,30,1002,1002,0,0,1114,29,16388,1,1.14286,18,5,0,0,1,42,53,0,116,1,2000,2000,1,4608,0,0,0,0,0,0,42.1344,57.9348,100,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,'',0,3,0,0,3,0,0,0,0,0,524298,'');
-- Make new vendor list (Innkeeper) active only if patch >= 5.
UPDATE `npc_vendor` SET `condition_id` = 4015 WHERE `entry` = 5814;
-- Add old item when patch < 5.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4024, 24, 4, 2, 0, 0, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `condition_id`) VALUES (5814, 2511, 4024);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
