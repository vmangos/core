DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200128173900');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200128173900');
-- Add your query below.

insert into `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) values('4595','1823','0','10');
insert into `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) values('3041','1823','0','10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;