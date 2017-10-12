DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171010010001');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171010010001');
-- Add your query below.


-- Fixes https://github.com/elysium-project/server/issues/3064
-- Correct Jaina's health and loot.
UPDATE `creature` SET `curhealth`=462000 WHERE `id`=4968;
UPDATE `creature_template` SET `minhealth`=462000, `maxhealth`=462000, `mingold`=700000, `maxgold`=750000 WHERE `entry`=4968;
-- Fix Jaina's Teleport spell.
REPLACE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (20682, 1, -4018.1, -4525.24, 12, 6.13);

-- Fixes https://github.com/elysium-project/server/issues/3076
REPLACE INTO `page_text` (`entry`, `text`, `next_page`) VALUES (1471, 'Solomon,$B$BThe carrier of this decree has been granted official status as an acting deputy of Stormwind. You may use $g him:her; to find proof of the black dragonflight\'s involvement with the Blackrock orcs. Should such proof be found, this deputy shall return said proof to me in Stormwind, at which time I shall release the order to dispense sufficient millitary force to aid Lakeshire.$B$BRegards,$B$BHighlord Bolvar Fordragon', 0);

-- Fixes https://github.com/elysium-project/server/issues/1803
UPDATE `creature` SET `curhealth`=1830, `curmana`=5013 WHERE `guid`=1179376;
UPDATE `creature_template` SET `minlevel`=55, `maxlevel`=55, `minhealth`=1830, `maxhealth`=1830, `minmana`=5013, `maxmana`=5013, `mindmg`=67, `maxdmg`=93, `attackpower`=101, `ScriptName`='npc_emerald_dragon_whelp' WHERE `entry`=8776;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
