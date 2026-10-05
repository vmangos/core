DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260810140059');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260810140059');
-- Add your query below.


-- Vilebranch Soul Eater
UPDATE `creature_template` SET `spell_list_id`=26470 WHERE `entry`=2647;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (26470, 'The Hinterlands - Vilebranch Soul Eater');
-- Spell: Dark Offering (7154)
UPDATE `creature_spells` SET `spellId_1`=7154, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=12, `delayRepeatMax_1`=15 WHERE `entry`=26470;
DELETE FROM `creature_ai_events` WHERE `id`=264702;
DELETE FROM `creature_ai_scripts` WHERE `id`=264702;

-- Shadowforge Chanter
UPDATE `creature_template` SET `spell_list_id`=27420 WHERE `entry`=2742;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (27420, 'Badlands - Shadowforge Chanter');
-- Spell: Renew (6077)
UPDATE `creature_spells` SET `spellId_1`=6077, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=18, `delayRepeatMax_1`=37 WHERE `entry`=27420;
DELETE FROM `creature_ai_events` WHERE `id`=274202;
DELETE FROM `creature_ai_scripts` WHERE `id`=274202;

-- Nethergarde Cleric
-- Spell: Heal (2054)
UPDATE `creature_spells` SET `spellId_2`=2054, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=16, `delayRepeatMax_2`=21 WHERE `entry`=60000;
DELETE FROM `creature_ai_events` WHERE `id`=600003;
DELETE FROM `creature_ai_scripts` WHERE `id`=600003;

-- Expeditionary Priest
UPDATE `creature_template` SET `spell_list_id`=143930 WHERE `entry`=14393;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (143930, 'Elwynn Forest - Expeditionary Priest');
-- Spell: Greater Heal (10965)
UPDATE `creature_spells` SET `spellId_1`=10965, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=6, `delayRepeatMax_1`=9 WHERE `entry`=143930;
DELETE FROM `creature_ai_events` WHERE `id`=1439300;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439300;

-- Scarlet Warder
-- Spell: Holy Light (15493)
UPDATE `creature_spells` SET `spellId_2`=15493, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=10, `delayRepeatMax_2`=18 WHERE `entry`=94470;
DELETE FROM `creature_ai_events` WHERE `id`=944703;
DELETE FROM `creature_ai_scripts` WHERE `id`=944703;

-- Arugal's Voidwalker
UPDATE `creature_template` SET `spell_list_id`=46270 WHERE `entry`=4627;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (46270, 'Shadowfang Keep - Arugal\'s Voidwalker');
-- Spell: Dark Offering (7154)
UPDATE `creature_spells` SET `spellId_1`=7154, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=7, `delayRepeatMax_1`=7 WHERE `entry`=46270;
DELETE FROM `creature_ai_events` WHERE `id`=462701;
DELETE FROM `creature_ai_scripts` WHERE `id`=462701;

-- Zul'Brin Warpbranch
-- Spell: Healing Wave (12491)
UPDATE `creature_spells` SET `spellId_2`=12491, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=10, `delayRepeatMax_2`=15 WHERE `entry`=108230;
DELETE FROM `creature_ai_events` WHERE `id`=1082304;
DELETE FROM `creature_ai_scripts` WHERE `id`=1082304;

-- Crimson Courier
-- Spell: Holy Light (15493)
UPDATE `creature_spells` SET `spellId_5`=15493, `castTarget_5`=17, `targetParam2_5`=0, `delayRepeatMin_5`=14, `delayRepeatMax_5`=18 WHERE `entry`=123370;
DELETE FROM `creature_ai_events` WHERE `id`=1233707;
DELETE FROM `creature_ai_scripts` WHERE `id`=1233707;

-- Scarlet Trooper
-- Spell: Lay on Hands (17233)
UPDATE `creature_spells` SET `spellId_3`=17233, `castTarget_3`=17, `targetParam2_3`=80, `delayRepeatMin_3`=15, `delayRepeatMax_3`=20 WHERE `entry`=123520;
DELETE FROM `creature_ai_events` WHERE `id`=1235204;
DELETE FROM `creature_ai_scripts` WHERE `id`=1235204;

-- Stonesplinter Shaman
UPDATE `creature_template` SET `spell_list_id`=11970 WHERE `entry`=1197;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (11970, 'Loch Modan - Stonesplinter Shaman');
-- Spell: Healing Wave (547)
UPDATE `creature_spells` SET `spellId_1`=547, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=17, `delayRepeatMax_1`=36 WHERE `entry`=11970;
DELETE FROM `creature_ai_events` WHERE `id`=119702;
DELETE FROM `creature_ai_scripts` WHERE `id`=119702;

