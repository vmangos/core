DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180227020029');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180227020029');
-- Add your query below.

UPDATE `item_template` SET `ExtraFlags`=2 WHERE entry in (21221,19802,18422,18423,19003,19002,20644);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
