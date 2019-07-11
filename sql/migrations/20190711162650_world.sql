DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190711162650');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190711162650');
-- Add your query below.


-- Texts for waterwalk and wallclimb commands.
UPDATE `mangos_string` SET `content_default`='You set waterwalk mode to %s for %s.' WHERE `entry`=338;
UPDATE `mangos_string` SET `content_default`='Your waterwalk mode has been turned %s by %s.' WHERE `entry`=339;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (351, 'You set wallclimb mode to %s for %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (352, 'Your wallclimb mode has been turned %s by %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
