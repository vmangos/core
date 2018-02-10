DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180210075757');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180210075757');
-- Add your query below.

-- Lunar Festival vendor corrections
DELETE FROM `npc_vendor` WHERE `item` IN (21640, 21741, 21743, 21742, 21740, 21537);

-- Correct the number of dumplings received from Coin of Ancenstry turnins
-- 8 as per https://web.archive.org/web/20071113084858/http://wow.allakhazam.com:80/db/quest.html?wquest=8863
UPDATE `quest_template` SET `RewItemCount1` = 8 WHERE `entry` = 8863;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
