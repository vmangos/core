DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240926142033');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240926142033');
-- Add your query below.


-- Make the column which holds the spell class mask for effects be uint64.
ALTER TABLE `spell_template`
	CHANGE COLUMN `effectItemType1` `effectItemType1` BIGINT UNSIGNED NOT NULL DEFAULT '0' AFTER `effectChainTarget3`,
	CHANGE COLUMN `effectItemType2` `effectItemType2` BIGINT UNSIGNED NOT NULL DEFAULT '0' AFTER `effectItemType1`,
	CHANGE COLUMN `effectItemType3` `effectItemType3` BIGINT UNSIGNED NOT NULL DEFAULT '0' AFTER `effectItemType2`;

-- Transfer spell class masks from spell_affect table to spell_template.
UPDATE `spell_template` T1, `spell_affect` T2 SET T1.`effectItemType1` = T2.`SpellFamilyMask` WHERE (T1.`entry` = T2.`entry`) && (T1.`build` BETWEEN T2.`build_min` AND T2.`build_max`) && (T2.`effectId` = 0);
UPDATE `spell_template` T1, `spell_affect` T2 SET T1.`effectItemType2` = T2.`SpellFamilyMask` WHERE (T1.`entry` = T2.`entry`) && (T1.`build` BETWEEN T2.`build_min` AND T2.`build_max`) && (T2.`effectId` = 1);
UPDATE `spell_template` T1, `spell_affect` T2 SET T1.`effectItemType3` = T2.`SpellFamilyMask` WHERE (T1.`entry` = T2.`entry`) && (T1.`build` BETWEEN T2.`build_min` AND T2.`build_max`) && (T2.`effectId` = 2);

-- Get rid of no longer needed separate table.
DROP TABLE `spell_affect`;

-- Change the mod table to use int64 as well.
ALTER TABLE `spell_effect_mod`
	CHANGE COLUMN `EffectItemType` `EffectItemType` BIGINT NOT NULL DEFAULT '-1' AFTER `EffectApplyAuraName`;

