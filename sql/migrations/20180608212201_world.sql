DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180608212201');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180608212201');
-- Add your query below.

-- Felwood
-- Start of vid 39: https://www.youtube.com/watch?v=5lRRXShK1Ag&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Strength of Corruption
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4120 AND `patch`=0;

-- Start of vid 41: https://www.youtube.com/watch?v=FFx7pDxRRrE&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- A Sample of Slime... - accept ok

-- Start of vid 47: https://www.youtube.com/watch?v=Iis-scUq9bg&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Forces of Jaedenar

-- Verifying the Corruption
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5156 AND `patch`=0;

-- Cleansing Felwood
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0 WHERE `entry`=4102 AND `patch`=0;

-- Maybess Riverbreeze should wander slightly
UPDATE `creature` SET `spawndist`=8, `MovementType`=1 WHERE `guid`=39092;

-- Well of Corruption
-- https://github.com/TrinityCore/TrinityCore/issues/21719
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `CompleteScript`=4505  WHERE `entry`=4505 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=4505;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4505, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: npc\_flag questgiver removed'),
(4505, 0, 20, 0, 0, 0, 0, 39704, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna\'s Kitten: Stop random movement'),
(4505, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5945, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: Say text 1'),
(4505, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: Emote talk'),
(4505, 3, 3, 2, 1800, 256, 2, 39704, 0, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: Walk to Winna\'s Kitten'),
(4505, 5, 35, 0, 0, 0, 0, 39704, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: Orient to Winna\'s Kitten'),
(4505, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5946, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: Emote text 2'),
(4505, 7, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: Emote kneel'),
(4505, 9, 15, 16510, 0, 0, 0, 39704, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna\'s Kitten: Cast spell "Corrupted Saber Visual"'),
(4505, 10, 23, 10042, 0, 0, 0, 39704, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna\'s Kitten: Morph kitten'),
(4505, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5947, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: Say text 2'),
(4505, 12, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: Emote laugh'),
(4505, 14, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5126.82, -325.127, 358.926, 4.99164, 0, 'Well of Corruption - Winna Hazzard: Walk to home'),
(4505, 17, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna Hazzard: npc\_flag questgiver added'),
(4505, 19, 23, 0, 0, 0, 0, 39704, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna\'s Kitten: Morph kitten back'),
(4505, 19, 20, 1, 0, 0, 0, 39704, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Well of Corruption - Winna\'s Kitten: Start random movement');

-- Fix position and add random movement for Winna's Kitten
UPDATE `creature` SET `position_x`=5126.69, `position_y`=-332.264, `position_z`=356.926, `spawndist`=8, `MovementType`=1 WHERE `guid`=39704;

-- A Husband's Last Battle
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=6, `OfferRewardEmote1`=2, `OfferRewardEmote2`=1 WHERE `entry`=6162 AND `patch`=0;

-- Wild Guardians pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4521 AND `patch`=0;

-- Deadwood of the North

-- Speak to Salfa and Feathers for Nafien should require Deadwood of the North
UPDATE `quest_template` SET `PrevQuestId`=8461 WHERE `entry`=8465 AND `patch`=7;
UPDATE `quest_template` SET `PrevQuestId`=8461 WHERE `entry`=8467 AND `patch`=7;

-- Start of vid 49: https://www.youtube.com/watch?v=uiOoJeosZbk&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Wild Guardians pt. 2 
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=4741 AND `patch`=0;

-- Collection of the Corrupt Water - already ok

-- Corrupted Sabers
UPDATE `quest_template` SET `DetailsEmote1`=11, `OfferRewardEmote1`=4, `OfferRewardEmote2`=11 WHERE `entry`=4506 AND `patch`=0;

-- Salve via Hunting
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5882 AND `patch`=0;

-- The Strength of Corruption - accept in Feralas fix
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4120 AND `patch`=0;

-- Lethtendris's Web - Both Horde and Ally
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=7489 AND `patch`=1;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=7488 AND `patch`=1;

-- Start of vid 54: https://www.youtube.com/watch?v=Ehxo0J_87iI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Wild Guardians pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4721 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
