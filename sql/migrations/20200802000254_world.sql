DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200802000254');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200802000254');
-- Add your query below.


DELETE FROM `script_texts` WHERE `entry` IN (-1999906, -1999907, -1999908, -1999909, -1999910, -1000293, -1000294, -1000295,
                                            -1000296, -1000297, -1000101, -1000102, -1000103, -1000104, -1000105, -1000582,
                                            -1000583, -1000584, -1000585, -1000586, -1000587, -1000588, -1000847, -1000848,
                                            -1000849, -1999902, -1999903, -1999904, -1999905, -1999915, -1700000, -1700001,
                                            -1700002, -1700003, -1700004, -1700005, -1700006, -1700007, -1700008, -1700009,
                                            -1700010, -1700011, -1700012, -1700013, -1700014, -1700015, -1700016, -1700017,
                                            -1780227, -1780228, -1780229, -1000993, -1000994, -1084001, -1084002, -1084003,
                                            -1084004, -1084005, -1084006, -1084007, -1084008, -1084009, -1000561, -1000562,
                                            -1000563, -1000564, -1000565, -1000571, -1000572, -1000573, -1000574, -1000403,
                                            -1000404, -1000405, -1000406, -1000407, -1000408, -1000409);

UPDATE `broadcast_text` SET `chat_type` = 1 WHERE `entry` IN (10474, 4613, 3934, 3936);
UPDATE `broadcast_text` SET `chat_type` = 6, `emote_id1` = 22 WHERE `entry` = 10537;
UPDATE `broadcast_text` SET `emote_id1` = 1 WHERE `entry` = 1403;
UPDATE `broadcast_text` SET `emote_id1` = 5 WHERE `entry` = 1404;
UPDATE `broadcast_text` SET `emote_id1` = 25 WHERE `entry` = 1402;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
