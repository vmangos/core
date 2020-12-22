DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201222170716');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201222170716');
-- Add your query below.


-- thousand needles
-- mageroyal - montarr
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4878 AND `item` = 785;

-- scroll of stamina 2 - montarr
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4878 AND `item` = 1711;

-- scroll of int 2 - montarr
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4878 AND `item` = 2290;

-- missing items - montarr
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(4878, 1478, 2, 7200),
(4878, 3355, 1, 7200),
(4878, 954, 2, 7200),
(4878, 2449, 3, 7200),
(4878, 2453, 2, 7200);

-- fine longbow - starn
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 9551 AND `item` = 11304;

-- balanced throwing dagger - jawn highmesa
DELETE FROM `npc_vendor` WHERE `entry` = 4876 AND `item` = 2946;

-- weighted throwing axe - jawn highmesa
DELETE FROM `npc_vendor` WHERE `entry` = 4876 AND `item` = 3131;

-- missing items - jinky twizzlefixxit
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(6730, 4389, 1, 10800),
(6730, 4382, 1, 10800),
(6730, 4371, 2, 10800),
(6730, 4361, 2, 10800);


-- tanaris
-- balanced throwing dagger - jabbey 
DELETE FROM `npc_vendor` WHERE `entry` = 8139 AND `item` = 2946;

-- weighted throwing axe - jabbey 
DELETE FROM `npc_vendor` WHERE `entry` = 8139 AND `item` = 3131;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
