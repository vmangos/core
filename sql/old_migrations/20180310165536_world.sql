DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180310165536');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180310165536');
-- Add your query below.


-- Harm Prevention Belt: Backfire effect
REPLACE INTO `spell_effect_mod` VALUES (13234, 1, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 0, -1, 42, -1, 0, 13235, 'Harm Prevention Belt: Backfire effect');

-- Rogue T3 set 4 family masks
UPDATE `spell_proc_event` SET `SpellFamilyMask0`=33554438, `SpellFamilyName`=8 WHERE `entry`=28812;

-- Elune Stone
-- https://github.com/LightsHope/issues/issues/89
UPDATE `creature_template` SET `unit_flags`=33554434 WHERE `entry`=15631;

-- Plagued Gargoyle
-- https://github.com/LightsHope/issues/issues/101
UPDATE `creature_template` SET `type`=6 WHERE `entry`=16446;

-- Ogre Warbead drop rate
-- https://github.com/LightsHope/issues/issues/92
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-5 WHERE `entry` in (11442,11440,11443) AND `item`=21982;

-- Dolanaar mobs
-- https://github.com/LightsHope/issues/issues/42
DELETE FROM `creature` WHERE `guid` in (166280,166281,166282);

-- Narain's Scrying Goggles adjust drop chance
-- https://github.com/LightsHope/issues/issues/93
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-1 WHERE `item`=20951;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-1 WHERE `item`=20951;



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
