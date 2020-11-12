DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201011013419');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201011013419');
-- Add your query below.


-- Prevent Theldren Trigger from aggroing.
INSERT INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES (27517, 131072, 'Summon Thelrin DND - No Aggro');
UPDATE `creature_template` SET `unit_flags`=256+512+33554432, `ai_name`='NullAI' WHERE `entry`=16079;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
