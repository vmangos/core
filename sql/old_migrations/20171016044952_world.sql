DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171016044952');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171016044952');
-- Add your query below.

-- Update patch level for all ZG-set bracers and belts, which are upgraded to epic in 1.11
UPDATE `item_template` 
    SET `patch` = 9 
    WHERE `entry` IN (19823, 19824, 19826, 19827, 19829, 19830, 
                      19832, 19833, 19835, 19836, 19839, 19840, 
                      19842, 19843, 19845, 19846, 19848, 19849);

-- Pull items out into a temp table, change patch and stats, insert back into item_template
DROP TABLE IF EXISTS `zg_set`;
CREATE TEMPORARY TABLE `zg_set` LIKE `item_template`;
INSERT INTO `zg_set` (
    SELECT * FROM `item_template` 
        WHERE `entry` IN (19823, 19824, 19826, 19827, 19829, 19830, 
                          19832, 19833, 19835, 19836, 19839, 19840, 
                          19842, 19843, 19845, 19846, 19848, 19849));
UPDATE `zg_set` SET `patch` = 5, `quality` = 3; -- Blue (Superior) items in 1.7-1.10

INSERT INTO `zg_set` (entry, patch, stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, 
        stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6, armor,
        spellid_1, spelltrigger_1, spellid_2, spelltrigger_2, spellid_3, spelltrigger_3)
    VALUES 
        (19823, 5, 4, 18, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 397, 7597, 1, 0, 0, 0, 0), -- Warrior Belt
        (19824, 5, 4, 12, 7, 11, 3, 11, 0, 0, 0, 0, 0, 0, 309, 0, 0, 0, 0, 0, 0), -- Warrior Bracers
        (19826, 5, 4, 13, 5, 9, 7, 13, 3, 8, 0, 0, 0, 0, 397, 9408, 1, 0, 0, 0, 0), -- Paladin Belt
        (19827, 5, 5, 9, 7, 12, 4, 11, 3, 5, 0, 0, 0, 0, 309, 0, 0, 0, 0, 0, 0), -- Paladin Bracers
        (19829, 5, 5, 21, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 224, 9417, 1, 0, 0, 0, 0), -- Shaman Belt
        (19830, 5, 7, 12, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 174, 9342, 1, 0, 0, 0, 0), -- Shaman Bracers
        (19832, 5, 5, 12, 3, 18, 7, 12, 6, 7, 0, 0, 0, 0, 224, 13597, 1, 0, 0, 0, 0), -- Hunter Belt
        (19833, 5, 5, 7, 7, 10, 6, 6, 0, 0, 0, 0, 0, 0, 174, 13599, 1, 21434, 1, 0, 0), -- Hunter Bracers
        (19835, 5, 3, 20, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 141, 15464, 1, 0, 0, 0, 0), -- Rogue Shoulders
        (19836, 5, 7, 12, 3, 14, 4, 7, 0, 0, 0, 0, 0, 0, 82, 0, 0, 0, 0, 0, 0), -- Rogue Bracers
        (19839, 5, 5, 21, 6, 12, 7, 10, 0, 0, 0, 0, 0, 0, 166, 0, 0, 0, 0, 0, 0), -- Druid Belt
        (19840, 5, 5, 10, 6, 10, 7, 7, 0, 0, 0, 0, 0, 0, 122, 9408, 1, 0, 0, 0, 0), -- Druid Bracers
        (19842, 5, 5, 20, 7, 10, 6, 10, 0, 0, 0, 0, 0, 0, 54, 9314, 1, 0, 0, 0, 0), -- Priest Belt
        (19843, 5, 5, 10, 6, 10, 7, 9, 0, 0, 0, 0, 0, 0, 42, 9408, 1, 0, 0, 0, 0), -- Priest Bracers
        (19845, 5, 5, 21, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 72, 9417, 1, 0, 0, 0, 0), -- Mage Shoulders
        (19846, 5, 5, 11, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 42, 9343, 1, 0, 0, 0, 0), -- Mage Bracers
        (19848, 5, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 9345, 1, 0, 0, 0, 0), -- Warlock Bracers
        (19849, 5, 7, 21, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 72, 9417, 1, 0, 0, 0, 0) -- Warlock Shoulders
    ON DUPLICATE KEY UPDATE
        stat_type1 = VALUES(stat_type1), stat_value1 = VALUES(stat_value1), stat_type2 = VALUES(stat_type2), stat_value2 = VALUES(stat_value2),
        stat_type3 = VALUES(stat_type3), stat_value3 = VALUES(stat_value3), stat_type4 = VALUES(stat_type4), stat_value4 = VALUES(stat_value4),
        stat_type5 = VALUES(stat_type5), stat_value5 = VALUES(stat_value5), stat_type6 = VALUES(stat_type6), stat_value6 = VALUES(stat_value6),
        armor = VALUES(armor),
        spellid_1 = VALUES(spellid_1), spelltrigger_1 = VALUES(spelltrigger_1), 
        spellid_2 = VALUES(spellid_2), spelltrigger_2 = VALUES(spelltrigger_2),
        spellid_3 = VALUES(spellid_3), spelltrigger_3 = VALUES(spelltrigger_3);


INSERT INTO `item_template` (SELECT * FROM `zg_set`);

DROP TABLE `zg_set`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
