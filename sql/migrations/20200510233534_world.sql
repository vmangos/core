DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200510233534');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200510233534');
-- Add your query below.

-- Fix page_text of The Third Troll Legend.
UPDATE `item_template` SET `page_text`=325 WHERE `entry`=2007;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
