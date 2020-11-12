DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200607100828');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200607100828');
-- Add your query below.


-- Ring of the Earthshatterer used wrong id of Increased Mana Regen.
UPDATE `item_template` SET `spellid_2`=21627 WHERE `entry`=23065;

-- Frostfire Robe is missing Spell Penetration 15.
UPDATE `item_template` SET `spellid_4`=28869, `spelltrigger_4`=1 WHERE `entry`=22496;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
