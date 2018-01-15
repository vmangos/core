DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171221162442');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171221162442');
-- Add your query below.

INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) 
VALUES (6763, 8, 7, 8762, 'Free Metzen - Credit for quest');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
