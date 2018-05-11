DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180511090349');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180511090349');
-- Add your query below.


-- Third volume of Enchanted Thorium Platemail should require 300 Blacksmithing as well.
-- https://web.archive.org/web/20071124090136/http://wow.allakhazam.com:80/db/item.html?witem=18771
UPDATE `item_template` SET `AllowableClass`=-1, `AllowableRace`=-1, `RequiredSkill`=164, `RequiredSkillRank`=300 WHERE `entry`=18771;

-- The books for Enchanted Thorium Platemail were added in 1.4. Quests have the right patch already.
-- There are no comments for them or the associated quests on Allakhazam prior to April 2005.
-- Most importantly the spells to craft them also do not exist in the 1.3 client.
UPDATE `item_template` SET `patch`=2 WHERE `entry` IN (18769, 18770, 18771);
REPLACE INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (18769, 1, 1);
REPLACE INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (18770, 1, 1);
REPLACE INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (18771, 1, 1);
UPDATE `item_template` SET `patch`=2 WHERE `entry` IN (18779, 18780, 18781, 18782, 18783, 18784);
REPLACE INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (18779, 1, 1);
REPLACE INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (18780, 1, 1);
REPLACE INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (18781, 1, 1);
REPLACE INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (18782, 1, 1);
REPLACE INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (18783, 1, 1);
REPLACE INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (18784, 1, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
