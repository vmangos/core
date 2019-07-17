DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190717144710');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190717144710');
-- Add your query below.


-- Frost Trap breaks Stealth since patch 1.11.
-- http://blue.cardplace.com/cache/wow-realm-test/355290.htm
-- https://us.forums.blizzard.com/en/wow/t/hunter-beta-issues-update/223166
-- https://us.forums.blizzard.com/en/wow/t/wow-classic-not-a-bug-list/175887/45?blzcmp=app
UPDATE `spell_template` SET `customFlags`=`customFlags`+512 WHERE `entry`=13810 && `build` >= 5464;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
