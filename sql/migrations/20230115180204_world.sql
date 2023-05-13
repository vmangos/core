DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230115180204');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230115180204');
-- Add your query below.

-- add missing ' in title
UPDATE `quest_template` SET `Title`='A Smokywood Pastures\' Thank You!' WHERE  `entry`=6984;

-- removed (elite) from title
UPDATE `quest_template` SET `Title`='Unraveling the Mystery' WHERE  `entry`=8314 AND `patch`=6;

-- Quest: Encoded Fragments

-- description was using tbc version (changed in ~2.1)
UPDATE `quest_template` SET `Details`='Lord Ravenholdt has asked a favor of us both.  He wishes to remove the enchantment from this bag.$b$bUnfortunately, some of my books on the subject of dispelling were taken recently, only to be destroyed by savages.  The remains of my books are still valuable to me.$b$bIf you can bring me enough of the encoded fragments, I can piece them back together.  Your best chance is to kill forest oozes, since they have a tendency to pick up just about anything.  You\'ll find them in northeast Azshara.' WHERE  `entry`=8235 AND `patch`=5;

-- remove questdrops from TBC version
DELETE FROM `creature_loot_template` WHERE `item`=20023 AND `entry` IN (6377, 6378, 6379, 6380, 8762);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
