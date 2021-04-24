DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200720182006');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200720182006');
-- Add your query below.


-- Remove quest Warlords Command (4903) from Warlord Goretooth (9077)
DELETE FROM `creature_questrelation` WHERE `quest` = 4903 AND `id` = 9077;

-- Add reputation requirement to receive Warlord Goretooth's Command.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4903, 5, 76, 4, 0, 0, 0);
UPDATE `conditions` SET `value3`=4903 WHERE `condition_entry`=61002;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
