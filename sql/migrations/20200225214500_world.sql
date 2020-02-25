DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200225214500');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200225214500');
-- Add your query below.

-- Correct Shimmering Gloves enchantment id to match Classic data: https://classic.wowhead.com/item=6565/shimmering-gloves
UPDATE `item_template` SET `random_property`='710' WHERE `entry`='6565';
-- However, they shouldn't be sold at NPC Zizzek: https://classic.wowhead.com/npc=3572/zizzek
-- Seems, it was a human error to add Shimmering Gloves (6565) instead of a Strong Fishing Pole (6365): http://classicdb.ch/?npc=3572
DELETE FROM `npc_vendor` WHERE `entry` = '3572' AND `item` = '6565';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
