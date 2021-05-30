DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210521151218');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210521151218');
-- Add your query below.


-- Tangled Horror is using wrong spell id for Wild Regeneration.
DELETE FROM `creature_ai_events` WHERE `creature_id`=766;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (76601, 766, 0, 2, 0, 100, 1, 30, 0, 20000, 25000, 76601, 0, 0, 'Tangled Horror - Cast Wild Regeneration at 30% HP');
UPDATE `creature_ai_scripts` SET `datalong`=7948 WHERE `command`=15 && `id`=76601 && `datalong`=9616;

-- Scarlet Vanguard is using wrong spell id for Shield Bash.
UPDATE `creature_ai_scripts` SET `datalong`=72 WHERE `command`=15 && `id`=154003 && `datalong`=11972;

-- Vile Fin Minor Oracle is using wrong spell id for Lightning Shield.
DELETE FROM `creature_ai_events` WHERE `creature_id`=1544;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (154401, 1544, 0, 27, 0, 100, 1, 324, 1, 15000, 30000, 154401, 0, 0, 'Vile Fin Minor Oracle - Cast Lightning Shield on Missing Buff');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (154402, 1544, 0, 1, 0, 100, 1, 1000, 1000, 600000, 600000, 154402, 0, 0, 'Vile Fin Minor Oracle - Cast Lightning Shield on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (154403, 1544, 0, 2, 0, 100, 0, 15, 0, 0, 0, 154403, 0, 0, 'Vile Fin Minor Oracle - Flee at 15% HP');
UPDATE `creature_ai_scripts` SET `datalong`=324 WHERE `command`=15 && `id`=154401 && `datalong`=12550;
UPDATE `creature_ai_scripts` SET `datalong`=324 WHERE `command`=15 && `id`=154402 && `datalong`=12550;

-- Scarlet Paladin is using wrong spell id for Holy Light.
UPDATE `creature_ai_scripts` SET `datalong`=15493 WHERE `command`=15 && `id`=183403 && `datalong`=13952;

-- Scarlet Cavalier is using wrong spell id for Knockdown.
UPDATE `creature_ai_scripts` SET `datalong`=13360 WHERE `command`=15 && `id`=183602 && `datalong`=18812;

-- Grand Inquisitor Isillien is using wrong spell id for Dominate Mind.
UPDATE `creature_ai_scripts` SET `datalong`=14515 WHERE `command`=15 && `id`=184001 && `datalong`=20604;

-- Dun Garok Mountaineer is using wrong spell id for Devotion Aura.
UPDATE `creature_ai_scripts` SET `datalong`=8258 WHERE `command`=15 && `id`=234401 && `datalong`=643;

-- Shadowy Assassin is using wrong spell id for Stealth.
UPDATE `creature_ai_scripts` SET `datalong`=1785 WHERE `command`=15 && `id`=243401 && `datalong`=1786;

-- Vilebranch Hideskinner is using wrong spell id for Backstab.
UPDATE `creature_ai_scripts` SET `datalong`=15657 WHERE `command`=15 && `id`=264401 && `datalong`=7159;

-- Vilebranch Aman'zasi Guard is using wrong spell id for Shield Slam.
UPDATE `creature_ai_scripts` SET `datalong`=15655 WHERE `command`=15 && `id`=264801 && `datalong`=8242;

-- Shadowforge Chanter is using wrong spell id for Sleep.
UPDATE `creature_ai_scripts` SET `datalong`=700 WHERE `command`=15 && `id`=274203 && `datalong`=15970;

-- Firemane Scalebane is using wrong spell id for Sunder Armor.
DELETE FROM `creature_ai_events` WHERE `creature_id`=4328;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (432801, 4328, 0, 4, 0, 100, 0, 0, 0, 0, 0, 432801, 0, 0, 'Firemane Scalebane - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (432802, 4328, 0, 0, 0, 100, 1, 1000, 1000, 600000, 600000, 432802, 0, 0, 'Firemane Scalebane - Cast Fire Shield on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (432803, 4328, 0, 9, 5, 100, 1, 0, 5, 5000, 9000, 432803, 0, 0, 'Firemane Scalebane - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (432804, 4328, 0, 24, 5, 100, 1, 8380, 5, 5000, 5000, 432804, 0, 0, 'Firemane Scalebane - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (432805, 4328, 0, 28, 3, 100, 1, 8380, 1, 5000, 5000, 432805, 0, 0, 'Firemane Scalebane - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (432807, 4328, 0, 27, 0, 100, 1, 18968, 1, 15000, 30000, 432807, 0, 0, 'Firemane Scalebane - Cast Fire Shield on Missing Buff');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (432808, 4328, 0, 7, 0, 100, 0, 0, 0, 0, 0, 432808, 0, 0, 'Firemane Scalebane - Set Phase to 0 on Evade');
UPDATE `creature_ai_scripts` SET `datalong`=8380 WHERE `command`=15 && `id`=432803 && `datalong`=11971;

-- Strashaz Myrmidon is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15754 WHERE `command`=15 && `id`=436801 && `datalong`=15284;

-- Vilebranch Warrior is using wrong spell id for Strike.
UPDATE `creature_ai_scripts` SET `datalong`=12057 WHERE `command`=15 && `id`=446501 && `datalong`=11976;

-- Agam'ar is using wrong spell id for Rushing Charge.
UPDATE `creature_ai_scripts` SET `datalong`=6268 WHERE `command`=15 && `id`=451101 && `datalong`=8260;

-- Tamed Battleboar is using wrong spell id for Rushing Charge.
UPDATE `creature_ai_scripts` SET `datalong`=6268 WHERE `command`=15 && `id`=453501 && `datalong`=8260;

-- Shadowforge Digger is using wrong spell id for Sunder Armor.
DELETE FROM `creature_ai_events` WHERE `creature_id`=4846;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (484601, 4846, 0, 4, 0, 100, 0, 0, 0, 0, 0, 484601, 0, 0, 'Shadowforge Digger - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (484602, 4846, 0, 9, 5, 100, 1, 0, 5, 5900, 11200, 484602, 0, 0, 'Shadowforge Digger - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (484603, 4846, 0, 24, 5, 100, 1, 8380, 5, 5000, 5000, 484603, 0, 0, 'Shadowforge Digger - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (484604, 4846, 0, 28, 3, 100, 1, 8380, 1, 5000, 5000, 484604, 0, 0, 'Shadowforge Digger - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (484605, 4846, 0, 2, 0, 100, 0, 15, 0, 0, 0, 484605, 0, 0, 'Shadowforge Digger - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (484606, 4846, 0, 7, 0, 100, 0, 0, 0, 0, 0, 484606, 0, 0, 'Shadowforge Digger - Set Phase to 0 on Evade');
UPDATE `creature_ai_scripts` SET `datalong`=8380 WHERE `command`=15 && `id`=484602 && `datalong`=11971;

-- Sprite Darter is using wrong spell id for Mana Burn.
UPDATE `creature_ai_scripts` SET `datalong`=11981 WHERE `command`=15 && `id`=527801 && `datalong`=17630;

-- Sandfury Hideskinner is using wrong spell id for Backstab.
UPDATE `creature_ai_scripts` SET `datalong`=15657 WHERE `command`=15 && `id`=564502 && `datalong`=7159;

-- Twilight Dark Shaman is using wrong spell id for Shock.
UPDATE `creature_ai_scripts` SET `datalong`=15500 WHERE `command`=15 && `id`=586001 && `datalong`=11824;

-- Twilight Dark Shaman is using wrong spell id for Healing Wave.
UPDATE `creature_ai_scripts` SET `datalong`=12491 WHERE `command`=15 && `id`=586003 && `datalong`=11986;

-- Ashmane Boar is using wrong spell id for Fire Shield.
UPDATE `creature_ai_scripts` SET `datalong`=18968 WHERE `command`=15 && `id`=599201 && `datalong`=11351;

-- Black Wyrmkin is using wrong spell id for Fire Nova.
UPDATE `creature_ai_scripts` SET `datalong`=12470 WHERE `command`=15 && `id`=704101 && `datalong`=11969;

-- Jadefire Betrayer is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=5532 WHERE `command`=15 && `id`=710801 && `datalong`=15584;

-- Vile Priestess Hexx is using wrong spell id for Shadow Word: Pain.
UPDATE `creature_ai_scripts` SET `datalong`=15654 WHERE `command`=15 && `id`=799501 && `datalong`=11639;

-- Vile Priestess Hexx is using wrong spell id for Heal.
UPDATE `creature_ai_scripts` SET `datalong`=15586 WHERE `command`=15 && `id`=799503 && `datalong`=11642;

-- Chronalis is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=17685 WHERE `command`=15 && `id`=819701 && `datalong`=15584;

-- Anvilrage Officer is using wrong spell id for Divine Shield.
UPDATE `creature_ai_scripts` SET `datalong`=13874 WHERE `command`=15 && `id`=889501 && `datalong`=1020;

-- Anvilrage Marshal is using wrong spell id for Holy Light.
UPDATE `creature_ai_scripts` SET `datalong`=15493 WHERE `command`=15 && `id`=889802 && `datalong`=25292;

-- Scarshield Grunt is using wrong spell id for Strike.
UPDATE `creature_ai_scripts` SET `datalong`=12057 WHERE `command`=15 && `id`=904301 && `datalong`=11976;

-- Scarshield Raider is using wrong spell id for Strike.
UPDATE `creature_ai_scripts` SET `datalong`=12057 WHERE `command`=15 && `id`=925801 && `datalong`=11976;

-- Bloodaxe Raider is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15663 WHERE `command`=15 && `id`=969205 && `datalong`=15284;

-- Plague Ghoul is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15613 WHERE `command`=15 && `id`=1040502 && `datalong`=15584;

-- Grimtotem Geomancer is using wrong spell id for Fireball.
UPDATE `creature_ai_scripts` SET `datalong`=20811 WHERE `command`=15 && `id`=1076002 && `datalong`=8400;

-- Gordok Enforcer is using wrong spell id for Strike.
UPDATE `creature_ai_scripts` SET `datalong`=12057 WHERE `command`=15 && `id`=1144002 && `datalong`=11976;

-- Gordok Reaver is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15754 WHERE `command`=15 && `id`=1145005 && `datalong`=15284;

-- Captain Galvangar is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15754 WHERE `command`=15 && `id`=1194703 && `datalong`=15284;

-- Captain Balinda Stonehearth is using wrong spell id for Fireball.
UPDATE `creature_ai_scripts` SET `datalong`=12466 WHERE `command`=15 && `id`=1194902 && `datalong`=17290;

-- Captain Balinda Stonehearth is using wrong spell id for Fireball.
UPDATE `creature_ai_scripts` SET `datalong`=12466 WHERE `command`=15 && `id`=1194903 && `datalong`=17290;

-- Captain Balinda Stonehearth is using wrong spell id for Arcane Explosion.
UPDATE `creature_ai_scripts` SET `datalong`=13745 WHERE `command`=15 && `id`=1194911 && `datalong`=26192;

-- Lava Surger is using wrong spell id for Surge.
UPDATE `creature_ai_scripts` SET `datalong`=19196 WHERE `command`=15 && `id`=1210101 && `datalong`=25787;

-- Cavern Shambler is using wrong spell id for Knockdown.
UPDATE `creature_ai_scripts` SET `datalong`=16790 WHERE `command`=15 && `id`=1222401 && `datalong`=11428;

-- Razorlash is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=11427 WHERE `command`=15 && `id`=1225802 && `datalong`=15584;

-- Death Talon Overseer is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15754 WHERE `command`=15 && `id`=1246101 && `datalong`=15284;

-- Death Talon Captain is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15622 WHERE `command`=15 && `id`=1246702 && `datalong`=19983;

-- Bloodfury Ripper is using wrong spell id for Rend.
UPDATE `creature_ai_scripts` SET `datalong`=13445 WHERE `command`=15 && `id`=1257901 && `datalong`=13443;

-- Officer Jaxon is using wrong spell id for Sunder Armor.
DELETE FROM `creature_ai_events` WHERE `creature_id`=14423;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1442302, 14423, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1442302, 0, 0, 'Officer Jaxon - Set Phase 1 on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1442303, 14423, 0, 9, 5, 100, 1, 0, 5, 5000, 9000, 1442303, 0, 0, 'Officer Jaxon - Cast Sunder Armor (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1442304, 14423, 0, 24, 5, 100, 1, 15572, 5, 5000, 5000, 1442304, 0, 0, 'Officer Jaxon - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1442305, 14423, 0, 28, 3, 100, 1, 15572, 1, 5000, 5000, 1442305, 0, 0, 'Officer Jaxon - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1442306, 14423, 0, 9, 0, 100, 1, 0, 30, 7000, 12000, 1442306, 0, 0, 'Officer Jaxon - Cast Hooked Net');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1442307, 14423, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1442307, 0, 0, 'Officer Jaxon - Set Phase to 0 on Evade');
UPDATE `creature_ai_scripts` SET `datalong`=15572 WHERE `command`=15 && `id`=1442303 && `datalong`=21081;
UPDATE `creature_ai_scripts` SET `datalong`=15572 WHERE `command`=15 && `id`=1443903 && `datalong`=21081;

-- Dun Baldar North Marshal is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15579 WHERE `command`=15 && `id`=1476202 && `datalong`=15284;

-- Dun Baldar South Marshal is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15579 WHERE `command`=15 && `id`=1476302 && `datalong`=15284;

-- Icewing Marshal is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15579 WHERE `command`=15 && `id`=1476402 && `datalong`=15284;

-- Stonehearth Marshal is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15579 WHERE `command`=15 && `id`=1476502 && `datalong`=15284;

-- East Frostwolf Warmaster is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15579 WHERE `command`=15 && `id`=1477202 && `datalong`=15284;

-- Iceblood Warmaster is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15579 WHERE `command`=15 && `id`=1477302 && `datalong`=15284;

-- Tower Point Warmaster is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15579 WHERE `command`=15 && `id`=1477602 && `datalong`=15284;

-- West Frostwolf Warmaster is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15579 WHERE `command`=15 && `id`=1477702 && `datalong`=15284;

-- Cenarion Hold Infantry is using wrong spell id for Summon Player.
UPDATE `creature_ai_scripts` SET `datalong`=26229 WHERE `command`=15 && `id`=1518404 && `datalong`=20477;

-- High Marshal Whirlaxis is using wrong spell id for Lightning Shield.
UPDATE `creature_ai_scripts` SET `datalong`=20545 WHERE `command`=15 && `id`=1520402 && `datalong`=25020;

-- Vekniss Soldier is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=11427 WHERE `command`=15 && `id`=1522903 && `datalong`=15584;

-- Anubisath Defender is using wrong spell id for Enrage.
UPDATE `creature_ai_scripts` SET `datalong`=8269 WHERE `command`=15 && `id`=1527705 && `datalong`=14204;

-- Anubisath Defender is using wrong spell id for Enrage.
UPDATE `creature_ai_scripts` SET `datalong`=8269 WHERE `command`=15 && `id`=1527713 && `datalong`=14204;

-- Anubisath Defender is using wrong spell id for Enrage.
UPDATE `creature_ai_scripts` SET `datalong`=8269 WHERE `command`=15 && `id`=1527721 && `datalong`=14204;

-- Anubisath Defender is using wrong spell id for Enrage.
UPDATE `creature_ai_scripts` SET `datalong`=8269 WHERE `command`=15 && `id`=1527729 && `datalong`=14204;

-- Anubisath Defender is using wrong spell id for Enrage.
UPDATE `creature_ai_scripts` SET `datalong`=8269 WHERE `command`=15 && `id`=1527737 && `datalong`=14204;

-- Anubisath Defender is using wrong spell id for Enrage.
UPDATE `creature_ai_scripts` SET `datalong`=8269 WHERE `command`=15 && `id`=1527745 && `datalong`=14204;

-- Anubisath Defender is using wrong spell id for Enrage.
UPDATE `creature_ai_scripts` SET `datalong`=8269 WHERE `command`=15 && `id`=1527753 && `datalong`=14204;

-- Anubisath Defender is using wrong spell id for Enrage.
UPDATE `creature_ai_scripts` SET `datalong`=8269 WHERE `command`=15 && `id`=1527761 && `datalong`=14204;

-- Major Yeggeth is using wrong spell id for Cleave.
UPDATE `creature_ai_scripts` SET `datalong`=15584 WHERE `command`=15 && `id`=1538601 && `datalong`=20691;

-- Shrieker Scarab is using wrong spell id for Berserker Charge.
UPDATE `creature_ai_scripts` SET `datalong`=22886 WHERE `command`=15 && `id`=1546102 && `datalong`=19471;

-- Spitting Scarab is using wrong spell id for Acid Spit.
UPDATE `creature_ai_scripts` SET `datalong`=24334 WHERE `command`=15 && `id`=1546201 && `datalong`=20657;

-- Sewage Slime is using wrong spell id for Disease Cloud.
UPDATE `creature_template` SET `auras`='28156', `ai_name`='' WHERE `entry`=16375;
DELETE FROM `creature_ai_events` WHERE `creature_id`=16375;
DELETE FROM `creature_ai_scripts` WHERE `id`=1637501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1637502;

-- Enraged Felguard is using wrong spell id for Fire Shield.
UPDATE `creature_ai_scripts` SET `datalong`=13377 WHERE `id`=1410106 && `datalong`=19626 && `command`=15;

-- Fallout Slime is using wrong spell id for Disease Cloud.
UPDATE `creature_template` SET `auras`=28156, `ai_name`='' WHERE `entry`=16290;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1629001);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16290;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
