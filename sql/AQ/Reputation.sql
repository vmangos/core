-- factions: 609=CC, 910=brood

-- =================== AQ 40 =================================================================================================
-- ===========================================================================================================================
-- Anubisath Defender 100 rep with brood, 0 with CC
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15277';

-- Anubisath Sentinel 100 rep with brood, 0 with CC
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15264';

-- Obsidian Eradicator 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15262';

-- Qiraji Lasher 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15249';

-- Vekniss Solider 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15229';
 
-- Vekniss Stinger 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15235';

-- Vekniss Warrior 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15230';

-- Vekniss Wasp 100 rep with brood, 0 with CC
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15236';

-- Vekniss hive crawler 100 rep with brood, 0 with CC
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15240';
  
-- C'thun gives 2500rep until exalted with brood, and 500 with cenarion circle
DELETE FROM creature_onkill_reputation where creature_id = 15727;
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) 
VALUES ('15727', '910', '609', '7', '0', '2500', '7', '0', '500', '0');

-- Shows rep of cthun and above mentioned trashmobs
-- SELECT * FROM creature_onkill_reputation where creature_id IN (15727, 15277, 15264, 15262, 15249, 15229, 15235, 15230, 15236, 15240);

-- Twin emperors each give 210 rep, seems about right.
-- SELECT * FROM creature_onkill_reputation where creature_id IN (15276, 15275);

-- No bosses except cthun and twins should give rep with brood, can controll with this select
-- SELECT * FROM creature_onkill_reputation where creature_id IN (15263, 15544, 15510, 15299, 15509, 15516, 15517, 15543, 15511);

-- Everything above is mentioned on wowwiki, hive crawlers are additionally mentioned here:
-- http://wow.gamepedia.com/Brood_of_Nozdormu also mentions Vekniss hive crawler:



-- ================ AQ 20 ===================================================================================================
-- ==========================================================================================================================
-- AQ20 bosses gives 300 (600 ossirian) according to http://wowwiki.wikia.com/wiki/Cenarion_Circle_reputation_guide
-- but if you check each individual boss they are said to give 150CC and 50 Brood rep (100/300 Ossirian). Presumably
-- the latter is a pre-"nerf" value. I am unable to find anything about when they stop giving rep, other than wowwiki
-- saying they give rep with both CC and Brood until exalted.

-- buru 15370
-- moam 15340
-- kurinaxx 15348
-- ayamiss 15369
-- ossirian 15339
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='50', `RewOnKillRepValue2`='150' WHERE `creature_id`='15370';
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='50', `RewOnKillRepValue2`='150' WHERE `creature_id`='15340';
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='50', `RewOnKillRepValue2`='150' WHERE `creature_id`='15348';
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='50', `RewOnKillRepValue2`='150' WHERE `creature_id`='15369';
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='300' WHERE `creature_id`='15339';
 -- SELECT * FROM creature_onkill_reputation where creature_id IN (15370, 15340, 15348, 15369, 15339);

-- C'thuns legacy gives 500 CC rep and 500 Brood rep.
UPDATE `mangos`.`quest_template` SET `RewRepFaction2`='910', `RewRepValue1`='500', `RewRepValue2`='500' WHERE `entry`='8801';

-- The Saviour of Kalimdor gives 500 CC rep and 1000 Brood rep.
UPDATE `mangos`.`quest_template` SET `RewRepFaction2`='910', `RewRepValue1`='500', `RewRepValue2`='1000' WHERE `entry`='8802';
