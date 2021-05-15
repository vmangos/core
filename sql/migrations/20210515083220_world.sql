DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210515083220');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210515083220');
-- Add your query below.

UPDATE `item_template` SET `minMoneyLoot`=50,  `maxMoneyLoot`=100 WHERE `entry`=20708; -- Tightly Sealed Trunk
UPDATE `item_template` SET `minMoneyLoot`=100, `maxMoneyLoot`=200 WHERE `entry`=21113; -- Watertight Trunk
UPDATE `item_template` SET `minMoneyLoot`=100, `maxMoneyLoot`=200 WHERE `entry`=21150; -- Iron Bound Trunk
UPDATE `item_template` SET `minMoneyLoot`=100, `maxMoneyLoot`=200 WHERE `entry`=21228; -- Mithril Bound Trunk

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
