DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180116210829');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180116210829');
-- Add your query below.


-- Fused Wiring is dropping off wrong mobs.
-- https://github.com/LightsHope/server/issues/1223

DELETE FROM `creature_loot_template` WHERE `entry`=2447 AND `item`=7191 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=12897 AND `item`=7191 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=10319 AND `item`=7191 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=10371 AND `item`=7191 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=10398 AND `item`=7191 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=11448 AND `item`=7191 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=11456 AND `item`=7191 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=10419 AND `item`=7191 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=9096 AND `item`=7191 AND `groupid`=0;


-- General DB issues part XI: Alchemy recipes
-- https://github.com/LightsHope/server/issues/710

-- Recipe: Free Action Potion
REPLACE INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`) 
VALUES (12245, 5642, 1, 7200);

-- Recipe: Great Rage Potion
REPLACE INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`) 
VALUES (12245, 5643, 1, 7200);

-- Recipe: Wildvine Potion
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.3 WHERE `item`= 9294;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `item`= 9294 AND `entry` IN (8217, 2530, 2645, 2646, 2648);

-- Recipe: Gift of Arthas
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=1783 AND `item`=9296 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=1791 AND `item`=9296 AND `groupid`=0;

-- Recipe: Elixir of the Sages
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=15162 AND `item`=13479 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=9452 AND `item`=13479 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=9451 AND `item`=13479 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=9450 AND `item`=13479 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=9449 AND `item`=13479 AND `groupid`=0;

-- Recipe: Elixir of the Mongoose
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=7106 AND `item`=13491 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=6201 AND `item`=13491 AND `groupid`=0;

-- Recipe: Flask of Supreme Power
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=3 WHERE `entry`=10508 AND `item`=13521 AND `groupid`=0;

-- Item: Recipe: Flask of the Titans
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2.5 WHERE `entry`=10363 AND `item`=13519 AND `groupid`=0;


-- Nothing But The Truth 
-- https://github.com/LightsHope/server/issues/1253

UPDATE `quest_template` SET `NextQuestInChain`=1388 WHERE `entry`=1383 AND `patch`=0;
UPDATE `quest_template` SET `PrevQuestId`=1383 WHERE `entry`=1388 AND `patch`=0;


-- Quest Containers A-Z
-- https://github.com/LightsHope/server/issues/1256

-- Russet set items
DELETE FROM `gameobject_loot_template` WHERE `item`=3593;
DELETE FROM `gameobject_loot_template` WHERE `item`=2432;
DELETE FROM `gameobject_loot_template` WHERE `item`=3594;
DELETE FROM `gameobject_loot_template` WHERE `item`=2434;
DELETE FROM `gameobject_loot_template` WHERE `item`=3889;
DELETE FROM `gameobject_loot_template` WHERE `item`=2431;
DELETE FROM `gameobject_loot_template` WHERE `item`=2429;

-- Alterac Granite
DELETE FROM `gameobject_loot_template` WHERE `entry`=2145;
REPLACE INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) 
VALUES (2145, 4521, -100, 0, 1, 1, 0);

-- Barrel of Melon Juice
DELETE FROM `gameobject_loot_template` WHERE `entry`=2601 AND `item`=5504;

-- Barrel of Milk
DELETE FROM `gameobject_loot_template` WHERE `entry`=2579 AND `item` NOT IN (1179);

-- Bloodsail Charts
DELETE FROM `gameobject_loot_template` WHERE `entry`=1852 AND `item`=3921;

-- Clam Meat
-- Removal of Clam Meat from Heavy Bronze box http://vanillawowdb.com/?item=4633#contains	group 1 
DELETE FROM `reference_loot_template` WHERE `entry`=2012 AND `item` = 5503;
-- Removal of Clam Meat from Ironbound Locked Chest http://vanillawowdb.com/?item=13875#contains
DELETE FROM `item_loot_template` WHERE `entry`=13875 AND `item`=5503;
-- Removal of Clam Meat from all object containers except Giant Clam http://vanillawowdb.com/?object=19017
DELETE FROM `gameobject_loot_template` WHERE `item`=5503 AND `entry` IN 
(404, 441, 444, 2279, 2280, 2281, 2579, 2765, 3394, 15124);

