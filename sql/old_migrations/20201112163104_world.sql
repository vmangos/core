DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201112163104');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201112163104');
-- Add your query below.


CREATE TABLE IF NOT EXISTS `gameobject_display_info_addon` (
  `display_id` int(11) NOT NULL DEFAULT '0',
  `min_x` float NOT NULL DEFAULT '0',
  `min_y` float NOT NULL DEFAULT '0',
  `min_z` float NOT NULL DEFAULT '0',
  `max_x` float NOT NULL DEFAULT '0',
  `max_y` float NOT NULL DEFAULT '0',
  `max_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`display_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
