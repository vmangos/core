DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180414160752');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180414160752');
-- Add your query below.

-- Arathi Highlands
-- Start of vid 17: https://www.youtube.com/watch?v=XccyLbaij2c&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Foul Magics pt. 1
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=671 AND `patch`=0;

-- Hammerfall

-- Raising Spirits pt. 1
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=672 AND `patch`=0;

-- Call to Arms pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=677 AND `patch`=0;

-- Raising Spirits pt. 2
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=674 AND `patch`=0;

-- Raising Spirits pt. 3

-- Guile of the Raptor pt. 1
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=701 AND `patch`=0;

-- Start of vid 21: https://www.youtube.com/watch?v=t9-p76s-G5k&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- To Steal From Thieves - accept ok
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2 WHERE `entry`=1164 AND `patch`=0;

-- Start of vid 22: https://www.youtube.com/watch?v=S20Mm-Zesik&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Sigil of Strom

-- The Princess Trapped

-- Hammerfall Guardian remove gossip flag
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=2621 AND `patch`=0;

-- Call to Arms pt. 2
UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=678 AND `patch`=0;

-- Stones of Binding

-- Triage

-- Call to Arms pt. 3 - Wrong amount of NPCs to kill
-- Boulderfist Shaman 7 -> 15
-- Boulderfist Lord 3 -> 10
-- Source: http://web.archive.org/web/20070516022750/http://thottbot.com:80/q679
-- Source: https://web.archive.org/web/20060522070439/http://wow.allakhazam.com:80/db/quest.html?wquest=679
UPDATE `quest_template` SET `Objectives`='Kill 15 Boulderfist Shaman and 10 Boulderfist Lords and return to Drum Fel in the Hammerfall outpost.' WHERE `entry`=679 AND `patch`=0;
UPDATE `quest_template` SET `ReqCreatureOrGOCount1`=15, `ReqCreatureOrGOCount2`=10 WHERE `entry`=679 AND `patch`=0;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=679 AND `patch`=0;

-- Guile of the Raptor pt. 2
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=702 AND `patch`=0;

-- Update timings in quest_end_scripts
DELETE FROM `quest_end_scripts` WHERE `id`=702;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(702, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: npc\_flag questgiver removed'),
(702, 0, 15, 4153, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Cast spell on himself'),
(702, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1020, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Emote text 1'),
(702, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 861, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Say text 1'),
(702, 8, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Roar emote'),
(702, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 862, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Say text 2'),
(702, 9, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: npc\_flag questgiver added');

-- Guile of the Raptor pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=23, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=847 AND `patch`=0;

-- Foul Magics pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=673 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
