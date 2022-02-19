DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220116070008');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220116070008');
-- Add your query below.


-- SAY_GAMESBEGIN_1
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=9907;
DELETE FROM `script_texts` WHERE `entry`=-1469004;

-- SAY_GAMESBEGIN_2
UPDATE `broadcast_text` SET `emote_id1`=22, `sound_id`=8280, `chat_type`=1 WHERE `entry`=9845;
DELETE FROM `script_texts` WHERE `entry`=-1469005;

-- SAY_SCEPTER_RUN_START
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11267;
DELETE FROM `script_texts` WHERE `entry`=-1469031;

-- SAY_SCEPTER_TAUNT_0
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11214;
DELETE FROM `script_texts` WHERE `entry`=-1469038;

-- SAY_SCEPTER_TAUNT_1
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11215;
DELETE FROM `script_texts` WHERE `entry`=-1469040;

-- SAY_SCEPTER_TAUNT_2
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11216;
DELETE FROM `script_texts` WHERE `entry`=-1469041;

-- SAY_SCEPTER_TAUNT_3
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11217;
DELETE FROM `script_texts` WHERE `entry`=-1469042;

-- SAY_SCEPTER_TAUNT_4
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11218;
DELETE FROM `script_texts` WHERE `entry`=-1469043;

-- SAY_SCEPTER_RUN_LAUGHTER
UPDATE `broadcast_text` SET `emote_id1`=11, `chat_type`=3 WHERE `entry`=11230;
DELETE FROM `script_texts` WHERE `entry`=-1469039;

-- SAY_SCEPTER_FAIL_LAUGHTER
UPDATE `broadcast_text` SET `emote_id1`=11, `chat_type`=3 WHERE `entry`=11231;
DELETE FROM `script_texts` WHERE `entry`=-1469044;

-- SAY_SCEPTER_FAIL
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=11219;
DELETE FROM `script_texts` WHERE `entry`=-1469045;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
