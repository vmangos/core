DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171112152449');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171112152449');
-- Add your query below.

-- Leper gnomes don't speak Troll
UPDATE `creature_ai_texts` SET `language`=7, `comment`='Common Leper Gnome' WHERE `entry`=-231;

-- Gibblewilt OOC chatter
-- http://www.bubblesofmischief.com/2012/03/28/gibblewilt/
REPLACE INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES
(850301, 8503, 1, 1, 0, 0, 180000, 180000, 1, 50842, 50844, 50845, 'Gibblewilt - Random Say 1'),
(850302, 8503, 1, 1, 90000, 90000, 180000, 180000, 1, 50846, 50847, 50848, 'Gibblewilt - Random Say 2');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
