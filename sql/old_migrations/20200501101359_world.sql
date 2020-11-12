DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200501101359');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200501101359');
-- Add your query below.


-- Show stacks in "list aura" command
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (468, 'id: %d eff: %d type: %d duration: %d maxduration: %d stacks: %d name: %s%s%s caster: %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- High Priestess Jeklik
UPDATE `creature_template` SET `dmg_min`=1533, `dmg_max`=2030, `armor`=3795 WHERE `entry`=14517;
UPDATE `creature_template` SET `health_min`=333125, `health_max`=333125 WHERE `entry`=14517;

-- High Priest Venoxis
UPDATE `creature_template` SET `dmg_min`=1431, `dmg_max`=1895, `armor`=3795 WHERE `entry`=14507;
UPDATE `creature_template` SET `health_min`=213200, `health_max`=213200 WHERE `entry`=14507;

-- High Priestess Mar'li
UPDATE `creature_template` SET `dmg_min`=1431, `dmg_max`=1895, `armor`=3795 WHERE `entry`=14510;

-- High Priest Thekal
UPDATE `creature_template` SET `dmg_min`=1794, `dmg_max`=2375, `armor`=3795 WHERE `entry`=14509;

-- High Priestess Arlokk
UPDATE `creature_template` SET `dmg_min`=1533, `dmg_max`=2030, `armor`=3795 WHERE `entry`=14515;
UPDATE `creature_template` SET `mana_min`=13100, `mana_max`=13100 WHERE `entry`=14515;

-- Hakkar
UPDATE `creature_template` SET `dmg_min`=2044.5, `dmg_max`=2706.5, `armor`=3795 WHERE `entry`=14834;
UPDATE `creature_template` SET `health_min`=719550, `health_max`=719550 WHERE `entry`=14834;

-- Bloodlord Mandokir
UPDATE `creature_template` SET `dmg_min`=2334, `dmg_max`=3094, `armor`=4691 WHERE `entry`=11382;

-- Ohgan
UPDATE `creature_template` SET `dmg_min`=1413, `dmg_max`=1875, `armor`=3791 WHERE `entry`=14988;
UPDATE `creature_template` SET `health_min`=99930, `health_max`=99930 WHERE `entry`=14988;

-- Jin'do the Hexxer
UPDATE `creature_template` SET `dmg_min`=1738, `dmg_max`=2301, `armor`=3795 WHERE `entry`=11380;

-- Gahz'ranka
UPDATE `creature_template` SET `dmg_min`=2197, `dmg_max`=2912, `armor`=4691 WHERE `entry`=15114;
UPDATE `creature_template` SET `health_min`=333100, `health_max`=333100 WHERE `entry`=15114;

-- Gri'lek
UPDATE `creature_template` SET `dmg_min`=2471, `dmg_max`=3276, `armor`=4691 WHERE `entry`=15082;
UPDATE `creature_template` SET `health_min`=333100, `health_max`=333100, `mana_min`=0, `mana_max`=0 WHERE `entry`=15082;

-- Hazza'rah
UPDATE `creature_template` SET `dmg_min`=2300, `dmg_max`=3045, `armor`=3795 WHERE `entry`=15083;
UPDATE `creature_template` SET `health_min`=266500, `health_max`=266500 WHERE `entry`=15083;

-- Renataki
UPDATE `creature_template` SET `dmg_min`=1648, `dmg_max`=2184, `armor`=4691 WHERE `entry`=15084;
UPDATE `creature_template` SET `health_min`=333100, `health_max`=333100, `mana_min`=0, `mana_max`=0 WHERE `entry`=15084;

-- Wushoolay
UPDATE `creature_template` SET `dmg_min`=2300, `dmg_max`=3045, `armor`=3795 WHERE `entry`=15085;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
