DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220322181309');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220322181309');
-- Add your query below.

-- Assign script to Jang
UPDATE `creature_template` SET `script_name`='npc_jang' WHERE `entry`=15078;

-- Master Angler
UPDATE `locales_quest` SET `OfferRewardText_loc3`='Beeilt Euch und reicht die Fische ein, wenn Ihr den Titel des Meisteranglers erwerben wollt! Ich stehe hier schon seit STUNDEN ohne etwas zu essen! Gebt mir die Viecher schon her!' WHERE `entry`=8193;
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Heute zwischen 14 Uhr und 16 Uhr findet der Wettbewerb statt, der den besten Angler unter uns ermitteln wird! Seid die ERSTE PERSON, die mir 40 Leckerfische aus den Fischschwärmen der Gewässer des Schlingendorntals bringt und Ihr werdet der neue Meisterangler sein!$b$bFalls Ihr nicht als Erster hier sein solltet, wird Euch mein Lehrling hier mit Geld für jeden Stapel von 5 Leckerfischen belohnen.$b$bOh und beeilt Euch, Leckerfische werden schnell schlecht!' WHERE `entry`=8193;

-- Apprentice Angler
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Wir haben zwar schon einen Gewinner ermittelt, aber ich kaufe Euch dennoch Eure restlichen Leckerfische ab. Ich zahl\' Euch einen angemessenen Preis, na, was sagt Ihr!' WHERE `entry`=8194;

-- Arena Grandmaster
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Aye, Landratte! Bringt mir 12 Schmuckstücke des hiesigen Meisters der Arena und Ihr seid der neue Großmeister der Arena der Gurabashi! Arrrr!' WHERE `entry`=7838;

-- Quest [Could I get a Fishing Flier?] requires fishing skill of 150
UPDATE `quest_template` SET `RequiredSkillValue`=150 WHERE `entry` IN (8228, 8229);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
