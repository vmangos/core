DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230526183338');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230526183338');
-- Add your query below.

-- AQ40 twin emperors room and trash mobs in their room give reputation with Cenarion Circle.
UPDATE `creature_onkill_reputation` SET `RewOnKillRepFaction2`=609, `MaxStanding2`=7, `RewOnKillRepValue2`=33 WHERE `creature_id`=15275; -- Emperor Vek'nilash
UPDATE `creature_onkill_reputation` SET `RewOnKillRepFaction2`=609, `MaxStanding2`=7, `RewOnKillRepValue2`=33 WHERE `creature_id`=15276; -- Emperor Vek'lor
INSERT INTO `creature_onkill_reputation` VALUES (15316, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Qiraji Scarab
INSERT INTO `creature_onkill_reputation` VALUES (15317, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Qiraji Scorpion

-- AQ20 second boss adds all give 5 reputation with Cenarion Circle.
INSERT INTO `creature_onkill_reputation` VALUES (15343, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Qiraji Swarmguard
INSERT INTO `creature_onkill_reputation` VALUES (15385, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Colonel Zerran
INSERT INTO `creature_onkill_reputation` VALUES (15386, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Major Yeggeth
INSERT INTO `creature_onkill_reputation` VALUES (15387, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Qiraji Warrior
INSERT INTO `creature_onkill_reputation` VALUES (15388, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Major Pakkon
INSERT INTO `creature_onkill_reputation` VALUES (15389, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Captain Drenn
INSERT INTO `creature_onkill_reputation` VALUES (15390, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Captain Xurrem
INSERT INTO `creature_onkill_reputation` VALUES (15391, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Captain Qeez
INSERT INTO `creature_onkill_reputation` VALUES (15392, 0, 609, 0, 7, 0, 5, 0, 0, 0, 0); -- Captain Tuubid

-- All mobs that currently give 3 reputation are AQ20 trash mobs. All of them except Flesh Hunter (15335) should give 5 reputation.
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`=5 WHERE `RewOnKillRepFaction1`=609 && `RewOnKillRepValue1`=3 && `creature_id`!=15335;
-- Affected IDS are 15168, 15318, 15319, 15320, 15323, 15324, 15325, 15327, 15333, 15335, 15336, 15338, 15461, 15462, 15505, 15521, 15537, 15538, 15555, 15934

-- AQ20 Bosses give too much reputation except Rajaxx who doesn't give any. Ossirian should give 100, all else give 50.
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue2`=100 WHERE `creature_id`=15339 AND `patch`=0; -- Ossirian
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue2`=50 WHERE `creature_id`=15348 AND `patch`=0; -- Kurinnaxx
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue2`=50 WHERE `creature_id`=15370 AND `patch`=0; -- Buru the Gorger
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue2`=50 WHERE `creature_id`=15340 AND `patch`=0; -- Moam
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue2`=50 WHERE `creature_id`=15369 AND `patch`=0; -- Ayamiss the Hunter
UPDATE `creature_onkill_reputation` SET `RewOnKillRepFaction2`=609, `MaxStanding2`=7, `RewOnKillRepValue2`=50 WHERE `creature_id`=15341 AND `patch`=0; -- General Rajaxx

-- This creature does not exist. Looks like a french version of Vem not used for anything?
DELETE FROM `creature_onkill_reputation` WHERE `creature_id`=15547;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
