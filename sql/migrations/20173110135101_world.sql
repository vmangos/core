DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20173110135101');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20173110135101');
-- Add your query below.

-- -------------------------------
-- 
-- Atiesh 
--
-- -------------------------------

-- damage/hp source: bestiary and https://www.youtube.com/watch?v=2KQCzxJU7eg
UPDATE `creature_template` SET `minhealth`=249825, `maxhealth`=249825, `speed_run`='2.54286', `mindmg`=4572, `maxdmg`=5646, `AIName`='', `equipment_id`='16387', `ScriptName`='boss_atiesh' WHERE `entry`=16387;

-- add his weapons
REPLACE into creature_equip_template (entry,patch,equipentry1,equipentry2,equipentry3) 
VALUES(16387, 0, 22738, 22738, 0);

REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) 
VALUES (181207, 3, 4175, 'Runed Demonic Blade', 0, 0, 1.5, 1085, 181207, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) 
VALUES (181207, 22736, 100, 0, 1, 1, 0);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

