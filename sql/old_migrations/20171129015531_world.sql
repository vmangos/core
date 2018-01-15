DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171129015531');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171129015531');
-- Add your query below.


-- Added patch support to map_template table.
DROP TABLE IF EXISTS `map_template`;
CREATE TABLE IF NOT EXISTS `map_template` (
  `Entry` smallint(5) unsigned NOT NULL,
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Parent` int(10) unsigned NOT NULL DEFAULT '0',
  `MapType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LinkedZone` int(10) unsigned NOT NULL DEFAULT '0',
  `LevelMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LevelMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ResetDelay` int(10) unsigned NOT NULL DEFAULT '0',
  `GhostEntranceMap` smallint(5) NOT NULL DEFAULT '-1',
  `GhostEntranceX` float NOT NULL DEFAULT '0',
  `GhostEntranceY` float NOT NULL DEFAULT '0',
  `MapName` varchar(128) NOT NULL DEFAULT '',
  `ScriptName` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`Entry`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- The player limit on dungeons changed in 1.3 and 1.10.
INSERT INTO `map_template` (`Entry`, `patch`, `Parent`, `MapType`, `LinkedZone`, `LevelMin`, `LevelMax`, `MaxPlayers`, `ResetDelay`, `GhostEntranceMap`, `GhostEntranceX`, `GhostEntranceY`, `MapName`, `ScriptName`) VALUES
	(0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 'Eastern Kingdoms', ''),
	(1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 'Kalimdor', ''),
	(13, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 'Testing', ''),
	(25, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 'Scott Test', ''),
	(29, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 'CashTest', ''),
	(30, 0, 0, 3, 0, 51, 60, 40, 0, -1, 0, 0, 'Alterac Valley', ''),
	(33, 0, 0, 1, 0, 20, 26, 40, 0, 0, -230.989, 1571.57, 'Shadowfang Keep', 'instance_shadowfang_keep'),
	(33, 1, 0, 1, 0, 20, 26, 10, 0, 0, -230.989, 1571.57, 'Shadowfang Keep', 'instance_shadowfang_keep'),
	(34, 0, 0, 1, 717, 24, 32, 40, 0, 0, -8762.38, 848.01, 'Stormwind Stockade', ''),
	(34, 1, 0, 1, 717, 24, 32, 10, 0, 0, -8762.38, 848.01, 'Stormwind Stockade', ''),
	(35, 0, 0, 0, 717, 0, 0, 0, 0, -1, 0, 0, '<unused> StormwindPrison', ''),
	(36, 0, 0, 1, 0, 17, 26, 40, 0, 0, -11207.8, 1681.15, 'Deadmines', 'instance_deadmines'),
	(36, 1, 0, 1, 0, 17, 26, 10, 0, 0, -11207.8, 1681.15, 'Deadmines', 'instance_deadmines'),
	(37, 0, 0, 0, 0, 10, 20, 30, 0, -1, 0, 0, 'Azshara Crater', ''),
	(42, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 'Collin\'s Test', ''),
	(43, 0, 0, 1, 718, 17, 24, 40, 0, 1, -751.131, -2209.24, 'Wailing Caverns', 'instance_wailing_caverns'),
	(43, 1, 0, 1, 718, 17, 24, 10, 0, 1, -751.131, -2209.24, 'Wailing Caverns', 'instance_wailing_caverns'),
	(44, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, '<unused> Monastery', ''),
	(47, 0, 0, 1, 0, 29, 38, 40, 0, 1, -4459.45, -1660.21, 'Razorfen Kraul', 'instance_razorfen_kraul'),
	(47, 1, 0, 1, 0, 29, 38, 10, 0, 1, -4459.45, -1660.21, 'Razorfen Kraul', 'instance_razorfen_kraul'),
	(48, 0, 0, 1, 719, 24, 32, 40, 0, 1, 4249.12, 748.387, 'Blackfathom Deeps', 'instance_blackfathom_deeps'),
	(48, 1, 0, 1, 719, 24, 32, 10, 0, 1, 4249.12, 748.387, 'Blackfathom Deeps', 'instance_blackfathom_deeps'),
	(70, 0, 0, 1, 1337, 41, 51, 40, 0, 0, -6060.18, -2955, 'Uldaman', 'instance_uldaman'),
	(70, 1, 0, 1, 1337, 41, 51, 10, 0, 0, -6060.18, -2955, 'Uldaman', 'instance_uldaman'),
	(90, 0, 0, 1, 721, 29, 38, 40, 0, 0, -5162.66, 931.599, 'Gnomeregan', 'instance_gnomeregan'),
	(90, 1, 0, 1, 721, 29, 38, 10, 0, 0, -5162.66, 931.599, 'Gnomeregan', 'instance_gnomeregan'),
	(109, 0, 0, 1, 1477, 50, 0, 40, 0, 0, -10170.1, -3995.97, 'Sunken Temple', 'instance_sunken_temple'),
	(109, 1, 0, 1, 1477, 50, 0, 10, 0, 0, -10170.1, -3995.97, 'Sunken Temple', 'instance_sunken_temple'),
	(129, 0, 0, 1, 0, 37, 46, 40, 0, 1, -4662.88, -2535.87, 'Razorfen Downs', 'instance_razorfen_downs'),
	(129, 1, 0, 1, 0, 37, 46, 10, 0, 1, -4662.88, -2535.87, 'Razorfen Downs', 'instance_razorfen_downs'),
	(169, 0, 0, 2, 0, 0, 0, 0, 0, -1, 0, 0, 'Emerald Dream', ''),
	(189, 0, 0, 1, 0, 34, 45, 40, 0, 0, 2892.24, -811.264, 'Scarlet Monastery', 'instance_scarlet_monastery'),
	(189, 1, 0, 1, 0, 34, 45, 10, 0, 0, 2892.24, -811.264, 'Scarlet Monastery', 'instance_scarlet_monastery'),
	(209, 0, 0, 1, 0, 44, 54, 40, 0, 1, -6790.58, -2891.28, 'Zul\'Farrak', 'instance_zulfarrak'),
	(209, 1, 0, 1, 0, 44, 54, 10, 0, 1, -6790.58, -2891.28, 'Zul\'Farrak', 'instance_zulfarrak'),
	(229, 0, 0, 1, 1583, 55, 0, 40, 0, 0, -7522.53, -1233.04, 'Blackrock Spire', 'instance_blackrock_spire'),
	(229, 1, 0, 1, 1583, 55, 0, 15, 0, 0, -7522.53, -1233.04, 'Blackrock Spire', 'instance_blackrock_spire'),
	(229, 8, 0, 1, 1583, 55, 0, 10, 0, 0, -7522.53, -1233.04, 'Blackrock Spire', 'instance_blackrock_spire'),
	(230, 0, 0, 1, 1584, 52, 0, 40, 0, 0, -7178.1, -928.639, 'Blackrock Depths', 'instance_blackrock_depths'),
	(230, 1, 0, 1, 1584, 52, 0, 10, 0, 0, -7178.1, -928.639, 'Blackrock Depths', 'instance_blackrock_depths'),
	(230, 8, 0, 1, 1584, 52, 0, 5, 0, 0, -7178.1, -928.639, 'Blackrock Depths', 'instance_blackrock_depths'),
	(249, 0, 0, 2, 2159, 60, 0, 40, 5, 1, -4753.31, -3752.42, 'Onyxia\'s Lair', ''),
	(269, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 'Caverns of Time', ''),
	(289, 0, 0, 1, 0, 58, 0, 40, 0, 0, 1274.78, -2552.56, 'Scholomance', 'instance_scholomance'),
	(289, 1, 0, 1, 0, 58, 0, 10, 0, 0, 1274.78, -2552.56, 'Scholomance', 'instance_scholomance'),
	(289, 8, 0, 1, 0, 58, 0, 5, 0, 0, 1274.78, -2552.56, 'Scholomance', 'instance_scholomance'),
	(309, 0, 0, 2, 1977, 60, 0, 20, 3, 0, -11916.1, -1224.58, 'Zul\'Gurub', 'instance_zulgurub'),
	(329, 0, 0, 1, 0, 58, 0, 40, 0, 0, 3392.32, -3378.48, 'Stratholme', 'instance_stratholme'),
	(329, 1, 0, 1, 0, 58, 0, 10, 0, 0, 3392.32, -3378.48, 'Stratholme', 'instance_stratholme'),
	(329, 8, 0, 1, 0, 58, 0, 5, 0, 0, 3392.32, -3378.48, 'Stratholme', 'instance_stratholme'),
	(349, 0, 0, 1, 2100, 46, 55, 40, 0, 1, -1432.7, 2924.98, 'Maraudon', 'instance_maraudon'),
	(349, 1, 0, 1, 2100, 46, 55, 10, 0, 1, -1432.7, 2924.98, 'Maraudon', 'instance_maraudon'),
	(369, 0, 0, 0, 2257, 0, 0, 0, 0, -1, 0, 0, 'Deeprun Tram', ''),
	(389, 0, 0, 1, 2437, 13, 18, 40, 0, 1, 1816.76, -4423.37, 'Ragefire Chasm', ''),
	(389, 1, 0, 1, 2437, 13, 18, 10, 0, 1, 1816.76, -4423.37, 'Ragefire Chasm', ''),
	(409, 0, 0, 2, 2717, 60, 0, 40, 7, 0, -7510.56, -1036.7, 'Molten Core', 'instance_molten_core'),
	(429, 0, 0, 1, 2557, 55, 0, 5, 0, 1, -3908.03, 1130, 'Dire Maul', 'instance_dire_maul'),
	(449, 0, 0, 0, 2918, 0, 0, 0, 0, -1, 0, 0, 'Alliance PVP Barracks', ''),
	(450, 0, 0, 0, 2917, 0, 0, 0, 0, -1, 0, 0, 'Horde PVP Barracks', ''),
	(451, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 'Development Land', ''),
	(469, 0, 0, 2, 2677, 60, 0, 40, 7, 0, -7663.41, -1218.67, 'Blackwing Lair', 'instance_blackwing_lair'),
	(489, 0, 0, 3, 3277, 10, 60, 10, 0, -1, 0, 0, 'Warsong Gulch', ''),
	(509, 0, 0, 2, 3429, 60, 0, 20, 3, 1, -8114.46, 1526.37, 'Ruins of Ahn\'Qiraj', 'instance_ruins_of_ahnqiraj'),
	(529, 0, 0, 3, 3358, 20, 60, 15, 0, -1, 0, 0, 'Arathi Basin', ''),
	(531, 0, 0, 2, 3428, 60, 0, 40, 7, 1, -8111.72, 1526.79, 'Ahn\'Qiraj Temple', 'instance_temple_of_ahnqiraj'),
	(533, 0, 0, 2, 3456, 60, 0, 40, 7, -1, 0, 0, 'Naxxramas', 'instance_naxxramas');
	

-- The portal inside BRD should not require being attuned.
-- In fact before 1.4 the Core Fragment for the attunement quest was INSIDE Molten Core.
-- https://web.archive.org/web/20050425165128/http://wow.allakhazam.com:80/db/quest.html?wquest=7487
-- "The Molten Core discovery quest has had its objective moved from inside the Molten Core to Blackrock Depths" 
-- https://web.archive.org/web/20060524065200/http://wow.allakhazam.com:80/db/object.html?wobject=410
-- Found in Dungeons: The Molten Core
UPDATE `areatrigger_teleport` SET `required_quest_done`=0 WHERE `id`=2886;
UPDATE `gameobject` SET `patch_min`=2 WHERE `guid` IN (234739, 234743, 234741, 234745, 234747);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (234778, 179553, 409, 1062.83, -476.046, -107.245, 3.05847, 0, 0, 0.999136, 0.0415495, 25, 100, 1, 0, 0, 1, 1);

-- The Molten Core attunement quest was added in 1.3, prior you had to run through BRD.
-- They added the teleport option in 1.3 because the player limit of BRD was changed.
-- https://www.engadget.com/2014/08/15/wow-archivist-the-classic-molten-core-experience/
-- https://web.archive.org/web/20050425165128/http://wow.allakhazam.com:80/db/quest.html?wquest=7487
-- Added: Mar 22nd, 2005
UPDATE `areatrigger_teleport` SET `patch`=1 WHERE `id` IN (3528, 3529);
UPDATE `quest_template` SET `patch`=1 WHERE `entry` IN (7848, 7487);
UPDATE `creature_involvedrelation` SET `patch`=1 WHERE `quest` IN (7848, 7487);
UPDATE `creature_questrelation` SET `patch`=1 WHERE `quest` IN (7848, 7487);

-- Creature speed update by thepparker.

-- Update wild creature speeds for some beasts. The existing default speed is ~115%.
-- Categories are: 1.14286 (~115%), 1.42857 (~145%), 2.14286 (~215%), 2.42857 (~245%)
--                 (increments of 1/7)
-- Based on speeds documented at http://petopia.morrowind4kids.com/archive/html/fastrun.html
-- Most creatures level 10 and below either run at 100% or ~115% speeds, whereas their higher 
-- level counterparts can run much faster.

-- Be wary of mobs that are designed to not move by having speeds set to 0.

-- --------- Wolves ---------
-- Slavering Worg, Mist Howler and other elite or stronger wolves above level 17 @ ~145%
UPDATE `creature_template` SET `speed_run` = 1.42857 
    WHERE `family` = 1 AND `rank` > 0 AND `minlevel` >= 17
        AND `speed_run` > 0 AND `speed_walk` > 0;
-- Longtooth runners @ ~145%
UPDATE `creature_template` SET `speed_run` = 1.42857 WHERE `entry` = 5286;
-- Frostwolves, tamed and un-tamed @ ~245%
UPDATE `creature_template` SET `speed_run` = 2.42857 WHERE `entry` IN (10981, 10985);

-- --------- Cats ---------
-- Low level non-rare and non-elite cats (level 9-16) @ ~115%
-- Note there are duplicate entries in source for Savannah cats, so take lowest
-- Snow Leopard, Flatland Cougar and other cats (lvl <9) in starting areas @ 100%
UPDATE `creature_template` SET `speed_run` = 1 
    WHERE `entry` IN (1199, 1201, 2031, 2032, 2042, 2961, 3035);
-- Higher level cats (level 16+) all at 145% ? source suggests "most" cats are 145%
UPDATE `creature_template` SET `speed_run` = 1.42857
    WHERE `family` = 2 AND `minlevel` > 16 
        AND `speed_run` > 0 AND `speed_walk` > 0;
-- Echeyakee and Duskstalker @ 115% ? This is questionable...
UPDATE `creature_template` SET `speed_run` = 1.14286 WHERE `entry` IN (3475, 14430);
-- Low level rare/elites Rake, Dishu, Humar @ ~145%
UPDATE `creature_template` SET `speed_run` = 1.42857 WHERE `entry` IN (5807, 5828, 5865);

--  --------- Spiders ---------
-- All at 115 aside from Marli's baby spider summon
UPDATE `creature_template` SET `speed_run` = 2.14286 WHERE `entry` = 15041;

-- --------- Boars ---------
-- All boars are at ~115% aside from some low level ones which are at 100%
UPDATE `creature_template` SET `speed_run` = 1 
    WHERE `family` = 5 AND `maxlevel` < 10 
        AND `speed_run` > 0 AND `speed_walk` > 0;

-- --------- Raptors ---------
-- Most raptors @ ~115% aside from Takk the Leaper at ~145%
UPDATE `creature_template` SET `speed_run` = 1.42857 WHERE `entry` = 5842;

-- --------- Tallstriders ---------
-- ALmost all tallstriders run at ~145%, follow the newbie speed rule
UPDATE `creature_template` SET `speed_run` = 1.42857 
    WHERE `family` = 12 AND `minlevel` > 10
        AND `speed_run` > 0 AND `speed_walk` > 0;
-- Mazzaranche runs at 100%
UPDATE `creature_template` SET `speed_run` = 1 WHERE `entry` = 3068;

-- --------- Bats ---------
-- All bats at ~115% aside from a couple special ones
-- Ressan the Needler @ ~145%
UPDATE `creature_template` SET `speed_run` = 1.42857 WHERE `entry` = 10357;
-- (Frenzied) Bloodseeker Bat from ZG @ ~215%
UPDATE `creature_template` SET `speed_run` = 2.14286 WHERE `entry` IN (11368, 14965);

-- --------- Owls ---------
-- All owls at ~115% aside from a couple low level owls @ ~145%
UPDATE `creature_template` SET `speed_run` = 1.42857
    WHERE `family` = 26 AND `maxlevel` <= 10
        AND `speed_run` > 0 AND `speed_walk` > 0;

-- --------- Windserpents ---------
-- Mostly at ~145%, aside from some low level ones at ~115%
UPDATE `creature_template` SET `speed_run` = 1.42857
    WHERE `family` = 27 AND `minlevel` >= 20
        AND `speed_run` > 0 AND `speed_walk` > 0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
