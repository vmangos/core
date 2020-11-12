DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200408050144');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200408050144');
-- Add your query below.


-- Correct faction for New Year's Eve revelers.
UPDATE `creature_template` SET `faction`=775 WHERE `entry`=15719;
UPDATE `creature_template` SET `faction`=775 WHERE `entry`=15907;
UPDATE `creature_template` SET `faction`=775 WHERE `entry`=15908;
UPDATE `creature_template` SET `faction`=774 WHERE `entry`=15694;
UPDATE `creature_template` SET `faction`=774 WHERE `entry`=15905;
UPDATE `creature_template` SET `faction`=774 WHERE `entry`=15906;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
