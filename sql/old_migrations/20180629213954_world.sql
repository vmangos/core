DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180629213954');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180629213954');
-- Add your query below.

REPLACE INTO `spell_mod` (`Id`, `AttributesEx`, `Comment`) VALUES 
('28377', '1024', 'Shadowguard R1 no threat'),
('28378', '1024', 'Shadowguard R2 no threat'),
('28379', '1024', 'Shadowguard R3 no threat'),
('28380', '1024', 'Shadowguard R4 no threat'),
('28381', '1024', 'Shadowguard R5 no threat'),
('28382', '1024', 'Shadowguard R6 no threat');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
