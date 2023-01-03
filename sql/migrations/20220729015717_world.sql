DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220729015717');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220729015717');
-- Add your query below.


-- Correct PPM based on classic research by guybrush and magey.
UPDATE `item_template` SET `spellppmrate_1`=0.6 WHERE `entry`=17075; -- Vis'kag the Bloodletter
UPDATE `item_template` SET `spellppmrate_1`=0.8 WHERE `entry`=811; -- Axe of the Deep Woods
UPDATE `item_template` SET `spellppmrate_1`=0.8 WHERE `entry`=17068; -- Deathbringer
UPDATE `item_template` SET `spellppmrate_1`=0.8 WHERE `entry`=11684; -- Ironfoe
UPDATE `item_template` SET `spellppmrate_1`=1 WHERE `entry`=12798; -- Annihilator
UPDATE `item_template` SET `spellppmrate_1`=1 WHERE `entry`=12590; -- Felstriker
UPDATE `item_template` SET `spellppmrate_1`=1 WHERE `entry`=13286; -- Rivenspike
UPDATE `item_template` SET `spellppmrate_1`=1 WHERE `entry`=17705; -- Thrash Blade
UPDATE `item_template` SET `spellppmrate_1`=1.375 WHERE `entry`=19169; -- Nightfall
UPDATE `item_template` SET `spellppmrate_1`=1.8 WHERE `entry`=871; -- Flurry Axe
UPDATE `item_template` SET `spellppmrate_1`=2 WHERE `entry`=17076 && `patch`=8; -- Bonereaver's Edge
UPDATE `item_template` SET `spellppmrate_1`=2.15 WHERE `entry`=17073; -- Earthshaker

-- This shouldn't have PPM assigned.
UPDATE `item_template` SET `spellppmrate_1`=0 WHERE `entry`=18300; -- Hyjal Nectar


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
