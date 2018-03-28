DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180325023821');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180325023821');
-- Add your query below.


REPLACE INTO `spell_effect_mod` (`Id`, `EffectBasePoints`, `Comment`) VALUES 
('2823', '1799', 'Temporary Enchant Duration'),
('2824', '1799', 'Temporary Enchant Duration'),
('3594', '1799', 'Temporary Enchant Duration'),
('6650', '1799', 'Temporary Enchant Duration'),
('7434', '1799', 'Temporary Enchant Duration'),
('7439', '3599', 'Temporary Enchant Duration'),
('7448', '3599', 'Temporary Enchant Duration'),
('7451', '3599', 'Temporary Enchant Duration'),
('7769', '3599', 'Temporary Enchant Duration'),
('7853', '3599', 'Temporary Enchant Duration'),
('7855', '3599', 'Temporary Enchant Duration'),
('7865', '3599', 'Temporary Enchant Duration'),
('8017', '299', 'Temporary Enchant Duration'),
('8018', '299', 'Temporary Enchant Duration'),
('8019', '299', 'Temporary Enchant Duration'),
('8024', '299', 'Temporary Enchant Duration'),
('8027', '299', 'Temporary Enchant Duration'),
('8030', '299', 'Temporary Enchant Duration'),
('8033', '299', 'Temporary Enchant Duration'),
('8038', '299', 'Temporary Enchant Duration'),
('8087', '599', 'Temporary Enchant Duration'),
('8088', '599', 'Temporary Enchant Duration'),
('8089', '299', 'Temporary Enchant Duration'),
('8090', '599', 'Temporary Enchant Duration'),
('8232', '299', 'Temporary Enchant Duration'),
('8235', '299', 'Temporary Enchant Duration'),
('8532', '599', 'Temporary Enchant Duration'),
('8679', '1799', 'Temporary Enchant Duration'),
('8686', '1799', 'Temporary Enchant Duration'),
('8688', '1799', 'Temporary Enchant Duration'),
('9092', '599', 'Temporary Enchant Duration'),
('10399', '299', 'Temporary Enchant Duration'),
('10456', '299', 'Temporary Enchant Duration'),
('10486', '299', 'Temporary Enchant Duration'),
('11338', '1799', 'Temporary Enchant Duration'),
('11339', '1799', 'Temporary Enchant Duration'),
('11340', '1799', 'Temporary Enchant Duration'),
('11355', '1799', 'Temporary Enchant Duration'),
('11356', '1799', 'Temporary Enchant Duration'),
('16314', '299', 'Temporary Enchant Duration'),
('16315', '299', 'Temporary Enchant Duration'),
('16316', '299', 'Temporary Enchant Duration'),
('16339', '299', 'Temporary Enchant Duration'),
('16341', '299', 'Temporary Enchant Duration'),
('16342', '299', 'Temporary Enchant Duration'),
('16355', '299', 'Temporary Enchant Duration'),
('16356', '299', 'Temporary Enchant Duration'),
('16362', '299', 'Temporary Enchant Duration'),
('25351', '1799', 'Temporary Enchant Duration'),
('28891', '3599', 'Temporary Enchant Duration');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