-- Grizlak
UPDATE `creature_template` SET `spell_list_id`=14250 WHERE `entry`=1425;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (14250, 'Loch Modan - Grizlak');
-- Spell: Renew (6074)
UPDATE `creature_spells` SET `spellId_1`=6074, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=20, `delayRepeatMax_1`=28 WHERE `entry`=14250;
DELETE FROM `creature_ai_events` WHERE `id`=142501;
DELETE FROM `creature_ai_scripts` WHERE `id`=142501;

-- Twilight Disciple
UPDATE `creature_template` SET `spell_list_id`=23380 WHERE `entry`=2338;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (23380, 'Darkshore - Twilight Disciple');
-- Spell: Heal (2054)
UPDATE `creature_spells` SET `spellId_1`=2054, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=21, `delayRepeatMax_1`=25 WHERE `entry`=23380;
DELETE FROM `creature_ai_events` WHERE `id`=233802;
DELETE FROM `creature_ai_scripts` WHERE `id`=233802;

-- Twilight Disciple
-- Spell: Renew (6074)
UPDATE `creature_spells` SET `spellId_2`=6074, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=18, `delayRepeatMax_2`=21 WHERE `entry`=23380;
DELETE FROM `creature_ai_events` WHERE `id`=233801;
DELETE FROM `creature_ai_scripts` WHERE `id`=233801;

-- Greymist Seer
UPDATE `creature_template` SET `spell_list_id`=22030 WHERE `entry`=2203;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (22030, 'Darkshore - Greymist Seer');
-- Spell: Healing Wave (547)
UPDATE `creature_spells` SET `spellId_1`=547, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=16, `delayRepeatMax_1`=21 WHERE `entry`=22030;
DELETE FROM `creature_ai_events` WHERE `id`=220303;
DELETE FROM `creature_ai_scripts` WHERE `id`=220303;

-- Murloc Oracle
-- Spell: Renew (6074)
UPDATE `creature_spells` SET `spellId_2`=6074, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=48, `delayRepeatMax_2`=54 WHERE `entry`=5170;
DELETE FROM `creature_ai_events` WHERE `id`=51702;
DELETE FROM `creature_ai_scripts` WHERE `id`=51702;

-- Blackwood Ursa
UPDATE `creature_template` SET `spell_list_id`=21700 WHERE `entry`=2170;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (21700, 'Darkshore - Blackwood Ursa');
-- Spell: Rejuvenation (1058)
UPDATE `creature_spells` SET `spellId_1`=1058, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=18, `delayRepeatMax_1`=21 WHERE `entry`=21700;
DELETE FROM `creature_ai_events` WHERE `id`=217001;
DELETE FROM `creature_ai_scripts` WHERE `id`=217001;

-- Emeraldon Oracle
UPDATE `creature_template` SET `spell_list_id`=124760 WHERE `entry`=12476;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (124760, 'Ashenvale - Emeraldon Oracle');
-- Spell: Regrowth (20665)
UPDATE `creature_spells` SET `spellId_1`=20665, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=10, `delayRepeatMax_1`=15 WHERE `entry`=124760;
DELETE FROM `creature_ai_events` WHERE `id`=1247602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1247602;

-- Emeraldon Oracle
-- Spell: Rejuvenation (20664)
UPDATE `creature_spells` SET `spellId_2`=20664, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=8, `delayRepeatMax_2`=12 WHERE `entry`=124760;
DELETE FROM `creature_ai_events` WHERE `id`=1247601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1247601;

-- Gnarlpine Shaman
UPDATE `creature_template` SET `spell_list_id`=20090 WHERE `entry`=2009;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (20090, 'Teldrassil - Gnarlpine Shaman');
-- Spell: Healing Wave (332)
UPDATE `creature_spells` SET `spellId_1`=332, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=15, `delayRepeatMax_1`=21 WHERE `entry`=20090;
DELETE FROM `creature_ai_events` WHERE `id`=200901;
DELETE FROM `creature_ai_scripts` WHERE `id`=200901;

-- Vile Fin Oracle
UPDATE `creature_template` SET `spell_list_id`=19080 WHERE `entry`=1908;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (19080, 'Silverpine Forest - Vile Fin Oracle');
-- Spell: Healing Wave (913)
UPDATE `creature_spells` SET `spellId_1`=913, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=24, `delayRepeatMax_1`=33 WHERE `entry`=19080;
DELETE FROM `creature_ai_events` WHERE `id`=190802;
DELETE FROM `creature_ai_scripts` WHERE `id`=190802;