-- Correct spell class masks for effects in cases where its missing in vanilla Spell.dbc but present in classic SpellEffect.db2.
UPDATE `spell_template` SET `effectItemType1`=14684919 WHERE `entry`=15059 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=2233056; -- Arcane Instability
UPDATE `spell_template` SET `effectItemType1`=14684919 WHERE `entry`=15058 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=2233056; -- Arcane Instability
UPDATE `spell_template` SET `effectItemType1`=14684919 WHERE `entry`=15060 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=2233056; -- Arcane Instability
UPDATE `spell_template` SET `effectItemType1`=14684919 WHERE `entry`=12042 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=551557879; -- Arcane Power
UPDATE `spell_template` SET `effectItemType1`=176162304 WHERE `entry`=20104 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=176161280; -- Benediction
UPDATE `spell_template` SET `effectItemType1`=176162304 WHERE `entry`=20101 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=176161280; -- Benediction
UPDATE `spell_template` SET `effectItemType1`=176162304 WHERE `entry`=20102 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=176161280; -- Benediction
UPDATE `spell_template` SET `effectItemType1`=176162304 WHERE `entry`=20103 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=176161280; -- Benediction
UPDATE `spell_template` SET `effectItemType1`=176162304 WHERE `entry`=20105 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=176161280; -- Benediction
UPDATE `spell_template` SET `effectItemType1`=4194325 WHERE `entry`=12351 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=12714007; -- Burning Soul
UPDATE `spell_template` SET `effectItemType1`=4194325 WHERE `entry`=11083 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=12714007; -- Burning Soul
UPDATE `spell_template` SET `effectItemType1`=4096 WHERE `entry`=28787 && `effect1`=6 && `effectApplyAuraName1`=109 && `effectItemType1`=8589934592; -- Cleanse
UPDATE `spell_template` SET `effectItemType1`=12589815 WHERE `entry`=12536 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=549460727; -- Clearcasting
UPDATE `spell_template` SET `effectItemType1`=12900875263 WHERE `entry`=16870 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=4512331310824191; -- Clearcasting
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=28682 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=4194327; -- Combustion
UPDATE `spell_template` SET `effectItemType1`=11813318656 WHERE `entry`=29197 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=0; -- Corrupted Mind
UPDATE `spell_template` SET `effectItemType1`=34359738816 WHERE `entry`=29199 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=0; -- Corrupted Mind
UPDATE `spell_template` SET `effectItemType1`=4450426437 WHERE `entry`=29184 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=0; -- Corrupted Mind
UPDATE `spell_template` SET `effectItemType1`=25769804016 WHERE `entry`=29195 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=0; -- Corrupted Mind
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=11115 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=146931735; -- Critical Mass
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=11367 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=146931735; -- Critical Mass
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=11369 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=146931735; -- Critical Mass
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=11370 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=146931735; -- Critical Mass
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=11368 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=146931735; -- Critical Mass
UPDATE `spell_template` SET `effectItemType1`=8388608 WHERE `entry`=29588 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=0; -- Defensive Tactics
UPDATE `spell_template` SET `effectItemType1`=8388608 WHERE `entry`=29589 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=0; -- Defensive Tactics
UPDATE `spell_template` SET `effectItemType1`=8388608 WHERE `entry`=29559 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=0; -- Defensive Tactics
UPDATE `spell_template` SET `effectItemType1`=3509583875 WHERE `entry`=16089 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=20723008519; -- Elemental Fury
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=12399 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=146931735; -- Fire Power
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=12400 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=146931735; -- Fire Power
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=11124 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=146931735; -- Fire Power
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=12378 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=146931735; -- Fire Power
UPDATE `spell_template` SET `effectItemType1`=12582935 WHERE `entry`=12398 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=146931735; -- Fire Power
UPDATE `spell_template` SET `effectItemType1`=6447219738 WHERE `entry`=18218 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=6447547418; -- Grim Reach
UPDATE `spell_template` SET `effectItemType1`=6447219738 WHERE `entry`=18219 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=6447547418; -- Grim Reach
UPDATE `spell_template` SET `effectItemType1`=12288 WHERE `entry`=26118 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=67108864; -- Implements of Unspoken Names Pet Bonus
UPDATE `spell_template` SET `effectItemType1`=37448586264 WHERE `entry`=30814 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=2954368024; -- Mental Quickness
UPDATE `spell_template` SET `effectItemType1`=37448586264 WHERE `entry`=30812 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=2954368024; -- Mental Quickness
UPDATE `spell_template` SET `effectItemType1`=37448586264 WHERE `entry`=30813 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=2954368024; -- Mental Quickness
UPDATE `spell_template` SET `effectItemType1`=151264832 WHERE `entry`=28808 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=17465351744; -- Reduced Threat
UPDATE `spell_template` SET `effectItemType1`=33685510 WHERE `entry`=28811 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=8388608; -- Reduced Threat
UPDATE `spell_template` SET `effectItemType1`=64 WHERE `entry`=28744 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=0; -- Regrowth
UPDATE `spell_template` SET `effectItemType1`=16 WHERE `entry`=28716 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=0; -- Rejuvenation
UPDATE `spell_template` SET `effectItemType1`=145 WHERE `entry`=18271 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType1`=145 WHERE `entry`=18272 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType1`=145 WHERE `entry`=18275 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType1`=145 WHERE `entry`=18274 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType1`=145 WHERE `entry`=18273 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType1`=15208471 WHERE `entry`=11170 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=1090394871; -- Shatter
UPDATE `spell_template` SET `effectItemType1`=15208471 WHERE `entry`=12985 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=1090394871; -- Shatter
UPDATE `spell_template` SET `effectItemType1`=15208471 WHERE `entry`=12982 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=1090394871; -- Shatter
UPDATE `spell_template` SET `effectItemType1`=15208471 WHERE `entry`=12983 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=1090394871; -- Shatter
UPDATE `spell_template` SET `effectItemType1`=15208471 WHERE `entry`=12984 && `effect1`=6 && `effectApplyAuraName1`=112 && `effectItemType1`=1090394871; -- Shatter
UPDATE `spell_template` SET `effectItemType1`=6447219738 WHERE `entry`=18174 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=6447531034; -- Suppression
UPDATE `spell_template` SET `effectItemType1`=6447219738 WHERE `entry`=18175 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=6447531034; -- Suppression
UPDATE `spell_template` SET `effectItemType1`=6447219738 WHERE `entry`=18177 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=6447531034; -- Suppression
UPDATE `spell_template` SET `effectItemType1`=6447219738 WHERE `entry`=18176 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=6447531034; -- Suppression
UPDATE `spell_template` SET `effectItemType1`=6447219738 WHERE `entry`=18178 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=6447531034; -- Suppression
UPDATE `spell_template` SET `effectItemType1`=537399320 WHERE `entry`=28818 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=537395200; -- Totemic Energy
UPDATE `spell_template` SET `effectItemType1`=67624960 WHERE `entry`=16189 && `effect1`=6 && `effectApplyAuraName1`=107 && `effectItemType1`=67362816; -- Totemic Mastery
UPDATE `spell_template` SET `effectItemType1`=73728 WHERE `entry`=16515 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=34359861248; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType1`=73728 WHERE `entry`=16719 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=34359861248; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType1`=8192 WHERE `entry`=16513 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=34359861248; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType1`=73728 WHERE `entry`=16720 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=34359861248; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType1`=73728 WHERE `entry`=16514 && `effect1`=6 && `effectApplyAuraName1`=108 && `effectItemType1`=34359861248; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType2`=12589815 WHERE `entry`=12042 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=551557879; -- Arcane Power
UPDATE `spell_template` SET `effectItemType2`=12288 WHERE `entry`=20575 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=67108864; -- Command
UPDATE `spell_template` SET `effectItemType2`=100 WHERE `entry`=17955 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=824633725796; -- Emberstorm
UPDATE `spell_template` SET `effectItemType2`=100 WHERE `entry`=17954 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=824633725796; -- Emberstorm
UPDATE `spell_template` SET `effectItemType2`=100 WHERE `entry`=17957 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=824633725796; -- Emberstorm 
UPDATE `spell_template` SET `effectItemType2`=100 WHERE `entry`=17956 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=824633725796; -- Emberstorm 
UPDATE `spell_template` SET `effectItemType2`=100 WHERE `entry`=17958 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=824633725796; -- Emberstorm 
UPDATE `spell_template` SET `effectItemType2`=0 WHERE `entry`=21942 && `effect2`=6 && `effectApplyAuraName2`=107 && `effectItemType2`=134217728; -- Hunter Giant Stalker
UPDATE `spell_template` SET `effectItemType2`=3221225472 WHERE `entry`=20215 && `effect2`=6 && `effectApplyAuraName2`=112 && `effectItemType2`=0; -- Illumination
UPDATE `spell_template` SET `effectItemType2`=3221225472 WHERE `entry`=20210 && `effect2`=6 && `effectApplyAuraName2`=112 && `effectItemType2`=0; -- Illumination
UPDATE `spell_template` SET `effectItemType2`=3221225472 WHERE `entry`=20212 && `effect2`=6 && `effectApplyAuraName2`=112 && `effectItemType2`=0; -- Illumination
UPDATE `spell_template` SET `effectItemType2`=3221225472 WHERE `entry`=20213 && `effect2`=6 && `effectApplyAuraName2`=112 && `effectItemType2`=0; -- Illumination
UPDATE `spell_template` SET `effectItemType2`=3221225472 WHERE `entry`=20214 && `effect2`=6 && `effectApplyAuraName2`=112 && `effectItemType2`=0; -- Illumination
UPDATE `spell_template` SET `effectItemType2`=17179869184 WHERE `entry`=29192 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=2097152; -- Improved Weapon Totems
UPDATE `spell_template` SET `effectItemType2`=17179869184 WHERE `entry`=29193 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=2097152; -- Improved Weapon Totems
UPDATE `spell_template` SET `effectItemType2`=4294968326 WHERE `entry`=28746 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=66566; -- Plagueheart
UPDATE `spell_template` SET `effectItemType2`=1048576 WHERE `entry`=14909 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=1048704; -- Searing Light
UPDATE `spell_template` SET `effectItemType2`=1048576 WHERE `entry`=15017 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=1048704; -- Searing Light
UPDATE `spell_template` SET `effectItemType2`=65536 WHERE `entry`=16515 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=122880; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType2`=65536 WHERE `entry`=16719 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=122880; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType2`=65536 WHERE `entry`=16513 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=122880; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType2`=65536 WHERE `entry`=16720 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=122880; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType2`=65536 WHERE `entry`=16514 && `effect2`=6 && `effectApplyAuraName2`=108 && `effectItemType2`=122880; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType3`=4194437 WHERE `entry`=12042 && `effect3`=6 && `effectApplyAuraName3`=108 && `effectItemType3`=551557879; -- Arcane Power
UPDATE `spell_template` SET `effectItemType3`=4295509000 WHERE `entry`=18271 && `effect3`=6 && `effectApplyAuraName3`=108 && `effectItemType3`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType3`=4295509000 WHERE `entry`=18272 && `effect3`=6 && `effectApplyAuraName3`=108 && `effectItemType3`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType3`=4295509000 WHERE `entry`=18275 && `effect3`=6 && `effectApplyAuraName3`=108 && `effectItemType3`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType3`=4295509000 WHERE `entry`=18274 && `effect3`=6 && `effectApplyAuraName3`=108 && `effectItemType3`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType3`=4295509000 WHERE `entry`=18273 && `effect3`=6 && `effectApplyAuraName3`=108 && `effectItemType3`=0; -- Shadow Mastery
UPDATE `spell_template` SET `effectItemType3`=268550144 WHERE `entry`=16515 && `effect3`=6 && `effectApplyAuraName3`=107 && `effectItemType3`=122880; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType3`=268550144 WHERE `entry`=16719 && `effect3`=6 && `effectApplyAuraName3`=107 && `effectItemType3`=122880; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType3`=268550144 WHERE `entry`=16513 && `effect3`=6 && `effectApplyAuraName3`=107 && `effectItemType3`=122880; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType3`=268550144 WHERE `entry`=16720 && `effect3`=6 && `effectApplyAuraName3`=107 && `effectItemType3`=122880; -- Vile Poisons
UPDATE `spell_template` SET `effectItemType3`=268550144 WHERE `entry`=16514 && `effect3`=6 && `effectApplyAuraName3`=107 && `effectItemType3`=122880; -- Vile Poisons


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
