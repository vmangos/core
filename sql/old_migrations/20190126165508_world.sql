DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190126165508');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190126165508');
-- Add your query below.


-- Fix pre-1.10 version of Feedback.
UPDATE `spell_template` SET `effectImplicitTargetA1`=0 WHERE `build`=5086 && `ID` IN (13896, 19271, 19273, 19274, 19275);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
