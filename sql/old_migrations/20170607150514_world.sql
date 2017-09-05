INSERT INTO `migrations` VALUES ('20170607150514'); 

-- Assign gossip menu to Deathguard Dillinger and Deathguard Burgess
DELETE FROM `npc_gossip` WHERE `npc_guid`=29796;
UPDATE `creature_template` SET `gossip_menu_id`=3356 WHERE `entry` IN (1496, 1652);

-- Remove gossip flag from Deathguard Phillip, Deathguard Randolph, Deathguard Oliver, Deathguard Elite
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry` IN (1736, 1737, 1739, 7980);

-- Assign gossip menu to Osric Strang
UPDATE `creature_template` SET `gossip_menu_id`=688 WHERE `entry`=1323;

-- Gossip menu for Human Orphan
INSERT INTO `gossip_menu` VALUES (5819, 6992, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5819, `npcflag`=3 WHERE `entry`=14305;

-- Remove static gossip for Scooty, he has a menu.
DELETE FROM `npc_gossip` WHERE `npc_guid`=2;

-- Gossip menu for Bernard Gump
INSERT INTO `gossip_menu` VALUES (703, 1255, 0);
UPDATE `creature_template` SET `gossip_menu_id`=703, `npcflag`=5 WHERE `entry`=1302;

-- Gossip text for Apothecary Johaan
INSERT INTO `npc_text` VALUES (213,'The Dark Lady has put forth the challenge. It is up to us to meet it.','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (35231, 213);

-- Gossip text for Coleman Farthing
INSERT INTO `npc_text` VALUES (214, 'I hope you\'re well, all things considered.\r\n\r\nSit for a spell, and hear my tale. It\'s a tragedy, of course, but one I hope will end in revenge!', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (29801, 214);

-- Gossip text for Executor Zygand
INSERT INTO `npc_text` VALUES (215, 'The Scarlet Crusade is encroaching on our homeland. The foolish zealots do not realize that the loyal servants of The Dark Lady shall see to their demise.', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (29797, 215);

-- Gossip text for Magistrate Sevren
INSERT INTO `npc_text` VALUES (216, 'Ah, you there! I have tasks to give, and I need not waste time explaining their crucial nature. Listen close.', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (34779, 216);

-- Gossip text for Deathguard Linnea
INSERT INTO `npc_text` VALUES (217, '', 'Greetings, $C. Be wary as you travel east toward The Bulwark. Recent surveillance reports indicate increased Scourge activity in that area, so exercise caution.', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (34778, 217);

-- Gossip text for Master Gadrin
INSERT INTO `npc_text` VALUES (218, 'There is something you wish to discuss, $c... come, sit by me.', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (6462, 218);

-- Gossip text for Canaga Earthcaller
INSERT INTO `npc_text` VALUES (219, 'I welcome you back, $n.', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (3417, 219);

-- Gossip text for Gar'Thok
INSERT INTO `npc_text` VALUES (220, 'Throm\'ka, $c. There is little time for talk and much work to be done.', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (4692, 220);

-- Gossip text for Kin'weelay
INSERT INTO `npc_text` VALUES (221, 'Hello! The spirits say you here to aid my chief. Say it loud, they do.', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (722, 221);

-- Gossip text for Sergra Darkthorn
INSERT INTO `npc_text` VALUES (222, '', 'The land, the water and the sky are all as one. It is your eyes that deceive you with such separation. The Earthmother is all those things and more.', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (13167, 222);

-- Gossip text for Mountaineer Stormpike
INSERT INTO `npc_text` VALUES (223, 'Well, if it isn\'t a young, bristling $c, no doubt drawn here by talk of my exploits in fields of battle!$B$BNo time for stories now, for there are great, important deeds that need doing!  So if you\'re looking for glory, then luck shines on you today...', '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (8204, 223);
