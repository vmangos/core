DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180503161906');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180503161906');
-- Add your query below.

-- Badlands
-- Start of vid 27: https://www.youtube.com/watch?v=-VL55SdDw-A&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&index=12

-- Indurium
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1108 AND `patch`=0;

-- Barbecued Buzzard Wings - accept ok
UPDATE `quest_template` SET `CompleteScript`=703 WHERE `entry`=703 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=703;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 887, 0, 0, 0, 0, 0, 0, 0, 0, 'Barbecued Buzzard Wings - Rigglefuzz: Emote text 1');

-- Study of the Elements: Rock pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=710 AND `patch`=0;

-- Coyote Thieves
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1419 AND `patch`=0;

-- Report to Helgrum - accept ok
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=1420 AND `patch`=0;

-- Broken Alliances pt. 1
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=782 AND `patch`=0;

-- Badlands Reagent Run
UPDATE `quest_template` SET `DetailsEmote1`=2, `CompleteEmote`=6, `OfferRewardEmote1`=21 WHERE `entry`=2258 AND `patch`=0;

-- Broken Alliances pt. 2

-- Uldaman Reagent Run
UPDATE `quest_template` SET `DetailsEmote1`=25 WHERE `entry`=2202 AND `patch`=0;

-- Study of the Elements: Rock pt. 2 - accept ok
UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=711 AND `patch`=0;

-- Study of the Elements: Rock pt. 3
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=712 AND `patch`=0;

-- Stone Is Better than Cloth
UPDATE `quest_template` SET `RequestItemsText`='I wouldn\'t wait too long to get that bracer, $N.$b$bWho knows what\'s going to happen next?' WHERE `entry`=716 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
