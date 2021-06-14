DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210104121750');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210104121750');
-- Add your query below.


-- Remove Speed limit from Traces of Silithyst (29534)
DELETE FROM `spell_effect_mod` WHERE  `Id`=29534 AND `EffectIndex`=0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
