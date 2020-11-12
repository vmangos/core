DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200929142434');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200929142434');
-- Add your query below.


DROP TABLE IF EXISTS `character_spell_cooldown`;
CREATE TABLE `character_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `SpellId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `SpellExpireTime` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell cooldown expire time',
  `Category` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category',
  `CategoryExpireTime` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category cooldown expire time',
  `ItemId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  PRIMARY KEY (`guid`,`SpellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
