DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180518172228');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180518172228');
-- Add your query below.


CREATE TABLE IF NOT EXISTS `map_event_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `target_param1` int(10) unsigned NOT NULL DEFAULT '0',
  `target_param2` int(10) unsigned NOT NULL DEFAULT '0',
  `target_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `conditions`
	ADD COLUMN `value3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'data field three for the condition' AFTER `value2`,
	ADD COLUMN `value4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'data field four for the condition' AFTER `value3`,
	DROP INDEX `unique_conditions`,
	ADD UNIQUE INDEX `unique_conditions` (`type`, `value1`, `value2`, `flags`, `value3`, `value4`);

UPDATE `conditions` SET `type`=34, `value3`=1 WHERE `type`=35;
UPDATE `conditions` SET `type`=34, `value3`=2 WHERE `type`=36;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
