DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180218044951');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180218044951');
-- Add your query below.

DELETE FROM `creature` WHERE id = 10776;
UPDATE `creature_template` SET `AIName`='EventAI', `gossip_menu_id`=6000, `npcflag`=1 WHERE `entry`=10776;
REPLACE INTO `creature_ai_scripts` VALUES (1555000, 10776, 0, 11, 0, 100, 3, 0, 0, 0, 0, 1, 6066, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Finkle Einhorn - Say text on spawn');

REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (6000, 3659),(6001, 3660),(6002, 3661),(6003, 3662),(6004, 3663),(6005, 3664),(6006, 3665);
REPLACE INTO `gossip_menu_option` VALUES 
(6000, 0, 0, 'How the hell did you get in there to begin with?', 6079, 1, 1, 6001, 0, 0, 0, 0, '', 0, 0),
(6001, 0, 0, 'I\'m all ears.', 6081, 1, 1, 6002, 0, 0, 0, 0, '', 0, 0),
(6002, 0, 0, 'So let me get this straight. You were swimming, nay, doing backstrokes in molten lava with this... this lava suit of yours? Yes? And out of nowhere, this here beast swallowed you whole? ', 6083, 1, 1, 6003, 0, 0, 0, 0, '', 0, 0),
(6003, 0, 0, 'I must know something: How did you go to the bathroom with that thing on?', 6085, 1, 1, 6004, 0, 0, 0, 0, '', 0, 0),
(6004, 0, 0, 'Oh?', 6087, 1, 1, 6005, 0, 0, 0, 0, '', 0, 0),
(6005, 0, 0, 'I\'ll consider that the next time I run into one of these things.', 6089, 1, 1, 6006, 0, 0, 0, 0, '', 0, 0),
(6006, 0, 0, 'To Malyfous, I assume.', 6092, 1, 1, -1, 0, 6000, 0, 0, '', 0, 0);

REPLACE INTO `gossip_scripts` VALUES (6000, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Finkle Einhorn - Add Questgiver Flag');

REPLACE INTO `scripted_areatrigger` VALUES (2066, 'at_ubrs_the_beast');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
