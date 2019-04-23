DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181119025556');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181119025556');
-- Add your query below.


-- In older clients the xp bar is shown even on max level, and sending 0 bugs out the entire interface.
-- Correct required xp value for level 60 from retail video https://youtu.be/TW9wP0J--BM?t=4981
INSERT INTO `player_xp_for_level` (`lvl`, `xp_for_next_level`) VALUES (60, 217400);

-- Gameobjects added in 1.10.
UPDATE `gameobject_template` SET `patch`=8 WHERE `patch` < 8 && `entry` IN (181063, 181066, 181064, 181062, 181071, 181072, 181029, 180524, 181068, 181069, 300059, 300060, 300061, 300062, 300063, 300064, 300065);
UPDATE `gameobject` SET `patch_min`=8 WHERE `patch_min` < 8 && `id` IN (181063, 181066, 181064, 181062, 181071, 181072, 181029, 180524, 181068, 181069, 300059, 300060, 300061, 300062, 300063, 300064, 300065);
UPDATE `gameobject_loot_template` SET `patch_min`=8 WHERE `patch_min` < 8 && `entry` IN (17883, 17884);
UPDATE `reference_loot_template` SET `patch_min`=8 WHERE `patch_min` < 8 && `entry` IN (30004, 30005);

-- Non existing or different spells.
UPDATE `spell_chain` SET `build_min`=5302 WHERE `spell_id` IN (724, 27681, 27685, 27799, 27800, 27801, 27841, 27870, 27871);
ALTER TABLE `spell_elixir`
	ADD COLUMN `build_min` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Minimum game client build to load this entry' AFTER `mask`,
	ADD COLUMN `build_max` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '5875' COMMENT 'Maximum game client build to load this entry' AFTER `build_min`;
UPDATE `spell_elixir` SET `build_min`=5302 WHERE `entry` IN (26276, 27652, 27653);
UPDATE `spell_proc_event` SET `build_min`=5302 WHERE `entry` IN (27419, 27498, 27787, 27811);
UPDATE `spell_bonus_data` SET `build_min`=5302 WHERE `entry` IN (27779, 27803, 27804, 27805, 27860);
ALTER TABLE `spell_threat`
	ADD COLUMN `build_min` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Minimum game client build to load this entry' AFTER `ap_bonus`,
	ADD COLUMN `build_max` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '5875' COMMENT 'Maximum game client build to load this entry' AFTER `build_min`;
UPDATE `spell_threat` SET `build_min`=5302 WHERE `entry` IN (24640, 27648);
ALTER TABLE `playercreateinfo_spell`
	CHANGE COLUMN `Spell` `spell` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `class`,
	ADD COLUMN `build_min` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Minimum game client build to load this entry' AFTER `spell`,
	ADD COLUMN `build_max` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '5875' COMMENT 'Maximum game client build to load this entry' AFTER `build_min`,
	CHANGE COLUMN `Note` `note` VARCHAR(255) NULL DEFAULT NULL AFTER `build_max`;
UPDATE `playercreateinfo_spell` SET `build_min`=5302 WHERE `spell` IN (27762, 27763, 27764);
UPDATE `spell_group` SET `build_min`=5302 WHERE `spell_id` IN (26276, 27841, 27681);
UPDATE `spell_affect` SET `build_min`=5302 WHERE `entry` IN (14909, 15017);

