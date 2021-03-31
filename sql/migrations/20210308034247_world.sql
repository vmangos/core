DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210308034247');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210308034247');
-- Add your query below.


-- Limit Vaelastrasz's Burning Adrenaline to Blackwing Lair.
-- https://www.twitch.tv/tharxsilverarrow/clip/SweetBitterRhinocerosRlyTho?filter=clips&range=7d&sort=time
INSERT INTO `spell_area` (`spell`, `area`) VALUES (18173, 2677);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
