DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190608093343');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190608093343');
-- Add your query below.


-- Fix wrong npc flags.
UPDATE `creature_template` SET `npc_flags` = 2 WHERE `entry` IN (239, 1748, 2910);

-- This npc should not be a vendor.
DELETE FROM `npc_vendor` WHERE `entry` = 2910;

-- Add missing quest greetings.
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `Emote`) VALUES
(239, 0, "Adventure from lands far and near $bMeeting with folks both odd and queer $bBut if of me a question you ask $bYou must first complete a simple task!", 0),
(267, 0, "Welcome to the town of Darkshire.  Clerk Daltry at your service.  Can I be of some assistance?", 0),
(272, 0, "Hello, hello!  Welcome to my kitchen, $g sir : m'lady;!  This is where all of the Scarlet Raven Tavern's finest delicacies are made.  Ah, just smell the wonderful aroma!", 0),
(278, 0, "Hello, good $gsir:lady;.  Have a seat, and a meal if you're hungry.  Don't fret if I look busy with my needlework - I'm listening to you...", 0),
(288, 0, "Huh?!?  Oh.  You don't look like a Defias thief...or a member of the Night Watch.  Take pity on a poor soul, will ya?", 0),
(289, 0, "Eh?  Greetings, young $C.  You're a brave one to find your way here with all those wandering creatures about!$B$BWell now that you are here, maybe you can help an old hermit...", 0),
(294, 0, "Hail, traveler.  My eyesight may be poor but I can sense the footsteps of a $c from a mile away.  For years I defended Stormwind with pride but once my eyes failed me, I was forced to retire.", 0),
(313, 0, "Welcome to the Tower of Azora, young $C.  I am Theocritus.$B$BDo you have business with me?  Or...do I have business with you, perhaps?", 0),
(341, 0, "I don't have much time for idle talk, $N.  I've got to get this bridge rebuilt before the rains come.  I've finished every project on-time and under budget and I'm not about to start slipping now.", 0),
(381, 0, "Well met, $C.  If you're here for business, then get yourself a brew and we'll have ourselves a talk.", 0),
(382, 0, "I don't have time to chat, citizen, but if you're willing to give us a hand against the orcs, then I'll find a use for you.", 0),
(415, 0, "Hey $Gbuddy:ma'am;, do you think you could give me a hand with something?  I'm really in dire straits here...", 0),
(464, 0, "Hail, $C.  Ill times these are, my friend, for our town is besieged!  The Blackrock Orcs attack from Stonewatch Keep, the Shadowhides loom over the Tower of Ilgalar, and the Redridge Gnoll Pack gathers strength.  I hope you're not here for a holiday...", 0),
(469, 0, "Greetings, $c.  If you're a friend of Colonel Kurzen then I'll have you cut down where you stand! but if you've come to aid us, then lend an ear...", 0),
(633, 0, "It's dark times that have come, $c... All too soon will we lose everything... When the Light will forsake all but those who truly walk under the Light.", 0),
(656, 0, "There were thieves everywhere! $b$bIt was horrible.  The cave came down on us.  I think the mining company is all dead, including my brother, the Foreman.", 0),
(663, 0, "The Carevin family fights for victory under the Light. My duty under the Light is to give my life in their battle against against the undead. Master Carevin has tasked me with the extermination of the vile worgen in Duskwood. Perhaps you would assit me?", 0),
(1105, 0, "You know, I always wanted to be a Prospector, but I was born with a head for numbers and the Guild decided I would be best suited to keep the books! Studying, studying, every day of my youth...", 0),
(1139, 0, "Well hello there, citizen. The name's Bluntnose, Magistrate Bluntnose, to be precise. I'm charged with overseeing the well-being of Thelsamar, and believe you me, we could always use another strong set of arms around here!", 0),
(1141, 0, "If you're here for the food, then welcome!  You won't find finer dining in all of Stormwind...or Azeroth!$B$BIf you're here on other matters, then please be brief.  I have a dozen dishes in preparation, and must care for each.", 0),
(1239, 0, "If you're willing to endure tales that will shiver your timbers and sog your skivvies, then get yourself a drink and sit for a spell...", 1),
(1254, 0, "Troggs! I swear the gods put them in this land only to torment me! Four inches deeper into the mines, then two feet back from the troggs!", 0),
(1267, 0, "Welcome to the Thunderbrew Distillery, founded by dear ol' pappy, Arkilus Thunderbrew.  I've been keeping the place running ever since my older brother, Grimbooze, disappeared in a drunken haze a few harvests ago.", 0),
(1344, 0, "Although we're trudging through a slow period at these ruins, I'm confident it won't last long.  But in the meantime, I could use someone like you.  Would you like to aid the Dwarven Explorers' Guild?", 0),
(1356, 0, "I'm in the middle of a very important task.  Prospector business.  Unless you have something equally important to say, which I doubt, then you'll have to excuse me.", 0),
(1440, 0, "You'll not find a greater cache of knowledge than in the Royal Library of Stormwind!", 1),
(1646, 0, "Greetings, I am Baros Alexston, City Architect of Stormwind.", 0),
(1719, 0, "Over here, you worthless...! If you want to do something useful, listen quick!", 0),
(1748, 0, "I am Bolvar Fordragon, Highlord of Stormwind.", 66),
(1977, 0, "I was bred and educated for public service. A representative of the people. My skill was not in arms or crafts, but in words and persuasion.", 0),
(2092, 0, "Siege engines are the pride of every pilot!", 0),
(2094, 0, "Greetings, $c. I'm in a bit of a pinch right now, running very low on hides.", 0),
(2785, 0, "Back away!  Stay back!  I have a pack full of blastpowder and I'm not afraid to use it!  I'll blow us all away!$B$BOh, never mind.  I thought you were someone else....", 0),
(2786, 0, "Welcome to Bonegrip's Runes and Dooms, $c.  You may look, but do not touch.$B$BSome of the knowledge here is not meant for the...uninitiated.", 0),
(2860, 0, "It was quite a departure, let me tell you, $c. We were grabbing whatever wasn't nailed down or could be removed quickly. We're a little spare on supplies because of it.", 0),
(2910, 0, "Bastards came right at us at night, after we'd gotten a few drinks in us. Otherwise, we could've taken 'em, count on it.$B$BEveryone's dead now... except a few of us.", 1),
(2920, 0, "Hey there, $N.$B$BLotwil's not the most perceptive boss I've had. He actually gets really involved with his work. So much so that sometimes his servants don't eat, or get paid.$B$B$B$BBut that doesn't mean you should suffer.", 1),
(3663, 0, "Good day, $glad:lass;! Perhaps you could help me with some things that need to be taken care of.", 0),
(3666, 0, "Hmm... I can plug this wire in here and that will power the fizzletan gear, but then the hydrophlange will need an alternate power source... Maybe I can... Oh, hello! Hey, want to help me try a new invention?", 0),
(4078, 0, "Hello, friend. What can I do for you?", 6),
(4456, 0, "No, Longears isn't my real name.  And I'm not going to tell you what it is, so don't ask.", 0),
(4792, 0, "Some people think the swamp's no good... no good, they say.", 0),
(5396, 0, "The Alliance has many stakes in Desolace, and our hold here is unstable.$B$BWill you help us?", 0),
(5638, 0, "I've got a lot going on out here in Desolace, $N. Roetten wants us to pick up some reagents for one of our clients as well as fetch some of these lost items.$B$BSeein' as you're here to help out, why don't we get started?", 1),
(6031, 0, "Some can't stand the heat of the Great Forge, but I think the heat is just right.  And it's the best place to do some serious smithwork.", 1),
(6179, 0, "Many tests await a paladin of the Light, $N. Be assured, our paths will cross many times in the future if you remain passionate and hold to those virtues that we praise.", 1),
(6569, 0, "Where Troggs and Leper Gnomes roam stands our home - Gnomeregan.$B$BOur families lost, our homes displaced. Scattered.$B$BOh how I long for the days of carefree Gnomeregan life, but those days are no more. We must make our stand! We must save Gnomeregan!", 0),
(6579, 0, "For Gnomeregan!", 0),
(9081, 0, "I never miss...", 25),
(9177, 0, "Stand at attention, soldier!$B$BWINKY! SOUND OFF!", 5),
(9562, 0, "Greetings, $R.", 2),
(10260, 0, "Welcome to Kibler's Exotic Pets! How can you help me today??", 5);

-- Events list for Highlord Bolvar Fordragon
DELETE FROM `creature_ai_events` WHERE `creature_id`=1748;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (174801, 1748, 0, 2, 0, 100, 1, 90, 1, 40000, 60000, 174801, 0, 0, 'Highlord Bolvar Fordragon - Cast Shield Wall at 90% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (174802, 1748, 0, 2, 0, 100, 0, 20, 1, 0, 0, 174802, 0, 0, 'Highlord Bolvar Fordragon - Cast Lay on Hands at 20% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=174801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (174801, 0, 15, 29061, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Bolvar Fordragon - Cast Shield Wall');
DELETE FROM `creature_ai_scripts` WHERE `id`=174802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (174802, 0, 15, 17233, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Bolvar Fordragon - Cast Lay on Hands');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (17480, 'Stormwind City - Highlord Bolvar Fordragon', 20684, 100, 1, 0, 0, 0, 5, 5, 5, 8, 0, 20683, 100, 1, 0, 0, 64, 10, 10, 20, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=17480, `ai_name`='EventAI', `script_name`='' WHERE `entry` =1748;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
