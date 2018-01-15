DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171125230506');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171125230506');
-- Add your query below.

UPDATE `quest_template`
SET `OfferRewardText`='I bid you greetings, $N. Your name rings loudly in Darnassus, for you show promise. But we shall soon see if you possess the strength of will to follow the path of the $C.'
WHERE `entry`=1684;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
