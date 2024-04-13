DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240413123221');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240413123221');
-- Add your query below.


/*
 World of Warcraft Client Patch 1.10.0 (2006-03-28)
 - The Bonereaver's Edge's triggered effect has been changed. Instead of
   lowering your victim's armor, it will cause you to ignore a portion
   of your victim's armor. Its triggering rate was substantially
   increased as well as the magnitude of the effect. In addition, the
   item now has 16 stamina. 
 World of Warcraft Client Patch 1.7.0 (2005-09-13)
 - The duration of the Bonereaver's Edge weapon debuff has been lowered,
   but the frequency of the effect has been raised.
*/
-- Classic research showed ppm was 2, but both 1.7 and 1.10 patch notes say ppm was increased. That means it used to be lower on previous patches.
UPDATE `item_template` SET `spellppmrate_1`=1 WHERE `entry`=17076 AND `patch`=0;
UPDATE `item_template` SET `spellppmrate_1`=1.5 WHERE `entry`=17076 AND `patch`=5;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
