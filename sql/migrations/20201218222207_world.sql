DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201218222207');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201218222207');
-- Add your query below.

-- Set QUEST_METHOD_DISABLED flag for following quests

-- 171 Four-legged Menaces
UPDATE `quest_template` SET `Method`=1 WHERE `entry`=171 AND `patch`=0;

-- 172 Ambushed In The Forest
UPDATE `quest_template` SET `Method`=1 WHERE `entry`=172 AND `patch`=0;

-- 236 Awaiting Word
UPDATE `quest_template` SET `Method`=1 WHERE `entry`=236 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
