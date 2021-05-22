DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210506015537');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210506015537');
-- Add your query below.

-- https://web.archive.org/web/20060524160851/http://wow.allakhazam.com/db/quest.html?wquest=787
-- This quest was only available from Eitrigg during beta days when he was spawned in Valley of Trials instead of Orgrimmar.
UPDATE `quest_template` SET `OfferRewardText` = 'Another one of Eitrigg''s recruits, hm?$B$BA sorry state of affairs we find ourselves in if this is the best the Horde can produce. No matter. By the time we think you''re ready to leave the Valley, you''ll be a proud warrior of the Horde.', `Method` = 1 WHERE `entry` = 787;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
