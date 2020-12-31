DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190430151640');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190430151640');
-- Add your query below.


-- Enchant pool 7% -> enchants = ~1% each (rather than 0.1%)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 7 WHERE `item` = 30411 AND `minCountOrRef` < 0;
-- Ref to a ref of enchant pool, wtf?
DELETE FROM `creature_loot_template` WHERE `item` IN (30418, 30414) AND `minCountOrRef` < 0;
DELETE FROM `reference_loot_template` WHERE `entry` IN (30418, 30414);

-- --------------
-- Sartura (15516)
-- --------------
-- Should potentially have Ring of Qiraji Fury in pool 30444 (or a separate, shared pool?)

-- Fankriss (15510)

-- Viscidus (15299)
-- Should potentially drop Recomposed Boots

-- Huhuran (15509)

-- Vek'nilash (15275)
-- Enchant Gloves: Threat 6.5%
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 6.5 WHERE `item` = 20726 AND `entry` = 15275;
-- Shouldn't have the global enchant pool
DELETE FROM `creature_loot_template` WHERE `item` = 30411 AND `entry` = 15275;

-- Vek'lor (15276)
-- Enchant Cloak: Subtlety 6.5
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 6.5 WHERE `item` = 20735 AND `entry` = 15276;
-- Also shouldn't have the global enchant pool
DELETE FROM `creature_loot_template` WHERE `item` = 30411 AND `entry` = 15276;

-- Ouro (15517)

-- C'Thun (15727)
-- Vanquished Tentacle 15%
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 15 WHERE `item` = 21579 AND `entry` = 15727;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
