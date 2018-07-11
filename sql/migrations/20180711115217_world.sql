DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180711115217');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180711115217');
-- Add your query below.


-- Comments from WoWHead below.

/*
Just for fun, I decided to see what the most valuable items in the junkboxes were so it was easy to tell what to leave in the junkboxes and what to loot. Using the loot data here on Wowhead, each box contains an average of 3.75s (Actual money contained appears to fluctuate between 1.5-6s).
Five of the items in the Heavy Junkbox loot table vendor for more than 3.75s on average, and therefore take priority over money: Star Ruby (Vendors for 50s each, averages 5g on Auction House), Rogue's Diary (45.62s), Major Healing Potion (10s, 50s on AH), Shabby Knot (2.25s each, 2-4 per drop), and Humanoid Skull (6.67s).
The remaining items all vendor for less than 3.75s on average, including the rogue poisons. Money should usually take priority over these.

I also found Pattern:Chimeric Leggings, and Formula: Enchant Bracer - Superior Spirit inside my heavy lockboxes.
*/

/*
 Looted inside:
- Plans: Wildthorn Mail
- Quicksilver Ring
- Jungle Necklace
*/

/*
Recieved Plans: Raidant Boots out of one of these.
*/

/*
Just got Alcor's Sunrazor from one of these.
*/

/*
I looted a Shadowblade( http://classicdb.ch/?item=2163 ) from one of the junkboxes...wierd that it's not even on the list :D
*/

/*
picked 1500 of theese for the insane rep farm. opened up every one of em, HAPPY to see 3 x teebu's blazing longswords. Would recommend checking the boxes for loots ;p
*/

/*
Got a Alcor's Sunrazor while grinding boxes for the Insane Achiev about 1/2 way on boxes was surprised as rare as it is.
*/

/*
Got a [Pattern: Chimeric Vest] from this junkbox just a minut ago
*/

/*
Got a Formula: Enchant Boots - Greater Stamina!
*/

/*
I've been farming for the Insane title, and after three bars into revered, I opened one of my heavy junkboxes and got a Shadowblade. :) I know its not near enough to make it worth farming them, but it was such a nice little surprise. Keep opening them while you farm. You might really get an epic out of it.
*/

/*
Day before Cata ships, I have run BRD several times.
I got 12 Sturdy Junkboxes: nothing of value.
And 8 Heavy Junkboxes: Of which my last one game me Alcor's Sunrazor
*/


-- Comments from Thottbot below.

/*
Junkboxes are pickpocketed off mobs occasionally, and they usually just have money. Every so often they have vendor junk or a potion. And one time I got a heavy junkbox with a Dragonscale Band... thought it was a bug at first, now I see it's just a very rare occurence. 
*/

/*
I found an enchanting recipe in one of these, demonslaying :) 
*/

UPDATE `item_template` SET `minMoneyLoot`=150, `maxMoneyLoot`=600 WHERE `entry`=16885;

-- Recipes dropped from Heavy Junkbox.
DELETE FROM `reference_loot_template` WHERE `entry`=1012;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1012, 11208, 0, 1, 1, 1, 0, 0, 10),
(1012, 11224, 0, 1, 1, 1, 0, 0, 10),
(1012, 12682, 0, 1, 1, 1, 0, 0, 10),
(1012, 12683, 0, 1, 1, 1, 0, 0, 10),
(1012, 12684, 0, 1, 1, 1, 0, 0, 10),
(1012, 12689, 0, 1, 1, 1, 0, 0, 10),
(1012, 12691, 0, 1, 1, 1, 0, 0, 10),
(1012, 12693, 0, 1, 1, 1, 0, 0, 10),
(1012, 12694, 0, 1, 1, 1, 0, 0, 10),
(1012, 12695, 0, 1, 1, 1, 0, 0, 10),
(1012, 12697, 0, 1, 1, 1, 0, 0, 10),
(1012, 12704, 0, 1, 1, 1, 0, 0, 10),
(1012, 13490, 0, 1, 1, 1, 0, 0, 10),
(1012, 14467, 0, 1, 1, 1, 0, 0, 10),
(1012, 14478, 0, 1, 1, 1, 0, 0, 10),
(1012, 14484, 0, 1, 1, 1, 0, 0, 10),
(1012, 14494, 0, 1, 1, 1, 0, 0, 10),
(1012, 14498, 0, 1, 1, 1, 0, 0, 10),
(1012, 14499, 0, 1, 1, 1, 0, 0, 10),
(1012, 15731, 0, 1, 1, 1, 0, 0, 10),
(1012, 15737, 0, 1, 1, 1, 0, 0, 10),
(1012, 15743, 0, 1, 1, 1, 0, 0, 10),
(1012, 15745, 0, 1, 1, 1, 0, 0, 10),
(1012, 15746, 0, 1, 1, 1, 0, 0, 10),
(1012, 15755, 0, 1, 1, 1, 0, 0, 10),
(1012, 15757, 0, 1, 1, 1, 0, 0, 10),
(1012, 16215, 0, 1, 1, 1, 0, 0, 10),
(1012, 16218, 0, 1, 1, 1, 0, 0, 10),
(1012, 16220, 0, 1, 1, 1, 0, 0, 10);

