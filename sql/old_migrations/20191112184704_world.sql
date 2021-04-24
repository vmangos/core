DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191112184704');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191112184704');
-- Add your query below.


-- Delete Winterspring Owl in Silithus
DELETE FROM `creature` WHERE `guid` = 2230118;

-- Make Field of Strife Blizzlike
DELETE FROM `creature` WHERE `id` = 20110;
DELETE FROM `creature` WHERE `id` = 20111;

-- Make triggers invisible
-- Trigger Vipore
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE  `entry`=14031;
-- Trigger Ichman
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE  `entry`=14029;
-- Trigger Mulverick
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE  `entry`=14027;
-- Trigger Jeztor
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE  `entry`=14028;
-- Trigger Slidore
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE  `entry`=14030;
-- Trigger Guse
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE  `entry`=14026;

-- Delete Cornish Rex Cat from dwarf start
DELETE FROM `creature` WHERE `guid` = 1528;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
