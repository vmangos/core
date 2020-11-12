DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200624145229');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200624145229');
-- Add your query below.


-- update progress text for Freedom for All Creatures (2969)
UPDATE `quest_template` SET `RequestItemsText` = 'We cannot allow the Grimtotem clan to destroy these beautiful creatures. They must be released from captivity!' WHERE `entry` = 2969;

-- update progress text for Agent of Hydraxis (6823)
UPDATE `quest_template` SET `RequestItemsText` = 'Your campaign is not yet done, $n.  Go out and defeat our enemies, the servants of air and earth and fire, and one day perhaps you will earn a place in the hall of the Waterlords.' WHERE `entry` = 6823;

-- update progress text for The Battle for Alterac (7142)
UPDATE `quest_template` SET `RequestItemsText` = 'We will not suffer the dwarves in our home!  Fall upon our foes and defeat their leader, general Stormpike!' WHERE `entry` = 7142;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