-- Greens dropped from Heavy Junkbox.
DELETE FROM `reference_loot_template` WHERE `entry`=1013;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1013, 1994, 0, 1, 1, 1, 0, 0, 10),
(1013, 7523, 0, 1, 1, 1, 0, 0, 10),
(1013, 7553, 0, 1, 1, 1, 0, 0, 10),
(1013, 9941, 0, 1, 1, 1, 0, 0, 10),
(1013, 10083, 0, 1, 1, 1, 0, 0, 10),
(1013, 10275, 0, 1, 1, 1, 0, 0, 10),
(1013, 11976, 0, 1, 1, 1, 0, 0, 10),
(1013, 11977, 0, 1, 1, 1, 0, 0, 10),
(1013, 11978, 0, 1, 1, 1, 0, 0, 10),
(1013, 11989, 0, 1, 1, 1, 0, 0, 10),
(1013, 11990, 0, 1, 1, 1, 0, 0, 10),
(1013, 11991, 0, 1, 1, 1, 0, 0, 10),
(1013, 11999, 0, 1, 1, 1, 0, 0, 10),
(1013, 12002, 0, 1, 1, 1, 0, 0, 10),
(1013, 12004, 0, 1, 1, 1, 0, 0, 10),
(1013, 12014, 0, 1, 1, 1, 0, 0, 10),
(1013, 12015, 0, 1, 1, 1, 0, 0, 10),
(1013, 12025, 0, 1, 1, 1, 0, 0, 10),
(1013, 12026, 0, 1, 1, 1, 0, 0, 10),
(1013, 12034, 0, 1, 1, 1, 0, 0, 10),
(1013, 12035, 0, 1, 1, 1, 0, 0, 10),
(1013, 12044, 0, 1, 1, 1, 0, 0, 10),
(1013, 12045, 0, 1, 1, 1, 0, 0, 10),
(1013, 12046, 0, 1, 1, 1, 0, 0, 10),
(1013, 12055, 0, 1, 1, 1, 0, 0, 10),
(1013, 12056, 0, 1, 1, 1, 0, 0, 10),
(1013, 12057, 0, 1, 1, 1, 0, 0, 10),
(1013, 15324, 0, 1, 1, 1, 0, 0, 10);

-- Blues and Epics dropped from Heavy Junkbox.
-- https://web.archive.org/web/20090313074825/http://thottbot.com:80/i16885#D::A
DELETE FROM `reference_loot_template` WHERE `entry`=1014;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1014, 1728, 0, 1, 1, 1, 0, 0, 10),
(1014, 2163, 0, 1, 1, 1, 0, 0, 10),
(1014, 13046, 0, 1, 1, 1, 0, 0, 10),
(1014, 14555, 0, 1, 1, 1, 0, 0, 10);

-- Loot for Heavy Junkbox.
-- https://web.archive.org/web/20070518164222/http://www.thottbot.com:80/i16885
DELETE FROM `item_loot_template` WHERE `entry`=16885;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(16885, 1012, 1.45, 0, -1012, 1, 0, 0, 10),
(16885, 1013, 1.4, 0, -1013, 1, 0, 0, 10),
(16885, 1014, 0.5, 0, -1014, 1, 0, 0, 10),
(16885, 785, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 2450, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 2928, 19.8, 0, 2, 8, 0, 0, 10),
(16885, 2930, 20.4, 0, 2, 2, 0, 0, 10),
(16885, 3356, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 3357, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 3419, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 3821, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 3928, 0.2, 0, 1, 1, 0, 0, 10),
(16885, 5140, 20.6, 0, 1, 9, 0, 0, 10),
(16885, 5173, 19.1, 0, 2, 8, 0, 0, 10),
(16885, 5428, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 5500, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 5530, 42.5, 0, 1, 8, 0, 0, 10),
(16885, 7909, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 7910, 1, 0, 1, 1, 0, 0, 10),
(16885, 7974, 0.5, 0, 1, 1, 0, 0, 10),
(16885, 8838, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 8846, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 8923, 19.8, 0, 2, 8, 0, 0, 10),
(16885, 8924, 18, 0, 2, 5, 0, 0, 10),
(16885, 8948, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 9355, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 13446, 9, 0, 1, 1, 0, 0, 10),
(16885, 13926, 0.05, 0, 1, 1, 0, 0, 10),
(16885, 24231, 24, 2, 2, 3, 0, 10, 10),
(16885, 24232, 3.5, 2, 2, 4, 0, 10, 10),
(16885, 24281, 5, 2, 1, 1, 0, 10, 10),
(16885, 24282, 1.5, 2, 1, 1, 0, 9, 10),
(16885, 24283, 0.5, 0, 1, 1, 0, 9, 10);

-- No longer used.
DELETE FROM `reference_loot_template` WHERE `entry` IN (1001, 1003);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
