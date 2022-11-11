DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220907073149');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220907073149');
-- Add your query below.


-- This gameobject does not exist in vanilla.
DELETE FROM `quest_greeting` WHERE `entry`=186420;

-- Add missing quest greetings from 1.13 sniffs.
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `emote_id`, `emote_delay`) VALUES 
(661, 0, 'Greetings. What business have you with the Carevin family? Do you seek to assist the Carevins in their battle against the undead?', 0, 0),
(1377, 0, 'Driving a Steam Tank isn\'t for everyone.  It takes an iron grip and nerves of steel...lucky I have both!  How about you?  How\'s your mettle?  Want to prove it to me?', 0, 0),
(2487, 0, 'Ah, smell the fine salt air!  \'Tis always nice to return to our home port of Booty Bay.', 0, 0),
(3050, 0, 'The tauren are sons and daughters of the Earthmother, and we show respect to all her children.  Even the beasts we slay are cherished, as their bodies give nourishment and their skins provide warmth.', 0, 0),
(4047, 0, 'The spirits of nature are powers to respect.  They offer great aid to the worthy, and mete out swift death to the foolish.', 0, 0),
(5393, 0, 'Nethergarde keep always needs more supplies - supplies to help our mages in their research, and supplies to keep our defenders in top fighting shape.', 1, 0),
(5637, 0, 'Pleased to meetcha, $c. Me name\'s Roetten. I lead Reclaimers Incorporated.$B$BMe guild and I specialize in aquiring lost goods. We usually hire brave adventurers and send them off to finish tasks for those who aren\'t able, or don\'t have the time.', 2, 0),
(6868, 0, 'Whatcha need, $c?  I trust that you\'ve come out to this wasteland for a reason other than idle chit chat.', 6, 0),
(8256, 0, 'Greetings, $N.', 1, 0),
(8379, 0, 'If you are here to beg for the privilege of working for me, then your company is quite welcome. Otherwise, there is little chance you are of any use to me.', 0, 0),
(10428, 0, 'Whitereach Post started off as a small hunting camp... Now, everyone wants to set up shop and call this home.$B$B<Motega shrugs his shoulder>', 1, 0),
(1738, 1, 'This collection of scrolls contains various logistic and strategic information, as well as coded correspondences.', 0, 0),
(138492, 1, 'These shards glint with an unnatural sheen.  It is clear that they hide a deep power within.', 0, 0);

-- Add missing quest greetings from 1.14 sniffs.
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `emote_id`, `emote_delay`) VALUES 
(2277, 0, 'I have a great deal of work to do.  Are you here to aid me with my research?', 0, 0),
(5888, 0, 'The earth calls to you, $N. Go to it, and know that your brethren are proud of you and all you will accomplish.', 1, 0),
(6169, 0, 'I\'m on quest.  A quest!  A quest for new alloys and harder metals for the greatest invention of all!!', 5, 0),
(6946, 0, 'Mathias found me left for dead by the Venture Co. in the Barrens. Had it not been for him, I\'d have been prowler fodder. ', 0, 0),
(7802, 0, 'So few make it this far, even fewer make it past. Do not become a statistic, $N.', 0, 0);