-- Twilight Acolyte
UPDATE `creature_template` SET `spell_list_id`=48090 WHERE `entry`=4809;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (48090, 'Blackfathom Deeps - Twilight Acolyte');
-- Spell: Renew (8362)
UPDATE `creature_spells` SET `spellId_1`=8362, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=18, `delayRepeatMax_1`=22 WHERE `entry`=48090;
DELETE FROM `creature_ai_events` WHERE `id`=480901;
DELETE FROM `creature_ai_scripts` WHERE `id`=480901;

-- Spirestone Battle Mage
-- Spell: Bloodlust (16170)
UPDATE `creature_spells` SET `spellId_2`=16170, `castTarget_2`=17, `targetParam2_2`=80, `delayRepeatMin_2`=20, `delayRepeatMax_2`=20 WHERE `entry`=91970;
DELETE FROM `creature_ai_events` WHERE `id`=919702;
DELETE FROM `creature_ai_scripts` WHERE `id`=919702;

-- Spirestone Mystic
-- Spell: Rejuvenation (15981)
UPDATE `creature_spells` SET `spellId_3`=15981, `castTarget_3`=17, `targetParam2_3`=20, `delayRepeatMin_3`=5, `delayRepeatMax_3`=10 WHERE `entry`=91980;
DELETE FROM `creature_ai_events` WHERE `id`=919803;
DELETE FROM `creature_ai_scripts` WHERE `id`=919803;

-- Spirestone Mystic
-- Spell: Healing Wave (15982)
UPDATE `creature_spells` SET `spellId_4`=15982, `castTarget_4`=17, `targetParam2_4`=0, `delayRepeatMin_4`=10, `delayRepeatMax_4`=15 WHERE `entry`=91980;
DELETE FROM `creature_ai_events` WHERE `id`=919804;
DELETE FROM `creature_ai_scripts` WHERE `id`=919804;

-- Smolderthorn Mystic
-- Spell: Chain Heal (15799)
UPDATE `creature_spells` SET `spellId_2`=15799, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=10, `delayRepeatMax_2`=15 WHERE `entry`=92390;
DELETE FROM `creature_ai_events` WHERE `id`=923902;
DELETE FROM `creature_ai_scripts` WHERE `id`=923902;

-- Scarlet Friar
UPDATE `creature_template` SET `spell_list_id`=15380 WHERE `entry`=1538;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (15380, 'Tirisfal Glades - Scarlet Friar');
-- Spell: Lesser Heal (2052)
UPDATE `creature_spells` SET `spellId_1`=2052, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=8, `delayRepeatMax_1`=12 WHERE `entry`=15380;
DELETE FROM `creature_ai_events` WHERE `id`=153803;
DELETE FROM `creature_ai_scripts` WHERE `id`=153803;

-- Warpwood Guardian
-- Spell: Regrowth (22373)
UPDATE `creature_spells` SET `spellId_3`=22373, `castTarget_3`=17, `targetParam2_3`=20, `delayRepeatMin_3`=9, `delayRepeatMax_3`=14 WHERE `entry`=114610;
DELETE FROM `creature_ai_events` WHERE `id`=1146103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146103;

-- Petrified Guardian
UPDATE `creature_template` SET `spell_list_id`=143030 WHERE `entry`=14303;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (143030, 'Dire Maul - Petrified Guardian');
-- Spell: Regrowth (22695)
UPDATE `creature_spells` SET `spellId_1`=22695, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=3, `delayRepeatMax_1`=7 WHERE `entry`=143030;
DELETE FROM `creature_ai_events` WHERE `id`=1430303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1430303;

-- Scholomance Acolyte
-- Spell: Dark Mending (17613)
UPDATE `creature_spells` SET `spellId_4`=17613, `castTarget_4`=17, `targetParam2_4`=0, `delayRepeatMin_4`=6, `delayRepeatMax_4`=12 WHERE `entry`=104710;
DELETE FROM `creature_ai_events` WHERE `id`=1047102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1047102;

-- Spectral Teacher
UPDATE `creature_template` SET `spell_list_id`=105000 WHERE `entry`=10500;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (105000, 'Scholomance - Spectral Teacher');
-- Spell: Arcane Focus (17633)
UPDATE `creature_spells` SET `spellId_1`=17633, `castTarget_1`=19, `delayInitialMin_1`=5, `delayInitialMax_1`=10, `delayRepeatMin_1`=5, `delayRepeatMax_1`=10 WHERE `entry`=105000;
DELETE FROM `creature_ai_events` WHERE `id`=1050002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1050002;

