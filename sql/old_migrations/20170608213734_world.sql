INSERT INTO `migrations` VALUES ('20170608213734');

-- Quest requirements
UPDATE quest_template SET MinLevel=10 WHERE entry IN (1468,1687,1558,1479,4822,558,171,172,911,910,1800,915,925,5502);
UPDATE quest_template SET RequiredRaces=77 WHERE entry IN (1468,1687,1558,1479,4822,558,171);
UPDATE quest_template SET RequiredRaces=178 WHERE entry IN (172,911,910,1800,915,925,5502);

-- Alliance quest chain
UPDATE quest_template SET PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0 WHERE entry = 1468;
UPDATE quest_template SET PrevQuestId=1468, NextQuestId=4822, ExclusiveGroup=-1687, NextQuestInChain=0 WHERE entry = 1687;
UPDATE quest_template SET PrevQuestId=1468, NextQuestId=4822, ExclusiveGroup=-1687, NextQuestInChain=0 WHERE entry = 1558;
UPDATE quest_template SET PrevQuestId=1468, NextQuestId=4822, ExclusiveGroup=-1687, NextQuestInChain=0 WHERE entry = 1479;
UPDATE quest_template SET PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=558 WHERE entry = 4822;
UPDATE quest_template SET PrevQuestId=4822, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=171 WHERE entry = 558;
UPDATE quest_template SET PrevQuestId=558, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0 WHERE entry = 171;

-- Horde quest chain
UPDATE quest_template SET PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0 WHERE entry = 172;
UPDATE quest_template SET PrevQuestId=172, NextQuestId=915, ExclusiveGroup=-911, NextQuestInChain=0 WHERE entry = 911;
UPDATE quest_template SET PrevQuestId=172, NextQuestId=915, ExclusiveGroup=-911, NextQuestInChain=0 WHERE entry = 910;
UPDATE quest_template SET PrevQuestId=172, NextQuestId=915, ExclusiveGroup=-911, NextQuestInChain=0 WHERE entry = 1800;
UPDATE quest_template SET PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=925 WHERE entry = 915;
UPDATE quest_template SET PrevQuestId=915, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=5502 WHERE entry = 925;
UPDATE quest_template SET PrevQuestId=925, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0 WHERE entry = 5502;

-- Add Warden quest to Orphan
DELETE FROM creature_questrelation WHERE id = 14305 AND quest = 171;
INSERT INTO creature_questrelation (id, quest) VALUES (14305, 171);

-- Remove polearm from Horde Orphan
UPDATE creature_template SET equipment_id=0 WHERE entry=14499;

-- Remove Orphans from world
DELETE FROM creature WHERE id IN (14305, 14444);

-- Orphan Matrons are permanent
DELETE FROM game_event_creature WHERE guid IN (6512, 79806);

-- Orphan gossip
DELETE FROM gossip_menu WHERE entry IN (5819,5820);
INSERT gossip_menu (entry, text_id, condition_id) VALUES (5819, 6992, 0);
INSERT gossip_menu (entry, text_id, condition_id) VALUES (5820, 6993, 0);
UPDATE creature_template SET npcflag=3, gossip_menu_id=5819 WHERE entry=14305;
UPDATE creature_template SET npcflag=3, gossip_menu_id=5820 WHERE entry=14444;

-- Add 5g to Curmudgeon's Payoff
UPDATE item_template SET minMoneyLoot=50000, maxMoneyLoot=50000 WHERE entry=23022;

-- Quest texts
UPDATE quest_template SET OfferRewardText= 'WOW, that was a real life ghost! That was so awesome - I can\'t wait to tell everyone back at the orphanage. Captain Grayson... he even looked like a pirate! When I grow up I wanna be a ghost pirate too!$B$BThanks for taking me to Westfall, $N. I know there are scary things out there in the wilds of Westfall, and I hope I wasn\'t too much of a pain. You\'re awesome!' WHERE entry= 1687;
UPDATE quest_template SET OfferRewardText= 'Zug zug! My name is Grunth, and I guess you\'re looking after me? You\'re an adventurer, like my mom and dad were. My matron says that they died with honor in battle. I\'m happy to meet you.$B$BI hope we\'ll do plenty of things together. I have some things I\'d like to do, and the matron says you\'ll be like a big $gbrother:sister; to me during this week. I\'d like that a whole bunch.' WHERE entry= 172;
UPDATE quest_template SET OfferRewardText= 'Um... hi. My name is Randis, and I guess you\'re looking after me? You\'re an adventurer, like my mom and dad were. I\'m happy to meet you.$B$BI hope we\'ll have a lot of fun together. I have some things I\'d like to do, and the matron says you\'ll be like a big $gbrother:sister; to me during this week. I\'d like that a whole bunch, yes $gsir:lady;.' WHERE entry= 1468;
UPDATE quest_template SET OfferRewardText= 'Wow, Ashenvale is where real adventure happens! Have you ever fought in Ashenvale, $N? When I become a hero when I grow up, I wanna come to Ashenvale and fight for the glory of the Horde!$B$BThank you for taking me to the frontier, $N. You\'re the best!' WHERE entry= 911;
UPDATE quest_template SET OfferRewardText= 'That throne room was scary, $N! Even though it was empty, it felt like a great evil had happened there. I felt mad... but I also felt sad too. I understand why the matrons tell us such stories; I will never betray my people like that!$B$BThank you for taking me to the throne room, $N. I learned a lot.' WHERE entry= 1800;
