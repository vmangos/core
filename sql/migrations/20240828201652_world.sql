DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240828201652');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240828201652');
-- Add your query below.


-- Fix gossip of Xizk Goodstitch.
DELETE FROM `gossip_menu` WHERE `entry`=2685;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2685, 3357, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2685, 3358, 0, 67);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
