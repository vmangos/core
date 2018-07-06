DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180705094551');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180705094551');
-- Add your query below.


REPLACE INTO `spell_mod` (`Id`, `AttributesEx`, `Comment`) VALUES 
('5101', '262144', 'Daze spell attribute'),
('5116', '262144', 'Daze spell attribute'),
('12323', '262144', 'Daze spell attribute'),
('13496', '262144', 'Daze spell attribute'),
('17174', '262144', 'Daze spell attribute'),
('22914', '262144', 'Daze spell attribute'),
('23600', '262144', 'Daze spell attribute'),
('26379', '262144', 'Daze spell attribute'),
('27634', '262144', 'Daze spell attribute');

UPDATE `spell_mod` SET `AttributesEx`='262144' WHERE `Id`=15571;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
