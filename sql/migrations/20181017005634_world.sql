DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181017005634');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181017005634');
-- Add your query below.


-- Correct health for Timbermaw Shaman.
UPDATE `creature_template` SET `minhealth`=2017, `maxhealth`=2086 WHERE `entry`=6188;
UPDATE `creature` SET `curhealth`=2017 WHERE `id`=6188;

-- Correct damage for Mist Howler.
UPDATE `creature_template` SET `mindmg`=27, `maxdmg`=33 WHERE `entry`=10644;

-- Furious Howl should be consumed on melee attack.
INSERT INTO `spell_mod` (`ID`, `AuraInterruptFlags`, `Comment`) VALUES
(24597, 4096, 'Furious Howl - Consume on Melee Attack'),
(24603, 4096, 'Furious Howl - Consume on Melee Attack'),
(24604, 4096, 'Furious Howl - Consume on Melee Attack'),
(24605, 4096, 'Furious Howl - Consume on Melee Attack');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
