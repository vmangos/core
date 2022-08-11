DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220315192839');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220315192839');
-- Add your query below.

-- Boss_Mekgineer_Thermaplugg
DELETE FROM `script_texts` WHERE `entry`= -1090024; 
DELETE FROM `script_texts` WHERE `entry`= -1090025; 
DELETE FROM `script_texts` WHERE `entry`= -1090026; 
DELETE FROM `script_texts` WHERE `entry`= -1090027; 

-- npc_blastmaster_emi_shortfuse
DELETE FROM `script_texts` WHERE `entry`= -1090000;
DELETE FROM `script_texts` WHERE `entry`= -1090001;
DELETE FROM `script_texts` WHERE `entry`= -1090002;
DELETE FROM `script_texts` WHERE `entry`= -1090003;
DELETE FROM `script_texts` WHERE `entry`= -1090004;
DELETE FROM `script_texts` WHERE `entry`= -1090005;
DELETE FROM `script_texts` WHERE `entry`= -1090006;
DELETE FROM `script_texts` WHERE `entry`= -1090007;
DELETE FROM `script_texts` WHERE `entry`= -1090008;
DELETE FROM `script_texts` WHERE `entry`= -1090009;
DELETE FROM `script_texts` WHERE `entry`= -1090010;
DELETE FROM `script_texts` WHERE `entry`= -1090011;
DELETE FROM `script_texts` WHERE `entry`= -1090012;
DELETE FROM `script_texts` WHERE `entry`= -1090013;
DELETE FROM `script_texts` WHERE `entry`= -1090014;
DELETE FROM `script_texts` WHERE `entry`= -1090015;
DELETE FROM `script_texts` WHERE `entry`= -1090016;
DELETE FROM `script_texts` WHERE `entry`= -1090017;
DELETE FROM `script_texts` WHERE `entry`= -1090018;
DELETE FROM `script_texts` WHERE `entry`= -1090019;
DELETE FROM `script_texts` WHERE `entry`= -1090020;
DELETE FROM `script_texts` WHERE `entry`= -1090021;
DELETE FROM `script_texts` WHERE `entry`= -1090022;

DELETE FROM `script_texts` WHERE `entry`= -1090028;
DELETE FROM `script_texts` WHERE `entry`= -1090023;

-- npc_kernobee
DELETE FROM `script_texts` WHERE `entry`= -1780204;
DELETE FROM `script_texts` WHERE `entry`= -1780205;
DELETE FROM `script_texts` WHERE `entry`= -1780206;
DELETE FROM `script_texts` WHERE `entry`= -1780207;
DELETE FROM `script_texts` WHERE `entry`= -1780208;

-- Some texts should be yell:
-- We come from below! You can never stop us!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4328;
-- Incoming blast in 10 seconds!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4135;
-- Incoming blast in 5 seconds. Clear the tunnel! Stay back!!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4136;
-- 10 seconds to blast! Stand back!!!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4326;
-- 5 seconds until detonation!!!!!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4327;
-- FIRE IN THE HOLE!
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=4137;
-- Self-destruct sequence activated.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=3927;

-- Add missing emotes
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=4050;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=4051;
UPDATE `broadcast_text` SET `emote_id1`=5 WHERE `entry`=4052;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=4129;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=4130;
UPDATE `broadcast_text` SET `emote_id1`=25 WHERE `entry`=4131;
UPDATE `broadcast_text` SET `emote_id1`=5 WHERE `entry`=4132;
UPDATE `broadcast_text` SET `emote_id1`=5 WHERE `entry`=4135;
UPDATE `broadcast_text` SET `emote_id1`=5 WHERE `entry`=4136;
UPDATE `broadcast_text` SET `emote_id1`=25 WHERE `entry`=4137;
UPDATE `broadcast_text` SET `emote_id1`=4 WHERE `entry`=4206;
UPDATE `broadcast_text` SET `emote_id1`=6 WHERE `entry`=4207;
UPDATE `broadcast_text` SET `emote_id1`=25 WHERE `entry`=4208;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=4325;
UPDATE `broadcast_text` SET `emote_id1`=5 WHERE `entry`=4326;
UPDATE `broadcast_text` SET `emote_id1`=5 WHERE `entry`=4327;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=4329;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=4328;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
