DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220604104651');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220604104651');
-- Add your query below.

-- Tirisfal - Brightwater lake (AreaID: 162) - https://classic.wowhead.com/tirisfal-glades#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=162 AND `item` IN 
(6303,6356,3641,8365,6308,15932,6310,6311,3827,4662,766,4658,8177,8179);
-- Default: Raw Brilliant Smallfish 
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry`=162 AND `item`=6291;
-- Sickly Looking Fish
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=15 WHERE `entry`=162 AND `item`=6299;
-- Old Skull
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=5 WHERE `entry`=162 AND `item`=6297;
-- Raw Longjaw Mud Snapper
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=29 WHERE `entry`=162 AND `item`=6289;

-- Undercity (AreaID: 1497) - https://de.classic.wowhead.com/undercity#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=1497 AND `item` IN 
(6559, 3184, 2976, 6512, 9763, 5212, 2406, 9785);
-- Old Skull
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=15 WHERE `entry`=1497 AND `item`=6297;
-- Sickly Looking Fish
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=15 WHERE `entry`=1497 AND `item`=6299;
-- Raw Bristle Whisker Catfish
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=15 WHERE `entry`=1497 AND `item`=6308;
-- Raw Brilliant Smallfish 
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=12 WHERE `entry`=1497 AND `item`=6291;

-- Silverpine Forest, Decrepit Ferry (AreaID: 237) - https://de.classic.wowhead.com/silverpine-forest#fishing:0-19+16+1
DELETE FROM `fishing_loot_template` WHERE `entry`=237 AND `item` IN 
(6358,3820,21071,20708,20709,858,3385,6351,6353,6307,6309,6301,6303,21162);
-- Sickly Looking Fish
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=10 WHERE `entry`=237 AND `item`=6299;
-- Raw Brilliant Smallfish 
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=15 WHERE `entry`=237 AND `item`=6291;
-- Raw Bristle Whisker Catfish
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=5 WHERE `entry`=237 AND `item`=6308;
-- Bloated Mud Snapper
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('237','6645','0.5','1','1','1','0','0','10');

-- Fenris Isle (AreaID: 172) - https://de.classic.wowhead.com/silverpine-forest#fishing:0-19+16+1
DELETE FROM `fishing_loot_template` WHERE `entry`=172 AND `item` IN 
(6358,3820,21071,20708,20709,858,3385,6351,6353,6307,6309,6301,6303,21162);
-- Sickly Looking Fish
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=10 WHERE `entry`=172 AND `item`=6299;
-- Raw Brilliant Smallfish 
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=15 WHERE `entry`=172 AND `item`=6291;
-- Raw Bristle Whisker Catfish
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=5 WHERE `entry`=172 AND `item`=6308;
-- Bloated Mud Snapper
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('172','6645','0.5','1','1','1','0','0','10');

-- Hillsbrad Foothills (AreaID: 267) - https://de.classic.wowhead.com/hillsbrad-foothills#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=267 AND `item` IN 
(6352,6354,929,3827,6307,6311,6310,6605,804,789,6360,6576,6562,21071,21113,21114,3820,6359,6358,6361);
-- Raw Longjaw Mud Snapper
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=15 WHERE `entry`=267 AND `item`=6289;
-- Bloated Catfish
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=267 AND `item`=6647;
-- 19 Pound Catfish
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('267','6310','0.04','1','1','1','0','0','10');
-- 22 Pound Catfish
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('267','6311','0.03','1','1','1','0','0','10');
-- Steelscale Crushfish
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('267','6360','0.01','1','1','1','0','0','10');

-- Alterac Mountains, Misty Shore (AreaID: 1681) - https://de.classic.wowhead.com/alterac-mountains#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=1681 AND `item` IN 
(21153,21150,8366,4352,7370,6418,4059,12029,6409,7085,3396,7455,3820,21151,6310,1710,3827,6311,6363,13758);

-- Alterac Mountains, The Uplands (AreaID: 284) - https://de.classic.wowhead.com/alterac-mountains#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=284 AND `item` IN 
(21153,21150,8366,4352,7370,6418,4059,12029,6409,7085,3396,7455,3820,21151,6310,1710,3827,6311,6363,13758);

-- Alterac Mountains - Dandred's Fold (AreaID: 1682) -  https://de.classic.wowhead.com/alterac-mountains#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=1682 AND `item` IN 
(21153,21150,8366,4352,7370,6418,4059,12029,6409,7085,3396,7455,3820,21151,6310,1710,3827,6311,6363,13758);

-- Arathi Highlands - (AreaID: 45) - https://de.classic.wowhead.com/arathi-highlands#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=45 AND `item` IN 
(6355,6357,8366,7354,10409,865,6421,1725,9826,9898,11972,6326);
-- Bloated Trout
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('45','8366','0.05','1','1','1','0','0','10');

-- Arathi Highlands, Faldir's Cove - (AreaID: 327) - https://de.classic.wowhead.com/arathi-highlands#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=327 AND `item` IN 
(21150,8366,7354,10409,865,6421,1725,9826,9898,11972,6326);
-- Bloated Trout
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('327','8366','0.05','1','1','1','0','0','10');

-- Hinterlands - (AreaID: 47) - https://de.classic.wowhead.com/the-hinterlands#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=47 AND `item` IN 
(10080,9928,11208,10090,8248,7528,7470,10320,6411,7477,3928);
-- Bloated Redgill
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('47','13881','0.03','1','1','1','0','0','10');

-- Hinterlands, Valorwind Lake - (AreaID: 1883) - https://de.classic.wowhead.com/the-hinterlands#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=1883 AND `item` IN 
(10080,9928,11208,10090,8248,7528,7470,10320,6411,7477,3928);
-- Bloated Redgill
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('1883','13881','0.03','1','1','1','0','0','10');

-- Hinterlands, Agol'watha - (AreaID: 1884) - https://de.classic.wowhead.com/the-hinterlands#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=1884 AND `item` IN 
(10080,9928,11208,10090,8248,7528,7470,10320,6411,7477);
-- Bloated Redgill
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('1884','13881','0.03','1','1','1','0','0','10');

-- Hinterlands, Skulk Rock - (AreaID: 351) - https://de.classic.wowhead.com/the-hinterlands#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=351 AND `item` IN 
(10080,9928,11208,10090,8248,7528,7470,10320,6411,7477);
-- Bloated Redgill
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('351','13881','0.03','1','1','1','0','0','10');

-- Hinterlands, The Overlook Cliffs - (AreaID: 307) - https://de.classic.wowhead.com/the-hinterlands#fishing
DELETE FROM `fishing_loot_template` WHERE `entry`=307 AND `item` IN 
(10080,9928,11208,10090,8248,7528,7470,10320,6411,7477);
-- Bloated Redgill
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('307','13881','0.03','1','1','1','0','0','10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
