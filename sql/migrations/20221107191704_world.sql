DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221107191704');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221107191704');
-- Add your query below.

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES 
(10997, 7, 202, 200, 0, 0, 0), -- Condition for Engineering skill of 200
(10994, 8, 3639, 0, 0, 0, 0), -- Condition for completing Show Your Work (goblin engineering)
(10995, 8, 3641, 0, 0, 0, 0), -- Condition for completing Show Your Work (gnomish engineering - alliance side) 
(10996, 8, 3643, 0, 0, 0, 0), -- Condition for completing Show Your Work (gnomish engineering - horde side) 
(10998, -2, 10994, 10995, 10996, 0, 0) -- Condition to return true if any of the above quests are complete
(10999, 17, 20219, 1, 0, 0, 0), -- Condition to return true if the player has NOT learnt Gnomish Engineering
(11000, 17, 20222, 1, 0, 0, 0), -- Condition to return true if the player has NOT learnt Goblin Engineering
(11001, -1, 10999, 11000, 0, 0, 0) -- Condition to return true if the player has NOT learnt Gnomish Engineering AND Goblin Engineering
(11002, -1, 11001, 10998, 10997, 0, 0) -- Condition to return true if the player doesn't have an Engineering specialisation, completed one of the Engineering specialisation quests, and has a skill of 225 Engineering


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
