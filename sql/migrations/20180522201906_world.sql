DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180522201906');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180522201906');
-- Add your query below.

-- Blackblade of Shahram -> GR 1
DELETE FROM `creature_loot_template` WHERE `entry`='10363' and`item`='12592' and`groupid`='0';
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('30270', '12592', '1', '1', '1', '1', '0', '0', '10');

-- Loot -> GR 1
DELETE FROM `reference_loot_template` WHERE `entry`='30270' and`item`='22253';
DELETE FROM `reference_loot_template` WHERE `entry`='30270' and`item`='22267';
DELETE FROM `reference_loot_template` WHERE `entry`='30270' and`item`='22268';
DELETE FROM `reference_loot_template` WHERE `entry`='30270' and`item`='22269';

-- 1.10 Loot -> GR 2
UPDATE `creature_loot_template` SET `patch_min`='8' WHERE `entry`='10363' and`item`='30271' and`groupid`='0';
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`='0', `patch_min`='8' WHERE `entry`='30271' and`item`='22268';
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`='0', `patch_min`='8' WHERE `entry`='30271' and`item`='22269';
UPDATE `reference_loot_template` SET `patch_min`='8' WHERE `entry`='30271' and`item`='22253';
UPDATE `reference_loot_template` SET `patch_min`='8' WHERE `entry`='30271' and`item`='22267';
DELETE FROM `reference_loot_template` WHERE `entry`='30271' and`item`='12602';
DELETE FROM `reference_loot_template` WHERE `entry`='30271' and`item`='13098';
DELETE FROM `reference_loot_template` WHERE `entry`='30271' and`item`='13141';
DELETE FROM `reference_loot_template` WHERE `entry`='30271' and`item`='13142';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
