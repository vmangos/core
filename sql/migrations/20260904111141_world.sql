DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260904111141');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260904111141');
-- Add your query below.

-- Update to option text from screenshot
UPDATE `gossip_menu_option` SET `option_text` = 'Pick the fruit from the night dragon.' WHERE `action_script_id` = 15344;

-- Inferred text (educated guess)
UPDATE `gossip_menu_option` SET `option_text` = 'Deeply inhale the fragrance from the songflower.' WHERE `action_script_id` = 15366;

-- Less substantiated guesses
UPDATE `gossip_menu_option` SET `option_text` = 'Collect the tubers from the whipper root.' WHERE `action_script_id` = 15343;
UPDATE `gossip_menu_option` SET `option_text` = 'Pick the berries from the windblossom.' WHERE `action_script_id` = 15342;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
