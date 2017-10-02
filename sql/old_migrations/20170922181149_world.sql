INSERT INTO `migrations` VALUES ('20170922181149'); 

-- Assign gossip menu to Roberto Pupellyverbos and Elaine Trias.
UPDATE `creature_template` SET `gossip_menu_id`=685, `npcflag`=5 WHERE `entry` IN (277, 483);

-- Assign gossip menu to Alma Jainrose.
UPDATE `creature_template` SET `gossip_menu_id`=7691 WHERE `entry`=812;

-- Add quest greeting for Martie Jainrose.
-- https://youtu.be/dtwK_FXCgNs?t=40s
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`) VALUES (342, 0, 'Hail, $n. Welcome to my humble garden. The weather has been perfect lately. Let us hope it holds steady for a ripe harvest.');

-- Fix text for Monument to Grom Hellscream.
-- https://github.com/elysium-project/server/issues/2674
UPDATE `page_text` SET `text`='Here lies Grommash Hellscream, Chieftain of the Warsong Clan$B$BIn many ways, the curse of our people began and ended with Grom.$BHis name meant \'giant\'s heart\' in our ancient tongue. He earned that $Bname a hundred-fold as he stood alone before the demon Mannoroth $B- and won our freedom with his blood. $B$BLok\'Tar ogar, big brother. May the Warsong never fade. $B$B-Thrall, Warchief of the Horde $B' WHERE `entry`=2211;

-- Add missing item Spellshock Leggings to ZF loot.
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (7267, 9484, 0.01, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (8127, 9484, 0.01, 0, 1, 1, 0);
