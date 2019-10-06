DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190422165936');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190422165936');
-- Add your query below.


-- Add missing flags for Andonisus, Reaper of Souls.
UPDATE `item_template` SET `flags`=229378 WHERE `entry`=22736;

-- Add missing depracated flag to several items.
UPDATE `item_template` SET `flags`=`flags`+16 WHERE `entry` IN (2444, 2929, 2932, 3034, 5105, 7725);

-- Add missing flag with unknown meaning to Atiesh.
UPDATE `item_template` SET `flags`=`flags`+64 WHERE `entry` IN (22589, 22630, 22631, 22632, 22737);

-- Add missing party loot flag to several items.
UPDATE `item_template` SET `flags`=`flags`+2048 WHERE `entry` IN (4613, 5061, 5338, 9189, 11179, 12334, 12345, 12411, 12412, 12467, 12525, 12765, 12766, 12768, 13536, 18336, 22733, 22734);

-- Add missing no disenchant flag to several items.
UPDATE `item_template` SET `flags`=`flags`+32768 WHERE entry IN (17586, 17588, 17590, 17591, 17592, 17593, 19577, 19822, 19823, 19824, 22860, 22870, 22883, 22886, 23206, 23263, 23264);

-- Replace ITEM_EXTRA_REAL_TIME_DURATION with ITEM_EXTRA_MAIL_STATIONERY.
UPDATE `item_template` SET `extra_flags`=`extra_flags`-1 WHERE (`extra_flags` & 1);
UPDATE `item_template` SET `extra_flags`=`extra_flags`+1 WHERE (`extra_flags` & 8);
UPDATE `item_template` SET `extra_flags`=`extra_flags`-8 WHERE (`extra_flags` & 8);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
