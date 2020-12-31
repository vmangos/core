DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200211175100');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200211175100');
-- Add your query below.

UPDATE `locales_quest` SET `RequestItemsText_loc3`="Diese Narren... Sie schaufeln sich fröhlich ihre eigenen Gräber." WHERE `entry`=381;
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Wie läuft es mit Eurem Auftrag, $N? " WHERE `entry`=382;
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Wenn ich mein getreues Gewehr bei mir hätte, wärt Ihr so gut wie tot, $C. Wartet nur, bis die Dampfpanzerbrigade hier anrückt, um mich zu befreien! " WHERE `entry`=492;
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Habt Ihr die sterblichen Überreste der Agamands? Sind diese verfluchten Bestien endlich vernichtet? " WHERE `entry`=354;
UPDATE `locales_quest` SET `RequestItemsText_loc3`="$N, habt Ihr das Buch beschafft? " WHERE `entry`=357;

UPDATE `locales_quest` SET `OfferRewardText_loc3`="Sehr gut, $N. Ich werde dieses Buch studieren und die Identität des Lichs herausfinden. Ihr habt Eurer Königin gut gedient.$b$bErstaunlich! Das Buch, das Ihr besorgt habt, gehört keinem Geringeren als Gunther Arcanus!$b$bGunther war ein bewanderter Totenbeschwörer im Leben; er und ich waren Freunde und Waffengefährten, vor der Seuche. Und nach diesem Buch zu urteilen, wurde er im Tode noch mächtiger.$b$bSeine Fähigkeiten wären ein großer Segen für uns." WHERE `entry`=357;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
