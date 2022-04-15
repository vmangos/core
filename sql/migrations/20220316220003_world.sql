DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220316220003');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220316220003');
-- Add your query below.

INSERT INTO `conditions` VALUES (7715, 11, 30056, 1, 0, 0, 0);
UPDATE `gossip_menu` SET `condition_id`=7715 WHERE `entry`=6421 AND `text_id`=7714;
UPDATE `gossip_menu` SET `condition_id`=0    WHERE `entry`=6421 AND `text_id`=7614;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
