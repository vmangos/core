INSERT INTO `migrations` VALUES ('20170330231749');

-- Add new conditions for Red Scepter Shard and "From the Desk of Victor Nefarius"
-- Behaviour to be defined in blackwing_instance script
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(55,    18, 469,    1),
(56,    18, 469,    2);


-- Make "From the Desk of Victor Nefarius" drop on a failed Scepter Run
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 100, `condition_id` = 55 WHERE `entry` = 21142;
-- Make Red Scepter shard drop for only the Scepter Champion
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 100, `condition_id` = 56 WHERE `entry` = 21138;
