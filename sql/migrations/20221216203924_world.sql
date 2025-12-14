DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221216203924');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221216203924');
-- Add your query below.

-- Remove duplicate mailbox from Darnassus bank 
DELETE FROM `gameobject` WHERE `guid`=49532; 

-- Mailbox at Darnassus bank was added in patch 1.3
UPDATE `gameobject` SET `patch_min`=1 WHERE  `guid`=32822;

-- Remove duplicate mailbox from Tinker Town Ironforge. Guid 7848=52
DELETE FROM `gameobject` WHERE `guid`=7848;

-- Remove duplicate mailbox from Ironforge bank. Guid 7999=866
DELETE FROM `gameobject` WHERE `guid`=7999;

-- Remove duplicate mailbox from Kharanos. Guid 8382=1074
DELETE FROM `gameobject` WHERE `guid`=8382;

-- Remove duplicate mailbox from Nethergard keep. Guid 12634=1379
DELETE FROM `gameobject` WHERE `guid`=12634;

-- Remove duplicate mailbox from The Stonfire tavern Ironforge. Guid 7197=1564
DELETE FROM `gameobject` WHERE `guid`=7197;

-- Remove duplicate mailbox from Razor Hill. Guid 24846=1620
DELETE FROM `gameobject` WHERE `guid`=24846;

-- Remove duplicate mailbox from Stonard. Guid 29365=2114
DELETE FROM `gameobject` WHERE `guid`=29365;

-- Remove duplicate mailbox from Goldshire. Guid 26784=2978
DELETE FROM `gameobject` WHERE `guid`=26784;

-- Remove duplicate mailbox from Theramore Isle Inn. Guid 25478=7555
DELETE FROM `gameobject` WHERE `guid`=25478;

-- Remove duplicate mailbox from Thelsamar. Guid 11824=9279
DELETE FROM `gameobject` WHERE `guid`=11824;

-- Remove duplicate mailbox from Menethil Harbor Inn. Guid 13770=9659
DELETE FROM `gameobject` WHERE `guid`=13770;

-- Remove duplicate mailbox from Grom'gol Base Camp. Guid 15866=10011
DELETE FROM `gameobject` WHERE `guid`=15866;

-- Remove duplicate mailbox from Orgrimmar bank. Guid 29704=10107
DELETE FROM `gameobject` WHERE `guid`=29704;

-- Remove duplicate mailbox from Wildhammer Keep. Guid 46048=10175
DELETE FROM `gameobject` WHERE `guid`=46048;

-- Remove duplicate mailbox from Booty Bay bank. Guid 16541=10764
DELETE FROM `gameobject` WHERE `guid`=16541;

-- Remove duplicate mailbox from Booty Bay Inn. Guid 16510=10807
DELETE FROM `gameobject` WHERE `guid`=16510;

-- Remove duplicate mailbox from Lakeshire Inn. Guid 11238=42497
DELETE FROM `gameobject` WHERE `guid`=42497;

-- Remove duplicate mailbox from Darkshire Inn. Guid 11874=14131
DELETE FROM `gameobject` WHERE `guid`=14131;

-- Remove duplicate mailbox from Sentinel Hill. Guid 12954=32101
DELETE FROM `gameobject` WHERE `guid`=32101;

-- Remove duplicate mailbox from Crossroads. Guid 13449=21451
DELETE FROM `gameobject` WHERE `guid`=21451;

-- Remove duplicate mailbox from The Sepulcher. Guid 14750=33370
DELETE FROM `gameobject` WHERE `guid`=33370;

-- Remove duplicate mailbox from Southshore. Guid 15036=17424
DELETE FROM `gameobject` WHERE `guid`=17424;

-- Remove duplicate mailbox from Tarren Mill. Guid 15586=17022
DELETE FROM `gameobject` WHERE `guid`=17022;

-- Remove duplicate mailbox from Camp Taurajo. Guid 15724=22201
DELETE FROM `gameobject` WHERE `guid`=22201;

-- Remove duplicate mailbox from Ratchet Inn. Guid 15753=21841
DELETE FROM `gameobject` WHERE `guid`=21841;

-- Remove duplicate mailbox from Camp Freewind Post. Guid 17101=33339
DELETE FROM `gameobject` WHERE `guid`=33339;

-- Remove duplicate mailbox from Brill. Guid 17210=44775
DELETE FROM `gameobject` WHERE `guid`=44775;

-- Remove duplicate mailbox from Undercity Inn. Guid 17985=44987
DELETE FROM `gameobject` WHERE `guid`=44987;

-- Remove duplicate mailbox from Splintertree Post. Guid 19713=48037
DELETE FROM `gameobject` WHERE `guid`=48037;

-- Remove duplicate mailbox from Astranaar. Guid 20030=47829
DELETE FROM `gameobject` WHERE `guid`=47829;

-- Remove duplicate mailbox from Bloodhoof Village. Guid 20420=27594
DELETE FROM `gameobject` WHERE `guid`=27594;

-- Remove duplicate mailbox from Thunder Bluff Bank. Guid 20426=27799
DELETE FROM `gameobject` WHERE `guid`=27799;

-- Remove duplicate mailbox from Auberdine. Guid 22934=48629
DELETE FROM `gameobject` WHERE `guid`=48629;

-- Remove duplicate mailbox from Nijels point. Guid 23207=32540
DELETE FROM `gameobject` WHERE `guid`=32540;

-- Remove duplicate mailbox from Feathermoon Stronghold. Guid 26380=49947
DELETE FROM `gameobject` WHERE `guid`=49947;

-- Remove duplicate mailbox from Stormwind Bank. Guid 26387=73671
DELETE FROM `gameobject` WHERE `guid`=73671;

-- Remove duplicate mailbox from Stormwind Pigs and Whistle. Guid 26463=72611
DELETE FROM `gameobject` WHERE `guid`=72611;

-- Remove duplicate mailbox from Camp Mojache. Guid 26771=50044
DELETE FROM `gameobject` WHERE `guid`=50044;

-- Remove duplicate mailbox from Sun Rock Retreat. Guid 30545=47458
DELETE FROM `gameobject` WHERE `guid`=47458;

-- Remove duplicate mailbox from Dolanaar. Guid 32657=49531
DELETE FROM `gameobject` WHERE `guid`=49531;

-- Remove duplicate mailbox from Everlook. Guid 34036=48996
DELETE FROM `gameobject` WHERE `guid`=48996;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
