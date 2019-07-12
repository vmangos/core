DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190711175327');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190711175327');
-- Add your query below.


-- Molten War Golem should have massive frost vulnerability.
-- https://www.wowhead.com/npc=8908/molten-war-golem#comments
-- Assuming the giant hits reported in wowhead comments were a
-- wotlk bug, because they are all from 2009/2010.
UPDATE `creature_template` SET `frost_res`=-140 WHERE `entry`=8908;

-- Tar mobs should have fire vulnerability.
-- https://classic.wowhead.com/npc=6517/tar-beast#comments
-- https://classic.wowhead.com/npc=6527/tar-creeper#screenshots
-- https://classic.wowhead.com/npc=6519/tar-lord#comments
-- https://classic.wowhead.com/npc=6518/tar-lurker#comments
UPDATE `creature_template` SET `fire_res`=-51 WHERE `entry` IN (6518, 6519, 6527, 6517);

-- Creatures with vulnerability in cmangos db.
UPDATE `creature_template` SET `frost_res`=-52 WHERE `entry`=8909;
UPDATE `creature_template` SET `fire_res`=-58 WHERE `entry`=11461;
UPDATE `creature_template` SET `fire_res`=-55 WHERE `entry`=11462;
UPDATE `creature_template` SET `fire_res`=-56 WHERE `entry`=11464;
UPDATE `creature_template` SET `fire_res`=-58 WHERE `entry`=11465;
UPDATE `creature_template` SET `frost_res`=-93 WHERE `entry`=11664;
UPDATE `creature_template` SET `frost_res`=-93 WHERE `entry`=11666;
UPDATE `creature_template` SET `frost_res`=-93 WHERE `entry`=11667;
UPDATE `creature_template` SET `frost_res`=-93 WHERE `entry`=11668;
UPDATE `creature_template` SET `frost_res`=-93 WHERE `entry`=12143;
UPDATE `creature_template` SET `frost_res`=-186 WHERE `entry`=12265;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
