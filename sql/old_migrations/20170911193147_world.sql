INSERT INTO `migrations` VALUES ('20170911193147'); 

-- Add column 'type' to table so it can support gameobjects.
ALTER TABLE `quest_greeting`
	ADD COLUMN `type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `entry`,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`entry`, `type`);

-- Add more quest greetings from cmangos.
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (737, 0, 'Well, hello there. You seem like you wouldn\'t be opposed to making some coin, hm? I can tell from the look in your eyes. I am Mogul Kebok, overseer of operations in Azeroth, and if it is riches you seek, perhaps I can make arrangements.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (773, 0, '$C, eh? I am Krazek, Baron Revilgaz\'s secretary. I know everything about the goings on in this jungle and beyond. Perhaps you\'d be interested in knowing the going price on oil in Ratchet? No? Looking for work, maybe? I can help you there.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (786, 0, 'Greetings, $G lad : lass;. I\'m Grelin Whitebeard. I\'m here to examine the threat posed by the growing numbers of trolls in Coldridge Valley. What have I found? It\'s a bit troubling...', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (1374, 0, 'Curse that Brewers\' League! They have access to all the best ingredients, while we\'re stuck here grubbing for grain and hops!', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (1937, 0, 'The Dark Lady has put the challenge forth.  Now it is up to the Royal Apothecary Society to develop a new plague.  We shall bring Arthas and his wretched army to their knees.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (2076, 1, 'This cauldron churns with thick, green bubbles.  Skulls, bones and organs of unknown creatures swim within its viscous broth...$B$BAnd rising lazily to the surface are the skulls of two, once mighty trolls:$B$BGan\'zulah and Nezzliok.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (2121, 0, 'Information... With our scouts and agents, we control the flow of information in Lordaeron. Scourge movements, their holdings, all underneath our watchful eyes...', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (2285, 0, 'My family boasts the finest collection of jewelry and objects of fine art among all the nobles of Stormwind!$B$BAnd we are always wishing to increase the size our collection...', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (2498, 0, 'What what?!?  We all have profit to make... and we won\'t do it by standing idle.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (2921, 0, 'How perfect of you to come by, $c.$B$BMy name is Lotwil Veriatus, founding member of the Enlightened Assembly of Arcanology, Alchemy, and Engineering Sciences: we seek to blend the intelligent sciences of Azeroth together into one comprehensive school.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (3391, 0, 'Thrall paid me and my boys well for helping out with the construction of Orgrimmar, so I decided to set up a port here. We do most of our business through Booty Bay and Baron Revilgaz.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (4791, 0, 'We may not be in open war with the Alliance, but blood is still shed between us.', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (5204, 0, 'If we are to make our place in this world, then we will do so through study, and through the will to ignore our fading human instincts.', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (5394, 0, 'Don\'t let the heat bother you.  In the Badlands, heat is the least of your worries.', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (5591, 0, 'This sty\'s a little shy of comfy, but it has history, so Stonard must be important to someone. I\'d gamble that\'s why we stay here. It sure ain\'t for the view--it don\'t even look like home.', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (7407, 0, 'The name\'s Bilgewhizzle, and I am the chief engineer of the Gadgetzan Water Company.  What can I assist you with?', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (7876, 0, 'Some people wonder what we\'re doing out here in the desert.  Well... if I told you, then you\'d stay and try to make our profits!', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (7882, 0, 'We\'re here to make a profit.  And having our goods stolen is no way to make a profit.', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (7900, 0, 'Hello, $N. Perhaps you have some time to chat?', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (9078, 0, 'Dear $g boy:girl;, you have arrived just in time to assist the Kargath Expeditionary Force.', 1, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (10926, 0, 'I never feel warm anymore...', 0, 0);
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`, `EmoteDelay`) VALUES (11039, 0, 'Greetings, $N. I am Duke Nicholas Zverenhoff of the Argent Dawn.', 1, 0);

-- Grelin Whitebeard has a quest greeting.
DELETE FROM `npc_gossip` WHERE `npc_guid`=963;

-- Add gossip to Haughty Modiste.
UPDATE `creature_template` SET `gossip_menu_id`=7524 WHERE `entry`=15165;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (7524, 0, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
