DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171216013820');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171216013820');
-- Add your query below.

UPDATE `quest_template` SET `OfferRewardText`='A dragon slayer and a seasoned leatherworker? You do not cease to astonish, hero. I am humbled.$B$BPlease accept what I am about to teach you. This knowledge will prove to be invaluable if you are to destroy what remains of the Black Dragonflight.$B$BCreate the cloak from the scales of the brood mother. It will protect you and your allies against the incendiary breath of the Lord of Blackrock... Nefarian.'
WHERE `entry` IN (7493,7497);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