-- Covert Ops Pack
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry` = 5738;

-- Cozzle's Footlocker
DELETE FROM `gameobject_loot_template` WHERE `entry`=3309 AND `item`=1708;

-- Crystallized Note x 2
DELETE FROM `creature_loot_template` WHERE `item` IN (10839,10840);

-- Dark Iron Ale Mug
DELETE FROM `gameobject_loot_template` WHERE `entry`=11281 AND `item`=11444;

-- Death Cap
DELETE FROM `gameobject_loot_template` WHERE `entry`=2765 AND `item`=5498;

-- Enslaved Druid of the Talon
DELETE FROM `creature_loot_template` WHERE `entry`=2852; -- Removal of all loot for NPC 2852
DELETE FROM `reference_loot_template` WHERE `entry` IN (307855,307866); -- Removal of unused loot templates

-- Empty Cursed Ooze Jar
DELETE FROM `creature_loot_template` WHERE `item`= 11914;
DELETE FROM `reference_loot_template` WHERE `entry`=2062 AND `item`=11914; -- Also used for mithril box

-- Empty Tainted Ooze Jar
DELETE FROM `creature_loot_template` WHERE `item`= 11948;
DELETE FROM `reference_loot_template` WHERE `entry`=2062 AND `item`=11948; -- Also used for mithril box

-- Fel Cone
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1701 AND `item` NOT IN (3418);

-- Fissure Plant
DELETE FROM `creature_loot_template` WHERE `item` = 5066;
DELETE FROM `gameobject_loot_template` WHERE `entry`=2603;
REPLACE INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) 
VALUES (2603, 5066, 100, 0, 1, 1, 0);

-- Gahz'ridian
DELETE FROM `gameobject_loot_template` WHERE `entry`=5446 AND `item`=3356;

-- Giant Clam Meat
DELETE FROM `creature_loot_template` WHERE `item` = 4655;

-- Grim Guzzler Boar
DELETE FROM `gameobject_loot_template` WHERE `entry`=11282 AND `item`=11325;

-- Heart of the Mountain
DELETE FROM `gameobject_loot_template` WHERE `entry`=11160 AND `item`=11939;
DELETE FROM `gameobject_loot_template` WHERE `entry`=11160 AND `item`=11940;
DELETE FROM `gameobject_loot_template` WHERE `entry`=11160 AND `item`=11942;
DELETE FROM `gameobject_loot_template` WHERE `entry`=11160 AND `item`=11966;

-- Mathystra Relic x3
DELETE FROM `gameobject_loot_template` WHERE `entry`=2767 AND `item`=5498;
DELETE FROM `gameobject_loot_template` WHERE `entry`=2767 AND `item`=5503;

-- Restorative Potion
DELETE FROM `reference_loot_template` WHERE `entry`=2062 AND `item`=9030; 
DELETE FROM `creature_loot_template` WHERE `entry`=4851 AND `item`=9030 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=6135 AND `item`=9030 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=6510 AND `item`=9030 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=7438 AND `item`=9030 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=8598 AND `item`=9030 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=10389 AND `item`=9030 AND `groupid`=0;

-- Rituals of Power
DELETE FROM `gameobject_loot_template` WHERE `entry`=4584 AND `item`=5535;

-- Sapphire of Aku'Mai x3
DELETE FROM `gameobject_loot_template` WHERE `entry`=15124 AND `item`=5498;

-- Serpentbloom
DELETE FROM `gameobject_loot_template` WHERE `entry`=2772 AND `item`=5503;

-- Tangy Clam Meat
-- Removal of Tangy Clam Meat from Heavy Bronze box http://vanillawowdb.com/?item=4633#contains	group 1 
DELETE FROM `reference_loot_template` WHERE `entry`=2012 AND `item`=5504;
-- Removal of Tangy Clam Meat from Steel Lockbox box http://vanillawowdb.com/?item=4637#contains	group 1 
DELETE FROM `reference_loot_template` WHERE `entry`=2042 AND `item`=5504;
-- Removal of Tangy Clam Meat from Steel Lockbox box http://vanillawowdb.com/?item=6354#contains
DELETE FROM `item_loot_template` WHERE `entry`=6354 AND `item`=5504;
-- Removal of Tangy Clam Meat from all object containers except Giant Clam http://vanillawowdb.com/?object=19017 and Giant Clam http://vanillawowdb.com/?object=19018
DELETE FROM `gameobject_loot_template` WHERE `item`=5504 AND `entry` IN 
(404, 405, 441, 444, 1618, 1619, 2279, 2280, 2281, 2282, 2283, 4227, 15124);

-- Waterlogged Letter
DELETE FROM `gameobject_loot_template` WHERE `entry`=2117;
REPLACE INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) 
VALUES (2117, 4433, 100, 0, 1, 1, 3); -- condition id 3 is ally/horde check --> Ally only

-- Winter Veil Roast
DELETE FROM `creature_loot_template` WHERE `entry`=11459 AND `item`=21235 AND `groupid`=0;

-- Zesty Clam Meat
-- Droprate was 99.8% from Clam Big-mouth Clam
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry`=7973 AND `item`=7974;
-- Removal of Zesty Clam Meat from Iron, Steel and Mithril Lockbox and creatures
DELETE FROM `reference_loot_template` WHERE `item`=7974;
-- Removal of Zesty Clam Meat from containers except Big-mouth Clam
DELETE FROM `item_loot_template` WHERE `item`=7974 AND `entry` NOT IN (7973);
-- Removal of Zesty Clam Meat from skinning loot
DELETE FROM `skinning_loot_template` WHERE `entry`=6349 AND `item`=7974;


-- Raenes cleansing quest bugged
-- https://github.com/LightsHope/server/issues/1021

UPDATE `quest_template` SET `ReqSourceId1`=5388 WHERE `entry`=1045 AND `patch`=0;


-- Roughshod Pike shouldn't drop from mobs.
-- https://github.com/LightsHope/server/issues/1273

