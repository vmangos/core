DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210114233723');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210114233723');
-- Add your query below.


-- Add targets for Gnarlpine Vengeance.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES 
(5628, 1, 2006, 0),
(5628, 1, 2007, 0),
(5628, 1, 2008, 0),
(5628, 1, 2009, 0),
(5628, 1, 2010, 0),
(5628, 1, 2011, 0),
(5628, 1, 2012, 0),
(5628, 1, 2013, 0),
(5628, 1, 2014, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
