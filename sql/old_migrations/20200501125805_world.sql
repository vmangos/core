DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200501125805');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200501125805');
-- Add your query below.


-- Do not remove some spells on creature evade.
-- Source: https://github.com/cmangos/mangos-classic/blob/f2dabbffb05b634d52aa16fc69dc8ecbac3454a8/src/game/Spells/SpellMgr.h#L362
UPDATE `spell_template` SET `customFlags`=`customFlags` | 1024 WHERE `entry` IN (588, 3235, 3284, 3417, 3418, 3616, 3637, 5111, 5301, 5680, 6718, 6752, 6947, 7090, 7165, 7276, 8247, 8279, 8393, 8599, 8601, 8876, 9205, 9460, 9941, 10022, 10072, 10074, 10095, 11838, 11919, 11966, 11984, 12099, 12246, 12529, 12539, 12546, 12556, 12627, 12787, 12898, 13299, 13616, 13767, 14178, 15088, 15097, 15876, 16140, 16563, 16577, 16592, 17327, 17467, 18148, 18268, 18943, 18968, 19030, 18950, 19194, 19195, 19396, 19626, 19640, 19817, 19818, 21061, 21857, 22128, 22578, 22735, 22856, 25592, 26341, 24692, 27987, 28126, 29526);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
