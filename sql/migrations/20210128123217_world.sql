DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210128123217');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210128123217');
-- Add your query below.

-- Kolkar Stormseer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.3 WHERE `item` = 6661 AND `entry` = 9523;
-- Geopriest Gukk'rok
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES('5863','6661','0.3','0','1','1','0','0','10');
-- Sister Rathtalon
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES('5830','6661','0.3','0','1','1','0','0','10');
-- Muck Frenzy
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.3 WHERE `item` = 6661 AND `entry` = 8236;
-- General Twinbraid
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES('3414','6661','0.19','0','1','1','0','0','10');
-- Razorfen Servitor
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.17 WHERE `item` = 6661 AND `entry` = 6132;
-- Razormane Hunter
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.14 WHERE `item` = 6661 AND `entry` = 3265;
-- Thora Feathermoon
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.14 WHERE `item` = 6661 AND `entry` = 5798;
-- Razormane Defender
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.12 WHERE `item` = 6661 AND `entry` = 3266;
-- Prospector Khazgorm
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.12 WHERE `item` = 6661 AND `entry` = 3392;
-- Venture Co. Peon
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.11 WHERE `item` = 6661 AND `entry` = 3285;
-- Captain Fairmount
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.11 WHERE `item` = 6661 AND `entry` = 3393;
-- Tazan
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.11 WHERE `item` = 6661 AND `entry` = 6494;
-- Venture Co. Drudger
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.1 WHERE `item` = 6661 AND `entry` = 3284;
-- Thunderhead
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.1 WHERE `item` = 6661 AND `entry` = 3239;
-- Overseer Glibby
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES('6606','6661','0.1','0','1','1','0','0','10');
-- Savannah Prowler
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.09 WHERE `item` = 6661 AND `entry` = 3425;
-- Southsea Cannoneer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.09 WHERE `item` = 6661 AND `entry` = 3382;
-- Savannah Patriarch
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.09 WHERE `item` = 6661 AND `entry` = 3241;
-- Zhevra Runner
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.08 WHERE `item` = 6661 AND `entry` = 3242;
-- Witchwing Harpy
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.08 WHERE `item` = 6661 AND `entry` = 3276;
-- Savannah Huntress
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.08 WHERE `item` = 6661 AND `entry` = 3415;
-- Hecklefang Hyena
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.08 WHERE `item` = 6661 AND `entry` = 4127;
-- Razormane Thornweaver
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.08 WHERE `item` = 6661 AND `entry` = 3268;
-- Greater Plainstrider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3244;
-- Fleeting Plainstrider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3246;
-- Witchwing Roguefeather
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3277;
-- Sunscale Lashtail
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3254;
-- Razormane Geomancer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3269;
-- Kolkar Bloodcharger
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3397;
-- Venture Co. Mercenary
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3282;
-- Kolkar Marauder
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3275;
-- Kolkar Packhound
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 4316;
-- Razormane Mystic
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3271;
-- Kolkar Pack Runner
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3274;
-- Burning Blade Acolyte
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3380;
-- Southsea Cutthroat
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.07 WHERE `item` = 6661 AND `entry` = 3383;
-- Washte Pawne
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES('3472','6661','0.07','0','1','1','0','0','10');
-- Southsea Brigand
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.06 WHERE `item` = 6661 AND `entry` = 3381;
-- Razormane Water Seeker
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.06 WHERE `item` = 6661 AND `entry` = 3267;
-- Razormane Seer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.06 WHERE `item` = 6661 AND `entry` = 3458;
-- Theramore Preserver
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.06 WHERE `item` = 6661 AND `entry` = 3386;
-- Zhevra Charger
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.06 WHERE `item` = 6661 AND `entry` = 3426;
-- Savannah Highmane
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.06 WHERE `item` = 6661 AND `entry` = 3243;
-- Witchwing Slayer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3278;
-- Theramore Marine
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3385;
-- Sunscale Screecher
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3255;
-- Oasis Snapjaw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3461;
-- Venture Co. Enforcer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3283;
-- Razormane Pathfinder
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3456;
-- Barrens Giraffe
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3248;
-- Savannah Matriarch
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3416;
-- Southsea Privateer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3384;
-- Wandering Barrens Giraffe
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3463;
-- Cannoneer Smythe
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3454;
-- Sunscale Scytheclaw
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.05 WHERE `item` = 6661 AND `entry` = 3256;
-- Bristleback Thornweaver
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3261;
-- Kolkar Stormer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3273;
-- Bristleback Geomancer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3263;
-- Venture Co. Overseer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3286;
-- Bael'dun Excavator
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3374;
-- Kolkar Invader
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 9524;
-- Hecklefang Snarler
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 4129;
-- Witchwing Ambusher
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3279;
-- Burning Blade Bruiser
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3379;
-- Thunderhawk Hatchling
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3247;
-- Hezrul Bloodmark
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3396;
-- Ishamuhale
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3257;
-- Silithid Protector
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3503;
-- Kolkar Wrangler
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.04 WHERE `item` = 6661 AND `entry` = 3272;
-- Bristleback Hunter
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.03 WHERE `item` = 6661 AND `entry` = 3258;
-- Ornery Plainstrider
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.03 WHERE `item` = 6661 AND `entry` = 3245;
-- Stormhide
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.03 WHERE `item` = 6661 AND `entry` = 3238;
-- Stormsnout
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.03 WHERE `item` = 6661 AND `entry` = 3240;
-- Witchwing Windcaller
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.03 WHERE `item` = 6661 AND `entry` = 3280;
-- Silithid Swarmer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.03 WHERE `item` = 6661 AND `entry` = 3252;
-- Lost Barrens Kodo
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.03 WHERE `item` = 6661 AND `entry` = 3234;
-- Kreenig Snarlsnout
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.03 WHERE `item` = 6661 AND `entry` = 3438;
-- Thunderhawk Cloudscraper
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.03 WHERE `item` = 6661 AND `entry` = 3424;
-- Bael'dun Rifleman
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.02 WHERE `item` = 6661 AND `entry` = 3377;
-- Bael'dun Soldier
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.02 WHERE `item` = 6661 AND `entry` = 3376;
-- Razormane Warfrenzy
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.02 WHERE `item` = 6661 AND `entry` = 3459;
-- Razormane Stalker
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.02 WHERE `item` = 6661 AND `entry` = 3457;
-- Bael'dun Officer
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.02 WHERE `item` = 6661 AND `entry` = 3378;
-- Zhevra Courser
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.02 WHERE `item` = 6661 AND `entry` = 3466;
-- Nak
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.02 WHERE `item` = 6661 AND `entry` = 3434;
-- Supervisor Lugwizzle
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.02 WHERE `item` = 6661 AND `entry` = 3445;
-- Verog the Dervish
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES('3395','6661','0.02','0','1','1','0','0','10');
-- Bristleback Water Seeker
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3260;
-- Hecklefang Stalker
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 4128;
-- Silithid Creeper
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3250;
-- Greater Thunderhawk
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3249;

-- Creatures below where not mentioned on wowhead, but had a drop chance for the recipe in vmangos db (since those are barrens creatures as well) -> setting dropchance to 0.01
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3235;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3236;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3237;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3251;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3270;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3375;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3394;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3436;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3467;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3470;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3471;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3473;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 3476;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 5797;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 5799;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 5800;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 5829;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 5832;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 5835;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 5841;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 5847;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 5865;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 0.01 WHERE `item` = 6661 AND `entry` = 6020;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
