DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210305185918');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210305185918');

ALTER TABLE character_aura MODIFY COLUMN basepoints0 float;
ALTER TABLE character_aura MODIFY COLUMN basepoints1 float;
ALTER TABLE character_aura MODIFY COLUMN basepoints2 float;

END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
