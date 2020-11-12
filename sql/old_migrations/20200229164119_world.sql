DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200229164119');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200229164119');
-- Add your query below.

REPLACE INTO `page_text` (`entry`, `text`) VALUES (691, 'If you are reading this note, then you survived the ordeal of undeath and have returned to us to join the ranks of the Forsaken.   This new life is viewed by many as more of a curse than a blessing, but make of it what you will.$B$BWhen you are ready for more training in the path of arcane magics, then I will show you what you need to know.  You will find me in the old church in Deathknell.$B$B   -Isabella, Mage Trainer.');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
