INSERT INTO `migrations` VALUES ('20170805164518'); 

-- Structure for table quest_greeting
CREATE TABLE IF NOT EXISTS `quest_greeting` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `Emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Remove quest greeting texts from npc_text. They don't belong there.
-- I added them there before, because quest greetings were not implemented.
DELETE FROM `npc_text` WHERE `ID` BETWEEN 198 AND 225;
DELETE FROM `npc_gossip` WHERE `textid` BETWEEN 198 AND 225;

-- Deputy Willem - http://www.youtube.com/watch?v=oLy8hMW-e48&t=6m50s ; German https://youtu.be/nYLy1qAVSP8?t=31s
INSERT INTO `quest_greeting` VALUES (823, 'Hello there, $c.  Normally I\'d be out on the beat looking after the folk of Stormwind, but a lot of the Stormwind guards are fighting in the other lands.  So here I am, deputized and offering bounties when I\'d rather be on patrol...', NULL, NULL, 'Guten Tag, $C. Normalerweise würde ich jetzt meine Runde machen und die Leute von Sturmwind beschützen, doch viele der Wachen von Sturmwind kämpfen in fremden Landen. Daher mache ich jetzt hier Vertretung und setze Kopfgelder aus, wo ich doch eigentlich lieber auf Patrouille sein würde...', NULL, NULL, NULL, NULL, NULL, 1, 0);
-- Remy "Two Times" - http://www.youtube.com/watch?v=4wIP0mdSVUA&t=1m32s ; German https://youtu.be/DuFDfmLFTA4?t=8m30s
INSERT INTO `quest_greeting` VALUES (241, 'Hey there, friend.  My name\'s Remy.$BI\'m from Redridge to the east, and came here looking for business, looking for business.  You got any...got any??', NULL, NULL, 'He, mein Freund. Man nennt mich Remy. Ich komme aus dem Rotkammgebirge im Osten und bin auf der Suche nach interessanten... Geschäften. Interessanten... Geschäften. Habt Ihr vielleicht welche... vielleicht welche?', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Guard Thomas - http://www.youtube.com/watch?v=RMF2a7Rg1FA&t=3m10s ; German https://youtu.be/j5DXCRAcUCE?t=7m53s
INSERT INTO `quest_greeting` VALUES (261, 'Hello, citizen.  You look like a $g man : woman; with a purpose - do you have business with the Stormwind Army?', NULL, NULL, 'Seid gegrüßt. Ihr seht aus wie ein $g Mann : Frau;, der weiß, was er will... habt ihr mit der Armee von Sturmwind zu tun?', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Farmer Furlbrow - http://www.youtube.com/watch?v=PNqdaVzV6FI&t=1m4s ; German https://youtu.be/cWnT_Qndfx0?t=3m28s
INSERT INTO `quest_greeting` VALUES (237, 'Nothing but trouble in these parts.  I tried to tell that fool Saldean to get out while he still could but he won\'t hear of it.  But I ain\'t no fool.  Verna and I are gonna mosey on out as soon as we get this wagon fixed.', NULL, NULL, 'In dieser Gegend gibt es wirklich nichts als Arger. Ich habe versucht, den Dummkopf Saldean dazu zu bringen, sich aus dem Staub zu machen, solange das noch geht, aber er will einfach nicht hören. Aber ich bin kein Dummkopf. Verna und ich hauen ab, sobald wir diesen Wagen repariert haben.', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Gryan Stoutmantle - http://www.youtube.com/watch?v=PNqdaVzV6FI&t=1m41s ; German https://youtu.be/eYg-qOlsTTY?t=3m45s
INSERT INTO `quest_greeting` VALUES (234, 'A foul corruption has crept into Westfall.  While I was upholding my duty on the battlefields of Lordaeron these honest farms were overrun and made into hide-outs for thugs and murderers. The People\'s Militia needs your help.', NULL, NULL, 'In Westfall hat sich üble Verderbnis eingeschlichen. Während ich auf dem Schlachtfeld von Lordaeron meine Pflicht tat, wurden diese anstandig geführten Höfe überfallen und zu Schlupfwinkeln für Schläger und Mörder umfunktioniert. Die Volksmiliz ist auf Eure Hilfe angewiesen.', NULL, NULL, NULL, NULL, NULL, 1, 0);
-- Duthorian Rall - http://www.youtube.com/watch?v=PNqdaVzV6FI&t=3m26s
INSERT INTO `quest_greeting` VALUES (6171, 'You will be tested many times by the darkness that surrounds our lands, $N. But to ensure you are always prepared, we will often ask tasks of you so you are at the height of your own power.$B$BGo with the Light, and remain virtuous.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
-- Talin Keeneye - http://www.youtube.com/watch?v=4wIP0mdSVUA&t=9m53s
INSERT INTO `quest_greeting` VALUES (714, 'Greetings, $c! Fine day for hunting, wouldn\'t you say? I\'ve been having more than a little luck with boars, myself. Perhaps you\'d like a shot?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Sentinel Glynda Nal'Shea - http://www.youtube.com/watch?v=P8cXHJcb50o&t=1m47s
INSERT INTO `quest_greeting` VALUES (2930, 'Corruption sneaks into nature\'s grove. The forest must be protected at all costs.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Thundris Windweaver - http://www.youtube.com/watch?v=P8cXHJcb50o&t=2m8s
INSERT INTO `quest_greeting` VALUES (3649, 'Dark forces encroach upon our borders, ancient taints resurface, and new evils emerge to topple the delicate balance of the land. In times of such darkness, we all must be vigilant.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
-- Onu - http://www.youtube.com/watch?v=9A4m7LINi8g&t=4m47s
INSERT INTO `quest_greeting` VALUES (3616, 'The wind whispers to those who listen...$B$BDo you hear it?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Shindrell Swiftfire - http://www.youtube.com/watch?v=LFX7S5Ctx0U&t=2m50s
INSERT INTO `quest_greeting` VALUES (3845, 'We elves have a long history.  Let us hope this history does not return to haunt us.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Gaxim Rustfizzle - http://www.youtube.com/watch?v=r9JUuuii7SU&t=5m55s
INSERT INTO `quest_greeting` VALUES (4077, 'If I can get the proper ingredients, we can create some explosives that will not only allow me to damage the Venture\'s Co.\'s operations, but also cause a distraction.$B$BI know you\'re impressed, but it gets better... I\'ll tell you more soon enough.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Apothecary Zamah - https://youtu.be/NrSdjsrhX0s?t=29m31s
INSERT INTO `quest_greeting` VALUES (3419, 'For our people to survive, we must study the ways of nature and learn its secrets.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
-- Verna Furlbrow - https://youtu.be/CPXPQNyPQbw?t=23s ; German https://youtu.be/cWnT_Qndfx0?t=3m37s
INSERT INTO `quest_greeting` VALUES (238, 'Sometimes I think there\'s a big gray cloud in the sky, just raining down bad luck upon us. First, we\'re driven off our land, and now we can\'t even get out of Westfall. Everything\'s a mess. Something needs to be done.', NULL, NULL, 'Manchmal denke ich, eine große dunkle Wolke schwebt über uns, aus der Unglück auf uns herabregnet. Erst werden wir von unserem Land vertrieben und jetzt kommen wir noch nicht einmal aus Westfall weg. Alles liegt im Argen. Es muss etwas geschehen.', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Salma Saldean - https://youtu.be/CPXPQNyPQbw?t=57s ; German https://youtu.be/eYg-qOlsTTY?t=2m4s
INSERT INTO `quest_greeting` VALUES (235, 'Welcome to our humble abode! It\'s always nice to see a friendly face. And what strong arms you have. My husband and I are always looking for help around the farm. Now that most the good folk have left, it\'s hard to find an able body to help out.', NULL, NULL, 'Willkommen in unserer bescheidenen Hüttel Wir freuen uns über jedes freundliche Gesicht. Und ihr habt so starke Arme. Mein Mann und ich sind ständig auf der Suche nach jemandem, der uns auf dem Hof häft. Jetzt, wo die ganzen guten Leute weg sind, ist es nicht einfach, kräftige Helfer zu bekommen.', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Apothecary Johaan - https://youtu.be/yvAjZ-wChsE?t=1m17s ; German https://youtu.be/7gFnNU3wZdc?t=4m1s
INSERT INTO `quest_greeting` VALUES (1518, 'The Dark Lady has put forth the challenge. It is up to us to meet it.', NULL, NULL, 'Die dunkle Fürstin hat die Herausforderung gestellt. Es liegt an uns, sie anzunehmen.', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Coleman Farthing - https://youtu.be/CVeijybDMN0?t=8m40s ; German https://youtu.be/LW2hKkhC5pY?t=2m1s
INSERT INTO `quest_greeting` VALUES (1500, 'I hope you\'re well, all things considered.\r\n\r\nSit for a spell, and hear my tale. It\'s a tragedy, of course, but one I hope will end in revenge!', NULL, NULL, 'Ich hoffe, Ihr seid den Umständen entsprechend wohlauf.\r\n\r\nNehmt doch hier Platz und lauscht meiner Geschichte. Natürlich ist es eine Tragödie, aber hoffentlich eine, die am Ende gerächt wird!', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Executor Zygand - https://youtu.be/CVeijybDMN0?t=7m39s ; German https://youtu.be/7gFnNU3wZdc?t=40s
INSERT INTO `quest_greeting` VALUES (1515, 'The Scarlet Crusade is encroaching on our homeland. The foolish zealots do not realize that the loyal servants of The Dark Lady shall see to their demise.', NULL, NULL, 'Der Scharlachrote Kreuzzug rückt unserer Heimat näher. Die törichten Eiferer erkennen nicht, dass die treuen Diener der dunklen Fürstin alles tun werden, um sie zu töten.', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Magistrate Sevren - https://youtu.be/2RVY-5mnsvc?t=4m24s ; German https://youtu.be/LW2hKkhC5pY?t=3m37s
INSERT INTO `quest_greeting` VALUES (1499, 'Ah, you there! I have tasks to give, and I need not waste time explaining their crucial nature. Listen close.', NULL, NULL, 'He, Ihr da! Ich hätte da ein paar Aufgaben zu vergeben und muss unbedingt kurz erklären, wie außerordentlich wichtig sie sind. Hört gut zu.', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Deathguard Linnea - https://youtu.be/O9l3KDibCiM?t=7m35s ; German https://youtu.be/V4UIQOBDW7A?t=7m36s
INSERT INTO `quest_greeting` VALUES (1495, 'Greetings, $C. Be wary as you travel east toward The Bulwark. Recent surveillance reports indicate increased Scourge activity in that area, so exercise caution.', NULL, NULL, 'Seid gegrüßt, $C. Seid wachsam, wenn Ihr nach Osten zum Bollwerk reist. Aktuellen Spähermeldungen zufolge ist in dem Bereich eine erhöhte Aktivität der Greißel zu verzeichnen. Hier ist also Vorsicht geboten.', NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Master Gadrin - https://youtu.be/SwLjJH8LXfc?t=39m19s
INSERT INTO `quest_greeting` VALUES (3188, 'There is something you wish to discuss, $c... come, sit by me.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Canaga Earthcaller - https://youtu.be/yYhvyVVcXCY?t=3m42s
INSERT INTO `quest_greeting` VALUES (5887, 'I welcome you back, $n.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Gar'Thok - https://youtu.be/PtIaVf9stHc?t=7m57s
INSERT INTO `quest_greeting` VALUES (3139, 'Throm\'ka, $c. There is little time for talk and much work to be done.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Kin'weelay - https://youtu.be/Ufb0OmKT3Qk?t=3m4s
INSERT INTO `quest_greeting` VALUES (2519, 'Hello! The spirits say you here to aid my chief. Say it loud, they do.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Sergra Darkthorn - https://youtu.be/Jgcn0jgdyvE?t=2m24s
INSERT INTO `quest_greeting` VALUES (3338, 'The land, the water and the sky are all as one. It is your eyes that deceive you with such separation. The Earthmother is all those things and more.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Mountaineer Stormpike - https://youtu.be/U6Ilz-7GUNk?t=1m22s
INSERT INTO `quest_greeting` VALUES (1343, 'Well, if it isn\'t a young, bristling $c, no doubt drawn here by talk of my exploits in fields of battle!$B$BNo time for stories now, for there are great, important deeds that need doing!  So if you\'re looking for glory, then luck shines on you today...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
-- Mebok Mizzyrix - https://youtu.be/OAA86_GuQ7E?t=1h43m33s
INSERT INTO `quest_greeting` VALUES (3446, 'Yes yes yes! You\'re just the $r I\'m looking for!\r\n\r\nSit! We have much to discuss!!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- Wharfmaster Dizzywig - https://youtu.be/Jgcn0jgdyvE?t=25m7s
INSERT INTO `quest_greeting` VALUES (3453, 'Something I can help you with, $n? There\'s a shipment I\'ve got to see to otherwise.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
-- William Pestle - https://youtu.be/4wIP0mdSVUA?t=40s ; German https://youtu.be/DuFDfmLFTA4?t=7m55s
INSERT INTO `quest_greeting` VALUES (253, 'Aha! Good day, good day, Master $C! Come, sit down and have a drink. You have an enterprising look in your eye, and I think you\'ll find speaking to me worth your time...', NULL, NULL, 'Aha! Guten Tag, guten Tag, Meister $C! Kommt, setzt Euch und trinkt etwas. Ihr habt so ein Leuchten in den Augen, als wolltet ihr gern etwas tun. Ich denke, Ihr solltet ein paar Wörtchen mit mir wechseln, es lohnt sich bestimmt...', NULL, NULL, NULL, NULL, NULL, 0, 0);
