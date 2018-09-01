DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180901035111');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180901035111');
-- Add your query below.


ALTER TABLE `creature_template`
	ADD COLUMN `Detection` FLOAT NOT NULL DEFAULT '20' AFTER `scale`,
	ADD COLUMN `CallForHelp` FLOAT NOT NULL DEFAULT '5' AFTER `Detection`,
	ADD COLUMN `Leash` FLOAT NOT NULL DEFAULT '0' AFTER `CallForHelp`,
	ADD COLUMN `ExperienceMultiplier` FLOAT NOT NULL DEFAULT '1' AFTER `rank`;

-- Baron Rivendare
UPDATE `creature_template` SET `Detection`=1 WHERE `entry`=10440;
-- Ossirian the Unscarred
UPDATE `creature_template` SET `Detection`=30 WHERE `entry`=15339;
-- Eye Stalk
UPDATE `creature_template` SET `CallForHelp`=1 WHERE `entry`=16236;
-- Diseased Maggot and Rotting Maggot.
UPDATE `creature_template` SET `CallForHelp`=0.5 WHERE `entry` IN (16056, 16057);
-- These have low HP for their level.
UPDATE `creature_template` SET `ExperienceMultiplier`=0.25 WHERE `entry` IN (2946, 6575, 9496, 10411, 14386, 16230);
UPDATE `creature_template` SET `ExperienceMultiplier`=0.5 WHERE `entry` IN (7076, 7077, 7309, 8477, 8615, 8658, 9157, 10387, 10389, 10441, 10461, 11460, 11466, 12473, 14350, 14396, 15546, 15720, 15733, 15735, 15738, 16032, 16286);
-- These have almost no HP.
UPDATE `creature_template` SET `flags_extra`=`flags_extra`+64 WHERE `entry` IN (4377, 6493, 7527, 7769, 8887, 9707, 10577, 14362, 14370, 14486, 14761, 16255, 16285, 16433, 16434, 16435, 16436, 16281, 16241, 16384, 16395, 16484, 16490, 16493, 16495, 16786, 16787);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
