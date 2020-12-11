DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201211153803');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201211153803');
-- Add your query below.


-- executioners sword - veenix
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4086 AND `item` = 4818;

-- dwarven mild - chylina
DELETE FROM `npc_vendor` WHERE `entry` = 4084 AND `item` = 422;

-- snapvine watermellon - chylina
DELETE FROM `npc_vendor` WHERE `entry` = 4084 AND `item` = 4538;

-- bristle whisker catfish - chylina
DELETE FROM `npc_vendor` WHERE `entry` = 4084 AND `item` = 4593;

-- small throwing knife and crude throwing axe - chylina
DELETE FROM `npc_vendor` WHERE `entry` = 4084 AND `item` IN (2947, 3111);

-- missing items jeeda
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(4083, 3357, 1, 7200),
(4083, 929, 3, 7200),
(4083, 3355, 1, 7200),
(4083, 785, 2, 7200);

-- small throwing knife and crude throwing axe - grawnal
DELETE FROM `npc_vendor` WHERE `entry` = 4082 AND `item` IN (2947, 3111);

-- fine longbow - borand
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 9549 AND `item` = 11304;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
