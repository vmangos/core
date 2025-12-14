DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230324083740');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230324083740');
-- Add your query below.


/*
By Managos (2,236 – 5·11) on 2021/03/18 (Classic)		
After killing over 3,769 worgs in Tirisfal Glades, with stringy wolf meat x2000,
discolored worg hearts x2946, and many useless greens... I got my DARKWOOD POLE.
Now to say that its better than the quest pole for horde would be a lie, however..
Its pretty neat to see. Good luck to those still grinding it out!
*/
/*
By Karasukami on 2005/01/21 (Patch 1.2.1)		
Subject: "hmm"
I have read that Bloodsnout Worgs in silverpine drop this..
I guess I'll try and see if that is so. :\
*/
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(1765, 6366, 0.005, 0, 1, 1, 0, 0, 10), -- Worg
(1766, 6366, 0.005, 0, 1, 1, 0, 0, 10), -- Mottled Worg
(1923, 6366, 0.005, 0, 1, 1, 0, 0, 10); -- Bloodsnout Worg

/*
By bilcosby on 2006/08/11 (Patch 1.11.2)		
Subject: "i got one"
i got one from a random mob in duskwood was a worg i was just running thro to get to ZG and i killed for fun and it droped
*/
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(628, 6366, 0.005, 0, 1, 1, 0, 0, 10), -- Black Ravager
(923, 6366, 0.005, 0, 1, 1, 0, 0, 10); -- Young Black Ravager


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
