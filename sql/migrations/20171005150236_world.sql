DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171005150236');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171005150236');
-- Add your query below.


-- Urok / Voone / Omokk loot tables
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (4018, 37, 8, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (4027, 37, 7, 2);
UPDATE `reference_loot_template` SET `condition_id`=4018 WHERE  `entry`=323642 AND `item`=13178;
UPDATE `reference_loot_template` SET `condition_id`=4018 WHERE  `entry`=321405 AND `item`=16670;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `condition_id`) VALUES (321492, 13178, 0, 1, 4027);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `condition_id`) VALUES (323642, 16670, 0, 1, 4027);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
