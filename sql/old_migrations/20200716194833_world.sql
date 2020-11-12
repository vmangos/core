DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200716194833');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200716194833');
-- Add your query below.

UPDATE `quest_template` SET `RequestItemsText`='Ya have the sapta, $G brotha:sista;?$B$BI know another that had trouble after defeating da corrupt water spirit--seems he waited too long and he came out of the spirit world too quick fer his taste. Hate to see dat happen to another, so I\'ll just wait here fer a bit to make sure no one else be needin\' me help.' WHERE `entry`=1103;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
