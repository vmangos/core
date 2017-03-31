INSERT INTO `migrations` VALUES ('20170327030530');
-- Add the npc_text connecion to the npc_gossip for Archmage Xylem
INSERT INTO `npc_gossip` (`npc_guid`,`textid`) VALUES (35886,8379) ON DUPLICATE KEY UPDATE npc_guid = npc_guid;
-- Combine the bitfields to allow for gossip and Xylem to be a quest giver
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry`=8379;
