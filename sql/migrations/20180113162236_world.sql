DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180113162236');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180113162236');
-- Add your query below.

-- Database issues: Quest items A --> G
-- https://github.com/LightsHope/server/issues/1181

-- A Letter to Yvette
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2.5 WHERE `item`=2839;

-- A Talking Head
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2.0 WHERE `item`=3317;

-- Acidic Venom Sac
DELETE FROM `creature_loot_template` WHERE `entry`=4376 AND `item`=5959 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4378 AND `item`=5959 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4379 AND `item`=5959 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4380 AND `item`=5959 AND `groupid`=0;

-- Quest text update for The Black Shield
UPDATE `quest_template` SET `Details`='Hmmm, there\'s writing right here on the rim of the shield, but it\'s hard to read from all the burned stuff.$b$bI need acid to make it clear. Venom from the Darkfang spiders in the marsh would do good. Get me some of their sacs and I can clean this up.\r\n\r\n' WHERE  `entry`=1322 AND `patch`=0;

-- Aged Gorilla Sinew
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=1557 AND `item`=3862 AND `groupid`=0;

-- Aged Kodo Hide
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=4700 AND `item`=6249 AND `groupid`=0;

-- Altered Snapjaw Shell
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=3461 AND `item`=5098 AND `groupid`=0;

-- Amethyst Runestone
DELETE FROM `creature_loot_template` WHERE `entry`=2725 AND `item`=4843 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=2726 AND `item`=4843 AND `groupid`=0;

-- Atal'ai Artifact
DELETE FROM `fishing_loot_template` WHERE `entry`=856 AND `item`=6175;

-- Blood Amber
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=7100 AND `item`=11503 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=7101 AND `item`=11503 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=7104 AND `item`=11503 AND `groupid`=0;

-- Bloodpetal Sprout
DELETE FROM `creature_loot_template` WHERE `item`=11315;

-- Blueleaf Tuber
DELETE FROM `creature_loot_template` WHERE `entry`=4511 AND `item`=5876 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4514 AND `item`=5876 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4541 AND `item`=5876 AND `groupid`=0;

-- Broken Tears
DELETE FROM `creature_loot_template` WHERE `item`=6083;

-- Burning Rock
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=6170 AND `item`=6845 AND `groupid`=0;

-- Candle of Beckoning
DELETE FROM `creature_loot_template` WHERE `entry`=1558 AND `item`=3080 AND `groupid`=0;

-- Claw Key
DELETE FROM `gameobject_loot_template` WHERE `entry`=3088 AND `item`=5690;

-- Corrupted Kor Gem
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=4802 AND `item`=6995 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=4803 AND `item`=6995 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=4805 AND `item`=6995 AND `groupid`=0;

-- Coyote Jawbone
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `item`=6166;

