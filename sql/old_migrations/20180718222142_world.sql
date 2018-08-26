DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180718222142');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180718222142');
-- Add your query below.

-- Green Lens enchantments
REPLACE INTO `item_enchantment_template` (`entry`, `ench`, `patch_min`, `patch_max`) VALUES 
('8652', '1933', '0', '0'),
('8652', '1934', '0', '0'),
('8652', '882', '0', '0'),
('8652', '883', '0', '0'),
('8652', '884', '0', '0'),
('8652', '797', '0', '0'),
('8652', '798', '0', '0'),
('8652', '799', '0', '0'),
('8652', '392', '0', '0'),
('8652', '393', '0', '0'),
('8652', '1052', '0', '0'),
('8652', '1053', '0', '0'),
('8652', '1054', '0', '0'),
('8652', '542', '0', '0'),
('8652', '543', '0', '0'),
('8652', '544', '0', '0'),
('8652', '341', '0', '0'),
('8652', '342', '0', '0');
UPDATE `item_enchantment_template` SET `chance`='1' WHERE `entry`=8652;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
