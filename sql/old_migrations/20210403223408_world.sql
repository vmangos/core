DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210403223408');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210403223408');
-- Add your query below.

-- Replace static name "Ferlis" with player's name in progress text.
UPDATE `quest_template`
SET `RequestItemsText` = 'Hello, $N. I''m glad you found me. I was thinking that perhaps you got lost on the way here.$b$bNothing really new has happened in Shadowglen since I sent you my sigil, but I''ll leave all the information gathering to you. Speak to the rest of the people around Aldrassil if you''d like.'
WHERE `entry` = 3118;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
