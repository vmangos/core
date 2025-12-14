DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230904190328');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230904190328');
-- Add your query below.


-- Add table to allow limiting number of times a creature id is selected in group.
CREATE TABLE IF NOT EXISTS `creature_groups_entry_limit` (
  `leader_guid` int(11) unsigned NOT NULL,
  `creature_id` int(11) unsigned NOT NULL,
  `min_count` int(11) unsigned NOT NULL DEFAULT '0',
  `max_count` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`leader_guid`,`creature_id`)
) ENGINE=MyISAM;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
