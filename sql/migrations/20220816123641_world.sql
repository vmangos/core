DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220816123641');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220816123641');
-- Add your query below.


-- Increase Lay on Hands threat so it does 95% of its heal amount with Improved Righteous Fury.
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (633, 0, 2, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
