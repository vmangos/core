DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171216152525');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171216152525');
-- Add your query below.

DELETE FROM `gossip_scripts` WHERE `id`=6763 AND `command`=7;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) 
VALUES (6763, 8, 7, 8746, 'Free Metzen - Credit for quest');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