DELETE FROM `creature_loot_template` WHERE `entry`=415 AND `item`=12533 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=9045 AND `item`=12533 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=9257 AND `item`=12533 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=9258 AND `item`=12533 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=9416 AND `item`=12533 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=10261 AND `item`=12533 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=9098 AND `item`=12533 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=9097 AND `item`=12533 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=9199 AND `item`=12533 AND `groupid`=0;
UPDATE `creature_template` SET `lootid`=0 WHERE `entry` IN (415, 2852, 10261);

-- Nesingwary Expedition quests
-- https://github.com/LightsHope/server/issues/980

UPDATE `quest_template` SET `Details`='Welcome to Stranglethorn!$B$BPerhaps you\'re not aware of this, but that dwarf over there is the one and only Hemet Nesingwary, renowned war hero of the Alliance and master big game hunter. He\'s not one for welcoming strangers into his camp, but you look like you\'ve seen quite a bit of action in your day, $C.$B$BBeing a veteran of many battles himself, Master Nesingwary has a soft spot for fellow heroes.$B$BGo and speak with him. Perhaps he can give you some hunting pointers.' WHERE `entry`=583 AND `patch`=0;
UPDATE `quest_template` SET `Details`='If you want to be a part of the hunt with this crack group Hemet has assembled, you\'re going to need to prove yourself an able panther hunter. We\'ll start you out easy -- don\'t you worry. Let\'s see you kill 10 young panthers to start.$B$BTracking them down is only half the challenge...' WHERE `entry`=190 AND `patch`=0;

-- Also from comment
UPDATE `quest_template` SET `Objectives`='Hemet Nesingwary wants you to kill Tethis, an elusive, dangerous raptor in Stranglethorn.' WHERE `entry`=197 AND `patch`=0;
UPDATE `quest_template` SET `Objectives`='Hemet Nesingwary wants you to bring him the head of King Bangalash, the great white tiger.' WHERE `entry`=208 AND `patch`=0;
UPDATE `quest_template` SET `Details`='I have a package for an old customer of mine, a dwarf named Hemet Nesingwary. The package took weeks to arrive, and Hemet\'s long gone by now. He said he was going to Stranglethorn to hunt the beasts there, but he left me some money to send his delivery when I could.$B$BHemet\'s a rich dwarf and it\'s a good idea to keep up relations with the rich ones, yeah? So... you want to deliver the package for me?$B$BI heard Hemet has a camp in Stranglethorn, north of Grom\'gol.' WHERE `entry`=5762 AND `patch`=0;
UPDATE `quest_template` SET `Details`='Long ago, a dwarf came to this land. His name was Hemet and he wished to hunt great beasts. His skills with the rifle were uncanny, and we spent many days hunting together. Even the enmity between our peoples were forgotten.$B$BWhen he left Desolace for Stranglethorn, I vowed to one day welcome him back so that we may hunt again. Now is that time.$B$BTake this kodo horn to Hemet. He will know it is from me. You will find him in Stranglethorn, north of the Grom\'gol Base camp.' WHERE `entry`=5763 AND `patch`=0;
UPDATE `quest_template` SET `Details`='What do you know of illusions, $N? For you see, it is an illusion that you must create in order to circumvent the Black Flight\'s defenses.$B$BI know of one that may be willing to assist you in your quest of deception. She has assisted our kind in the past when she has deemed the cause worthy.$B$BIn the Western Plaguelands you will find Myranda the Hag, master illusionist - an exile of the Lordaeron alliance. Travel there and take with you this message.', `Objectives`='Deliver Rexxar\'s Testament to Myranda the Hag in the Western Plaguelands.' WHERE `entry`=6568 AND `patch`=0;
UPDATE `quest_template` SET `Details`='From the skulls of our enemies is shaped a medallion. You know this medallion, yesss? You have no doubt seen it worn by your elders.$B$BTake it, whelp. Return to the Spire and present it to General Drakkisath. The General will place the final enchantment upon the medallion, attuning the trinket to your spirit.$B$BYou will wear the finished medallion as a badge of honor, symbolizing your ascension to one of our most guarded ranks: Guardian to the brood mother.$B$BGo!', `Objectives`='It would appear as if the charade is over. You know that the Amulet of Draconic Subversion that Myranda the Hag created for you will not function inside Blackrock Spire. Perhaps you should find Rexxar and explain your predicament. Show him the Dull Drakefire Amulet. Hopefully he will know what to do next.' WHERE `entry`=6601 AND `patch`=0;

-- 6602
UPDATE `quest_template` SET `Details`='You will pay the General a visit, yes, but not as one of the Black Dragonflight.$B$BYou see, a ceremony is merely another term for blood letting to the Black Flight.$B$BThe latent amulet merely needs the blood of the General in order to become active. One of their crude failsafe mechanisms.$B$BReturn to Blackrock Spire and destroy Drakkisath. Bring his blood back here and I shall activate the key to Onyxia\'s lair.' WHERE `entry`=6602 AND `patch`=0;
UPDATE `quest_template` SET `Objectives`='Travel to Blackrock Spire and slay General Drakkisath. Gather his blood and return it to Rexxar.' WHERE `entry`=6602 AND `patch`=0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
