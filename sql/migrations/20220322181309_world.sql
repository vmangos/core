SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220322181309');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220322181309');
-- Add your query below.


SET NAMES utf8;

-- New condition: fishing event has no winner
INSERT INTO `conditions` VALUES (7716, 11, 30056, 0, 0, 0, 0);

-- Events list for Jang
DELETE FROM `creature_ai_events` WHERE `creature_id`=15078;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1507801, 15078, 0, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1507801, 0, 0, 'Jang - Add Quest Flag'),
(1507802, 15078, 0, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1507802, 0, 0, 'Jang - Remove Quest Flag');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1507801, 1507802);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1507801, 0, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7715, 'Jang - Add Quest Flag'),
(1507802, 0, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7716, 'Jang - Remove Quest Flag');

UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15078;

-- Master Angler
UPDATE `locales_quest` SET `OfferRewardText_loc3`='Beeilt Euch und reicht die Fische ein, wenn Ihr den Titel des Meisteranglers erwerben wollt! Ich stehe hier schon seit STUNDEN ohne etwas zu essen! Gebt mir die Viecher schon her!' WHERE `entry`=8193;
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Heute zwischen 14 Uhr und 16 Uhr findet der Wettbewerb statt, der den besten Angler unter uns ermitteln wird! Seid die ERSTE PERSON, die mir 40 Leckerfische aus den Fischschwärmen der Gewässer des Schlingendorntals bringt und Ihr werdet der neue Meisterangler sein!$b$bFalls Ihr nicht als Erster hier sein solltet, wird Euch mein Lehrling hier mit Geld für jeden Stapel von 5 Leckerfischen belohnen.$b$bOh und beeilt Euch, Leckerfische werden schnell schlecht!' WHERE `entry`=8193;

-- Apprentice Angler
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Wir haben zwar schon einen Gewinner ermittelt, aber ich kaufe Euch dennoch Eure restlichen Leckerfische ab. Ich zahl\' Euch einen angemessenen Preis, na, was sagt Ihr!' WHERE `entry`=8194;

-- Arena Grandmaster
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Aye, Landratte! Bringt mir 12 Schmuckstücke des hiesigen Meisters der Arena und Ihr seid der neue Großmeister der Arena der Gurabashi! Arrrr!' WHERE `entry`=7838;

-- Quest [Could I get a Fishing Flier?] requires fishing skill of 150
UPDATE `quest_template` SET `RequiredSkillValue`=150 WHERE `entry` IN (8228, 8229);
-- Quest [Could I get a Fishing Flier?] german locales
UPDATE `locales_quest` SET `OfferRewardText_loc3`='Es wird diesen Sonntag einen Angelwettbewerb in Booty Bay geben! Hier sind die Regeln für den Wettbewerb, falls Ihr daran teilnehmen möchtet!' WHERE `entry`=8228;
UPDATE `locales_quest` SET `OfferRewardText_loc3`='Es wird einen Angelwettbewerb in Booty Bay geben, diesen Sonntag! Hier sind die Regeln für Euch!' WHERE `entry`=8229;

-- School of Tastyfish: rare fish drop rate https://classic.wowhead.com/item=19803/brownells-blue-striped-racer#comments
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=0.2 WHERE `entry`=17280  AND `item` IN (19803, 19805, 19806, 19808);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
