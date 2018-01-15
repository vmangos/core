DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171118154313');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171118154313');
-- Add your query below.

-- https://github.com/LightsHope/server/issues/686
UPDATE `spell_proc_event` SET `SpellFamilyMask0`=17718313984, `SpellFamilyMask1`=17718313984, `SpellFamilyMask2`=17718313984, `procFlags`=87056 WHERE `entry`=26135;
UPDATE `spell_mod` SET `SpellFamilyFlags`=17179869184 WHERE `Id` IN (20467,20963,20964,20965,20966);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