-- Some spells have broken proc flags (zero or negative value). Maybe an error in extraction.
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (6866, 4436, 'Moss Covered Hands');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (9452, 20, 'Vindication');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (26016, 20, 'Vindication');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (26021, 20, 'Vindication');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (9799, 131072, 'Eye for an Eye');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (11119, 65536, 'Ignite');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (15286, 655360, 'Vampiric Embrace');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (20911, 40, 'Blessing of Sanctuary');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (25899, 40, 'Greater Blessing of Sanctuary');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (26107, 16, 'Symbols of Unending Life Finisher Bonus');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (26119, 65536, 'Stormcaller Spelldamage Bonus');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (26128, 65536, 'Enigma Resist Bonus');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (26480, 340, 'Badge of the Swarmguard');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (20375, 4, 'Seal of Command');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (20915, 4, 'Seal of Command');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (20918, 4, 'Seal of Command');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (20919, 4, 'Seal of Command');
INSERT INTO `spell_mod` (`Id`, `procFlags`, `Comment`) VALUES (20920, 4, 'Seal of Command');
UPDATE `spell_mod` SET `procFlags` = 65536 WHERE `Id` = 22007;
UPDATE `spell_mod` SET `procFlags` = 20 WHERE `Id` = 27656;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=109;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=114;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=168;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=324;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=325;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=409;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=410;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=411;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=503;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=637;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=646;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=648;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=742;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=821;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=863;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=905;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=945;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=1028;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=1034;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=1048;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=1120;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=1126;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=1181;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=1182;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=1183;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=1455;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=1456;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=1457;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=1492;
UPDATE `spell_template` SET `procFlags`=256 WHERE `build`=5086 && `ID`=1707;
UPDATE `spell_template` SET `procFlags`=1139 WHERE `build`=5086 && `ID`=2095;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=2351;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=2353;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=2354;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=2564;
UPDATE `spell_template` SET `procFlags`=66 WHERE `build`=5086 && `ID`=2565;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=2566;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=2616;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=2617;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=2645;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=2652;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=2689;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=2849;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=2852;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=2880;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3029;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=3169;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3232;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=3235;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=3284;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=3338;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3394;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3417;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=3418;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3424;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=3436;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=3439;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3440;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3509;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3512;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3582;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=3616;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=3637;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=4051;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=4064;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=4065;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=4066;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=4067;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=4068;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=4069;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4070;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4071;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4112;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4113;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4114;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4115;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4133;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4136;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4138;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4140;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=4142;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4144;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4161;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4241;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4242;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4245;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4279;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4283;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4284;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=4312;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4315;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4317;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4387;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4388;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4389;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4390;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4493;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4494;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4495;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=4496;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4512;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=4517;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=4518;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=4519;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4525;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4932;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=4951;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5104;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=5118;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5201;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5202;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=5205;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=5232;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=5234;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5262;
UPDATE `spell_template` SET `procFlags`=112 WHERE `build`=5086 && `ID`=5301;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5341;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5342;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5343;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5344;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5345;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5346;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5349;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5350;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5351;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5352;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5353;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5354;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=5364;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=5368;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=5369;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=5370;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5377;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=5388;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5427;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5429;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5430;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5431;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5432;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5433;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5513;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5549;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5550;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5551;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5552;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5553;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5554;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5575;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5580;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5638;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5639;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5640;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5641;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5642;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5643;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5680;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=5694;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=5707;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=5718;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=5719;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5751;
UPDATE `spell_template` SET `procFlags`=2049 WHERE `build`=5086 && `ID`=5752;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5753;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5754;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5755;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=5756;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=5811;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5976;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5977;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=5979;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=6058;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=6134;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=6135;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=6260;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=6261;
UPDATE `spell_template` SET `procFlags`=129 WHERE `build`=5086 && `ID`=6268;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=6373;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=6374;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=6433;
UPDATE `spell_template` SET `procFlags`=1138 WHERE `build`=5086 && `ID`=6592;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6593;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6645;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=6727;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6750;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6752;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=6756;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6867;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6871;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6909;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6921;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6923;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6947;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=6961;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7095;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7098;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7102;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7103;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7137;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=7154;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=7198;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=7200;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7276;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=7288;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=7291;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7300;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7301;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7302;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7320;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=7331;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7371;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7383;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7445;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7446;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7486;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7601;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7614;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7615;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7616;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=7617;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7618;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=7619;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7711;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7721;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7722;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7723;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7724;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7725;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7726;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7806;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7807;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=7808;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=7822;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=7824;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7849;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=7967;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=7999;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=8134;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=8224;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=8233;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=8236;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=8247;
UPDATE `spell_template` SET `procFlags`=129 WHERE `build`=5086 && `ID`=8260;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=8288;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=8289;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=8397;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=8516;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=8601;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=8612;
UPDATE `spell_template` SET `procFlags`=1026 WHERE `build`=5086 && `ID`=8788;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=8852;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=8876;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=8907;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=8981;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=9084;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=9160;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=9205;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=9233;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=9276;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=9460;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=9463;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=9778;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=9782;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=9784;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=9793;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=9797;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=9801;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=9808;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=9849;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=9850;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=9884;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=9885;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=10022;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=10092;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=10095;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=10219;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=10220;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=10400;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=10431;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=10432;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=10484;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=10608;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=10610;
UPDATE `spell_template` SET `procFlags`=1026 WHERE `build`=5086 && `ID`=10727;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=10868;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=11103;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=11129;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=11213;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=11255;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=11371;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=11441;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=11675;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=11687;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=11688;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=11689;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=11830;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=11838;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=11919;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=11959;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=11961;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=11964;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=11984;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=12002;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12038;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=12043;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12094;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=12099;
UPDATE `spell_template` SET `procFlags`=66 WHERE `build`=5086 && `ID`=12169;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=12246;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12254;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12281;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12284;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12289;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=12292;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=12298;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12311;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=12317;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=12319;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12322;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12331;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12357;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12358;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12359;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12360;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=12421;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=12529;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=12536;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12539;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=12543;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=12544;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12546;
UPDATE `spell_template` SET `procFlags`=1026 WHERE `build`=5086 && `ID`=12550;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12552;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=12556;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=12562;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12574;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12575;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12576;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12577;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12598;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12668;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12701;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12702;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12703;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12704;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=12724;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=12725;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=12726;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=12727;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=12782;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12787;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12797;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12799;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12800;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12812;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12813;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12814;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12815;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=12834;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=12849;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=12867;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=12880;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12947;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=12958;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12964;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=12966;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=12967;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=12968;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=12969;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=12970;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=12971;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=12972;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=12973;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=12974;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=12999;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13000;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13001;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13002;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=13045;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=13046;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=13047;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=13048;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=13078;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=13159;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=13165;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=13260;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13299;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=13320;
UPDATE `spell_template` SET `procFlags`=16 WHERE `build`=5086 && `ID`=13358;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=13483;
UPDATE `spell_template` SET `procFlags`=1026 WHERE `build`=5086 && `ID`=13585;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13616;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13709;
UPDATE `spell_template` SET `procFlags`=1026 WHERE `build`=5086 && `ID`=13716;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=13754;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13767;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13800;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13801;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13802;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13803;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=13808;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=13867;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=13877;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=13879;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13886;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=13959;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13960;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13961;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13962;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13963;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=13964;
UPDATE `spell_template` SET `procFlags`=16 WHERE `build`=5086 && `ID`=13983;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=13987;
UPDATE `spell_template` SET `procFlags`=16 WHERE `build`=5086 && `ID`=14070;
UPDATE `spell_template` SET `procFlags`=16 WHERE `build`=5086 && `ID`=14071;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=14108;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=14111;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=14133;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=14143;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=14144;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=14148;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=14149;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=14150;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=14151;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=14152;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=14153;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=14154;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=14155;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=14156;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=14160;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=14161;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=14177;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=14178;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=14186;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=14190;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=14193;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=14194;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=14195;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=14201;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=14202;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=14203;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=14204;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=14318;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=14319;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=14320;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=14321;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=14322;
UPDATE `spell_template` SET `procFlags`=8192 WHERE `build`=5086 && `ID`=14531;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=14751;
UPDATE `spell_template` SET `procFlags`=8192 WHERE `build`=5086 && `ID`=14774;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=14796;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=14869;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=14870;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=14892;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=14898;
UPDATE `spell_template` SET `procFlags`=8192 WHERE `build`=5086 && `ID`=15061;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=15088;
UPDATE `spell_template` SET `procFlags`=8192 WHERE `build`=5086 && `ID`=15097;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=15128;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=15268;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=15270;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15277;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=15323;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=15324;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=15325;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=15326;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=15335;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=15336;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=15337;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=15338;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15346;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=15349;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=15354;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=15355;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=15356;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=15362;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=15363;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=15364;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=15365;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=15366;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15506;
UPDATE `spell_template` SET `procFlags`=1026 WHERE `build`=5086 && `ID`=15507;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15567;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15568;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15569;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15573;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=15594;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15599;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15600;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=15603;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15636;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15641;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=15644;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15650;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15730;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15733;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=15784;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15849;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15852;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=15876;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=15978;
UPDATE `spell_template` SET `procFlags`=32 WHERE `build`=5086 && `ID`=16092;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=16140;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16142;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=16146;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=16164;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=16166;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16176;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16177;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=16188;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16235;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16236;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16237;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16238;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16239;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16240;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16241;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16242;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=16246;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16247;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16256;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=16257;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=16277;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=16278;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=16279;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=16280;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16281;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16282;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16283;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16284;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16311;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16312;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16313;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=16361;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=16423;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16428;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=16487;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=16489;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=16492;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=16511;
UPDATE `spell_template` SET `procFlags`=8192 WHERE `build`=5086 && `ID`=16550;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16563;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16574;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16575;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=16610;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=16611;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16615;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=16620;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=16624;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=16689;
UPDATE `spell_template` SET `procFlags`=8192 WHERE `build`=5086 && `ID`=16792;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=16793;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16800;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=16810;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=16811;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=16812;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=16813;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=16837;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16843;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=16850;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16864;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=16870;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=16878;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16880;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=16886;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=16923;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=16924;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=16925;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=16926;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16952;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16954;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16955;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16956;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=16957;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=16958;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=16961;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=16962;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=16963;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=16964;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=16982;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=17000;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=17001;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=17010;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=17079;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=17082;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=17116;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=17154;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=17329;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=17332;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=17347;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=17348;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=17350;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=17364;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=17495;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=17670;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=17687;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=17688;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=17690;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=17793;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=17794;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=17796;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=17797;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=17798;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=17799;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=17800;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=17801;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=17802;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=17803;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=17941;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=18073;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=18096;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=18097;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=18100;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=18119;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=18120;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=18121;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=18122;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=18123;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=18137;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=18146;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=18152;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=18167;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=18186;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=18189;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=18288;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=18542;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=18634;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=18708;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=18765;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=18799;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=18800;
UPDATE `spell_template` SET `procFlags`=256 WHERE `build`=5086 && `ID`=18803;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=18815;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=18816;
UPDATE `spell_template` SET `procFlags`=256 WHERE `build`=5086 && `ID`=18820;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=18847;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=18907;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=18943;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=18979;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=18983;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19184;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19194;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19195;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19228;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19232;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19233;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19234;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19235;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19261;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19262;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19264;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19265;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19266;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=19308;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=19309;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=19310;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=19311;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=19312;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19362;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19387;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19388;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19389;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19390;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19396;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19407;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=19409;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19412;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19413;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19414;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=19415;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=19449;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=19478;
UPDATE `spell_template` SET `procFlags`=1026 WHERE `build`=5086 && `ID`=19514;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19577;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19640;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=19655;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=19656;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=19660;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=19723;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=19769;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=19784;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19817;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=19818;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=20049;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=20056;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=20057;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=20058;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=20059;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20127;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=20128;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20130;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=20131;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=20132;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=20133;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=20134;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20135;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20136;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20137;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20154;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20163;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20164;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20165;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20166;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=20169;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20177;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20179;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20180;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20181;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=20182;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=20185;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=20186;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=20210;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=20212;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=20213;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=20214;
UPDATE `spell_template` SET `procFlags`=65536 WHERE `build`=5086 && `ID`=20215;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=20216;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=20230;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=20234;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=20235;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20287;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20288;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20289;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20290;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20291;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20292;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20293;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=20344;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=20345;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=20346;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20347;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20348;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20349;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=20354;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=20355;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20356;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20357;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20375;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20419;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20421;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20422;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20423;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=20500;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=20501;
UPDATE `spell_template` SET `procFlags`=1026 WHERE `build`=5086 && `ID`=20545;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20563;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=20577;
UPDATE `spell_template` SET `procFlags`=8192 WHERE `build`=5086 && `ID`=20705;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=20725;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=20784;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20809;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20810;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=20847;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20884;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=20891;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20896;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20915;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20918;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20919;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=20920;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=20925;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=20927;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=20928;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=21053;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=21054;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=21061;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=21080;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=21084;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=21091;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=21163;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=21185;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=21187;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=21228;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=21229;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=21230;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=21247;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=21329;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=21334;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=21387;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=21645;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=21747;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=21788;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=21789;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=21838;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=21841;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=21849;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=21850;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=21853;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=21879;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=21882;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=21887;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=21890;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=21897;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=21911;
UPDATE `spell_template` SET `procFlags`=32768 WHERE `build`=5086 && `ID`=21959;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=21969;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=21972;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=21977;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=22283;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=22285;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=22286;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=22287;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=22288;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=22413;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=22438;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=22583;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=22584;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=22585;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=22618;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=22620;
UPDATE `spell_template` SET `procFlags`=4096 WHERE `build`=5086 && `ID`=22648;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=22716;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=22817;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=22818;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=22820;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=22835;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=22857;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=23158;
UPDATE `spell_template` SET `procFlags`=69632 WHERE `build`=5086 && `ID`=23255;
UPDATE `spell_template` SET `procFlags`=8192 WHERE `build`=5086 && `ID`=23301;
UPDATE `spell_template` SET `procFlags`=8192 WHERE `build`=5086 && `ID`=23303;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=23305;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=23306;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=23340;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=23378;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=23394;
UPDATE `spell_template` SET `procFlags`=32 WHERE `build`=5086 && `ID`=23547;
UPDATE `spell_template` SET `procFlags`=64 WHERE `build`=5086 && `ID`=23548;
UPDATE `spell_template` SET `procFlags`=1049602 WHERE `build`=5086 && `ID`=23552;
UPDATE `spell_template` SET `procFlags`=524288 WHERE `build`=5086 && `ID`=23578;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23581;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23602;
UPDATE `spell_template` SET `procFlags`=256 WHERE `build`=5086 && `ID`=23684;
UPDATE `spell_template` SET `procFlags`=4 WHERE `build`=5086 && `ID`=23685;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23686;
UPDATE `spell_template` SET `procFlags`=256 WHERE `build`=5086 && `ID`=23688;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23689;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=23695;
UPDATE `spell_template` SET `procFlags`=131072 WHERE `build`=5086 && `ID`=23721;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23771;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=23780;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=23781;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23863;
UPDATE `spell_template` SET `procFlags`=129 WHERE `build`=5086 && `ID`=23867;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23885;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23886;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23887;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=23888;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=24051;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=24187;
UPDATE `spell_template` SET `procFlags`=524289 WHERE `build`=5086 && `ID`=24256;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=24353;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=24389;
UPDATE `spell_template` SET `procFlags`=3 WHERE `build`=5086 && `ID`=24450;
UPDATE `spell_template` SET `procFlags`=3 WHERE `build`=5086 && `ID`=24452;
UPDATE `spell_template` SET `procFlags`=3 WHERE `build`=5086 && `ID`=24453;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=24574;
UPDATE `spell_template` SET `procFlags`=524289 WHERE `build`=5086 && `ID`=24597;
UPDATE `spell_template` SET `procFlags`=524289 WHERE `build`=5086 && `ID`=24603;
UPDATE `spell_template` SET `procFlags`=524289 WHERE `build`=5086 && `ID`=24604;
UPDATE `spell_template` SET `procFlags`=524289 WHERE `build`=5086 && `ID`=24605;
UPDATE `spell_template` SET `procFlags`=256 WHERE `build`=5086 && `ID`=24658;
UPDATE `spell_template` SET `procFlags`=524289 WHERE `build`=5086 && `ID`=24661;
UPDATE `spell_template` SET `procFlags`=8 WHERE `build`=5086 && `ID`=24752;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=24779;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=24844;
UPDATE `spell_template` SET `procFlags`=32 WHERE `build`=5086 && `ID`=24949;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25008;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25009;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25010;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25011;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25012;
UPDATE `spell_template` SET `procFlags`=1026 WHERE `build`=5086 && `ID`=25020;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25023;
UPDATE `spell_template` SET `procFlags`=2048 WHERE `build`=5086 && `ID`=25050;
UPDATE `spell_template` SET `procFlags`=128 WHERE `build`=5086 && `ID`=25160;
UPDATE `spell_template` SET `procFlags`=16384 WHERE `build`=5086 && `ID`=25296;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25592;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25669;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25715;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25727;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25728;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25729;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25730;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25731;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25732;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25733;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=25734;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25751;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25752;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25753;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25757;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25758;
UPDATE `spell_template` SET `procFlags`=256 WHERE `build`=5086 && `ID`=25767;
UPDATE `spell_template` SET `procFlags`=256 WHERE `build`=5086 && `ID`=25906;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25942;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25943;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25944;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=25945;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=26177;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=26178;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=26179;
UPDATE `spell_template` SET `procFlags`=1 WHERE `build`=5086 && `ID`=26201;
UPDATE `spell_template` SET `procFlags`=270336 WHERE `build`=5086 && `ID`=26341;
UPDATE `spell_template` SET `procFlags`=1048578 WHERE `build`=5086 && `ID`=26463;
UPDATE `spell_template` SET `procFlags`=2 WHERE `build`=5086 && `ID`=27661;

