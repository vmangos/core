DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250312171132');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250312171132');
-- Add your query below.

-- Naxxramas
-- Your petty magics are no challenge to the might of the Scourge!
UPDATE `broadcast_text` SET `sound_id` = 9088 WHERE `entry` = 13492;
-- Fix wrong sound/text assignment
-- Come, Zeliek, do not drive them out. Not before we've had our fun!
UPDATE `broadcast_text` SET `sound_id` = 8896 WHERE `entry` = 13014;
-- Who's next?
UPDATE `broadcast_text` SET `sound_id` = 8894 WHERE `entry` = 13012;

-- Blackwing Lair
-- None of your kind should be here!  You've doomed only yourselves!
UPDATE `broadcast_text` SET `sound_id` = 8286 WHERE `entry` = 9967;
-- Clever, mortals - but I am not so easily lured away from my sanctum!
UPDATE `broadcast_text` SET `sound_id` = 8287 WHERE `entry` = 9968;
-- If I fall into the abyss, I'll take all of you mortals with me!
UPDATE `broadcast_text` SET `sound_id` = 8278 WHERE `entry` = 9591;

-- AQ 40
-- Are you so eager to die? I would be happy to accomodate you.
DELETE FROM `script_texts` WHERE `entry` = -1531000;
UPDATE `broadcast_text` SET `sound_id` = 8615 WHERE `entry` = 11445;
-- Let your death serve as an example!
DELETE FROM `script_texts` WHERE `entry` = -1531003;
UPDATE `broadcast_text` SET `sound_id` = 8617 WHERE `entry` = 11446;
-- You only delay the inevitable!
DELETE FROM `script_texts` WHERE `entry` = -1531007;
UPDATE `broadcast_text` SET `sound_id` = 8622 WHERE `entry` = 11447;
-- You will not escape death!
DELETE FROM `script_texts` WHERE `entry` = -1531023; 
UPDATE `broadcast_text` SET `sound_id` = 8629 WHERE `entry` = 11453;
-- Your fate is sealed!
DELETE FROM `script_texts` WHERE `entry` = -1531030;
UPDATE `broadcast_text` SET `sound_id` = 8635 WHERE `entry` = 11455;

-- AQ 20
DELETE FROM `script_texts` WHERE `entry` = -1509025; -- Sands of the desert rise and block out the sun!
DELETE FROM `script_texts` WHERE `entry` = -1509026; -- You are terminated.
DELETE FROM `script_texts` WHERE `entry` = -1509027; -- I...have...failed.
DELETE FROM `script_texts` WHERE `entry` = -1509000; -- %s senses your fear.
DELETE FROM `script_texts` WHERE `entry` = -1509001; -- %s bristles with energy!
DELETE FROM `script_texts` WHERE `entry` = -1509028; -- %s drains your mana and turns to stone.
DELETE FROM `script_texts` WHERE `entry` = -1900117; -- Kill $n!
-- Sands of the desert, rise and block out the sun!
UPDATE `broadcast_text` SET `sound_id` = 8598, `chat_type` = 6 WHERE `entry` = 11449;
-- You are terminated.
UPDATE `broadcast_text` SET `sound_id` = 8602, `chat_type` = 6 WHERE `entry` = 11450;
-- I...have...failed.
UPDATE `broadcast_text` SET `sound_id` = 8594, `chat_type` = 6 WHERE `entry` = 11451;

-- Molten Core
-- BY FIRE BE PURGED!
UPDATE `broadcast_text` SET `sound_id` = 8046 WHERE `entry` = 9426;
-- YOU CANNOT DEFEAT THE LIVING FLAME! COME YOU MINIONS OF FIRE! COME FORTH YOU CREATURES OF HATE! YOUR MASTER CALLS!
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 8573;
-- %s performs one last service for Ragnaros.
DELETE FROM `script_texts` WHERE `entry` = -1409000;
-- 8253

-- Zul'Gurub
-- Bethekk, your priestess calls upon your might!
UPDATE `broadcast_text` SET `sound_id` = 8416 WHERE `entry` = 10461;
-- At last, I am free of the Soulflayer!
UPDATE `broadcast_text` SET `sound_id` = 8412 WHERE `entry` = 10450;

-- Sunken Temple
-- The walls of the chamber tremble. Something is happening...
UPDATE `broadcast_text` SET `chat_type`= 2 WHERE `entry`= 11191;

-- Stratholme
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 6442;  -- Damn you mortals! All my plans of revenge, all my hate... all burned to ash...
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 13162; -- The shadow of the Scourge yet remains on this land, fools! You will never prevail!
DELETE FROM `script_texts` WHERE `entry` = -1900161; -- Prepare to be Malowned!
 UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 6504;
DELETE FROM `script_texts` WHERE `entry` = -1900162; -- You've been MALOWNED!
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 6530;
DELETE FROM `script_texts` WHERE `entry` = -1900160; -- TIMMY!
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 6150;
DELETE FROM `script_texts` WHERE `entry` = -1900116; -- An Ash'ari Crystal has been toppled! Restore the ziggurat before the Slaughterhouse is vulnerable!
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 6527;
DELETE FROM `script_texts` WHERE `entry` = -1900115; -- The Ash'ari Crystals have been destroyed! The Slaughterhouse is vulnerable!
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 6289;
DELETE FROM `script_texts` WHERE `entry` = -1329000; -- Praise be to Egan!
-- 6453
DELETE FROM `script_texts` WHERE `entry` = -1329001; -- Rivendare must be destroyed!
-- 6455
DELETE FROM `script_texts` WHERE `entry` = -1329002; -- The curse ends!
-- 6452
DELETE FROM `script_texts` WHERE `entry` = -1329003; -- May Kel'Thuzad one day feel our vengeance.
-- 6454

-- Misc Texts
DELETE FROM `script_texts` WHERE `entry` = -1900169; -- %s marches around, roaring and making a ruckus.
DELETE FROM `script_texts` WHERE `entry` = -1900170; -- Raaaaaaaaaaaaarrrr!
DELETE FROM `script_texts` WHERE `entry` = -1900171; -- Oh!!! Get that thing away from me!
DELETE FROM `script_texts` WHERE `entry` = -1900172; -- %s jumps in fright!
DELETE FROM `script_texts` WHERE `entry` = -1900173; -- %s jumps in fright!

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
