DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251117221718');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251117221718');
-- Add your query below.

-- 3984: Target Is Friendly Or Better With Faction 749
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3984, 5, 749, 4, 0, 0, 0);

-- Add missing Hydraxian Honor Guard gossips at Friendly and Honored.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (5109, 6162, 0, 3984);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (5109, 6163, 0, 4203);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
