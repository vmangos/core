DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220610205651');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220610205651');
-- Add your query below.


-- Add checks for nameplate and follow distance hacks.
INSERT INTO `warden_scans` (`id`, `type`, `str`, `data`, `address`, `length`, `result`, `flags`, `penalty`, `comment`) VALUES (90, 0, NULL, NULL, 12900744, 4, '0000C843', 2, -1, 'Nameplate extender');
INSERT INTO `warden_scans` (`id`, `type`, `str`, `data`, `address`, `length`, `result`, `flags`, `penalty`, `comment`) VALUES (91, 0, NULL, NULL, 8784512, 4, '00006144', 2, -1, 'Unlimited follow distance');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
