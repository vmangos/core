DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180115132158');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180115132158');
-- Add your query below.

-- ERROR:Table `creature` have creature (GUID: 17081 Entry: 2255) with low current mana (36), `creature_template`.`minmana`=2861.
-- ERROR:Table `creature` have creature (GUID: 17072 Entry: 2255) with low current mana (36), `creature_template`.`minmana`=2861.
-- ERROR:Table `creature` have creature (GUID: 16995 Entry: 2255) with low current mana (36), `creature_template`.`minmana`=2861.
-- ERROR:Table `creature` have creature (GUID: 16811 Entry: 2255) with low current mana (36), `creature_template`.`minmana`=2861.
-- ERROR:Table `creature` have creature (GUID: 16807 Entry: 2255) with low current mana (36), `creature_template`.`minmana`=2861.
-- ERROR:Table `creature` have creature (GUID: 16804 Entry: 2255) with low current mana (36), `creature_template`.`minmana`=2861.
-- ERROR:Table `creature` have creature (GUID: 16774 Entry: 2255) with low current mana (36), `creature_template`.`minmana`=2861.
-- ERROR:Table `creature` have creature (GUID: 16772 Entry: 2255) with low current mana (36), `creature_template`.`minmana`=2861.
UPDATE `creature` SET `curmana`=2975 WHERE `id`=2255;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