-- Fix wrong texts compared to 1.13 sniffs.
UPDATE `quest_greeting` SET `content_default`='Welcome to our humble abode!  It\'s always nice to see a friendly face.  And what strong arms you have.  My husband and I are always looking for help around the farm.  Now that most the good folk have left, it\'s hard to find an able body to help out.' WHERE `entry`=235 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Nothing but trouble in these parts.  I tried to tell that fool Saldean to get out while he still could be he won\'t hear of it.  But I ain\'t no fool.  Verna and I are gonna mosey on out as soon as we get this wagon fixed.' WHERE `entry`=237 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Sometimes I think there\'s a big gray cloud in the sky, just raining down bad luck upon us.  First, we\'re driven off our land, and now we can\'t even get out of Westfall.  Everything\'s a mess.  Something needs to be done.' WHERE `entry`=238 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Hey there, friend.  My name\'s Remy.  I\'m from Redridge to the east, and came here looking for business, looking for business.  You got any...got any??' WHERE `entry`=241 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Aha!  Good day, good day, Master $C!  Come, sit down and have a drink.  You have an enterprising look in your eye, and I think you\'ll find speaking to me worth your time...' WHERE `entry`=253 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Hello, citizen.  You look like a $gman:woman; with a purpose - do you have business with the Stormwind Army?' WHERE `entry`=261 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='At ease, $C.  If you are just passing though I suggest you stick to the roads and only travel by day. If your business is here in Darkshire, consider lending your abilities to The Night Watch.  Our skill is unquestionable but our numbers are small.' WHERE `entry`=264 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Hail, $N!  Welcome to my humble garden.  The weather has been perfect lately.  Let us hope it holds steady for a ripe harvest.' WHERE `entry`=342 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Who is this $c who goes before the Court of Lakshire in the Kingdom of Stormwind?  State your business within this township, $R.  The orc threat to the Kingdom is far too great to squander time in idle conversation.' WHERE `entry`=344 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Another fine day in the jungle!  It\'s going to be quite a hunt, I can feel it.  Once Barnil is done cleaning the guns, I\'m taking the hunting party deep into the twisting vines.  Not such a bad way for an old war vet to spend his retirement, eh?' WHERE `entry`=715 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='You watch where you step around here, $Gson:lass;.  You might not be a part of our outfit, but that doesn\'t mean I won\'t take a cane to you if you fall out of line!' WHERE `entry`=733 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Greetings, $g lad : girl;. I\'m Grelin Whitebeard. I\'m here to examine the threat posed by the growing numbers of trolls in Coldridge Valley. What have I found? It\'s a bit troubling...' WHERE `entry`=786 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Hello there, $c.  Normally I\'d be out on the beat looking after the folk of Stormwind, but a lot of the Stormwind guards are fighting in other lands.  So here I am, deputized and offering bounties when I\'d rather be on patrol...' WHERE `entry`=823 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='If there\'s one thing time has taught me it\'s that no assignment is a dull one.  Protecting the Thandol Span should have been an easy task.  But with the brunt of the army fighting alongside the alliance, we were overwhelmed here and Dun Modr has fallen.' WHERE `entry`=1071 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Curse that Brewers\' League!  They have access to all the best ingredients, while we\'re stuck here grubbing for grain and hops!$B$BI really would like to give them some bitter tasting justice...' WHERE `entry`=1374 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Greetings, $C.  Be wary as you travel east toward The Bulwark.  Recent surveillance reports indicate increased Scourge activity in that area, so exercise caution.' WHERE `entry`=1495 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Ah, you there!  I have tasks to give, and I need not waste time explaining their crucial nature.  Listen close.' WHERE `entry`=1499 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='I hope you\'re well, all things considered.$B$BSit for a spell, and hear my tale.  It\'s a tragedy, of course, but one I hope will end in revenge!' WHERE `entry`=1500 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='The Scarlet Crusade is encroaching on our homeland.  The foolish zealots do not realize that the loyal servants of The Dark Lady shall see to their demise.' WHERE `entry`=1515 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='The Dark Lady has put forth the challenge.  It is up to us to meet it.' WHERE `entry`=1518 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='We spent so much of our lives in flight, memories of peaceful times grow evermore distant.' WHERE `entry`=1776 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='My brother and I are on a vital mission, but we are holed up in this farmhouse.  The Deathstalkers need your help.' WHERE `entry`=1950 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='I hope you\'re here to work, $C.  We have a lot to do and the Horde, the Syndicate and the Ogres aren\'t going to help us.' WHERE `entry`=2263 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='When I was first offered the title of Southshore Magistrate I was elated to have earned such a commission so early in my career.$B$BBut now that I\'m here, I wonder if I\'d have been better off shuffling papers in Stormwind.' WHERE `entry`=2276 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Hello!  The spirits say you here to aid my chief.  Say it loud, they do.' WHERE `entry`=2519 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='We at Refuge Pointe hold one of the few remaining patches of Stromgarde territory in the Arathi Highlands.  And we\'re losing ground...$B$BIf you have words for me, then I hope they are good tidings.' WHERE `entry`=2700 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Thanks to the Warchief, even here in the ruins of our former prison, some hope remains, and the Horde rises anew.' WHERE `entry`=2706 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='This wooden board holds roughly-made wanted posters.' WHERE `entry`=2713 && `type`=1;
UPDATE `quest_greeting` SET `content_default`='You must be hard up to be wandering these Badlands, $c.  Hard up like me.$B$BOr maybe you\'re here because you\'re crazy.  Crazy, like me.' WHERE `entry`=2817 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Hey there, $N.$B$BLotwil\'s not the most perceptive boss I\'ve had. He actually gets really involved with his work. So much so that sometimes his servants don\'t eat, or get paid.$B$B<Lucien frowns over at Lotwil.>$B$BBut that doesn\'t mean you should suffer.' WHERE `entry`=2920 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Corruption sneaks into nature\'s grove.  The forest must be protected at all costs.' WHERE `entry`=2930 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='The land, the water, and the sky are all as one. It is your eyes that deceive you with such separation. The Earthmother is all those things and more.' WHERE `entry`=3338 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='The Barrens holds a wealth of substances for which we, the apothecaries or Lordaeron, may find use.' WHERE `entry`=3390 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Yes yes yes!  You\'re just the $r I\'m looking for!$B$BSit!  We have much to discuss!!' WHERE `entry`=3446 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='The spirit of Stonetalon weeps.  It weeps from its mountain peaks, to its rivers, to its severed, dying trees.' WHERE `entry`=4049 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Be careful where you put that foot of yours, $gmister:ma\'am;.  We\'re not all blessed with the lofty height of a $r.' WHERE `entry`=4453 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='The centaur clans rule the wastes of Desolace.  If united, they would be a terrible force.  It is then good that the centaur clans are not united but instead bicker and war amongst themselves.' WHERE `entry`=5412 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='The main threat Thrall wishes dealt with is the Burning Blade--members of the Horde that have given their loyalty to the demons. They seek to practice their dark magic and care little for Thrall\'s vision of the Horde\'s future here in Kalimdor.' WHERE `entry`=5641 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='Dear $g boy:girl;, you have arrived just in time to assist the Kargath Expeditionary Force.\n' WHERE `entry`=9078 && `type`=0;

-- Fix wrong texts compared to 1.13 sniffs.
UPDATE `quest_greeting` SET `content_default`='Keep the door closed, $C.  Never know when the Dark Riders will be passing through again.' WHERE `entry`=273 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='This had better be good....' WHERE `entry`=3339 && `type`=0;
UPDATE `quest_greeting` SET `content_default`='If we are to protect nature, then we must embrace its strength.  And we must show this strength to those who would harm the land.' WHERE `entry`=5770 && `type`=0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
