DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171026072658');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171026072658');
-- Add your query below.

-- -------------------------------
-- 
-- NAXXRAMAS PATCH 3
-- 
-- Damage and stat adjustments
--
-- -------------------------------

-- 4HM hp fix based on Bestiary guide
UPDATE `creature_template` SET `minhealth`=533984, `maxhealth`=533984 WHERE `entry`=16062; -- Mograine
UPDATE `creature_template` SET `minhealth`=499987, `maxhealth`=499987 WHERE `entry`=16063; -- Zeliek
UPDATE `creature_template` SET `minhealth`=599781, `maxhealth`=599781 WHERE `entry`=16064; -- thane
UPDATE `creature_template` SET `minhealth`=499912, `maxhealth`=499912 WHERE `entry`=16065; -- Blaumeux

UPDATE `creature` SET `curhealth`=533984 WHERE `id`=16062; -- Mograine
UPDATE `creature` SET `curhealth`=499987 WHERE `id`=16063; -- Zeliek
UPDATE `creature` SET `curhealth`=599781 WHERE `id`=16064; -- thane
UPDATE `creature` SET `curhealth`=499912 WHERE `id`=16065; -- Blaumeux

-- Deathknight Understudy higher dmg based on Bestiary guide
UPDATE `creature_template` SET `minhealth`=91560, `maxhealth`=91560, `mindmg`=4729, `maxdmg`=6274 WHERE `entry`=16803; -- Deathknight Understudy

-- Gothik adds updated some values based on Bestiary guide
UPDATE `creature_template` SET `mindmg`=2540, `maxdmg`=3367 WHERE `entry`=16125; -- Unrelenting Deathknight
UPDATE `creature_template` SET `mindmg`=2209, `maxdmg`=2927 WHERE `entry`=16126; -- Unrelenting Rider
UPDATE `creature_template` SET `minlevel`=61, `maxlevel`=61, `minhealth`=5030, `maxhealth`=5030, `mindmg`=591, `maxdmg`=782 WHERE `entry`=16127; -- Spectral Trainee
UPDATE `creature_template` SET `mindmg`=2197, `maxdmg`=2912 WHERE `entry`=16150; -- Soectral Rider
UPDATE `creature_template` SET `minhealth`=19185, `maxhealth`=19185, `mindmg`=2589, `maxdmg`=3435 WHERE `entry`=16148; -- Spectral Deathknight
UPDATE `creature_template` SET `minhealth`=31500, `maxhealth`=31500, `mindmg`=2997, `maxdmg`=3712 WHERE `entry`=16149; -- Spectral Horse

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