-- Crystallized Azsharite
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry`=10834 AND `item`=10832; -- Always give Fel Tracker Owner's Manual
DELETE FROM `item_loot_template` WHERE  `entry`=10834 AND `item`=7971;	-- Remove black pearl
DELETE FROM `item_loot_template` WHERE  `entry`=10834 AND `item`=10714; -- Remove Crystallized Azsharite

-- Nothing But The Truth (Quest) - Remove reference to whelp blood (From TBC version of quest)
UPDATE `quest_template` SET `Objectives`='Apothecary Faustin at Beggar\'s Haunt needs 5 Shadow Panther Hearts, Mire Lord Fungus and a Deep Strider Tumor.' WHERE `entry`=1383 AND `patch`=0;
UPDATE `quest_template` SET `Details`='I have just the right serum in mind. It will deal with the truth in precisely the way the truth should be dealt with.$B$BFor this concoction I will need several Shadow Panther hearts from the Swamp. I also require the enchanted fungus off of the Mire Lord who resides there. I am sure one as able as you, $N, can persuade him to part with some.$B$BNow the hard part will be locating a Deepstrider tumor from far-off Desolace. Very rarely the giants there become ill and a tumor forms.$B$BNow, off you go!' WHERE `entry`=1383 AND `patch`=0;

-- Diamond Runestone
DELETE FROM `creature_loot_template` WHERE `entry`=2725 AND `item`=4845 AND `groupid`=0;

-- Dinosaur Bone
DELETE FROM `creature_loot_template` WHERE `entry`=6512 AND `item`=11114 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=9167 AND `item`=11114 AND `groupid`=0;

-- Druidical Remains
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `item`=22226;

-- Dust Devil Debris
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=832 AND `item`=5669 AND `groupid`=0;

-- Dwarven Tinder
DELETE FROM `creature_loot_template` WHERE `entry`=2091 AND `item`=3339 AND `groupid`=0;

-- Encrusted Tail Fin
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `item`=5796;

-- Fire Tar
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=5026;

-- Gaffer Jack
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=-10 WHERE `entry`=148 AND `item`=6717;
UPDATE `fishing_loot_template` SET `groupid`=0 WHERE `entry`=148 AND `item`=6717;

-- Gold Pickup Schedule
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `item`=1307 AND `entry` in (97, 448, 478);

-- Gordunni Orb
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=5239 AND `item`=9371 AND `groupid`=0;

-- Gorishi Scent Gland
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `item`=11837;

-- Grimesilt Outhouse Key
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `item`=11818;

-- Grime-Encrusted Object
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=15 WHERE `item`=9308;



-- Database issues: Quest items A --> G
-- https://github.com/LightsHope/server/issues/1203

-- Handful of Oats
DELETE FROM `gameobject_template` WHERE `entry`=74731; -- incorrect Noggle's Satchel that is not used 

-- Heart of Zeal
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `item`=5805;

-- Heartswood
DELETE FROM `creature_loot_template` WHERE `entry`=3730 AND `item`=6912 AND `groupid`=0;

-- Hive'Ashi Silithid Brain
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=20457;

-- Hive'Regal Silithid Brain
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=20459;

-- Hive'Zora Silithid Brain
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=20458;

-- Humbert's Sword
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=3693;

-- Huntsman Malkhor's Bones
DELETE FROM `creature_loot_template` WHERE `entry`=4468 AND `item`=19070 AND `groupid`=0;

-- Incantations from the Nether
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=14396;

-- Jordan's Ore Shipment
DELETE FROM `creature_loot_template` WHERE `entry`=1178 AND `item`=6992 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=1179 AND `item`=6992 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=1181 AND `item`=6992 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=1183 AND `item`=6992 AND `groupid`=0;

-- Karnitol's Satchel
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=4716 AND `item`=6245 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=4719 AND `item`=6245 AND `groupid`=0;

-- Large Soran'ruk Fragment
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=3855 AND `item`=6915 AND `groupid`=0;

-- Lookout's Spyglass
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=8566 AND `item`=18960 AND `groupid`=0;

-- Lurker Venom
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=2606;

-- Crocolisk Tear
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=2939;

-- Opal Runestone
DELETE FROM `creature_loot_template` WHERE `entry`=2725 AND `item`=4844 AND `groupid`=0;

-- Metzen's Letters and Notes
DELETE FROM `creature_loot_template` WHERE `entry`=2251 AND `item`=21314 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4846 AND `item`=21314 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=5856 AND `item`=21314 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=7855 AND `item`=21314 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=10447 AND `item`=21314 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=11472 AND `item`=21314 AND `groupid`=0;

-- Oracle Crystal
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=4718 AND `item`=6442 AND `groupid`=0;

-- Plainstrider Talon
DELETE FROM `creature_loot_template` WHERE `entry`=2955 AND `item`=4759 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-80 WHERE `entry`=3244 AND `item`=4759 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-80 WHERE `entry`=3245 AND `item`=4759 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-80 WHERE `entry`=3246 AND `item`=4759 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-80 WHERE `entry`=2957 AND `item`=4759 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-80 WHERE `entry`=2956 AND `item`=4759 AND `groupid`=0;

-- Pouch of Reindeer Dust
DELETE FROM `creature_loot_template` WHERE `entry`=2251 AND `item`=21211 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=5856 AND `item`=21211 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4846 AND `item`=21211 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=7855 AND `item`=21211 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=11472 AND `item`=21211 AND `groupid`=0;

-- Prayer to Elune
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `item`=10458;

-- Pristine Tigress Fang
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=772 AND `item`=3839 AND `groupid`=0;

-- Reagent Pouch
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=3199 AND `item`=6652 AND `groupid`=0;

-- Resonite Crystal
DELETE FROM `creature_loot_template` WHERE `entry`=11915 AND `item`=16581 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=11917 AND `item`=16581 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=11918 AND `item`=16581 AND `groupid`=0;

-- Rolf and Malakai's Medallions
DELETE FROM `creature_loot_template` WHERE `entry`=46 AND `item`=735 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=515 AND `item`=735 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=735 AND `item`=735 AND `groupid`=0;

-- Annals of Darrowshire
DELETE FROM `gameobject_loot_template` WHERE `entry`=13610 AND `item`=15696;
DELETE FROM `gameobject_loot_template` WHERE `entry`=14480 AND `item`=12900;



-- Database issues: Quest items S --> Z
-- https://github.com/LightsHope/server/issues/1228

-- Salty Scorpid Venom
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=4139 AND `item`=5794 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=4140 AND `item`=5794 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=5937 AND `item`=5794 AND `groupid`=0;

-- Shaman Voodoo Charm
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=2009 AND `item`=8363 AND `groupid`=0;

-- Silithid Egg
DELETE FROM `creature_loot_template` WHERE `entry`=3250 AND `item`=5058 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=3251 AND `item`=5058 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=3252 AND `item`=5058 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=3503 AND `item`=5058 AND `groupid`=0;

UPDATE `gameobject_loot_template` SET `maxcount`=3 WHERE `entry`=2620 AND `item`=5058;

-- Smithing Tuyere
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=5840 AND `item`=18959 AND `groupid`=0;

-- Soft-shelled Clam
DELETE FROM `creature_loot_template` WHERE `item`=15874 AND `entry` NOT IN (12347);

-- Some Rune
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `item`=13815;

-- Spells of Shadow
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=11322 AND `item`=14395 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-25 WHERE `entry`=11324 AND `item`=14395 AND `groupid`=0;

-- Steamsaw
DELETE FROM `creature_loot_template` WHERE `entry`=10990 AND `item`=17411 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=13320 AND `item`=17411 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=12127 AND `item`=17411 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=12052 AND `item`=17411 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=13424 AND `item`=17411 AND `groupid`=0;

-- Stone of Relu
DELETE FROM `creature_loot_template` WHERE `entry`=2091 AND `item`=5233 AND `groupid`=0;

-- Super Reaper 6000 Blueprints
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=3988 AND `item`=5734 AND `groupid`=0;

-- Symbol of Ragnaros
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `item`=10552;

-- The Heart of the Mountain
DELETE FROM `gameobject_loot_template` WHERE `entry`=11103 AND `item`=11309;

-- Un'Goro Gorilla Pelt
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-50 WHERE `entry`=6514 AND `item`=11478 AND `groupid`=0;

-- Un'Goro Stomper Pelt
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-50 WHERE `entry`=6513 AND `item`=11479 AND `groupid`=0;

-- Un'Goro Thunderer Pelt
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-50 WHERE `entry`=6516 AND `item`=11480 AND `groupid`=0;

-- Undamaged Venom Sac
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `entry`=2686 AND `item`=9322 AND `groupid`=0;

-- Warsong Report
DELETE FROM `creature_loot_template` WHERE `item`=16746; 

-- Westfall Deed
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `item`=1972;

-- White Punch Card
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-15 WHERE `item`=9279;

-- White Ravasaur Claw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-80 WHERE `item`=11477;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
