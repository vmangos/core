DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180922210754');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180922210754');
-- Add your query below.


-- World of Warcraft Client Patch 1.11.0 (2006-06-20)
-- "Schools of Fish have been spotted off the coast of Azshara"
-- Firefin Snapper School
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid` IN (18122, 48233);
-- Oily Blackmouth School
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid` IN (18067, 48230);
-- Floating Wreckage
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid` IN (18084, 48231, 48232);

-- World of Warcraft Client Patch 1.11.0 (2006-06-20)
-- "Bloated Fish will no longer be found in wreckage."
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1015, 6643, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1015, 6645, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1015, 21162, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (17441, 1015, 10, 0, -1015, 1, 0, 7, 8);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1016, 6647, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1016, 13881, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (17498, 1016, 10, 0, -1016, 1, 0, 7, 8);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1017, 8366, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1017, 21164, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (17518, 1017, 10, 0, -1017, 1, 0, 7, 8);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1018, 13881, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1018, 13891, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1018, 21243, 0, 1, 1, 1, 0, 7, 8);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (17534, 1018, 10, 0, -1018, 1, 0, 7, 8);

-- Bloated Oily Blackmouth is missing data.
-- Seems to have been added in patch 1.9.
UPDATE `item_template` SET `patch`=7 WHERE `entry`=21162;

-- Loot for Bloated Oily Blackmouth.
-- Allakhazam comments mention a Shadowgem, Moss Agate, and a green chest.
-- Adding loot from Bloated Mud Snapper which is the same item level.
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21162, 774, 10, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21162, 818, 45, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21162, 1206, 15, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21162, 1210, 30, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21162, 30019, 5, 0, -30019, 1, 0, 7, 10);

-- Fishing locations for Bloated Oily Blackmouth from Allakhazam.
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (442, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (456, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (172, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (38, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (170, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (387, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (452, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (305, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (385, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (392, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (130, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (306, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (146, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (237, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (386, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (556, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (453, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (391, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (927, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (226, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (388, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (401, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2078, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (227, 21162, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (115, 21162, 1, 0, 1, 1, 0, 7, 10);

-- Bloated Rockscale Cod is missing data.
-- Seems to have been added in patch 1.9.
UPDATE `item_template` SET `patch`=7 WHERE `entry`=21164;

-- Fishing locations for Bloated Rockscale Cod from Allakhazam.
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (279, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1682, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (518, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2405, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (327, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (117, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (37, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (170, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1681, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (129, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (100, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (385, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (598, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2408, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (33, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (301, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (284, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (104, 21164, 1, 0, 1, 1, 0, 7, 10);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (122, 21164, 1, 0, 1, 1, 0, 7, 10);

-- Loot for Bloated Rockscale Cod.
-- "They contain jewelry such as Jades, necklaces and rings. :)"
-- "They contain goodies inside like the other Bloated fishes. Id say mostly gems and jewelry (such as necks and rings) :)"
-- "I Caught 1 at Strangethorn Vale and had Carnelian Loop of Shadow Resistance drop, what luck"
-- Adding loot from Bloated Trout which is the same item level.
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 1529, 47, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 1705, 15, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 3864, 25, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 4614, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 5003, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 5007, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 5009, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 5011, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 7909, 10, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 11970, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 11971, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 11972, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 11985, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 11986, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 11996, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 11997, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 12009, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 12010, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 12019, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 12020, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 12028, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 12029, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 12030, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 12039, 0, 1, 1, 1, 0, 7, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (21164, 12040, 0, 1, 1, 1, 0, 7, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