-- Shadowfang Wolfguard
UPDATE `creature_template` SET `spell_list_id`=38540 WHERE `entry`=3854;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (38540, 'Shadowfang Keep - Shadowfang Wolfguard');
-- Spell: Dark Restore (7106)
UPDATE `creature_spells` SET `spellId_1`=7106, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=21, `delayRepeatMax_1`=34 WHERE `entry`=38540;
DELETE FROM `creature_ai_events` WHERE `id`=385402;
DELETE FROM `creature_ai_scripts` WHERE `id`=385402;

-- Commander Springvale
UPDATE `creature_template` SET `spell_list_id`=42780 WHERE `entry`=4278;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (42780, 'Shadowfang Keep - Commander Springvale');
-- Spell: Holy Light (1026)
UPDATE `creature_spells` SET `spellId_1`=1026, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=12, `delayRepeatMax_1`=22 WHERE `entry`=42780;
DELETE FROM `creature_ai_events` WHERE `id`=427801;
DELETE FROM `creature_ai_scripts` WHERE `id`=427801;

-- Lord Grayson Shadowbreaker
UPDATE `creature_template` SET `spell_list_id`=9280 WHERE `entry`=928;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (9280, 'Stormwind City - Lord Grayson Shadowbreaker');
-- Spell: Holy Light (13952)
UPDATE `creature_spells` SET `spellId_1`=13952, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=8, `delayRepeatMax_1`=12 WHERE `entry`=9280;
DELETE FROM `creature_ai_events` WHERE `id`=92802;
DELETE FROM `creature_ai_scripts` WHERE `id`=92802;

-- Wyrmkin Dreamwalker
-- Spell: Rejuvenation (12160)
UPDATE `creature_spells` SET `spellId_3`=12160, `castTarget_3`=17, `targetParam2_3`=20, `delayRepeatMin_3`=12, `delayRepeatMax_3`=15 WHERE `entry`=7430;
DELETE FROM `creature_ai_events` WHERE `id`=74303;
DELETE FROM `creature_ai_scripts` WHERE `id`=74303;

-- Murta Grimgut
-- Spell: Renew (11640)
UPDATE `creature_spells` SET `spellId_2`=11640, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=45, `delayRepeatMax_2`=60 WHERE `entry`=76080;
DELETE FROM `creature_ai_events` WHERE `id`=760803;
DELETE FROM `creature_ai_scripts` WHERE `id`=760803;

-- Murta Grimgut
-- Spell: Heal (11642)
UPDATE `creature_spells` SET `spellId_3`=11642, `castTarget_3`=17, `targetParam2_3`=0, `delayRepeatMin_3`=45, `delayRepeatMax_3`=60 WHERE `entry`=76080;
DELETE FROM `creature_ai_events` WHERE `id`=760804;
DELETE FROM `creature_ai_scripts` WHERE `id`=760804;

-- Hakkari Blood Priest
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1134001, 1134002);
DELETE FROM `creature_ai_events` WHERE `creature_id`=11340;

-- Jademir Oracle
UPDATE `creature_template` SET `spell_list_id`=53170 WHERE `entry`=5317;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (53170, 'Feralas - Jademir Oracle');
-- Spell: Rejuvenation (20664)
UPDATE `creature_spells` SET `spellId_1`=20664, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=8, `delayRepeatMax_1`=12 WHERE `entry`=53170;
DELETE FROM `creature_ai_events` WHERE `id`=531701;
DELETE FROM `creature_ai_scripts` WHERE `id`=531701;

-- Jademir Oracle
-- Spell: Regrowth (20665)
UPDATE `creature_spells` SET `spellId_2`=20665, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=10, `delayRepeatMax_2`=15 WHERE `entry`=53170;
DELETE FROM `creature_ai_events` WHERE `id`=531702;
DELETE FROM `creature_ai_scripts` WHERE `id`=531702;

-- Verdantine Oracle
UPDATE `creature_template` SET `spell_list_id`=124780 WHERE `entry`=12478;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (124780, 'The Hinterlands - Verdantine Oracle');
-- Spell: Rejuvenation (20664)
UPDATE `creature_spells` SET `spellId_1`=20664, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=8, `delayRepeatMax_1`=12 WHERE `entry`=124780;
DELETE FROM `creature_ai_events` WHERE `id`=1247801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1247801;

-- Verdantine Oracle
-- Spell: Regrowth (20665)
UPDATE `creature_spells` SET `spellId_2`=20665, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=10, `delayRepeatMax_2`=15 WHERE `entry`=124780;
DELETE FROM `creature_ai_events` WHERE `id`=1247802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1247802;

