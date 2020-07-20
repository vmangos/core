DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200720183107');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200720183107');
-- Add your query below.


-- add chop wood emote to  scarlet lumberjack
INSERT INTO `creature_addon` (`guid`, `emote`)VALUES
(46775, 234),
(45384, 234),
(45380, 234),
(47156, 234),
(45386, 234),
(46784, 234),
(45378, 234),
(46776, 234),
(47159, 234),
(45383, 234),
(46777, 234),
(47161, 234),
(47164, 234);

-- add talk emote to scarlet lumberjack
INSERT INTO `creature_addon` (`guid`, `emote`)VALUES
(47162, 1),
(46782, 1),
(47163, 1),
(47152, 1),
(46781, 1),
(46783, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
