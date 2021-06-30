DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210408075547');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210408075547');
-- Add your query below.


-- Make Demonic Sacrifice positive so it doesn't get evaded when delayed.
UPDATE `spell_template` SET `customFlags`=`customFlags` | 4 WHERE `entry`=18788;

-- Hack: Change charges of Elemental Mastery to recreate blizzlike bug.
-- This was fixed all the way in TBC patch 2.3.0 according to patch notes.
INSERT INTO `spell_mod` (`Id`, `StackAmount`, `Comment`) VALUES (16166, 2, 'Elemental Mastery: Set Stack Amount to 2 to recreate blizzlike bug where 2 spells can be made to crit if cast within the same batching window.');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
