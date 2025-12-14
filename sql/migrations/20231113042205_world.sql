DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231113042205');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231113042205');
-- Add your query below.


-- Fix grammar mistake in "Hallowed Scroll" item text.
UPDATE `page_text` SET `text` = 'Feel blessed that your spirit was not released to the Nether, $N. Feel even more blessed that I decided you were worth the effort to write this scroll for.$B$BThe people you once knew, perhaps even cared for, are no longer! You must learn to \"live\" with that for the rest of your now unnatural life. I suggest you learn to deal with that first.$B$BIf you think you\'re ready for the trials ahead, then seek me out in the church in Deathknell.$B$B- Dark Cleric Duesten, Priest Trainer' WHERE `entry`=2467;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