-- Herbs Bag Family was added in 1.10.
DELETE FROM `item_template` WHERE `entry` IN (765, 785, 1401, 2447, 2449, 2450, 2452, 2453, 3355, 3356, 3357, 3358, 3369, 3818, 3819, 3820, 3821, 4625, 5056, 5168, 8153, 8831, 8836, 8838, 8839, 8845, 8846, 11022, 11040, 11514, 13463, 13464, 13465, 13466, 13467, 16205, 16208, 17034, 17035, 17037, 17038, 17760, 18297, 5013);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `description`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `delay`, `range_mod`, `ammo_type`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `block`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmrate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmrate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmrate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmrate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmrate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `duration`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `extra_flags`, `other_team_entry`) VALUES 
(765, 0, 7, 0, 'Silverleaf', '', 18088, 1, 0, 1, 40, 10, 0, -1, -1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(785, 0, 7, 0, 'Mageroyal', '', 7341, 1, 0, 1, 80, 20, 0, -1, -1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(1401, 0, 0, 0, 'Green Tea Leaf', '', 18088, 1, 0, 1, 56, 14, 0, -1, -1, 14, 4, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 833, 0, -1, 0, 0, 11, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(2447, 0, 7, 0, 'Peacebloom', '', 7396, 1, 0, 1, 40, 10, 0, -1, -1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(2449, 0, 7, 0, 'Earthroot', '', 1464, 1, 0, 1, 80, 20, 0, -1, -1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(2450, 0, 7, 0, 'Briarthorn', '', 7406, 1, 0, 1, 100, 25, 0, -1, -1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(2452, 0, 7, 0, 'Swiftthistle', '', 7241, 1, 0, 1, 60, 15, 0, -1, -1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(2453, 0, 7, 0, 'Bruiseweed', '', 7337, 1, 0, 1, 100, 25, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3355, 0, 7, 0, 'Wild Steelbloom', '', 6524, 1, 0, 1, 200, 50, 0, -1, -1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3356, 0, 7, 0, 'Kingsblood', '', 7346, 1, 0, 1, 120, 30, 0, -1, -1, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3357, 0, 7, 0, 'Liferoot', '', 7381, 1, 0, 1, 300, 75, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3358, 0, 7, 0, 'Khadgar\'s Whisker', '', 6661, 1, 0, 1, 700, 175, 0, -1, -1, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3369, 0, 7, 0, 'Grave Moss', '', 6396, 1, 0, 1, 100, 25, 0, -1, -1, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3818, 0, 7, 0, 'Fadeleaf', '', 18169, 1, 0, 1, 500, 125, 0, -1, -1, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3819, 0, 7, 0, 'Wintersbite', '', 7364, 1, 0, 1, 400, 100, 0, -1, -1, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3820, 0, 7, 0, 'Stranglekelp', '', 18089, 1, 0, 1, 400, 100, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(3821, 0, 7, 0, 'Goldthorn', '', 19497, 1, 0, 1, 600, 150, 0, -1, -1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(4625, 0, 7, 0, 'Firebloom', '', 19495, 1, 0, 1, 1000, 250, 0, -1, -1, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(5013, 0, 0, 0, 'Fertile Bulb', '', 6376, 1, 0, 1, 152, 38, 0, -1, -1, 15, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5100, 0, -1, 0, 0, 24, 60000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(5056, 0, 12, 0, 'Root Sample', '', 1464, 1, 0, 1, 0, 0, 0, 2047, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(5168, 0, 12, 0, 'Timberling Seed', '', 7273, 1, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(8153, 0, 7, 0, 'Wildvine', '', 7346, 1, 0, 1, 20, 5, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(8831, 0, 7, 0, 'Purple Lotus', '', 19493, 1, 0, 1, 1200, 300, 0, 1535, -1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(8836, 0, 7, 0, 'Arthas\' Tears', '', 19498, 1, 0, 1, 380, 95, 0, -1, -1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(8838, 0, 7, 0, 'Sungrass', '', 19492, 1, 0, 1, 240, 60, 0, -1, -1, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(8839, 0, 7, 0, 'Blindweed', '', 19496, 1, 0, 1, 1500, 375, 0, -1, -1, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(8845, 0, 7, 0, 'Ghost Mushroom', '', 17871, 1, 0, 1, 1500, 375, 0, -1, -1, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(8846, 0, 7, 0, 'Gromsblood', '', 19494, 1, 0, 1, 1000, 250, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11022, 0, 12, 0, 'Packet of Tharlendris Seeds', '', 20505, 1, 0, 1, 1000, 250, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11040, 0, 7, 0, 'Morrowgrain', '', 1442, 1, 0, 1, 4, 1, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11514, 0, 12, 0, 'Fel Creep', '', 21471, 1, 0, 1, 4, 1, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(13463, 0, 7, 0, 'Dreamfoil', '', 24689, 1, 0, 1, 400, 100, 0, -1, -1, 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(13464, 0, 7, 0, 'Golden Sansam', '', 24690, 1, 0, 1, 400, 100, 0, -1, -1, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(13465, 0, 7, 0, 'Mountain Silversage', '', 24692, 1, 0, 1, 600, 150, 0, -1, -1, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(13466, 0, 7, 0, 'Plaguebloom', '', 24693, 1, 0, 1, 1000, 250, 0, -1, -1, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(13467, 0, 7, 0, 'Icecap', '', 24691, 1, 0, 1, 1000, 250, 0, -1, -1, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16205, 0, 12, 0, 'Gaea Seed', '', 26774, 1, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16208, 0, 12, 0, 'Enchanted Gaea Seeds', '', 7287, 1, 64, 1, 0, 0, 0, 2047, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20269, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(17034, 0, 5, 0, 'Maple Seed', '', 7287, 1, 0, 1, 200, 50, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(17035, 0, 5, 0, 'Stranglethorn Seed', '', 7287, 1, 0, 1, 400, 100, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(17037, 0, 5, 0, 'Hornbeam Seed', '', 7287, 1, 0, 1, 1400, 350, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(17038, 0, 5, 0, 'Ironwood Seed', '', 7287, 1, 0, 1, 2000, 500, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(17760, 0, 12, 0, 'Seed of Life', '', 19492, 1, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(18297, 0, 0, 0, 'Thornling Seed', '', 30650, 1, 0, 1, 0, 0, 0, -1, -1, 60, 55, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22792, 0, -1, 0, 900000, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(765, 8, 7, 0, 'Silverleaf', '', 18088, 1, 0, 1, 40, 10, 0, -1, -1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(785, 8, 7, 0, 'Mageroyal', '', 7341, 1, 0, 1, 80, 20, 0, -1, -1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(1401, 8, 0, 0, 'Green Tea Leaf', '', 18088, 1, 0, 1, 56, 14, 0, -1, -1, 14, 4, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 833, 0, -1, 0, 0, 11, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(2447, 8, 7, 0, 'Peacebloom', '', 7396, 1, 0, 1, 40, 10, 0, -1, -1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(2449, 8, 7, 0, 'Earthroot', '', 1464, 1, 0, 1, 80, 20, 0, -1, -1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(2450, 8, 7, 0, 'Briarthorn', '', 7406, 1, 0, 1, 100, 25, 0, -1, -1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(2452, 8, 7, 0, 'Swiftthistle', '', 7241, 1, 0, 1, 60, 15, 0, -1, -1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(2453, 8, 7, 0, 'Bruiseweed', '', 7337, 1, 0, 1, 100, 25, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(3355, 8, 7, 0, 'Wild Steelbloom', '', 6524, 1, 0, 1, 200, 50, 0, -1, -1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(3356, 8, 7, 0, 'Kingsblood', '', 7346, 1, 0, 1, 120, 30, 0, -1, -1, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(3357, 8, 7, 0, 'Liferoot', '', 7381, 1, 0, 1, 300, 75, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(3358, 8, 7, 0, 'Khadgar\'s Whisker', '', 6661, 1, 0, 1, 700, 175, 0, -1, -1, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(3369, 8, 7, 0, 'Grave Moss', '', 6396, 1, 0, 1, 100, 25, 0, -1, -1, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(3818, 8, 7, 0, 'Fadeleaf', '', 18169, 1, 0, 1, 500, 125, 0, -1, -1, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(3819, 8, 7, 0, 'Wintersbite', '', 7364, 1, 0, 1, 400, 100, 0, -1, -1, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(3820, 8, 7, 0, 'Stranglekelp', '', 18089, 1, 0, 1, 400, 100, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(3821, 8, 7, 0, 'Goldthorn', '', 19497, 1, 0, 1, 600, 150, 0, -1, -1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(4625, 8, 7, 0, 'Firebloom', '', 19495, 1, 0, 1, 1000, 250, 0, -1, -1, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(5013, 8, 0, 0, 'Fertile Bulb', '', 6376, 1, 0, 1, 152, 38, 0, -1, -1, 15, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5100, 0, -1, 0, 0, 24, 60000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(5056, 8, 12, 0, 'Root Sample', '', 1464, 1, 0, 1, 0, 0, 0, 2047, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(5168, 8, 12, 0, 'Timberling Seed', '', 7273, 1, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(8153, 8, 7, 0, 'Wildvine', '', 7346, 1, 0, 1, 20, 5, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(8831, 8, 7, 0, 'Purple Lotus', '', 19493, 1, 0, 1, 1200, 300, 0, 1535, -1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(8836, 8, 7, 0, 'Arthas\' Tears', '', 19498, 1, 0, 1, 380, 95, 0, -1, -1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(8838, 8, 7, 0, 'Sungrass', '', 19492, 1, 0, 1, 240, 60, 0, -1, -1, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(8839, 8, 7, 0, 'Blindweed', '', 19496, 1, 0, 1, 1500, 375, 0, -1, -1, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(8845, 8, 7, 0, 'Ghost Mushroom', '', 17871, 1, 0, 1, 1500, 375, 0, -1, -1, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(8846, 8, 7, 0, 'Gromsblood', '', 19494, 1, 0, 1, 1000, 250, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(11022, 8, 12, 0, 'Packet of Tharlendris Seeds', '', 20505, 1, 0, 1, 1000, 250, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(11040, 8, 7, 0, 'Morrowgrain', '', 1442, 1, 0, 1, 4, 1, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(11514, 8, 12, 0, 'Fel Creep', '', 21471, 1, 0, 1, 4, 1, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(13463, 8, 7, 0, 'Dreamfoil', '', 24689, 1, 0, 1, 400, 100, 0, -1, -1, 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(13464, 8, 7, 0, 'Golden Sansam', '', 24690, 1, 0, 1, 400, 100, 0, -1, -1, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(13465, 8, 7, 0, 'Mountain Silversage', '', 24692, 1, 0, 1, 600, 150, 0, -1, -1, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(13466, 8, 7, 0, 'Plaguebloom', '', 24693, 1, 0, 1, 1000, 250, 0, -1, -1, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(13467, 8, 7, 0, 'Icecap', '', 24691, 1, 0, 1, 1000, 250, 0, -1, -1, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(16205, 8, 12, 0, 'Gaea Seed', '', 26774, 1, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(16208, 8, 12, 0, 'Enchanted Gaea Seeds', '', 7287, 1, 64, 1, 0, 0, 0, 2047, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20269, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(17034, 8, 5, 0, 'Maple Seed', '', 7287, 1, 0, 1, 200, 50, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(17035, 8, 5, 0, 'Stranglethorn Seed', '', 7287, 1, 0, 1, 400, 100, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(17037, 8, 5, 0, 'Hornbeam Seed', '', 7287, 1, 0, 1, 1400, 350, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(17038, 8, 5, 0, 'Ironwood Seed', '', 7287, 1, 0, 1, 2000, 500, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(17760, 8, 12, 0, 'Seed of Life', '', 19492, 1, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(18297, 8, 0, 0, 'Thornling Seed', '', 30650, 1, 0, 1, 0, 0, 0, -1, -1, 60, 55, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22792, 0, -1, 0, 900000, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1);
DELETE FROM `item_template` WHERE `entry` IN (5173, 11951, 11952, 13468, 17036, 19726, 19727, 21857);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `description`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `delay`, `range_mod`, `ammo_type`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `block`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmrate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmrate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmrate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmrate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmrate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `duration`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `extra_flags`, `other_team_entry`) VALUES 
(5173, 0, 7, 0, 'Deathweed', 'It must be carried very, very carefully.', 7328, 1, 0, 1, 100, 25, 0, 8, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(5173, 8, 7, 0, 'Deathweed', 'It must be carried very, very carefully.', 7328, 1, 0, 1, 100, 25, 0, 8, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(5173, 9, 7, 0, 'Deathweed', 'It must be carried very, very carefully.', 7328, 1, 0, 1, 100, 25, 0, 8, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(11951, 0, 0, 0, 'Whipper Root Tuber', '', 21974, 1, 0, 5, 0, 0, 0, -1, -1, 55, 45, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15700, 0, -1, 0, 60000, 11, 1000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11951, 8, 0, 0, 'Whipper Root Tuber', '', 21974, 1, 0, 5, 0, 0, 0, -1, -1, 55, 45, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15700, 0, -1, 0, 60000, 11, 1000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(11951, 9, 0, 0, 'Whipper Root Tuber', '', 21974, 1, 0, 5, 0, 0, 0, -1, -1, 55, 45, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15700, 0, -1, 0, -1, 1153, 120000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(11952, 0, 0, 0, 'Night Dragon\'s Breath', '', 21975, 1, 0, 5, 0, 0, 0, -1, -1, 55, 45, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15701, 0, -1, 0, 60000, 11, 1000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11952, 8, 0, 0, 'Night Dragon\'s Breath', '', 21975, 1, 0, 5, 0, 0, 0, -1, -1, 55, 45, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15701, 0, -1, 0, 60000, 11, 1000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(11952, 9, 0, 0, 'Night Dragon\'s Breath', '', 21975, 1, 0, 5, 0, 0, 0, -1, -1, 55, 45, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15701, 0, -1, 0, -1, 1153, 120000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(13468, 0, 7, 0, 'Black Lotus', '', 24688, 2, 0, 1, 4000, 1000, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(13468, 5, 7, 0, 'Black Lotus', '', 24688, 2, 0, 1, 4000, 1000, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(13468, 8, 7, 0, 'Black Lotus', '', 24688, 2, 0, 1, 4000, 1000, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(17036, 0, 5, 0, 'Ashwood Seed', '', 7287, 1, 0, 1, 800, 200, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(17036, 8, 5, 0, 'Ashwood Seed', '', 7287, 1, 0, 1, 800, 200, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(17036, 9, 5, 0, 'Ashwood Seed', '', 7287, 1, 0, 1, 800, 200, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(19726, 5, 7, 0, 'Bloodvine', '', 18087, 2, 0, 1, 2000, 500, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19726, 8, 7, 0, 'Bloodvine', '', 18087, 2, 0, 1, 2000, 500, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(19727, 5, 7, 0, 'Blood Scythe', 'Allows an Herbalist to collect Bloodvine from Zul\'Gurub Flora when carried.', 32189, 3, 0, 1, 60000, 15000, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19727, 8, 7, 0, 'Blood Scythe', 'Allows an Herbalist to collect Bloodvine from Zul\'Gurub Flora when carried.', 32189, 3, 0, 1, 60000, 15000, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1),
(21857, 8, 1, 2, 'Test Herb Bag', '', 33940, 2, 0, 1, 20000, 5000, 18, 256, -1, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 1);

-- Enchanting Bag Family was added in 1.10.
DELETE FROM `item_template` WHERE (`patch` < 8) && (`entry` IN (6218, 6222, 6339, 6342, 6343, 6344, 6345, 6346, 6347, 6348, 6349, 6375, 6376, 6377, 10938, 10939, 10940, 10940, 10978, 10978, 10998, 11038, 11039, 11081, 11082, 11083, 11083, 11084, 11084, 11098, 11101, 11130, 11134, 11135, 11137, 11137, 11138, 11138, 11139, 11139, 11145, 11150, 11151, 11152, 11163, 11164, 11165, 11166, 11167, 11168, 11174, 11175, 11176, 11176, 11177, 11177, 11178, 11178, 11202, 11203, 11204, 11205, 11206, 11207, 11208, 11223, 11224, 11225, 11226, 11813, 14343, 14343, 14344, 14344, 16202, 16203, 16204, 16204, 16207, 16214, 16215, 16216, 16217, 16218, 16219, 16220, 16221, 16222, 16223, 16224, 16242, 16243, 16244, 16245, 16246, 16247, 16248, 16249, 16250, 16251, 16252, 16253, 16254, 16255, 17725, 18259, 18260, 19444, 19445, 19446, 19447, 19448, 19449, 20725, 20725, 20726, 20727, 20728, 20729, 20730, 20731, 20732, 20733, 20734, 20735, 20736, 20752, 20753, 20754, 20755, 20756, 20757, 20758));
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `description`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `delay`, `range_mod`, `ammo_type`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `block`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmrate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmrate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmrate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmrate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmrate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `duration`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `extra_flags`, `other_team_entry`) VALUES 
(6218, 0, 7, 0, 'Runed Copper Rod', '', 21207, 1, 0, 1, 124, 24, 0, -1, -1, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6222, 0, 9, 8, 'Formula: Imbue Chest - Minor Spirit', '', 11431, 2, 80, 1, 100, 25, 0, -1, -1, 12, 0, 333, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7462, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6339, 0, 7, 0, 'Runed Silver Rod', '', 21208, 1, 0, 1, 124, 24, 0, -1, -1, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6342, 0, 9, 8, 'Formula: Enchant Chest - Minor Mana', '', 11431, 2, 64, 1, 300, 75, 0, -1, -1, 12, 0, 333, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7444, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6343, 0, 9, 8, 'Formula: Imbue Chest - Spirit', '', 11431, 2, 80, 1, 350, 87, 0, -1, -1, 14, 0, 333, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7462, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6344, 0, 9, 8, 'Formula: Enchant Bracer - Minor Spirit', '', 11431, 2, 64, 1, 400, 100, 0, -1, -1, 17, 0, 333, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7767, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6345, 0, 9, 8, 'Formula: Imbue Cloak - Protection', '', 11431, 2, 80, 1, 400, 100, 0, -1, -1, 18, 0, 333, 90, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7772, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6346, 0, 9, 8, 'Formula: Enchant Chest - Lesser Mana', '', 11431, 2, 64, 1, 400, 100, 0, -1, -1, 19, 0, 333, 80, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7777, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6347, 0, 9, 8, 'Formula: Enchant Bracer - Minor Strength', '', 11431, 2, 64, 1, 400, 100, 0, -1, -1, 19, 0, 333, 80, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7783, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6348, 0, 9, 8, 'Formula: Enchant Weapon - Minor Beastslayer', '', 11431, 2, 64, 1, 500, 125, 0, -1, -1, 20, 0, 333, 90, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7787, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6349, 0, 9, 8, 'Formula: Enchant 2H Weapon - Lesser Intellect', '', 11431, 1, 64, 1, 500, 125, 0, -1, -1, 20, 0, 333, 100, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7798, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6375, 0, 9, 8, 'Formula: Enchant Bracer - Lesser Spirit', '', 11431, 2, 64, 1, 1000, 250, 0, -1, -1, 24, 0, 333, 120, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7860, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6376, 0, 9, 8, 'Formula: Enchant Boots - Minor Stamina', '', 11431, 2, 80, 1, 1000, 250, 0, -1, -1, 25, 0, 333, 125, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7864, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6377, 0, 9, 8, 'Formula: Enchant Boots - Minor Agility', '', 11431, 2, 64, 1, 1000, 250, 0, -1, -1, 25, 0, 333, 125, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7868, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(10938, 0, 7, 0, 'Lesser Magic Essence', '', 20608, 2, 1024, 1, 800, 0, 0, -1, -1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13361, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(10939, 0, 7, 0, 'Greater Magic Essence', '', 20609, 2, 64, 1, 2400, 0, 0, -1, -1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13362, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(10940, 0, 7, 0, 'Strange Dust', '', 20611, 1, 0, 1, 800, 0, 0, -1, -1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(10978, 0, 7, 0, 'Small Glimmering Shard', '', 20612, 3, 0, 1, 4000, 0, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(10998, 0, 7, 0, 'Lesser Astral Essence', '', 20610, 2, 1024, 1, 3000, 0, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13497, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11038, 0, 9, 8, 'Formula: Enchant 2H Weapon - Lesser Spirit', '', 11431, 2, 64, 1, 800, 200, 0, -1, -1, 22, 0, 333, 110, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13393, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11039, 0, 9, 8, 'Formula: Enchant Cloak - Minor Agility', '', 11431, 2, 64, 1, 800, 200, 0, -1, -1, 22, 0, 333, 110, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13420, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11081, 0, 9, 8, 'Formula: Enchant Shield - Lesser Protection', '', 11431, 2, 64, 1, 800, 200, 0, -1, -1, 22, 0, 333, 115, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13465, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11082, 0, 7, 0, 'Greater Astral Essence', '', 20613, 2, 0, 1, 9000, 0, 0, -1, -1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13498, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11083, 0, 7, 0, 'Soul Dust', '', 20614, 1, 0, 1, 2400, 0, 0, -1, -1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11084, 0, 7, 0, 'Large Glimmering Shard', '', 20615, 3, 0, 1, 6000, 0, 0, -1, -1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11098, 0, 9, 8, 'Formula: Enchant Cloak - Lesser Shadow Resistance', '', 11431, 2, 64, 1, 2000, 500, 0, -1, -1, 27, 0, 333, 135, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13525, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11101, 0, 9, 8, 'Formula: Enchant Bracer - Lesser Strength', '', 11431, 2, 64, 1, 2500, 625, 0, -1, -1, 28, 0, 333, 140, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13537, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11130, 0, 7, 0, 'Runed Golden Rod', '', 21206, 1, 0, 1, 2000, 500, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11134, 0, 7, 0, 'Lesser Mystic Essence', '', 20794, 2, 1024, 1, 10000, 0, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13632, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11135, 0, 7, 0, 'Greater Mystic Essence', '', 20795, 2, 1024, 1, 30000, 0, 0, -1, -1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13633, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11137, 0, 7, 0, 'Vision Dust', '', 20798, 1, 0, 1, 4000, 0, 0, -1, -1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11138, 0, 7, 0, 'Small Glowing Shard', '', 20799, 3, 0, 1, 8000, 0, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11139, 0, 7, 0, 'Large Glowing Shard', '', 20800, 3, 0, 1, 12000, 0, 0, -1, -1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11145, 0, 7, 0, 'Runed Truesilver Rod', '', 21209, 1, 0, 1, 5000, 1250, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11150, 0, 9, 8, 'Formula: Enchant Gloves - Mining', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 29, 0, 333, 145, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13613, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11151, 0, 9, 8, 'Formula: Enchant Gloves - Herbalism', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 29, 0, 333, 145, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13618, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11152, 0, 9, 8, 'Formula: Enchant Gloves - Fishing', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 29, 0, 333, 145, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13621, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11163, 0, 9, 8, 'Formula: Enchant Bracer - Lesser Deflection', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 34, 0, 333, 170, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13647, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11164, 0, 9, 8, 'Formula: Enchant Weapon - Lesser Beastslayer', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 35, 0, 333, 175, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13654, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11165, 0, 9, 8, 'Formula: Enchant Weapon - Lesser Elemental Slayer', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 35, 0, 333, 175, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13656, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11166, 0, 9, 8, 'Formula: Enchant Gloves - Skinning', '', 11431, 2, 64, 1, 4000, 1000, 0, -1, -1, 40, 0, 333, 200, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13699, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11167, 0, 9, 8, 'Formula: Enchant Boots - Lesser Spirit', '', 11431, 2, 64, 1, 4000, 1000, 0, -1, -1, 38, 0, 333, 190, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13688, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11168, 0, 9, 8, 'Formula: Enchant Shield - Lesser Block', '', 11431, 2, 64, 1, 4000, 1000, 0, -1, -1, 39, 0, 333, 195, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13691, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11174, 0, 7, 0, 'Lesser Nether Essence', '', 20895, 2, 1024, 1, 20000, 0, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13739, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11175, 0, 7, 0, 'Greater Nether Essence', '', 20896, 2, 1024, 1, 60000, 0, 0, -1, -1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13740, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11176, 0, 7, 0, 'Dream Dust', '', 20899, 1, 0, 1, 8000, 0, 0, -1, -1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11177, 0, 7, 0, 'Small Radiant Shard', '', 20901, 3, 0, 1, 24000, 0, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11178, 0, 7, 0, 'Large Radiant Shard', '', 20902, 3, 0, 1, 36000, 0, 0, -1, -1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11202, 0, 9, 8, 'Formula: Enchant Shield - Stamina', '', 11431, 2, 64, 1, 4400, 1100, 0, -1, -1, 42, 0, 333, 210, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13818, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11203, 0, 9, 8, 'Formula: Enchant Gloves - Advanced Mining', '', 11431, 2, 64, 1, 4400, 1100, 0, -1, -1, 43, 0, 333, 215, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13842, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11204, 0, 9, 8, 'Formula: Enchant Bracer - Greater Spirit', '', 11431, 2, 64, 1, 4400, 1100, 0, -1, -1, 44, 0, 333, 220, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13850, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11205, 0, 9, 8, 'Formula: Enchant Gloves - Advanced Herbalism', '', 11431, 2, 64, 1, 5000, 1250, 0, -1, -1, 45, 0, 333, 225, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13869, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11206, 0, 9, 8, 'Formula: Enchant Cloak - Lesser Agility', '', 11431, 2, 64, 1, 5000, 1250, 0, -1, -1, 45, 0, 333, 225, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13883, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11207, 0, 9, 8, 'Formula: Enchant Weapon - Fiery Weapon', '', 11431, 2, 64, 1, 12000, 3000, 0, -1, -1, 53, 0, 333, 265, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13904, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11208, 0, 9, 8, 'Formula: Enchant Weapon - Demonslaying', '', 11431, 2, 64, 1, 5400, 1350, 0, -1, -1, 46, 0, 333, 230, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13916, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11223, 0, 9, 8, 'Formula: Enchant Bracer - Deflection', '', 11431, 2, 64, 1, 5800, 1450, 0, -1, -1, 47, 0, 333, 235, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13932, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11224, 0, 9, 8, 'Formula: Enchant Shield - Frost Resistance', '', 11431, 2, 64, 1, 5800, 1450, 0, -1, -1, 47, 0, 333, 235, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13934, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11225, 0, 9, 8, 'Formula: Enchant Bracer - Greater Stamina', '', 11431, 2, 64, 1, 6200, 1550, 0, -1, -1, 49, 0, 333, 245, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13946, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11226, 0, 9, 8, 'Formula: Enchant Gloves - Riding Skill', '', 11431, 2, 64, 1, 6200, 1550, 0, -1, -1, 50, 0, 333, 250, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13949, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11813, 0, 9, 8, 'Formula: Smoking Heart of the Mountain', '', 11431, 2, 64, 1, 12000, 3000, 0, -1, -1, 53, 0, 333, 265, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15597, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(14343, 0, 7, 0, 'Small Brilliant Shard', '', 25054, 3, 0, 1, 36000, 0, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(14344, 0, 7, 0, 'Large Brilliant Shard', '', 25055, 3, 0, 1, 36000, 0, 0, -1, -1, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16202, 0, 7, 0, 'Lesser Eternal Essence', '', 26771, 2, 1024, 1, 40000, 0, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20039, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16203, 0, 7, 0, 'Greater Eternal Essence', '', 26772, 2, 1024, 1, 120000, 0, 0, -1, -1, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20040, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16204, 0, 7, 0, 'Illusion Dust', '', 26773, 1, 0, 1, 12000, 0, 0, -1, -1, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16207, 0, 7, 0, 'Runed Arcanite Rod', '', 26775, 1, 0, 1, 5000, 1250, 0, -1, -1, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16214, 0, 9, 8, 'Formula: Enchant Bracer - Greater Intellect', '', 7798, 2, 64, 1, 12000, 3000, 0, -1, -1, 51, 0, 333, 255, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20065, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16215, 0, 9, 8, 'Formula: Enchant Boots - Greater Stamina', '', 7798, 2, 64, 1, 12000, 3000, 0, -1, -1, 52, 0, 333, 260, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20067, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16216, 0, 9, 8, 'Formula: Enchant Cloak - Greater Resistance', '', 7798, 2, 64, 1, 12000, 3000, 0, -1, -1, 53, 0, 333, 265, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20068, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16217, 0, 9, 8, 'Formula: Enchant Shield - Greater Stamina', '', 7798, 1, 64, 1, 12000, 3000, 0, -1, -1, 53, 0, 333, 265, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20069, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16218, 0, 9, 8, 'Formula: Enchant Bracer - Superior Spirit', '', 7798, 2, 64, 1, 14000, 3500, 0, -1, -1, 54, 0, 333, 270, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20070, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16219, 0, 9, 8, 'Formula: Enchant Gloves - Greater Agility', '', 7798, 2, 64, 1, 14000, 3500, 0, -1, -1, 54, 0, 333, 270, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20071, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16220, 0, 9, 8, 'Formula: Enchant Boots - Spirit', '', 7798, 2, 64, 1, 16000, 4000, 0, -1, -1, 55, 0, 333, 275, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20072, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16221, 0, 9, 8, 'Formula: Enchant Chest - Major Health', '', 7798, 1, 64, 1, 16000, 4000, 0, -1, -1, 55, 0, 333, 275, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20073, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16222, 0, 9, 8, 'Formula: Enchant Shield - Superior Spirit', '', 7798, 2, 64, 1, 20000, 5000, 0, -1, -1, 56, 0, 333, 280, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20074, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16223, 0, 9, 8, 'Formula: Enchant Weapon - Icy Chill', '', 7798, 2, 64, 1, 20000, 5000, 0, -1, -1, 57, 0, 333, 285, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20075, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16224, 0, 9, 8, 'Formula: Enchant Cloak - Superior Defense', '', 7798, 1, 64, 1, 20000, 5000, 0, -1, -1, 57, 0, 333, 285, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20076, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16242, 0, 9, 8, 'Formula: Enchant Chest - Major Mana', '', 7798, 2, 64, 1, 22000, 5500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20077, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16243, 0, 9, 8, 'Formula: Runed Arcanite Rod', '', 7798, 1, 64, 1, 22000, 5500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20078, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16244, 0, 9, 8, 'Formula: Enchant Gloves - Greater Strength', '', 7798, 2, 64, 1, 24000, 6000, 0, 2047, 255, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20079, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16245, 0, 9, 8, 'Formula: Enchant Boots - Greater Agility', '', 7798, 2, 64, 1, 24000, 6000, 0, -1, -1, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20080, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16246, 0, 9, 8, 'Formula: Enchant Bracer - Superior Strength', '', 7798, 2, 64, 1, 24000, 6000, 0, -1, -1, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20081, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16247, 0, 9, 8, 'Formula: Enchant 2H Weapon - Superior Impact', '', 7798, 2, 64, 1, 24000, 6000, 0, -1, -1, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20082, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16248, 0, 9, 8, 'Formula: Enchant Weapon - Unholy', '', 7798, 2, 64, 1, 24000, 6000, 0, -1, -1, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20083, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16249, 0, 9, 8, 'Formula: Enchant 2H Weapon - Major Intellect', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20084, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16250, 0, 9, 8, 'Formula: Enchant Weapon - Superior Striking', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20085, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16251, 0, 9, 8, 'Formula: Enchant Bracer - Superior Stamina', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20086, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16252, 0, 9, 8, 'Formula: Enchant Weapon - Crusader', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 61, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20087, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16253, 0, 9, 8, 'Formula: Enchant Chest - Greater Stats', '', 7798, 2, 64, 1, 30000, 7500, 0, 2047, 255, 62, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20088, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16254, 0, 9, 8, 'Formula: Enchant Weapon - Lifestealing', '', 7798, 3, 64, 1, 30000, 7500, 0, -1, -1, 62, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20089, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16255, 0, 9, 8, 'Formula: Enchant 2H Weapon - Major Spirit', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 62, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20090, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(17725, 0, 9, 8, 'Formula: Enchant Weapon - Winter\'s Might', '', 11431, 2, 64, 1, 3000, 750, 0, 32767, -1, 38, 0, 333, 190, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21933, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(18259, 2, 9, 8, 'Formula: Enchant Weapon - Spell Power', '', 7798, 3, 64, 1, 30000, 7500, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22753, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(18260, 2, 9, 8, 'Formula: Enchant Weapon - Healing Power', '', 7798, 3, 64, 1, 30000, 7500, 0, 2047, 255, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22754, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19444, 4, 9, 8, 'Formula: Enchant Weapon - Strength', '', 7798, 1, 64, 1, 30000, 7500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 0, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23805, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19445, 4, 9, 8, 'Formula: Enchant Weapon - Agility', '', 7798, 1, 64, 1, 30000, 7500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 576, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23806, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19446, 4, 9, 8, 'Formula: Enchant Bracer - Mana Regeneration', '', 7798, 1, 64, 1, 30000, 7500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 529, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23807, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19447, 4, 9, 8, 'Formula: Enchant Bracer - Healing', '', 7798, 1, 64, 1, 60000, 15000, 0, -1, -1, 64, 0, 333, 300, 0, 0, 0, 529, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23808, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19448, 4, 9, 8, 'Formula: Enchant Weapon - Mighty Spirit', '', 7798, 1, 64, 1, 80000, 20000, 0, -1, -1, 66, 0, 333, 300, 0, 0, 0, 0, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23809, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19449, 4, 9, 8, 'Formula: Enchant Weapon - Mighty Intellect', '', 7798, 1, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23810, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20725, 0, 7, 0, 'Nexus Crystal', '', 33448, 4, 0, 1, 60000, 0, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20726, 7, 9, 8, 'Formula: Enchant Gloves - Threat', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25087, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20727, 7, 9, 8, 'Formula: Enchant Gloves - Shadow Power', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25088, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20728, 7, 9, 8, 'Formula: Enchant Gloves - Frost Power', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25089, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20729, 7, 9, 8, 'Formula: Enchant Gloves - Fire Power', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25090, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20730, 7, 9, 8, 'Formula: Enchant Gloves - Healing Power', '', 7798, 3, 64, 1, 100000, 25000, 0, -1, -1, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25091, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20731, 7, 9, 8, 'Formula: Enchant Gloves - Superior Agility', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25092, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20732, 7, 9, 8, 'Formula: Enchant Cloak - Greater Fire Resistance', '', 7798, 1, 64, 1, 100000, 25000, 0, -1, -1, 70, 0, 333, 300, 0, 0, 0, 609, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25093, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20733, 7, 9, 8, 'Formula: Enchant Cloak - Greater Nature Resistance', '', 7798, 1, 64, 1, 100000, 25000, 0, -1, -1, 70, 0, 333, 300, 0, 0, 0, 609, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25094, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20734, 7, 9, 8, 'Formula: Enchant Cloak - Stealth', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25095, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20735, 7, 9, 8, 'Formula: Enchant Cloak - Subtlety', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25096, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20736, 7, 9, 8, 'Formula: Enchant Cloak - Dodge', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25097, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20752, 7, 9, 8, 'Formula: Minor Mana Oil', '', 11431, 1, 64, 1, 3000, 750, 0, -1, -1, 30, 0, 333, 150, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25133, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20753, 7, 9, 8, 'Formula: Lesser Wizard Oil', '', 11431, 1, 64, 1, 4000, 1000, 0, -1, -1, 40, 0, 333, 200, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25134, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20754, 7, 9, 8, 'Formula: Lesser Mana Oil', '', 11431, 1, 64, 1, 10000, 2500, 0, -1, -1, 50, 0, 333, 250, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25135, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20755, 7, 9, 8, 'Formula: Wizard Oil', '', 7798, 1, 64, 1, 20000, 5000, 0, -1, -1, 55, 0, 333, 275, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25136, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20756, 7, 9, 8, 'Formula: Brilliant Wizard Oil', '', 7798, 1, 64, 1, 40000, 10000, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 270, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25137, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20757, 7, 9, 8, 'Formula: Brilliant Mana Oil', '', 7798, 1, 64, 1, 40000, 10000, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 270, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25138, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20758, 7, 9, 8, 'Formula: Minor Wizard Oil', '', 11431, 1, 64, 1, 500, 125, 0, -1, -1, 15, 0, 333, 45, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25132, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6218, 8, 7, 0, 'Runed Copper Rod', '', 21207, 1, 0, 1, 124, 24, 0, -1, -1, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6222, 8, 9, 8, 'Formula: Imbue Chest - Minor Spirit', '', 11431, 2, 80, 1, 100, 25, 0, -1, -1, 12, 0, 333, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7462, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6339, 8, 7, 0, 'Runed Silver Rod', '', 21208, 1, 0, 1, 124, 24, 0, -1, -1, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6342, 8, 9, 8, 'Formula: Enchant Chest - Minor Mana', '', 11431, 2, 64, 1, 300, 75, 0, -1, -1, 12, 0, 333, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7444, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6343, 8, 9, 8, 'Formula: Imbue Chest - Spirit', '', 11431, 2, 80, 1, 350, 87, 0, -1, -1, 14, 0, 333, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7462, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6344, 8, 9, 8, 'Formula: Enchant Bracer - Minor Spirit', '', 11431, 2, 64, 1, 400, 100, 0, -1, -1, 17, 0, 333, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7767, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6345, 8, 9, 8, 'Formula: Imbue Cloak - Protection', '', 11431, 2, 80, 1, 400, 100, 0, -1, -1, 18, 0, 333, 90, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7772, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6346, 8, 9, 8, 'Formula: Enchant Chest - Lesser Mana', '', 11431, 2, 64, 1, 400, 100, 0, -1, -1, 19, 0, 333, 80, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7777, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6347, 8, 9, 8, 'Formula: Enchant Bracer - Minor Strength', '', 11431, 2, 64, 1, 400, 100, 0, -1, -1, 19, 0, 333, 80, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7783, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6348, 8, 9, 8, 'Formula: Enchant Weapon - Minor Beastslayer', '', 11431, 2, 64, 1, 500, 125, 0, -1, -1, 20, 0, 333, 90, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7787, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6349, 8, 9, 8, 'Formula: Enchant 2H Weapon - Lesser Intellect', '', 11431, 1, 64, 1, 500, 125, 0, -1, -1, 20, 0, 333, 100, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7798, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6375, 8, 9, 8, 'Formula: Enchant Bracer - Lesser Spirit', '', 11431, 2, 64, 1, 1000, 250, 0, -1, -1, 24, 0, 333, 120, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7860, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6376, 8, 9, 8, 'Formula: Enchant Boots - Minor Stamina', '', 11431, 2, 80, 1, 1000, 250, 0, -1, -1, 25, 0, 333, 125, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7864, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(6377, 8, 9, 8, 'Formula: Enchant Boots - Minor Agility', '', 11431, 2, 64, 1, 1000, 250, 0, -1, -1, 25, 0, 333, 125, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7868, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(10938, 8, 7, 0, 'Lesser Magic Essence', '', 20608, 2, 1024, 1, 800, 0, 0, -1, -1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13361, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(10939, 8, 7, 0, 'Greater Magic Essence', '', 20609, 2, 64, 1, 2400, 0, 0, -1, -1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13362, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(10940, 8, 7, 0, 'Strange Dust', '', 20611, 1, 0, 1, 800, 0, 0, -1, -1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(10978, 8, 7, 0, 'Small Glimmering Shard', '', 20612, 3, 0, 1, 4000, 0, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(10998, 8, 7, 0, 'Lesser Astral Essence', '', 20610, 2, 1024, 1, 3000, 0, 0, -1, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13497, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11038, 8, 9, 8, 'Formula: Enchant 2H Weapon - Lesser Spirit', '', 11431, 2, 64, 1, 800, 200, 0, -1, -1, 22, 0, 333, 110, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13393, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11039, 8, 9, 8, 'Formula: Enchant Cloak - Minor Agility', '', 11431, 2, 64, 1, 800, 200, 0, -1, -1, 22, 0, 333, 110, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13420, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11081, 8, 9, 8, 'Formula: Enchant Shield - Lesser Protection', '', 11431, 2, 64, 1, 800, 200, 0, -1, -1, 22, 0, 333, 115, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13465, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11082, 8, 7, 0, 'Greater Astral Essence', '', 20613, 2, 0, 1, 9000, 0, 0, -1, -1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13498, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11083, 8, 7, 0, 'Soul Dust', '', 20614, 1, 0, 1, 2400, 0, 0, -1, -1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11084, 8, 7, 0, 'Large Glimmering Shard', '', 20615, 3, 0, 1, 6000, 0, 0, -1, -1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11098, 8, 9, 8, 'Formula: Enchant Cloak - Lesser Shadow Resistance', '', 11431, 2, 64, 1, 2000, 500, 0, -1, -1, 27, 0, 333, 135, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13525, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11101, 8, 9, 8, 'Formula: Enchant Bracer - Lesser Strength', '', 11431, 2, 64, 1, 2500, 625, 0, -1, -1, 28, 0, 333, 140, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13537, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11130, 8, 7, 0, 'Runed Golden Rod', '', 21206, 1, 0, 1, 2000, 500, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11134, 8, 7, 0, 'Lesser Mystic Essence', '', 20794, 2, 1024, 1, 10000, 0, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13632, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11135, 8, 7, 0, 'Greater Mystic Essence', '', 20795, 2, 1024, 1, 30000, 0, 0, -1, -1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13633, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11137, 8, 7, 0, 'Vision Dust', '', 20798, 1, 0, 1, 4000, 0, 0, -1, -1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11138, 8, 7, 0, 'Small Glowing Shard', '', 20799, 3, 0, 1, 8000, 0, 0, -1, -1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11139, 8, 7, 0, 'Large Glowing Shard', '', 20800, 3, 0, 1, 12000, 0, 0, -1, -1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11145, 8, 7, 0, 'Runed Truesilver Rod', '', 21209, 1, 0, 1, 5000, 1250, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11150, 8, 9, 8, 'Formula: Enchant Gloves - Mining', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 29, 0, 333, 145, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13613, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11151, 8, 9, 8, 'Formula: Enchant Gloves - Herbalism', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 29, 0, 333, 145, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13618, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11152, 8, 9, 8, 'Formula: Enchant Gloves - Fishing', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 29, 0, 333, 145, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13621, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11163, 8, 9, 8, 'Formula: Enchant Bracer - Lesser Deflection', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 34, 0, 333, 170, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13647, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11164, 8, 9, 8, 'Formula: Enchant Weapon - Lesser Beastslayer', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 35, 0, 333, 175, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13654, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11165, 8, 9, 8, 'Formula: Enchant Weapon - Lesser Elemental Slayer', '', 11431, 2, 64, 1, 3000, 750, 0, -1, -1, 35, 0, 333, 175, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13656, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11166, 8, 9, 8, 'Formula: Enchant Gloves - Skinning', '', 11431, 2, 64, 1, 4000, 1000, 0, -1, -1, 40, 0, 333, 200, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13699, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11167, 8, 9, 8, 'Formula: Enchant Boots - Lesser Spirit', '', 11431, 2, 64, 1, 4000, 1000, 0, -1, -1, 38, 0, 333, 190, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13688, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11168, 8, 9, 8, 'Formula: Enchant Shield - Lesser Block', '', 11431, 2, 64, 1, 4000, 1000, 0, -1, -1, 39, 0, 333, 195, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13691, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11174, 8, 7, 0, 'Lesser Nether Essence', '', 20895, 2, 1024, 1, 20000, 0, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13739, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11175, 8, 7, 0, 'Greater Nether Essence', '', 20896, 2, 1024, 1, 60000, 0, 0, -1, -1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13740, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11176, 8, 7, 0, 'Dream Dust', '', 20899, 1, 0, 1, 8000, 0, 0, -1, -1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11177, 8, 7, 0, 'Small Radiant Shard', '', 20901, 3, 0, 1, 24000, 0, 0, -1, -1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11178, 8, 7, 0, 'Large Radiant Shard', '', 20902, 3, 0, 1, 36000, 0, 0, -1, -1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11202, 8, 9, 8, 'Formula: Enchant Shield - Stamina', '', 11431, 2, 64, 1, 4400, 1100, 0, -1, -1, 42, 0, 333, 210, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13818, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11203, 8, 9, 8, 'Formula: Enchant Gloves - Advanced Mining', '', 11431, 2, 64, 1, 4400, 1100, 0, -1, -1, 43, 0, 333, 215, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13842, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11204, 8, 9, 8, 'Formula: Enchant Bracer - Greater Spirit', '', 11431, 2, 64, 1, 4400, 1100, 0, -1, -1, 44, 0, 333, 220, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13850, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11205, 8, 9, 8, 'Formula: Enchant Gloves - Advanced Herbalism', '', 11431, 2, 64, 1, 5000, 1250, 0, -1, -1, 45, 0, 333, 225, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13869, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11206, 8, 9, 8, 'Formula: Enchant Cloak - Lesser Agility', '', 11431, 2, 64, 1, 5000, 1250, 0, -1, -1, 45, 0, 333, 225, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13883, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11207, 8, 9, 8, 'Formula: Enchant Weapon - Fiery Weapon', '', 11431, 2, 64, 1, 12000, 3000, 0, -1, -1, 53, 0, 333, 265, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13904, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11208, 8, 9, 8, 'Formula: Enchant Weapon - Demonslaying', '', 11431, 2, 64, 1, 5400, 1350, 0, -1, -1, 46, 0, 333, 230, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13916, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11223, 8, 9, 8, 'Formula: Enchant Bracer - Deflection', '', 11431, 2, 64, 1, 5800, 1450, 0, -1, -1, 47, 0, 333, 235, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13932, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11224, 8, 9, 8, 'Formula: Enchant Shield - Frost Resistance', '', 11431, 2, 64, 1, 5800, 1450, 0, -1, -1, 47, 0, 333, 235, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13934, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11225, 8, 9, 8, 'Formula: Enchant Bracer - Greater Stamina', '', 11431, 2, 64, 1, 6200, 1550, 0, -1, -1, 49, 0, 333, 245, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13946, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11226, 8, 9, 8, 'Formula: Enchant Gloves - Riding Skill', '', 11431, 2, 64, 1, 6200, 1550, 0, -1, -1, 50, 0, 333, 250, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13949, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(11813, 8, 9, 8, 'Formula: Smoking Heart of the Mountain', '', 11431, 2, 64, 1, 12000, 3000, 0, -1, -1, 53, 0, 333, 265, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15597, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(14343, 8, 7, 0, 'Small Brilliant Shard', '', 25054, 3, 0, 1, 36000, 0, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(14344, 8, 7, 0, 'Large Brilliant Shard', '', 25055, 3, 0, 1, 36000, 0, 0, -1, -1, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16202, 8, 7, 0, 'Lesser Eternal Essence', '', 26771, 2, 1024, 1, 40000, 0, 0, -1, -1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20039, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16203, 8, 7, 0, 'Greater Eternal Essence', '', 26772, 2, 1024, 1, 120000, 0, 0, -1, -1, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20040, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16204, 8, 7, 0, 'Illusion Dust', '', 26773, 1, 0, 1, 12000, 0, 0, -1, -1, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16207, 8, 7, 0, 'Runed Arcanite Rod', '', 26775, 1, 0, 1, 5000, 1250, 0, -1, -1, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16214, 8, 9, 8, 'Formula: Enchant Bracer - Greater Intellect', '', 7798, 2, 64, 1, 12000, 3000, 0, -1, -1, 51, 0, 333, 255, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20065, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16215, 8, 9, 8, 'Formula: Enchant Boots - Greater Stamina', '', 7798, 2, 64, 1, 12000, 3000, 0, -1, -1, 52, 0, 333, 260, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20067, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16216, 8, 9, 8, 'Formula: Enchant Cloak - Greater Resistance', '', 7798, 2, 64, 1, 12000, 3000, 0, -1, -1, 53, 0, 333, 265, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20068, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16217, 8, 9, 8, 'Formula: Enchant Shield - Greater Stamina', '', 7798, 1, 64, 1, 12000, 3000, 0, -1, -1, 53, 0, 333, 265, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20069, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16218, 8, 9, 8, 'Formula: Enchant Bracer - Superior Spirit', '', 7798, 2, 64, 1, 14000, 3500, 0, -1, -1, 54, 0, 333, 270, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20070, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16219, 8, 9, 8, 'Formula: Enchant Gloves - Greater Agility', '', 7798, 2, 64, 1, 14000, 3500, 0, -1, -1, 54, 0, 333, 270, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20071, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16220, 8, 9, 8, 'Formula: Enchant Boots - Spirit', '', 7798, 2, 64, 1, 16000, 4000, 0, -1, -1, 55, 0, 333, 275, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20072, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16221, 8, 9, 8, 'Formula: Enchant Chest - Major Health', '', 7798, 1, 64, 1, 16000, 4000, 0, -1, -1, 55, 0, 333, 275, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20073, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16222, 8, 9, 8, 'Formula: Enchant Shield - Superior Spirit', '', 7798, 2, 64, 1, 20000, 5000, 0, -1, -1, 56, 0, 333, 280, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20074, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16223, 8, 9, 8, 'Formula: Enchant Weapon - Icy Chill', '', 7798, 2, 64, 1, 20000, 5000, 0, -1, -1, 57, 0, 333, 285, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20075, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16224, 8, 9, 8, 'Formula: Enchant Cloak - Superior Defense', '', 7798, 1, 64, 1, 20000, 5000, 0, -1, -1, 57, 0, 333, 285, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20076, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16242, 8, 9, 8, 'Formula: Enchant Chest - Major Mana', '', 7798, 2, 64, 1, 22000, 5500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20077, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16243, 8, 9, 8, 'Formula: Runed Arcanite Rod', '', 7798, 1, 64, 1, 22000, 5500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20078, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16244, 8, 9, 8, 'Formula: Enchant Gloves - Greater Strength', '', 7798, 2, 64, 1, 24000, 6000, 0, 2047, 255, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20079, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16245, 8, 9, 8, 'Formula: Enchant Boots - Greater Agility', '', 7798, 2, 64, 1, 24000, 6000, 0, -1, -1, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20080, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16246, 8, 9, 8, 'Formula: Enchant Bracer - Superior Strength', '', 7798, 2, 64, 1, 24000, 6000, 0, -1, -1, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20081, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16247, 8, 9, 8, 'Formula: Enchant 2H Weapon - Superior Impact', '', 7798, 2, 64, 1, 24000, 6000, 0, -1, -1, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20082, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16248, 8, 9, 8, 'Formula: Enchant Weapon - Unholy', '', 7798, 2, 64, 1, 24000, 6000, 0, -1, -1, 59, 0, 333, 295, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20083, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16249, 8, 9, 8, 'Formula: Enchant 2H Weapon - Major Intellect', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20084, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16250, 8, 9, 8, 'Formula: Enchant Weapon - Superior Striking', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20085, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16251, 8, 9, 8, 'Formula: Enchant Bracer - Superior Stamina', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20086, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16252, 8, 9, 8, 'Formula: Enchant Weapon - Crusader', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 61, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20087, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16253, 8, 9, 8, 'Formula: Enchant Chest - Greater Stats', '', 7798, 2, 64, 1, 30000, 7500, 0, 2047, 255, 62, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20088, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16254, 8, 9, 8, 'Formula: Enchant Weapon - Lifestealing', '', 7798, 3, 64, 1, 30000, 7500, 0, -1, -1, 62, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20089, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(16255, 8, 9, 8, 'Formula: Enchant 2H Weapon - Major Spirit', '', 7798, 2, 64, 1, 30000, 7500, 0, -1, -1, 62, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20090, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(17725, 8, 9, 8, 'Formula: Enchant Weapon - Winter\'s Might', '', 11431, 2, 64, 1, 3000, 750, 0, 32767, -1, 38, 0, 333, 190, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21933, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(18259, 8, 9, 8, 'Formula: Enchant Weapon - Spell Power', '', 7798, 3, 64, 1, 30000, 7500, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22753, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(18260, 8, 9, 8, 'Formula: Enchant Weapon - Healing Power', '', 7798, 3, 64, 1, 30000, 7500, 0, 2047, 255, 60, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22754, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(19444, 8, 9, 8, 'Formula: Enchant Weapon - Strength', '', 7798, 1, 64, 1, 30000, 7500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 0, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23805, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(19445, 8, 9, 8, 'Formula: Enchant Weapon - Agility', '', 7798, 1, 64, 1, 30000, 7500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 576, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23806, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(19446, 8, 9, 8, 'Formula: Enchant Bracer - Mana Regeneration', '', 7798, 1, 64, 1, 30000, 7500, 0, -1, -1, 58, 0, 333, 290, 0, 0, 0, 529, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23807, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(19447, 8, 9, 8, 'Formula: Enchant Bracer - Healing', '', 7798, 1, 64, 1, 60000, 15000, 0, -1, -1, 64, 0, 333, 300, 0, 0, 0, 529, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23808, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(19448, 8, 9, 8, 'Formula: Enchant Weapon - Mighty Spirit', '', 7798, 1, 64, 1, 80000, 20000, 0, -1, -1, 66, 0, 333, 300, 0, 0, 0, 0, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23809, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(19449, 8, 9, 8, 'Formula: Enchant Weapon - Mighty Intellect', '', 7798, 1, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23810, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20725, 8, 7, 0, 'Nexus Crystal', '', 33448, 4, 0, 1, 60000, 0, 0, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20726, 8, 9, 8, 'Formula: Enchant Gloves - Threat', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25087, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20727, 8, 9, 8, 'Formula: Enchant Gloves - Shadow Power', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25088, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20728, 8, 9, 8, 'Formula: Enchant Gloves - Frost Power', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25089, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20729, 8, 9, 8, 'Formula: Enchant Gloves - Fire Power', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25090, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20730, 8, 9, 8, 'Formula: Enchant Gloves - Healing Power', '', 7798, 3, 64, 1, 100000, 25000, 0, -1, -1, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25091, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20731, 8, 9, 8, 'Formula: Enchant Gloves - Superior Agility', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25092, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20732, 8, 9, 8, 'Formula: Enchant Cloak - Greater Fire Resistance', '', 7798, 1, 64, 1, 100000, 25000, 0, -1, -1, 70, 0, 333, 300, 0, 0, 0, 609, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25093, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20733, 8, 9, 8, 'Formula: Enchant Cloak - Greater Nature Resistance', '', 7798, 1, 64, 1, 100000, 25000, 0, -1, -1, 70, 0, 333, 300, 0, 0, 0, 609, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25094, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20734, 8, 9, 8, 'Formula: Enchant Cloak - Stealth', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25095, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20735, 8, 9, 8, 'Formula: Enchant Cloak - Subtlety', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25096, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20736, 8, 9, 8, 'Formula: Enchant Cloak - Dodge', '', 7798, 3, 64, 1, 100000, 25000, 0, 2047, 255, 70, 0, 333, 300, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25097, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20752, 8, 9, 8, 'Formula: Minor Mana Oil', '', 11431, 1, 64, 1, 3000, 750, 0, -1, -1, 30, 0, 333, 150, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25133, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20753, 8, 9, 8, 'Formula: Lesser Wizard Oil', '', 11431, 1, 64, 1, 4000, 1000, 0, -1, -1, 40, 0, 333, 200, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25134, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20754, 8, 9, 8, 'Formula: Lesser Mana Oil', '', 11431, 1, 64, 1, 10000, 2500, 0, -1, -1, 50, 0, 333, 250, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25135, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20755, 8, 9, 8, 'Formula: Wizard Oil', '', 7798, 1, 64, 1, 20000, 5000, 0, -1, -1, 55, 0, 333, 275, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25136, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20756, 8, 9, 8, 'Formula: Brilliant Wizard Oil', '', 7798, 1, 64, 1, 40000, 10000, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 270, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25137, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20757, 8, 9, 8, 'Formula: Brilliant Mana Oil', '', 7798, 1, 64, 1, 40000, 10000, 0, -1, -1, 60, 0, 333, 300, 0, 0, 0, 270, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25138, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(20758, 8, 9, 8, 'Formula: Minor Wizard Oil', '', 11431, 1, 64, 1, 500, 125, 0, -1, -1, 15, 0, 333, 45, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25132, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 1);

-- Linked flight paths were added in 1.10, so transitions are useless prior to that.
UPDATE `taxi_path_transitions` SET `build_min`=5302 WHERE `build_min`=0;

-- Missing creature template used by Orange Murloc Egg.
INSERT INTO `creature_template` (`entry`, `patch`, `modelid_1`, `name`, `faction_A`, `faction_H`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `speed_walk`, `speed_run`, `scale`, `InhabitType`, `type`) VALUES (15361, 6, 15395, 'Murki', 188, 188, 1, 1, 1, 1, 1, 1.14286, 0, 3, 1);

-- Non existing models.
UPDATE `creature_model_info` SET `build`=5302 WHERE `modelid` IN (15947, 15965, 15966, 15967, 15968, 15972, 15974, 15975, 15976, 15977, 15979, 15980, 15981, 15982, 15985, 15987, 15991, 15993, 15994, 15995, 15996, 15997, 15998, 15999, 16000, 16003, 16004, 16017, 16018, 16019, 16020, 16021, 16022, 16023, 16025, 16031, 16185, 16186, 16187, 16189, 16257, 16259);

-- Remove redundant second faction column and fix wrong faction for some creatures.
ALTER TABLE `creature_template`
	DROP COLUMN `faction_A`;
ALTER TABLE `creature_template`
	CHANGE COLUMN `faction_H` `faction` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `armor`;
UPDATE `creature_template` SET `faction`=57 WHERE `entry`=2989;
UPDATE `creature_template` SET `faction`=57 WHERE `entry`=2990;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=3374;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=3375;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=3376;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=3377;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=3378;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=3392;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=3414;
UPDATE `creature_template` SET `faction`=151 WHERE `entry`=4923;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=5847;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=5848;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=5849;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=5851;
UPDATE `creature_template` SET `faction`=122 WHERE `entry`=6668;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=2673;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=2674;
UPDATE `creature_template` SET `faction`=104 WHERE `entry`=10427;
UPDATE `creature_template` SET `faction`=14 WHERE `entry`=12426;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=17209;

-- Creature spells that are wrong or have wrong patch.
UPDATE `creature_template` SET `spell1`=8427 WHERE `entry`=4719;
DELETE FROM `creature_template` WHERE `entry`=11373;
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (11373, 5, 0, 0, 14559, 0, 0, 0, 'Razzashi Cobra', NULL, 0, 60, 60, 20167, 20167, 0, 0, 3791, 28, 0, 1, 1.14286, 0, 20, 5, 0, 1, 1, 1061, 1204, 0, 272, 1, 1175, 2000, 1, 32832, 0, 0, 0, 0, 0, 0, 62.016, 85.272, 100, 1, 9, 11373, 0, 11373, 0, 15, 15, 15, 15, 15, 24097, 0, 0, 0, 113730, 0, 737, 967, '', 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `patch`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Detection`, `CallForHelp`, `Leash`, `rank`, `ExperienceMultiplier`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spells_template`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (11373, 8, 0, 0, 14559, 0, 0, 0, 'Razzashi Cobra', NULL, 0, 60, 60, 20167, 20167, 0, 0, 3791, 28, 0, 1, 1.14286, 0, 20, 5, 0, 1, 1, 1061, 1204, 0, 272, 1, 1175, 2000, 1, 32832, 0, 0, 0, 0, 0, 0, 62.016, 85.272, 100, 1, 9, 11373, 0, 11373, 0, 15, 15, 15, 15, 15, 24097, 27919, 0, 0, 113730, 0, 737, 967, '', 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '');
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE (`patch_min` < 5) && (`entry`=11373);
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=11373;
UPDATE `creature_addon` SET `patch`=5 WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=11373);
UPDATE `creature_template` SET `spell3`=0 WHERE `entry`=15863;
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=15328;
UPDATE `creature_template_addon` SET `patch`=8 WHERE `entry`=15328;
UPDATE `npc_trainer` SET `build_min`=5302 WHERE `spell`=27822;
UPDATE `npc_trainer` SET `build_min`=5302 WHERE `spell`=27875;
UPDATE `npc_trainer` SET `build_min`=5302 WHERE `spell`=27821;
UPDATE `npc_trainer` SET `build_min`=5302 WHERE `spell`=27796;
UPDATE `npc_trainer` SET `build_min`=5302 WHERE `spell`=27845;
UPDATE `npc_trainer` SET `build_min`=5302 WHERE `spell`=27876;
UPDATE `npc_trainer` SET `build_min`=5302 WHERE `spell`=27823;
UPDATE `npc_trainer` SET `build_min`=5302 WHERE `spell`=27843;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
