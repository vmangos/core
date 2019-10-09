DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191009195108');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191009195108');
-- Add your query below.


-- pre wotlk changed wotlk sniff data
UPDATE `creature_model_info` SET `gender`=1, `bounding_radius`=1.8, `combat_reach`=23.4 WHERE `modelid` = 8570;
UPDATE `creature_template` SET `faction`=103, `unit_flags`=64 WHERE `entry` = 10184;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
