DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190319163539');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190319163539');
-- Add your query below.


-- Correct minimum level requirements for some dungeon entrance/exit triggers.
-- https://github.com/cmangos/classic-db/commit/929bd010ffb4444b7636420bcbd39bfac6e80092

-- Exit Triggers
UPDATE `areatrigger_teleport` SET `required_level`=0 WHERE `id` IN (606, 3728);

-- Gnomeregan and Razorfen Kraul
-- https://wowwiki.fandom.com/wiki/Gnomeregan_(dungeon)?oldid=2355828
-- https://wowwiki.fandom.com/wiki/Razorfen_Kraul?oldid=2076966
UPDATE `areatrigger_teleport` SET `required_level`=15 WHERE `id` IN (244, 324, 523);

-- Blackrock Depths (MC Exit)
UPDATE `areatrigger_teleport` SET `required_level`=40 WHERE `id` IN (2890);

-- Ahn'Qiraj
UPDATE `areatrigger_teleport` SET `required_level`=50 WHERE `id` IN (4008, 4010);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
