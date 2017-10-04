INSERT INTO `migrations` VALUES ('20170723153000');

-- Lord Serpentis on aggro
UPDATE `creature_ai_texts` SET `sound` = 5788 WHERE `entry` = -123;
-- Lord Pythas on aggro
UPDATE `creature_ai_texts` SET `sound` = 5787 WHERE `entry` = -140;
-- Lady Anacondra on aggro
UPDATE `creature_ai_texts` SET `sound` = 5786 WHERE `entry` = -124;
-- Lord Cobrahn on aggro
UPDATE `creature_ai_texts` SET `sound` = 5785 WHERE `entry` = -99;
-- Naralex on awake
UPDATE `script_texts` SET `content_default` = 'I AM AWAKE, AT LAST!', `sound` = 5789 WHERE `entry` = -1614985;