-- Withered Mistress
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (148250, 'Zul\'Gurub - Withered Mistress', 24673, 100, 1, 0, 0, 0, 5, 15, 5, 15, 0, 24674, 100, 1, 0, 0, 0, 7, 12, 12, 17, 0, 17201, 100, 21, 0, 0, 0, 10, 15, 5, 15, 0, 24672, 100, 20, 0, 0, 0, 20, 20, 20, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Spell: Dispel Magic (17201)
DELETE FROM `creature_ai_events` WHERE `id`=1482504;
DELETE FROM `creature_ai_scripts` WHERE `id`=1482504;
-- Spell: Unholy Frenzy (24672)
DELETE FROM `creature_ai_events` WHERE `id`=1482503;
DELETE FROM `creature_ai_scripts` WHERE `id`=1482503;

-- Blackhand Dragon Handler
UPDATE `creature_template` SET `spell_list_id`=107420 WHERE `entry`=10742;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (107420, 'Blackrock Spire - Blackhand Dragon Handler');
-- Spell: Mend Dragon (16637)
UPDATE `creature_spells` SET `spellId_1`=16637, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=9, `delayRepeatMax_1`=14 WHERE `entry`=107420;
DELETE FROM `creature_ai_events` WHERE `id`=1074201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1074201;

-- Jammal'an the Prophet
-- Spell: Healing Wave (12492)
UPDATE `creature_spells` SET `spellId_3`=12492, `castTarget_3`=17, `targetParam2_3`=0, `delayRepeatMin_3`=3, `delayRepeatMax_3`=10 WHERE `entry`=57100;
DELETE FROM `creature_ai_events` WHERE `id`=571005;
DELETE FROM `creature_ai_scripts` WHERE `id`=571005;

-- Silver Hand Disciple
-- Spell: Holy Light (15493)
UPDATE `creature_spells` SET `spellId_2`=15493, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=15, `delayRepeatMax_2`=20 WHERE `entry`=109490;
DELETE FROM `creature_ai_events` WHERE `id`=1094902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094902;

-- Priestess of the Moon
UPDATE `creature_template` SET `spell_list_id`=156340 WHERE `entry`=15634;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (156340, 'Silithus - Priestess of the Moon');
-- Spell: Mass Healing (25839)
UPDATE `creature_spells` SET `spellId_1`=25839, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=50, `delayRepeatMax_1`=60 WHERE `entry`=156340;
DELETE FROM `creature_ai_events` WHERE `id`=1562911;
DELETE FROM `creature_ai_scripts` WHERE `id`=1562911;

-- Razormane Dustrunner
UPDATE `creature_template` SET `spell_list_id`=31130 WHERE `entry`=3113;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (31130, 'Durotar - Razormane Dustrunner');
-- Spell: Rejuvenation (774)
UPDATE `creature_spells` SET `spellId_1`=774, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=14, `delayRepeatMax_1`=21 WHERE `entry`=31130;
DELETE FROM `creature_ai_events` WHERE `id`=311302;
DELETE FROM `creature_ai_scripts` WHERE `id`=311302;

-- Dalaran Brewmaster
UPDATE `creature_template` SET `spell_list_id`=35770 WHERE `entry`=3577;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (35770, 'Silverpine Forest - Dalaran Brewmaster');
-- Spell: Potion Toss (7638)
UPDATE `creature_spells` SET `spellId_1`=7638, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=12, `delayRepeatMax_1`=18 WHERE `entry`=35770;
DELETE FROM `creature_ai_events` WHERE `id`=357701;
DELETE FROM `creature_ai_scripts` WHERE `id`=357701;

-- Scarlet Preserver
-- Spell: Holy Light (13952)
UPDATE `creature_spells` SET `spellId_2`=13952, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=12, `delayRepeatMax_2`=18 WHERE `entry`=42800;
DELETE FROM `creature_ai_events` WHERE `id`=428002;
DELETE FROM `creature_ai_scripts` WHERE `id`=428002;

-- Scarlet Protector
-- Spell: Holy Light (15493)
UPDATE `creature_spells` SET `spellId_2`=15493, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=13, `delayRepeatMax_2`=23 WHERE `entry`=42920;
DELETE FROM `creature_ai_events` WHERE `id`=429203;
DELETE FROM `creature_ai_scripts` WHERE `id`=429203;

-- Scarlet Chaplain
-- Spell: Renew (8362)
UPDATE `creature_spells` SET `spellId_2`=8362, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=22, `delayRepeatMax_2`=29 WHERE `entry`=42990;
DELETE FROM `creature_ai_events` WHERE `id`=429904;
DELETE FROM `creature_ai_scripts` WHERE `id`=429905;

-- Scarlet Abbot
UPDATE `creature_template` SET `spell_list_id`=43030 WHERE `entry`=4303;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (43030, 'Scarlet Monastery - Scarlet Abbot');
-- Spell: Heal (6064)
UPDATE `creature_spells` SET `spellId_1`=6064, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=13, `delayRepeatMax_1`=19 WHERE `entry`=43030;
DELETE FROM `creature_ai_events` WHERE `id`=430303;
DELETE FROM `creature_ai_scripts` WHERE `id`=430304;

-- Ward Guardian
UPDATE `creature_template` SET `spell_list_id`=44270 WHERE `entry`=4427;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (44270, 'Razorfen Kraul - Ward Guardian');
-- Spell: Healing Wave (959)
UPDATE `creature_spells` SET `spellId_1`=959, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=13, `delayRepeatMax_1`=18 WHERE `entry`=44270;
DELETE FROM `creature_ai_events` WHERE `id`=442701;
DELETE FROM `creature_ai_scripts` WHERE `id`=442701;

-- Death's Head Acolyte
UPDATE `creature_template` SET `spell_list_id`=45150 WHERE `entry`=4515;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (45150, 'Razorfen Kraul - Death\'s Head Acolyte');
-- Spell: Renew (8362)
UPDATE `creature_spells` SET `spellId_1`=8362, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=14, `delayRepeatMax_1`=19 WHERE `entry`=45150;
DELETE FROM `creature_ai_events` WHERE `id`=451502;
DELETE FROM `creature_ai_scripts` WHERE `id`=451502;

-- Gordunni Shaman
UPDATE `creature_template` SET `spell_list_id`=52360 WHERE `entry`=5236;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (52360, 'Feralas - Gordunni Shaman');
-- Spell: Healing Wave (8005)
UPDATE `creature_spells` SET `spellId_1`=8005, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=14, `delayRepeatMax_1`=18 WHERE `entry`=52360;
DELETE FROM `creature_ai_events` WHERE `id`=523603;
DELETE FROM `creature_ai_scripts` WHERE `id`=523603;

-- Hatecrest Screamer
-- Spell: Renew (6078)
UPDATE `creature_spells` SET `spellId_2`=6078, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=13, `delayRepeatMax_2`=16 WHERE `entry`=53350;
DELETE FROM `creature_ai_events` WHERE `id`=533502;
DELETE FROM `creature_ai_scripts` WHERE `id`=533502;

-- Northspring Harpy
UPDATE `creature_template` SET `spell_list_id`=53620 WHERE `entry`=5362;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (53620, 'Feralas - Northspring Harpy');
-- Spell: Flow of the Northspring (11014)
UPDATE `creature_spells` SET `spellId_1`=11014, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=15, `delayRepeatMax_1`=20 WHERE `entry`=53620;
DELETE FROM `creature_ai_events` WHERE `id`=536201;
DELETE FROM `creature_ai_scripts` WHERE `id`=536201;

-- Northspring Roguefeather
-- Spell: Flow of the Northspring (11014)
UPDATE `creature_spells` SET `spellId_2`=11014, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=15, `delayRepeatMax_2`=20 WHERE `entry`=53630;
DELETE FROM `creature_ai_events` WHERE `id`=536303;
DELETE FROM `creature_ai_scripts` WHERE `id`=536303;

-- Northspring Slayer
UPDATE `creature_template` SET `spell_list_id`=53640 WHERE `entry`=5364;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (53640, 'Feralas - Northspring Slayer');
-- Spell: Flow of the Northspring (11014)
UPDATE `creature_spells` SET `spellId_1`=11014, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=15, `delayRepeatMax_1`=20 WHERE `entry`=53640;
DELETE FROM `creature_ai_events` WHERE `id`=536402;
DELETE FROM `creature_ai_scripts` WHERE `id`=536402;

-- Sandfury Witch Doctor
-- Spell: Flash Heal (17843)
UPDATE `creature_spells` SET `spellId_2`=17843, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=18, `delayRepeatMax_2`=24 WHERE `entry`=56500;
DELETE FROM `creature_ai_events` WHERE `id`=565003;
DELETE FROM `creature_ai_scripts` WHERE `id`=565003;

-- Arkkoran Oracle
UPDATE `creature_template` SET `spell_list_id`=61380 WHERE `entry`=6138;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (61380, 'Azshara - Arkkoran Oracle');
-- Spell: Healing Wave (11986)
UPDATE `creature_spells` SET `spellId_1`=11986, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=16, `delayRepeatMax_1`=21 WHERE `entry`=61380;
DELETE FROM `creature_ai_events` WHERE `id`=613804;
DELETE FROM `creature_ai_scripts` WHERE `id`=613804;

-- Holdout Medic
UPDATE `creature_template` SET `spell_list_id`=63920 WHERE `entry`=6392;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (63920, 'Gnomeregan - Holdout Medic');
-- Spell: Renew (22168)
UPDATE `creature_spells` SET `spellId_1`=22168, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=12, `delayRepeatMax_1`=16 WHERE `entry`=63920;
DELETE FROM `creature_ai_events` WHERE `id`=639203;
DELETE FROM `creature_ai_scripts` WHERE `id`=639203;

-- Holdout Medic
-- Spell: Heal (22167)
UPDATE `creature_spells` SET `spellId_2`=22167, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=14, `delayRepeatMax_2`=21 WHERE `entry`=63920;
DELETE FROM `creature_ai_events` WHERE `id`=639204;
DELETE FROM `creature_ai_scripts` WHERE `id`=639204;

-- Deadwood Gardener
-- Spell: Rejuvenation (12160)
UPDATE `creature_spells` SET `spellId_2`=12160, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=14, `delayRepeatMax_2`=17 WHERE `entry`=71540;
DELETE FROM `creature_ai_events` WHERE `id`=715402;
DELETE FROM `creature_ai_scripts` WHERE `id`=715402;

-- Sandfury Soul Eater
-- Spell: Dark Offering (7154)
UPDATE `creature_spells` SET `spellId_2`=7154, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=10, `delayRepeatMax_2`=16 WHERE `entry`=72470;
DELETE FROM `creature_ai_events` WHERE `id`=724702;
DELETE FROM `creature_ai_scripts` WHERE `id`=724702;

-- Wandering Forest Walker
UPDATE `creature_template` SET `spell_list_id`=75840 WHERE `entry`=7584;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (75840, 'Feralas - Wandering Forest Walker');
-- Spell: Regrowth (16561)
UPDATE `creature_spells` SET `spellId_1`=16561, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=25, `delayRepeatMax_1`=31 WHERE `entry`=75840;
DELETE FROM `creature_ai_events` WHERE `id`=758401;
DELETE FROM `creature_ai_scripts` WHERE `id`=758401;

-- Vile Priestess Hexx
-- Spell: Heal (15586)
UPDATE `creature_spells` SET `spellId_2`=15586, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=12, `delayRepeatMax_2`=15 WHERE `entry`=79950;
DELETE FROM `creature_ai_events` WHERE `id`=799503;
DELETE FROM `creature_ai_scripts` WHERE `id`=799503;

-- Alexandra Blazen
UPDATE `creature_template` SET `spell_list_id`=83780 WHERE `entry`=8378;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (83780, 'Azshara - Alexandra Blazen');
-- Spell: Renew (11640)
UPDATE `creature_spells` SET `spellId_1`=11640, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=14, `delayRepeatMax_1`=18 WHERE `entry`=83780;
DELETE FROM `creature_ai_events` WHERE `id`=837802;
DELETE FROM `creature_ai_scripts` WHERE `id`=837802;

-- Scarshield Acolyte
-- Spell: Renew (8362)
UPDATE `creature_spells` SET `spellId_2`=8362, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=17, `delayRepeatMax_2`=24 WHERE `entry`=90450;
DELETE FROM `creature_ai_events` WHERE `id`=904503;
DELETE FROM `creature_ai_scripts` WHERE `id`=904503;

-- Moonkin Oracle
-- Spell: Regrowth (16561)
UPDATE `creature_spells` SET `spellId_2`=16561, `castTarget_2`=17, `targetParam2_2`=20, `delayRepeatMin_2`=25, `delayRepeatMax_2`=30 WHERE `entry`=101570;
DELETE FROM `creature_ai_events` WHERE `id`=1015703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1015703;

-- Crimson Defender
UPDATE `creature_template` SET `spell_list_id`=104210 WHERE `entry`=10421;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (104210, 'Stratholme - Crimson Defender');
-- Spell: Holy Light (15493)
UPDATE `creature_spells` SET `spellId_1`=15493, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=18, `delayRepeatMax_1`=25 WHERE `entry`=104210;
DELETE FROM `creature_ai_events` WHERE `id`=1042104;
DELETE FROM `creature_ai_scripts` WHERE `id`=1042104;

-- Scarlet Medic
UPDATE `creature_template` SET `spell_list_id`=106050 WHERE `entry`=10605;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (106050, 'Western Plaguelands - Scarlet Medic');
-- Spell: Renew (11640)
UPDATE `creature_spells` SET `spellId_1`=11640, `castTarget_1`=17, `targetParam2_1`=20, `delayRepeatMin_1`=16, `delayRepeatMax_1`=19 WHERE `entry`=106050;
DELETE FROM `creature_ai_events` WHERE `id`=1060501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1060501;

-- Scarlet Medic
-- Spell: Flash Heal (17137)
UPDATE `creature_spells` SET `spellId_2`=17137, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=12, `delayRepeatMax_2`=15 WHERE `entry`=106050;
DELETE FROM `creature_ai_events` WHERE `id`=1060502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1060502;

-- Malor the Zealous
UPDATE `creature_template` SET `spell_list_id`=110320 WHERE `entry`=11032;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (110320, 'Stratholme - Malor the Zealous');
-- Spell: Lay on Hands (10310)
UPDATE `creature_spells` SET `spellId_1`=10310, `castTarget_1`=17, `targetParam2_1`=80, `delayRepeatMin_1`=3600, `delayRepeatMax_1`=3600 WHERE `entry`=110320;
DELETE FROM `creature_ai_events` WHERE `id`=1103202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1103202;

-- Malor the Zealous
-- Spell: Holy Light (15493)
UPDATE `creature_spells` SET `spellId_2`=15493, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=14, `delayRepeatMax_2`=17 WHERE `entry`=110320;
DELETE FROM `creature_ai_events` WHERE `id`=1103204;
DELETE FROM `creature_ai_scripts` WHERE `id`=1103204;

-- Major Mattingly
UPDATE `creature_template` SET `spell_list_id`=143940 WHERE `entry`=14394;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (143940, 'Stormwind City - Major Mattingly');
-- Spell: Holy Light (15493)
UPDATE `creature_spells` SET `spellId_1`=15493, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=8, `delayRepeatMax_1`=12 WHERE `entry`=143940;
DELETE FROM `creature_ai_events` WHERE `id`=1439401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439401;

-- High Priestess Hai'watna
-- Spell: Healing Wave (15982)
UPDATE `creature_spells` SET `spellId_2`=15982, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=10, `delayRepeatMax_2`=20 WHERE `entry`=113830;
DELETE FROM `creature_ai_events` WHERE `id`=1138301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1138301;

-- Hakkari Oracle
-- Spell: Healing Wave (15982)
UPDATE `creature_spells` SET `spellId_3`=15982, `castTarget_3`=17, `targetParam2_3`=0, `delayRepeatMin_3`=15, `delayRepeatMax_3`=25 WHERE `entry`=113460;
DELETE FROM `creature_ai_events` WHERE `id`=1134601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1134601;

-- Kurzen Mindslave
UPDATE `creature_template` SET `spell_list_id`=63660 WHERE `entry`=6366;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (63660, 'Stranglethorn Vale - Kurzen Mindslave');
-- Spell: Heal (11642)
UPDATE `creature_spells` SET `spellId_1`=11642, `castTarget_1`=17, `targetParam2_1`=0, `delayRepeatMin_1`=15, `delayRepeatMax_1`=23 WHERE `entry`=63660;
DELETE FROM `creature_ai_events` WHERE `id`=636601;
DELETE FROM `creature_ai_scripts` WHERE `id`=636601;

-- Blackfathom Oracle
-- Spell: Healing Wave (11986)
UPDATE `creature_spells` SET `spellId_2`=11986, `castTarget_2`=17, `targetParam2_2`=0, `delayRepeatMin_2`=18, `delayRepeatMax_2`=24 WHERE `entry`=48030;
DELETE FROM `creature_ai_events` WHERE `id`=480302;
DELETE FROM `creature_ai_scripts` WHERE `id`=480302;

-- Assign probabilities to new spells.
UPDATE `creature_spells` SET `probability_3`=100 WHERE `entry`=123520;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=90450;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=5170;
UPDATE `creature_spells` SET `probability_3`=100 WHERE `entry`=7430;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=92390;
UPDATE `creature_spells` SET `probability_3`=100 WHERE `entry`=91980;
UPDATE `creature_spells` SET `probability_4`=100 WHERE `entry`=91980;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=76080;
UPDATE `creature_spells` SET `probability_3`=100 WHERE `entry`=76080;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=72470;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=42800;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=42920;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=42990;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=91970;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=53350;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=53630;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=56500;
UPDATE `creature_spells` SET `probability_3`=100 WHERE `entry`=57100;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=60000;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=71540;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=79950;
UPDATE `creature_spells` SET `probability_5`=100 WHERE `entry`=123370;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=94470;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=101570;
UPDATE `creature_spells` SET `probability_4`=100 WHERE `entry`=104710;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=108230;
UPDATE `creature_spells` SET `probability_2`=100 WHERE `entry`=109490;
UPDATE `creature_spells` SET `probability_3`=100 WHERE `entry`=114610;

-- Remove EventAI from npcs that no longer use it.
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` IN (743, 928, 5317, 7584, 9197, 9198, 10742, 11346, 11383, 12476, 12478, 14393, 14394, 14825, 15634);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
