DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210204225833');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210204225833');
-- Add your query below.

UPDATE `locales_broadcast_text` SET `male_text_loc3`='Ich brauche Hilfe. $n hat mich gesehen.' WHERE `entry`=488;  
UPDATE `locales_broadcast_text` SET `male_text_loc3`='$n will mich töten! Hilfe!' WHERE `entry`=490;
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Wir werden belagert! Zu den Waffen! Tötet $n!' WHERE `entry`=497;
UPDATE `locales_broadcast_text` SET `male_text_loc3`='$n! Von uns freigelegt! Ich brauche Hilfe beim Töten!' WHERE `entry`=939;
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Helft mir! $n will mich einfach nicht loslassen!' WHERE `entry`=940;  
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Ich habe so das Gefühl, dass $n auch hinter diesem rätselhaften Fossil her ist. Hilfe!' WHERE `entry`=941;  
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Könnt Ihr $n von mir wegbekommen?' WHERE `entry`=943;  
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Vorsicht! Ein $n greift uns an!' WHERE `entry`=1022; 
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Helft mir, $n von mir zu bekommen!' WHERE `entry`=1073; 
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Hilfe! Ein $n greift uns an!' WHERE `entry`=1074; 
UPDATE `locales_broadcast_text` SET `male_text_loc3`='$n greift mich an! Helft mir, es loszuwerden!' WHERE `entry`=1273;
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Da, $n! Kümmert Euch darum! Ich muss mich darauf vorbereiten, Naralex zu erwecken!' WHERE `entry`=1274;
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Ich werde mit diesem $n allein nicht fertig! Hilfe!' WHERE `entry`=1275;
UPDATE `locales_broadcast_text` SET `male_text_loc3`='$n ist zweifellos ein Diener aus Naralex Alptraum!' WHERE `entry`=1276;
UPDATE `locales_broadcast_text` SET `male_text_loc3`='Und $n kommt durch die erste Kurve!' WHERE `entry`=1517;
UPDATE `locales_broadcast_text` SET `male_text_loc3`='$n ist durch die zweite Kurve!' WHERE `entry`=1642;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
