DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200302101500');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200302101500');
-- Add your query below.

-- Escorting Erland
UPDATE `script_texts` SET content_loc3="Wir sollten zu den anderen gehen und die Wölfe da draußen im Auge behalten..." WHERE entry=-1000306;
UPDATE `script_texts` SET content_loc3="Gebt Acht, $N. Diese Wölfe halten sich oft unter den Bäumen versteckt." WHERE entry=-1000307;
UPDATE `script_texts` SET content_loc3="$C greift an!" WHERE entry=-1000308;
UPDATE `script_texts` SET content_loc3="Hilfe! Ich werde angegriffen!" WHERE entry=-1000309;
UPDATE `script_texts` SET content_loc3="Vorsicht! Ein $C ist hinter uns her!" WHERE entry=-1000310;
UPDATE `script_texts` SET content_loc3="Wir sind fast da!" WHERE entry=-1000311;
UPDATE `script_texts` SET content_loc3="Wir haben es geschafft! Danke, $N. Ohne Euch hätte ich es bis hierher nicht geschafft." WHERE entry=-1000312;
UPDATE `script_texts` SET content_loc3="Schön euch wiederzusehen, Erland. Wie lautet Euer Bericht?" WHERE entry=-1000313;
UPDATE `script_texts` SET content_loc3="Im Osten halten sich unzählige Wölfe auf und wer auch immer bei Maldens Obsthain lebte, ist fort." WHERE entry=-1000314;
UPDATE `script_texts` SET content_loc3="Wenn Ihr mich entschuldigen wollt, dann würde ich jetzt gerne mal nach Quinn sehen..." WHERE entry=-1000315;
UPDATE `script_texts` SET content_loc3="Hallo, Quinn. Wie geht es Euch?" WHERE entry=-1000316;
UPDATE `script_texts` SET content_loc3="Es ging mir schon besser. Ivar der Verfaulte hat mich überwältigt..." WHERE entry=-1000317;
UPDATE `script_texts` SET content_loc3="Seit in Zukunft vorsichtiger, Quinn. Dieses mal hattet Ihr Glück." WHERE entry=-1000318;

-- Pyrewood Ambush
UPDATE `script_texts` SET content_loc3="Haltet euch bereit, $N. Ich höre den Rat zurückkehren. Macht Euch für einen Hinterhalt bereit!" WHERE entry=-1000553;
UPDATE `script_texts` SET content_loc3="Gut gemacht. Ein Schlag für Arugal, kein Zeifel!" WHERE entry=-1000554;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;