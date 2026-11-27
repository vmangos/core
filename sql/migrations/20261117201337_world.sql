SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261117201337');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20261117201337');
-- Add your query below.


SET NAMES utf8;

-- Missing german quest texts (source: wowhead.com/classic/de)
UPDATE `locales_quest` SET `Title_loc3`='Verzweifeltes Gebet', `Details_loc3`='Gepriesen seien Elune und Euer Licht, $N.$B$BZurzeit erlernen viele unseres Ordens Fähigkeiten, die ihren Glauben an Elune widerspiegeln. Wenn ich mich nicht irre, gilt das Gleiche auch für Euren Orden.$B$BWenn Eure Angelegenheiten in Darnassus abgeschlossen sind, solltet Ihr eine Eurer Hohepriesterinnen zur weiteren Ausbildung aufsuchen.', `Objectives_loc3`='Sprecht mit der Hohepriesterin Laurena in Stormwind.' WHERE `entry`=5640;
UPDATE `locales_quest` SET `ObjectiveText2_loc3`='Öffnet Scharfschnabels Käfig.' WHERE `entry`=2994;
UPDATE `locales_quest` SET `ObjectiveText1_loc3`='Gackert für Gastwirt Firebrew wie ein Huhn' WHERE `entry`=8353;
UPDATE `locales_quest` SET `ObjectiveText1_loc3`='Gackert für Gastwirt Norman wie ein Huhn' WHERE `entry`=8354;
UPDATE `locales_quest` SET `ObjectiveText1_loc3`='Spielt einen "Zug" für Talvash' WHERE `entry`=8355;
UPDATE `locales_quest` SET `ObjectiveText1_loc3`='Gebt für Gastwirtin Allison mit Euren Muskeln an' WHERE `entry`=8356;
UPDATE `locales_quest` SET `ObjectiveText1_loc3`='Tanzt für Gastwirtin Saelienne' WHERE `entry`=8357;
UPDATE `locales_quest` SET `ObjectiveText1_loc3`='Spielt einen "Zug" für Kali Remik' WHERE `entry`=8358;
UPDATE `locales_quest` SET `ObjectiveText1_loc3`='Gebt für Gastwirtin Gryshka mit Euren Muskeln an' WHERE `entry`=8359;
UPDATE `locales_quest` SET `ObjectiveText1_loc3`='Tanzt für Gastwirtin Pala' WHERE `entry`=8360;

-- Missing german quest texts (not available on wowhead, translated manually)
UPDATE `locales_quest` SET `OfferRewardText_loc3`='Der Wind weht heftig vom Horizont her, die Erde unter Euren Füßen ist fest und Euer Geist ist bereits vom Feuer gewärmt... ich würde sagen, es ist an der Zeit, dass Ihr etwas über die Reinheit des Wassers lernt.$B$BEuer Weg hat Euch so weit gebracht und Euer Geist wird Euch die Kraft geben, noch weiter zu gehen. Doch den ersten Schritt müsst Ihr selbst machen.' WHERE `entry`=2986;
UPDATE `locales_quest` SET `EndText_loc3`='Tötet den Dämon der Kugel' WHERE `entry`=1955;
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Lagebericht?' WHERE `entry`=5081;
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Du hast einige fehlende Teile für die Quest, bitte geh und hol sie alle!' WHERE `entry`=9068;
UPDATE `locales_quest` SET `Details_loc3`='Ihr habt Euren Wert für unsere Bemühungen in der Warsongschlucht bewiesen. Unterstützt unsere Sache weiterhin und bringt mir mehr Verdienstabzeichen. Tut Ihr das, werdet Ihr Euch noch mehr unseres Vertrauens verdienen.', `Objectives_loc3`='Ihr habt für Eure letzte Aufgabe ein Verdienstabzeichen der Silverwing erhalten. Sprecht erneut mit mir, um Eure Belohnung zu erhalten.' WHERE `entry` IN (7886, 7887, 7888, 7921);
UPDATE `locales_quest` SET `Details_loc3`='Ihr habt Euren Wert für unsere Bemühungen in der Warsongschlucht bewiesen. Kämpft weiter mit aller Wut gegen die Schildwachen der Silverwing! Bringt mir mehr Ehrenabzeichen!', `Objectives_loc3`='Ihr habt für Eure letzte Aufgabe ein Ehrenabzeichen der Warsong erhalten. Sprecht erneut mit mir, um Eure Belohnung zu erhalten.' WHERE `entry` IN (7922, 7923, 7924, 7925);
UPDATE `locales_quest` SET `Details_loc3`='Ich weiß, dass es in der Warsongschlucht manchmal schwierig sein kann, als Sieger hervorzugehen. Dennoch ist Euer Einsatz für uns wichtig - selbst wenn der Sieg ausbleibt.$B$BSolltet Ihr eine der Prüfungen in der Warsongschlucht abschließen, ohne den Sieg zu erringen, erhaltet Ihr trotzdem ein Aufopferungsabzeichen der Warsongschlucht. Bringt es mir, damit die Warsongvorhut Euch für Euren Einsatz in unserem Namen belohnen kann... auch wenn Ihr diesmal nicht gewinnen konntet.', `Objectives_loc3`='Bringt das Aufopferungsabzeichen der Warsongschlucht zu Captain Shatterskull, damit die Warsongvorhut Euch für Euren Einsatz in unserem Namen belohnen kann.' WHERE `entry`=8267;
UPDATE `locales_quest` SET `Details_loc3`='Ich weiß, dass es in der Warsongschlucht manchmal schwierig sein kann, als Sieger hervorzugehen. Dennoch ist Euer Einsatz für uns wichtig - selbst wenn der Sieg ausbleibt.$B$BSolltet Ihr eine der Prüfungen in der Warsongschlucht abschließen, ohne den Sieg zu erringen, erhaltet Ihr trotzdem ein Aufopferungsabzeichen der Warsongschlucht. Bringt es mir, damit die Schildwachen Euch für Euren Einsatz in unserem Namen belohnen können... auch wenn Ihr diesmal nicht gewinnen konntet.', `Objectives_loc3`='Bringt das Aufopferungsabzeichen der Warsongschlucht zu Schildwache Farsong, damit die Schildwachen Euch für Euren Einsatz in unserem Namen belohnen können.' WHERE `entry`=8269;
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Ich darf mich nicht einmischen, $R.', `OfferRewardText_loc3`='Die Tragweite dieser Leistung darf nicht unterschätzt werden, $N. Ihr habt vollbracht, was die meisten für unmöglich gehalten hätten. Doch es war Schicksal. Der Stab hat seine Wahl getroffen...' WHERE `entry` IN (9257, 9269, 9270, 9271);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
